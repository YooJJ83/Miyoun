console.log("auth파일 진입");
var express = require('express');
var router = express.Router();
//var router = express();

const controller = require('./auth.controller.js');

router.use('/init', controller.init);
router.use('/index', controller.index);
router.use('/destroy', controller.destroy);
router.use('/create', controller.create);

module.exports = router;
