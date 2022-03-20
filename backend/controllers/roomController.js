Rooms = require('../models/roomModel');

exports.index = (req, res) =>{
    Rooms.get((err, room) =>{
        if(err){
            res.json({
                status:'err',
                code: 500,
                message:err
            });
        }
        res.json(room)
    })
}

exports.new = function(req,res){
    let room = new Rooms()
    room.name = req.body.name
    room.price = req.body.price
    room.stock = req.body.stock
    room.save(function(err){
        if(err){
            res.json({
                status:'err',
                code:500,
                message:err

            })
        }
            
        
        else{
            res.json({
                status:'success',
                code:200,
                message:'Register save',
                data:room
            })
        }

    })
}

exports.view = function(req,res){
    
    Rooms.findById(req.params.id, function(err,room){
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
            message:'Room Name',
            data:room
        })

    })
}

exports.update = function(req, res){
    Rooms.findById(req.params.id, function(err, room){
        if(err){
            res.json({
                status:'err',
                code:500,
                message:err
            })}
            room.name = req.body.name
            room.price = req.body.price
            room.stock = req.body.stock
        room.save(function(err){
            if(err){
                res.json({
                    status:'err',
                    code:500,
                    message:err
                })}
            res.json({
                status:'success',
                code:200,
                message: "Room Name updated",
                data :room
            })
            })
    
    
})}

exports.delete = function(req, res){
    Rooms.remove({
        _id:req.params.id
    },function(err){
        if(err){
            res.json({
                status:'err',
                code:500,
                message:err
            })
        res.json({
            status:'success',
            code:200,
            message: 'Room is Removed'
        })
        }
    }
    )
}