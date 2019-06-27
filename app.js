const http = require('http');
const express = require('express');
var app = express();
//var appRouter = express.Router();
const bodyParser = require('body-parser');
//var router = require('./router/index.js')(appRouter);
var router = require('./router/index.js')
var sequelize = require("./models").sequelize; //추가한 부분.
sequelize.sync();
app.listen(3000, function() {
	console.log("start, express server on port 3000");
});

app.use(express.static(__dirname+'/public'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.set('view engine', 'ejs');
app.set('views', __dirname +'/views');
app.engine('html', require('ejs').renderFile)
//appRouter.use('/',router);
//app.use(appRouter);
app.use(router);


module.exports = app;
