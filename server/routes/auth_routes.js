const express = require('express');
const User = require('../model/user_model');
var bcrypt = require('bcryptjs');
const jwt = require("jsonwebtoken");
const auth = require('../middleware/auth');

const authRoute = express.Router();

// SignUp---------------------------------
authRoute.post('/api/signup', async (req, res) => {
    try {
        const { name, email, password } = req.body;
        let isUserExist = await User.findOne({ email });

        if (isUserExist) {
            return res.status(400).json({ msg: "user already exists" });
        }
        let hashPassword = await bcrypt.hash(password, 8);
        let user = new User({ name, email, password: hashPassword });
        user = await user.save();
        res.status(201).json(user);
    } catch (error) {
        return res.status(500).json({ msg: `error ${error.message}` });
    }


});

// SignIn---------------------------------
authRoute.post('/api/signin', async (req, res) => {
    try { //password
        const { email, password } = req.body;
        console.log(email, password);
        const user = await User.findOne({ email });
        if (!user)
            return res.status(400).json({ msg: "user with this Email does not exists!" });

        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch)
            return res.status(400).json({ msg: "Incorrect password " });

        let token = jwt.sign({ id: user._id }, "passwordKey");
        return res.status(200).json({ token, ...user._doc });

    } catch (error) {
        return res.status(500).json({ msg: `error ${error.message}` });

    }


});

// Valid-Token---------------------------------
authRoute.post('/tokenIsValid', async (req, res) => {
    try {
        const token = req.header('x-auth-token');
        if (!token) return res.json(false);

        const verified = jwt.verify(token, "passwordKey");
        if (!verified) return res.json(false);

        const user = await User.findById(verified.id);
        res.json(true);
    } catch (error) {
        return res.status(500).json({ msg: `error ${error.message}` });

    }


});

//get-data--------------------------------
authRoute.get('/', auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
});
module.exports = authRoute;