const mongoose = require("mongoose");

var users = new mongoose.Schema({
    name:String
});

module.exports = mongoose.model("users",users) 