const express = require('express');
const router = express.Router();
var users = require("../models/users.js")

router.post("/send" , async(req,res)=>{



    await users.find().then((result)=>{
        return res.send(result)
    })
    // var obj = new users({
    //     name:"mubeen"
    // })
    // await obj.save().then((result=>{
    //     console.log(result)
    //     return res.send(result)
    // }))

})

module.exports = router;