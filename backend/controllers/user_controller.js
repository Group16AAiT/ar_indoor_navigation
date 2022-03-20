User = require('../models/userModel');

exports.index = (req, res) =>{
    User.get((err, user) =>{
        if(err){
            res.json({
                status:'err',
                code: 500,
                message:err
            });
        }
        res.json(user)
    })
}

exports.new = function(req,res){
    let user = new User()
    user.name = req.body.name
    user.price = req.body.price
    user.stock = req.body.stock
    user.save(function(err){
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
                data:user
            })
        }

    })
}

exports.view = function(req,res){
    
    User.findById(req.params.id, function(err,user){
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
            data:user
        })

    })
}

exports.update = function(req, res){
    User.findById(req.params.id, function(err, user){
        if(err){
            res.json({
                status:'err',
                code:500,
                message:err
            })}
            user.name = req.body.name
            user.price = req.body.price
            user.stock = req.body.stock
            user.save(function(err){
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
                data :user
            })
            })
    
    
})}

exports.delete = function(req, res){
    User.remove({
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