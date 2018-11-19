$(function(){
    //找元素
    $("#login-form>div>div.btn-box").click(function(){
        var uname=$("#d2>div.u-input>input").val();
        var upwd=$("#d5>div.p-input>input").val()
        ;
        /*var reg = /^[a-zA-Z0-9]{4-10}$/
        if(reg.test(upwd)==false){
            upwd.attr("placeholder","密码为字母数字，长度为4-10")
        }*/
        console.log(uname);
        (async function(){
            var res=await $.ajax({
                url:"http://localhost:3000/users/checkUname",
                type:"get",
                data:{uname},
                dataType:"json"
            })
            console.log(res.ok)
            if(res.ok==2){//
                alert(res.msg)//跳转到index.html
            }else if(res.ok==3){
                alert(res.msg)
            }else if(res.ok==4){
                alert(res.msg)
            }
            console.log(res.msg)
            if(res.ok==1){
                var res2 =await $.ajax({
                    url:"http://localhost:3000/users/register",
                    type:"post",
                    data:{uname,upwd},
                    dataType:"json"
                })
                alert(res2.msg)//提示注册成功
                //跳转到登录页
                if(location.search.startsWith("?back=")){
                    console.log(location.search);
                    var url=location.search.slice(6)
                }else{
                    var url="/login-register/login.html"
                }
                location.href=url;
            }
        })()
        
        
    })
})