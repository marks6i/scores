'use strict';

const express = require('express');
const https = require('https');
var parseString = require('xml2js').parseString;

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';
  
// App
const app = express();
app.set('json spaces', 2);

app.get('/scores', (req, res) => {
//    res.json([]);
    https.get('https://www.scorespro.com/rss2/live-baseball.xml', (resp) => {
        let data = '';
        // A chunk of data has been recieved.
        resp.on('data', (chunk) => {
            data += chunk;
        });
        // The whole response has been received. Print out the result.
        resp.on('end', () => {
            //console.log(JSON.parse(data).explanation);
            parseString(data, function (err, result) {
                res.json(result);
            });
        });
    }).on("error", (err) => {
        return res.status(400).send({
            message: 'This is an error!'
         });
    });
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);