const express=require("express")
const router=express.Router()
const pool=require("../pool")

router.get("/",(req,res)=>{
    var lid=req.query.lid;
    console.log(lid);
    var output={product:[],pics:[],imglist:[]};
    //用lid当前查询商品信息：pic+product
    var sql1="SELECT * FROM kl_laptop where lid=?";
    //用lid查询商品图片
    var sql2="SELECT * FROM kl_laptop_pic where lid=?"
    //用lid查询商品图片
    var sql3="SELECT * FROM kl_laptop_pic_list WHERE lid=?"
    Promise.all([
        new Promise(function(open){
            pool.query(sql1,[lid],(err,result)=>{
                if(err) console.log(err);
                output.product=result;
                
                open();
                console.log("查询product完成");
            })
        }),
        new Promise(function(open){
            pool.query(sql2,[lid],(err,result)=>{
                if(err) console.log(err);
                output.pics=result;
                open();
                console.log("查询pics完成");
            })
        }),
        new Promise(function(open){
            pool.query(sql3,[lid],(err,result)=>{
                if(err) console.log(err);
                output.imglist=result;
                
                open();
                console.log("查询imglist完成");
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