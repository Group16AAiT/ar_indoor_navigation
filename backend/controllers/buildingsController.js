Building = require('../models/buildingsModel');

exports.index = (req, res) =>{
    Building.get((err, building) =>{
        if(err){
            res.json({
                status:'err',
                code: 500,
                message:err
            });
        }
        res.json(building)
    })
}


exports.view = function(req,res){
    
    Building.findById(req.params.id, function(err,building){
        if(err){
            res.json({
                status:'err',
                code:500,
                message:err
            })
        }
        res.json({
            status:'success',
            code:200,
            message:'Buildings Name',
            data:building
        })

    })
}
