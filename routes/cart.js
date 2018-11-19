const express=require("express")
const router=express.Router()
const pool=require("../pool")

//http://localhost:3000/cart/add?shop_id=2&count=6
router.get("/add",(req,res)=>{
    var shop_id = req.query.lid;
    var count = req.query.count;
    var uid = req.session.uid;
    pool.query(
        "SELECT * FROM kl_shoppingcart_item WHERE uid=? and shop_id=? ",
        [uid,shop_id],
        (err,result)=>{
            if(err) console.log(err);
            if(result.length==0){
                pool.query(
                    "INSERT INTO kl_shoppingcart_item VALUES(null,?,?,?,0)",
                    [uid,shop_id,count],
                    (err,result)=>{
                        if(err) console.log(err)
                        res.end();
                    }
                )
            }else{
                pool.query(
                    "update kl_shoppingcart_item set count=count+? where uid=? and shop_id=?",
                    [count,uid,shop_id],
                    (err,result)=>{
                        if(err) console.log(err)
                        res.end();
                    }
                )
            }
        }

    )
    
})

//此文件要与products.js结合起来看

router.get("/items",(req,res)=>{//通过用户id查找他的购物车内容
    var uid = req.session.uid;
    var sql = `SELECT * FROM kl_shoppingcart_item inner join kl_products on shop_id=lid where uid=?`//`SELECT *,(select img from kl_products where lid=shop_id limit 1)as md FROM kl_shoppingcart_item inner join kl_laptop on shop_id=kid where uid=?`
    pool.query(sql,[uid],(err,result)=>{
        if(err) console.log(err)
        res.writeHead(200)//成功
        res.write(JSON.stringify(result))
        res.end();
    })
})

//http://localhost:3000/users/signin?uname=dingding&upwd=123456
//http://localhost:3000/cart/update?count=5&id=2
router.get("/update",(req,res)=>{
    var id = req.query.id;//
    var count = req.query.count;
    if(count>0){//添加 商品 名+数量
        var sql = "update kl_shoppingcart_item set count=? where id=?";
        var data = [count,id];
    }else{
        var sql = "delete from kl_shoppingcart_item where id=?";
        var data = [id];
    }
    pool.query(sql,data,(err,result)=>{
        if(err) console.log(err);
        res.end();
    })
})


module.exports=router;