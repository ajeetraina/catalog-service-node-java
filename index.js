const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

// Sample catalog data
const catalog = [
    { id: 1, name: 'Product 1', price: 99.99, description: 'First product' },
    { id: 2, name: 'Product 2', price: 149.99, description: 'Second product' }
];

app.use(express.json());

// GET all products
app.get('/api/products', (req, res) => {
    res.json(catalog);
});

// GET product by ID
app.get('/api/products/:id', (req, res) => {
    const product = catalog.find(p => p.id === parseInt(req.params.id));
    if (!product) return res.status(404).json({ message: 'Product not found' });
    res.json(product);
});

// Health check endpoint
app.get('/health', (req, res) => {
    res.json({ status: 'UP' });
});

app.listen(port, () => {
    console.log(`Catalog service listening at http://localhost:${port}`);
});