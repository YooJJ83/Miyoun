console.log("index파일 진입");
var express = require('express');
var router = express.Router();

const auth = require('./auth/auth.js');
const bsps = require('./bsps/bsps.js');

router.use('/auth', auth);
router.use('/bsps', bsps);

module.exports = router;