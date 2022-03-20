let mongoose  = require('mongoose');


let categoriesSchema = mongoose.Schema({
    name:{
        type:String,
        required:true
    },
    
    
    
    create:{
        type: Date,
        default : Date.now
    }
});

let categories = module.exports = mongoose.model('Categories', categoriesSchema);
module.exports.get = function(callback ,limit){
    categories.find(callback).limit(limit);
}