require('dotenv').config();
const mysql = require('mysql2/promise');
const express = require("express");
const port = process.env.PORT || 3001;
const app = new express()
app.use(express.json())


app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});