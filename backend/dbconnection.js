const mongoose = require('mongoose')

mongoose.connect('mongodb+srv://admin:admin@cluster0.btun9.mongodb.net/ar_indoor_db?retryWrites=true&w=majority',{
    useNewUrlParser:true,
    useUnifiedTopology:true,
    
}).then(db => console.log('connection establishe successfully'))