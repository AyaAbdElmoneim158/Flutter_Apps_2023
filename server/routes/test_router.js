const express = require('express');
const testRoute = express.Router();


testRoute.get("/test/hello", async (req, res) => {
    res.status(200).json({ msg: "Hello" });
});