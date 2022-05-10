var express = require('express');
const authMiddleware = require('../middlewares/auth');
var router = express.Router();
Rooms = require('../models/roomModel').RoomModel;
Category = require('../models/categoriesModel');
Building = require('../models/buildingsModel').BuildingModel;
const jwt = require('jsonwebtoken');
const config = require('../config');

router.get('/', async (req, res, next) => {
    try {
        const bldgId = req.body.bldgId;
        var roomListRes = await Rooms.find({bldgId: bldgId});
        
        for (let i = 0; i < roomListRes.length; i++) {
            element = roomListRes[i];
            var fetchedCategory = await Category.findById(element["category"]);
            roomListRes[i]["category"] = fetchedCategory;
        }
        res.json(roomListRes);
    } catch (e) {
        // next(e);
        res.status(500).json({
            status: 'err',
            code: 500,
            message: e
        });
    }
});


router.post('/', authMiddleware.isAuthenticated, async (req, res, next) => {
    try {
        var fetchedCategory = await Category.findOne({name: req.body.categoryName});
        const resCategory = fetchedCategory["_id"];
        
        let room = new Rooms({
            roomName: req.body.roomName,
            roomNumber: req.body.roomNumber,
            floorNumber: req.body.floorNumber,
            isEmpty: req.body.isEmpty,
            category: resCategory,
            bldgId: req.body.bldgId
        })
        await room.save()
        res.json({
            status: 'success',
            code: 200,
            message: 'Room added',
            data: room
        })
    } catch (e) {
        // next(e);
        // console.log("errr " + e);
        res.status(500).json({
            status: 'err',
            code: 500,
            message: e

        })
    }
});


router.get('/:id', async (req, res, next) => {
    try {
        var fetchedRoom = await Rooms.findById(req.params.id);
        var fetchedCategory = await Category.findById(fetchedRoom["category"]);
        fetchedRoom["category"] = fetchedCategory;
        res.json({
            status: 'success',
            code: 200,
            message: 'Room Name',
            data: fetchedRoom
        })

    } catch (e) {
        // next(e);
        res.status(500).json({
            status: 'err',
            code: 500,
            message: e

        })
    }
});

router.put('/:id', async (req, res, next) => {
    try {
        var fetchedRoom = await Rooms.findById(req.params.id);
        var returnedData = fetchedRoom.toObject();
        fetchedRoom.roomName = req.body.name
        fetchedRoom.isEmpty = req.body.isEmpty
        returnedData.isEmpty = req.body.isEmpty
        if (req.body.isEmpty) {
            fetchedRoom.roomName = "NO NAME";
            returnedData.roomName = "NO NAME";
        }
        if (req.body.category) {
            var fetchedCategory = await Category.findOne({name: req.body.category});
            fetchedRoom.category = fetchedCategory._id;
            returnedData.category = fetchedCategory;
        } else {
            returnedData.category = {name: "NO CATEGORY", _id: "NOid", createdAt: Date.now()};
        }
        await fetchedRoom.save();        
        res.json({
            status: 'success',
            code: 200,
            message: "Room Name updated",
            data: returnedData
        })

    } catch (e) {
        // next(e);
        res.status(500).json({
            status: 'err',
            code: 500,
            message: e

        })
    }
});


router.delete('/:id', async (req, res, next) => {
    try {
        await Rooms.deleteOne({ _id: req.params.id });
        res.json({
            status: 'success',
            code: 200,
            message: 'Room is Removed'
        })

    } catch (e) {
        // next(e);
        res.status(500).json({
            status: 'err',
            code: 500,
            message: e
        })
    }
});


module.exports = router;