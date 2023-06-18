const express = require('express');
const app = express();
const cors = require('cors');
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());
// const fileUpload = require('express-file-upload');
// app.use(fileUpload());

const {PORT} = require("./details/details.js")
const userRouter = require('./services/apis.js');
const connection = require("./connections.js")







app.use('/', userRouter);
// app.use('/',connection);

app.listen(PORT, function (err) {
    if (err) console.log(err);
    console.log("Server listening on PORT", PORT);
});