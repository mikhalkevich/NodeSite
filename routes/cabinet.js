var express = require('express');
const db = require('../models');
const {Op} = require("sequelize");
const fs = require("fs");
var router = express.Router();
const Account = db.accounts;

var session = require('express-session');

router.get('/info', (req, res, next) => {
    res.render('cabinet_info')
})

router.post('/update', (req, res, next) => {
    let imageName = req.files.file.name ? req.files.file.name : ''
    let newFileName = '';

    let newPath = './public/uploads/';

    if (req.files.file) {
        const fileNameArr = imageName.split('.');
        newFileName = req.session.user.id + '.' + fileNameArr[fileNameArr.length - 1]

        let obj = req.files.file;
        obj.mv(newPath + newFileName, (err) => {
        });
    }
    const accountObj = {
        user_id: req.session.user.id,
        fio: req.body.fio,
        phone: req.body.phone,
        file_name: newFileName,
        status: '',
    }
    Account.create(accountObj).then(data => {
        res.send(data);
    })

})

module.exports = router;
