const express = require('express');
const app = express();

const port = 1234;

app.get('/', (req, res) => res.json([
    {
        name:'Rituj',
        age:27
    },
    {
        name:'Ankit',
        age:28
    }
]

));

app.listen(port , ()=>console.log("server running on port: "+ port));
