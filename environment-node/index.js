const express = require('express');

const PORT = 3000;
const HOST = "0.0.0.0";

const app = express();

app.get("/", (req, res) => {
    res.send("Environment NodeJs 2");
});

app.listen(PORT, HOST);