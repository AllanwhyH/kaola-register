const express=require("express")
const router=express.Router()
const pool=require("../pool")

//验证用户名是否存在
router.get("/checkUname",(req,res)=>{
    var uname=req.query.uname;
    var reg = /^\w{6,12}$/ig;
    if(!uname){
        res.send({ok:3,msg:"用户名不能为空"})//用户名为空
        return
    }else if(!reg.exec(uname)){
        res.send({ok:4,msg:"用户名必须为2-12位"})//用户名为2-12位
        return
    }
    var sql = " SELECT * FROM kl_user WHERE uname=? "
    pool.query(sql,[uname],(err,result)=>{
        if(err) throw err;
        if(result.length > 0){
            res.write(JSON.stringify({
                ok:2,
                msg:"用户名已存在"
            }))//用户名不能用
        }else{
            res.write(JSON.stringify({
                ok:1,
                msg:"用户名可用"
            }))//用户名可用res.send('1');
        }
        res.end();
    })
})

//注册用户
router.post('/register',(req,res)=>{
    var uname = req.body.uname;
    var upwd = req.body.upwd;
    var sql = 'INSERT INTO kl_user VALUES (NULL,?,?,NUll,NULL,NULL,NULL,NULL)'
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err) throw err;
        res.send({ok:1,msg:"注册成功"})
    })
})

//是否
router.post("/signin",(req,res)=>{
    var uname=req.body.uname;
    var upwd=req.body.upwd;
    console.log(uname,upwd);
    pool.query(
        "select * from kl_user where uname=? and upwd=?",//到数据库查找uanme  upwd
        [uname,upwd],
        (err,result)=>{
            if(err) console.log(err);
            if(result.length>0){
                res.writeHead(200);
                var user=result[0]
                req.session.uid=user.uid
                console.log(req.session["uid"])
                res.write(JSON.stringify({
                    ok:1,
                    msg:"登陆成功!"
                }))
            }else{
                res.write(JSON.stringify({
                    ok:0,
                    msg:"用户名或密码错误!"
                }))
            }
            res.end()
        }
    )
})

//登录是否成功
router.get("/islogin",(req,res)=>{
    res.writeHead(200);
    if(req.session.uid===undefined){
        res.write(JSON.stringify({ok:0}))
        res.end()//结束
    }else{//有uid时
        var uid=req.session.uid;
        var sql="select * from kl_user where uid=?"//在数据库找uid信息
        pool.query(sql,[uid],(err,result)=>{
            if(err) console.log(err);
            var user=result[0];//user
            res.write(JSON.stringify({
                ok:1,uname:user.uname
            }))
            res.end()
        })
    }
})

//注销功能
router.get("/signout",(req,res)=>{
    req.session["uid"]=undefined;
    res.write(JSON.stringify({
        ok:0,uname:"登录"
    }))
    res.end();
})
//测试：
//http://localhost:3000/users/islogin ok:0
//.../users/signin?uname=dingding&upwd=123456 ok:1
//.../users/islogin ok:1
//.../users/signout
//.../users/islogin ok:0
module.exports=router;