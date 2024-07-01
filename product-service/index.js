const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

let products = [];

app.post('/products', (req, res) => {
    const product = req.body;
    products.push(product);
    res.status(201).send(product);
});

app.get('/products', (req, res) => {
    res.status(200).send(products);
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
    console.log(`Product service running on port ${PORT}`);
});
