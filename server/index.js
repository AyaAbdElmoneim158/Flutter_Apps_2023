// Imports packages.............................
const express = require('express');
const mongoose = require('mongoose');

// Imports Files.............................
const authRoute = require('./routes/auth_route');
const adminRoute = require('./routes/admin_routes');


// Init.............................
mongoose.connect("mongodb+srv://AyA:AyA@amazon-clone.xjzkmrb.mongodb.net/Amazon_clone?retryWrites=true&w=majority")
    .then((connection) => {
        console.log(`Connecting Successful `);
    })
    .catch((error) => {
        console.log(`Connecting Failure : ${error}`);
    });
const app = express();
const port = 8000;

// Middleware.............................
app.use(express.json());
app.use(authRoute);
app.use(adminRoute);


app.listen(port, '0.0.0.0', () => {
    console.log(`Server running on port ${port}`);
});