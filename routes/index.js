const express=require("express")
const router=express.Router()
const pool=require("../pool")

/*router.get("/Products",(req,res)=>{
  var sql="SELECT * FROM kl_index_product";
  pool.query(sql,[],(err,result)=>{
    if(err) console.log(err);
    //res.send(result);
    res.writeHead(200,{
      "Content-Type":"application/json;charset=utf-8",
      "Access-Control-Allow-Origin":"*"
    })
    res.write(JSON.stringify(result));
    res.end();
  })
})*/
//接口地址: http://localhost:3000/index/Products

router.get("/Products",(req,res)=>{
  var output = {product:[],carousel:[],indexList:[]}
  var sql1 = "SELECT * FROM kl_index_product";
  var sql2 = "SELECT * FROM kl_index_carousel ";
  var sql3 = "SELECT * FROM kl_index_indexList"

  Promise.all([
    new Promise(function(open){
      pool.query(sql1,[],(err,result)=>{
        if(err) console.log(err);
        output.product = result;
        open();
        console.log("查询product完成");
      })
    }),
    new Promise(function(open){
      pool.query(sql2,[],(err,result)=>{
        if(err) console.log(err);
        output.carousel = result;
        open();
        console.log("查询carousel完成");
      })
    }),
    new Promise(function(open){
      pool.query(sql3,[],(err,result)=>{
        if(err) console.log(err);
        output.indexList = result;
        open();
        console.log("查询indexList完成");
      })
    })
  ]).then(function(){
    res.writeHead(200,{
      "Content-Type":"application/json;charset=utf-8",
      "Access-Control-Allow-Origin":"*"
    })
    res.write(JSON.stringify(output));
    res.end();
    console.log("响应完成")
  })
  
})

module.exports=router;