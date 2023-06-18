const express = require('express');
const router = express.Router();
var users = require("../models/User")
const details = require('../details/details')
// const express = require('express');

const fs = require('fs');
// const https = require('https');
// const FormData = require('form-data');
const nodemailer = require("nodemailer");
const path = require('path');
var {ObjectId} = require('mongodb');
const randomstring = require("randomstring");

var generator = require('generate-password');
// const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const saltRounds = 10;







 



router.post('/signup', async function (req, res) {

    var email = req.body.email;
    
    await users.find({"email":email}).then((result)=>{
    
    if(result.length>0){
      console.log(result)
      return res.send({"status":400})
    }else{
      var password = randomstring.generate({
        length: 5,
        charset: "numeric",
      });
        
      let transporter = nodemailer.createTransport({
      host: 'smtp.gmail.com',
      port: 465,
      secure: true,
      service: 'gmail',
      auth: {
        user:'talha.rasool@nearearthadventures.com',
        pass: 'earArth@tr1'
        }
        });
        
        let mailOptions = {
        // from: '<a2z>',
        from: 'talha.rasool@nearearthadventures.com',
        to: email,//'orders@produce-vault.com',
        subject: 'The DoctorNow Verification',
       text: "Your Verification Code is: " + password
      
        };
        
        
        transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
      console.log(error);
      } else {
        console.log('Email sent: ' + info.response);
       }
        });
        
        
    
    
        
        return res.send({'status':200,"verification":password});
    }
    })
    
    
      })
      
    
      router.post("/InsertUser", async (req, res) => {

        var firstname =  req.body.firstname;
        var lastname = req.body.lastname;
        var email =  req.body.email;
        var phone = req.body.phone;
        var password = req.body.password
        var role = 'User';
    
        var obj = new users({
          firstname:firstname,
          lastname:lastname,
          email:email,
          phone:phone,
          password:password,
          role:role
        });
  
  console.log(obj,'data')
  
        obj.save().then(()=>{
          return res.send({'status':200 , obj:obj})
        })
      })
      
      router.post("/login", async (req, res) => {
      
        const { email, password } = req.body;
      
        try {
          // Find the user based on the email
          const user = await users.findOne({ email });
  
          if (!user) {
            return res.status(404).json({ status:404, message: "User not found" });
          }
      
          // Compare the provided password with the stored password
          if (password !== user.password) {
            return res.status(401).json({ status:400, message: "Invalid password" });
          }
      
          // Password is valid, user is authenticated
          return res.status(200).json({'status':200, message: "Login successful", "user": user });
        } catch (error) {
          return res.status(500).json({ status:500, message: "Error during login" });
        }
      });
    
    router.post("/logout", (req, res) => {
    console.log('working')
      console.log(req.session,req.session.destroy,'logout  ????????')
      
      req.session.destroy((err) => {
        if (err) {
          console.log(err); 
          return res.json({status :400,  message: "Logout failed" });
        }
        return res.json({ status:200, message: "Logout successful" });
      });
    });
    ///////////// 
    



    
    router.post("/del", async (req, res) => {
        console.log('working')
        
        var gg = await users.deleteMany();
            if (gg) {
              console.log(gg); 
              return res.json({status :400,  message: "failed" });
            }
            return res.json({ status:200, message: "delete successful" });
          });
       
        ///////////// 
        
        router.post('/checkMail', async function (req, res) {
          await users.find({ email: req.body.email }).then(result => {
            if(result.length>0)
            return res.send({ status: false, msg: "ID Exixts" })
            else
            return res.send({ status: true, msg: "No ID Exixts" })
          });
        });


module.exports = router;