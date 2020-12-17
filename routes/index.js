var express = require('express');
const db = require('../models');
var router = express.Router();
const Maintext = db.maintexts;

router.get('/:url?', function (req, res, next) {
    let url;
    if (req.params.url) {
        url = req.params.url;
    } else {
        url = 'index';
    }
    Maintext.findOne({where: {url: url}})
        .then(data => {
            // res.send(data);
            res.render('index', {obj: data});
        })
        .catch(error => {
            console.log(error);
            res.send('error');
        })

})

module.exports = router;
