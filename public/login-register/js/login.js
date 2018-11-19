$(function(){
    //找元素
    $("#loginwrap>div.loginForm>div.loginbox>div>div>div.btn-box>a").click(function(){
        var uname=$("#d2>div.u-input>input").val();
        var upwd=$("#d4>div>div.pwd-input>input").val()
        ;

        console.log(uname,upwd);
        (async function(){
            var res=await $.ajax({
                url:"http://localhost:3000/users/signin",
                type:"post",
                data:{uname,upwd},
                dataType:"json"
            })
            if(res.ok==0)//如果登录失败
                alert(res.msg);
            else{
                alert("登录成功!")//跳转到index.html
                if(location.search.startsWith("?back=")){
                    console.log(location.search);
                    var url=location.search.slice(6)
                }else{
                    var url="/index/index.html"
                }
                location.href=url;
            }
        })()
    })
})