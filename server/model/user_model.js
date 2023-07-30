const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    email: {
        type: String,
        required: true,
        trim: true,
        validate: {
            validator: (val) => {
                const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return val.match(re);
            },
            message: "please enter a valid email address"
        }
    },
    password: {
        type: String,
        required: true,
        validate: {
            validator: (val) => {
                return val.length >= 6;
            },
            message: "Please enter a long password"
        }
    },
    address: {
        type: String,
        default: ''
    },
    type: {
        type: String,
        default: 'user'
    },
}, { timestamps: true });

const User = mongoose.model('User', userSchema);
module.exports = User;