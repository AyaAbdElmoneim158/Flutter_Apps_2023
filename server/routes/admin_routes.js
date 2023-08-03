const express = require('express');
const { Product } = require("../model/product_model");
const adminRoute = express.Router();

adminRoute.post();
// Get all your products
adminRoute.get("/admin/get-products", admin, async(req, res) => {
    try {
        const products = await Product.find({});
        res.json(products);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Delete the product
adminRoute.post("/admin/delete-product", admin, async(req, res) => {
    try {
        const { id } = req.body;
        let product = await Product.findByIdAndDelete(id);
        res.json(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});