const express=require("express")
const router=express.Router()
const pool=require("../pool")

//测试地址: http://localhost:3000/products?kwords=Apple i5 128g
router.get("/",(req,res)=>{
    var kwords=req.query.kwords;//
    var arr=kwords.split(" ")//arr[]
    for(var i=0;i<arr.length;i++){
        arr[i]=`title like '%${arr[i]}%'`
    }//arr[title like '%macbook%', ... ]
    var where=" where "+arr.join(" and ")
    //where title like '%macbook%' and title like '%i5%' and title like '%128g%'
    //要回发客户端的支持分页的对象
    var output={ pageSize:8 }//每页10 个商品
    output.pno=req.query.pno;
    var sql="select * from kl_products"//"SELECT *,(select md from kl_laptop_pic where lid=id) as md FROM kl_laptop ";
    pool.query(sql+where,[],(err,result)=>{
        if(err) console.log(err);
        output.count=result.length;//获取总记录
        output.pageCount=Math.ceil(//计算总页数
            output.count/output.pageSize);
        output.products=//截取分页后的结果
            result.slice(output.pno*8,output.pno*8+8);
        res.writeHead(200,{
            "Content-Type":"application/json;charset=utf-8",
            "Access-Control-Allow-Origin":"*"
        })
        res.write(JSON.stringify(output))
        res.end()
    })
    //测试地址... products?kwords=i5&pno=1
})

module.exports=router;