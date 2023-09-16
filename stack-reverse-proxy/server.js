const express = require("express");
const os = require("os");
const app = express();

app.use("/", async(req, res) =>{
    res.json({
        message: "Response from: ", hostname: `${os.hostname}`
    })
})

app.listen(3006, ()=> {
    console.log("Server is running at port 3006")
})