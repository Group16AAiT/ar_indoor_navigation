Categories = require('../models/categoriesModel');

exports.index = (req, res) =>{
    Categories.get((err, categories) =>{
        if(err){
            res.json({
                status:'err',
                code: 500,
                message:err
            });
        }
        res.json(categories)
    })
}

exports.new = function(req,res){
    let categories = new Categories()
    categories.name = req.body.name
    categories.price = req.body.price
    categories.stock = req.body.stock
    categories.save(function(err){
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
                data:categories
            })
        }

    })
}

exports.view = function(req,res){
    
    Categories.findById(req.params.id, function(err,categories){
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
            message:'Category Name',
            data:categories
        })

    })
}

exports.update = function(req, res){
    Categories.findById(req.params.id, function(err, categories){
        if(err){
            res.json({
                status:'err',
                code:500,
                message:err
            })}
            categories.name = req.body.name
            
        categories.save(function(err){
            if(err){
                res.json({
                    status:'err',
                    code:500,
                    message:err
                })}
            res.json({
                status:'success',
                code:200,
                message: "Category Name updated",
                data :categories
            })
            })
    
    
})}

exports.delete = function(req, res){
    Categories.deleteMany({
        _id: req.params.id
    }, function(err){
        if(err){
            res.json({
                status:'err',
                code:500,
                message:err
            })}
        res.json({
            status:'success',
            code:200,
            message: 'Category Removed'
        })
        
    }
    )
}