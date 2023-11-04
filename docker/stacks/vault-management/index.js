require('dotenv').config();
const express = require('express');
const cors = require('cors');
const limit = require("express-limit").limit;
const app = express();
const PORT = 1234;

app.use(cors());
app.set('view engine', 'ejs');
app.use(express.static('public'));

const data = {
    USERNAME: process.env.USERNAME,
    PASSWORD: process.env.PASSWORD,
    CLIENT_ID: process.env.CLIENT_ID,
    CLIENT_SECRET: process.env.CLIENT_SECRET,
    WS_ENDPOINT: process.env.WS_ENDPOINT,
    LINE_TOKEN: process.env.LINE_TOKEN,
};

const aws = {
    ID: process.env.AWS_ID,
    SECRET: process.env.AWS_SEC
};

app.get('/', limit({ max: 50, period: 60 * 1000 }), (req, res) => {
    res.render('index', { data, aws });
});

app.listen(PORT, () => {
    console.log(`Server is running at port ${PORT}`);
});
