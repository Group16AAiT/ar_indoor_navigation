var express = require('express');
var router = express.Router();
Building = require('../models/buildingsModel');


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
        var bldgRes = await Building.findById(req.params.id);
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