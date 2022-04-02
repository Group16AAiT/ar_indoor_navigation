let mongoose = require('mongoose');

const RoomSchema = new mongoose.Schema({
    roomName: String,
    roomNumber: String,
    floorNumber: String,
    isEmpty: Boolean,
    createdAt: {
        type: Date,
        default: Date.now
    },
    category: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Categories",
        required: true
    },
    bldgId: String

});



// let rooms = module.exports = mongoose.model('Room', RoomSchema);
// module.exports.get = function(callback ,limit){
//     rooms.find(callback).limit(limit);
// }
module.exports = mongoose.model('Room', RoomSchema);
