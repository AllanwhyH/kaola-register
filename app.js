//使用express构建web服务器 --11:25
const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session');
const cors = require('cors');
/*引入路由模块*/
const index=require('./routes/index');
const users=require('./routes/users');
const details=require('./routes/details');
const cart=require('./routes/cart');
const products=require('./routes/products');

var app = express();
app.use(cors({
    origin:'http://localhost:8080',//允许哪里来的跨域请求
    credentials:true  //允许
}))
var server = app.listen(3000);
//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public目录下
app.use(express.static('public'));
app.use(session({
    secret: '128位随机字符串',
    resave: false,
    saveUninitialized: true,
}))

//req.session
/*使用路由器来管理路由*/
app.use("/index",index);
app.use("/users",users);
app.use("/details",details);
app.use("/cart",cart);
app.use("/products",products);
//接口地址http://localhost:8000/details/?lid=5

