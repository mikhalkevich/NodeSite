var express = require('express');
const db = require('../models');
const {Op} = require("sequelize");
var router = express.Router();
const User = db.users;

var session = require('express-session');

/* GET users listing. */
router.get('/register', function (req, res, next) {
    // res.send('respond with a resource');
    res.render('register')
});

router.post('/register', function (req, res, next) {
    const dataUser = {
        name: req.body.name,
        email: req.body.email,
        password: req.body.password
    }
    // res.send(req.body);
    User.findOne({where: {email: dataUser.email}}).then(data => {
            if (!data) {
            User.create(dataUser).then(data => {
                // res.send(data);
                res.redirect('/user/login/?email=' + data.email)
            })
            } else {
                res.redirect('/user/login/?email=' + data.email)
            }
        }
    )
});

router.get('/login', function (req, res, next) {
    // res.send('respond with a resource');
    const email = req.query.email ? req.query.email : '';
    // console.log(req.query.email);
    res.render('login', {email: email})

});

router.post('/login', function (req, res, next) {
    User.findOne({where: {email: req.body.email, password: req.body.password}})
        .then(data => {
            if (data) {
               req.session.user = data;
               res.redirect('/cabinet/info');
            } else {
                res.render('login', {errorText: 'error exit'})
            }

        })
        .catch(error => {
            console.log(error);
            res.send('error');
        })

});

router.get('/logout', function (req, res, next) {
    // res.send('respond with a resource');
    req.session.destroy();
    res.redirect('/');
});

module.exports = router;
