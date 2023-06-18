var mongoose = require('mongoose');


var UserSchema = new mongoose.Schema({

  
    firstname: {
        type: String,
        required: true,
    },
    lastname: {
        type: String,
        required: true,
    },
    email: {
        type: String,
        required: true
    },
    phone: {
        type: String,
        required: true
    },


    password: { 
        type: String
    },

    role: {
        type: String,
        required:true
    }
});
module.exports = mongoose.model('User', UserSchema);