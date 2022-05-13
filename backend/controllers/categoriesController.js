var express = require('express');
var router = express.Router();
Categories = require('../models/categoriesModel');
authMiddleware = require('../middlewares/auth');
var ObjectId = require('mongoose').Types.ObjectId;

router.get('/', async (req, res, next) => {
    try {
        // const bldgId = req.params.id;
        const bldgId = res.locals.bldgId;
        var roomListRes = await Rooms.find({bldgId: bldgId});
        var counts = {}
        for(const room of roomListRes) {
            counts[room.category] = counts[room.category] ? counts[room.category] + 1: 1;
        }
        var categoriesList = await Categories.find({bldgId: bldgId}).lean();
        if(categoriesList.length == 0) {
            return res.status(404).json({message: "No categories found"});
        }
        for (let i = 0; i < categoriesList.length; i++) {
            element = categoriesList[i];
            categoriesList[i].count = counts[element._id];
        }
        res.json(categoriesList);
    } catch (e) {
        res.status(500).json({
            status: 'err',
            code: 500,
            message: e
        });
    }
});

router.post('/',  authMiddleware.isAuthenticated, async (req, res, next) => {
    try {
        const bldgId = res.locals.bldgId;
        var existingCategory = await Categories.findOne({name: req.body.name, bldgId: bldgId});
        if (existingCategory) {
            return res.status(409).json({
                status: 'err',
                code: 409,
                message: "category already exists"
            });
        }
        let categories = new Categories()
        categories.name = req.body.name
        categories.bldgId = bldgId
        await categories.save()
        res.json({
            status: 'success',
            code: 200,
            message: 'Register save',
            data: categories
        })

    } catch (e) {
        res.status(500).json({
            status: 'err',
            code: 500,
            message: e
        });
    }
});



router.get('/:id', async (req, res, next) => {
    try {
        const categoryId = req.params.id;
        if(!ObjectId.isValid(categoryId)) {
            return res.status(404).json({message: "Category not found"});
        }
        // var category = await Categories.findById(req.params.id);
        var category = await Categories.findOne({_id: categoryId});
        
        if(!category) {
            return res.status(404).json({
                message: "Category not found",
            });
        }
        res.json({
            status: 'success',
            code: 200,
            message: "Category Name",
            data: category
        })
    } catch (e) {
        res.status(500).json({
            status: 'err',
            code: 500,
            message: e
        });
    }
});

router.put('/:id', async (req, res, next) => {
    try {
        var category = await Categories.findById(req.params.id);
        category.name = req.body.name;
        await category.save();
        res.json({
            status: 'success',
            code: 200,
            message: "Category Name updated",
            data: category
        })
    } catch (e) {
        res.status(500).json({
            status: 'err',
            code: 500,
            message: e
        });
    }
});


router.delete('/:id',  authMiddleware.isAuthenticated, async (req, res, next) => {
    try {
        var roomListRes = await Rooms.find({category: req.params.id});
        // console.log({roomssFound: roomListRes});
        if(roomListRes.length > 0) {
            return res.status(409).json({
                status: 'err',
                code: 409,
                message: "category can't be deleted. One or more rooms have it as category."
            });
        }
        await Categories.deleteMany({ _id: req.params.id });
        res.json({
            status: 'success',
            code: 200,
            message: 'Category Removed'
        })
    } catch (e) {
        res.status(500).json({
            status: 'err',
            code: 500,
            message: e
        });
    }
});


module.exports = router;