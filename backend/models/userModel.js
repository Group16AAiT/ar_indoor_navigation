const { Schema, model} = require('mongoose')
const bcrypt = require('bcryptjs')
let mongoose  = require('mongoose');


const UserSchema = new Schema({
    name : String, 
    email: String, 
    password:String
});




let User = module.exports = mongoose.model('User', UserSchema);
module.exports.get = function(callback ,limit){
    User.find(callback).limit(limit);
}