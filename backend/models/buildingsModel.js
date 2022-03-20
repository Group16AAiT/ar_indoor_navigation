let mongoose  = require('mongoose');


let buildingSchema = mongoose.Schema({
    name:{
        type:String,
        required:true
    },
    
    create:{
        type: Date,
        default : Date.now
    }
});

let building = module.exports = mongoose.model('Buildings', buildingSchema);
module.exports.get = function(callback ,limit){
    building.find(callback).limit(limit);
}