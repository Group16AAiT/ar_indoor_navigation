let mongoose  = require('mongoose');


const RoomSchema = mongoose.Schema({
    name : String, 

    create:{
        type: Date,
        default : Date.now
    }
    
});



let rooms = module.exports = mongoose.model('Room', RoomSchema);
module.exports.get = function(callback ,limit){
    rooms.find(callback).limit(limit);
}