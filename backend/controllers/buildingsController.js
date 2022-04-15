var express = require('express');
var router = express.Router();
Building = require('../models/buildingsModel').BuildingModel;
Rooms = require('../models/roomModel').RoomModel;
authMiddleware = require('../middlewares/auth');


router.get('/', async (req, res, next) => {
    try {
        var bldgListRes = await Building.find({});
        res.json(bldgListRes);
    } catch (e) {
        // next(e);
        res.json({
            status: 'err',
            code: 500,
            message: e
        });
    }
});


router.get('/:id', async (req, res, next) => {
    try {
        
        const bldgId = req.params.id;
        var bldgRes = await Building.findById(bldgId).lean();
        
        var roomListRes = await Rooms.find({bldgId: bldgId});
        
        for (let i = 0; i < roomListRes.length; i++) {
            element = roomListRes[i];
            var fetchedCategory = await Category.findById(element["category"]);
            roomListRes[i]["category"] = fetchedCategory;
        }
        bldgRes.rooms = roomListRes;
        
        res.json({
            status: 'success',
            code: 200,
            message: 'Buildings Name',
            data: bldgRes
        })

    } catch (e) {
        // next(e);
        res.json({
            status: 'err',
            code: 500,
            message: e
        });
    }
});



module.exports = router;