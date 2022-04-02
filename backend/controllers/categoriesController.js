var express = require('express');
var router = express.Router();
Categories = require('../models/categoriesModel');

router.get('/', async (req, res, next) => {
    try {
        var categoriesList = await Categories.find({});
        res.json(categoriesList);
    } catch (e) {
        res.json({
            status: 'err',
            code: 500,
            message: e
        });
    }
});

router.post('/', async (req, res, next) => {
    try {
        let categories = new Categories()
        categories.name = req.body.name
        await categories.save()
        res.json({
            status: 'success',
            code: 200,
            message: 'Register save',
            data: categories
        })

    } catch (e) {
        res.json({
            status: 'err',
            code: 500,
            message: e
        });
    }
});



router.get('/:id', async (req, res, next) => {
    try {
        var category = await Categories.findById(req.params.id);
        res.json({
            status: 'success',
            code: 200,
            message: "Category Name",
            data: category
        })
    } catch (e) {
        res.json({
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
        res.json({
            status: 'err',
            code: 500,
            message: e
        });
    }
});


router.delete('/:id', async (req, res, next) => {
    try {
        await Categories.deleteMany({ _id: req.params.id });
        res.json({
            status: 'success',
            code: 200,
            message: 'Category Removed'
        })
    } catch (e) {
        res.json({
            status: 'err',
            code: 500,
            message: err
        });
    }
});


module.exports = router;