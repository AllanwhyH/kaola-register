$(function(){
    //1.动态创建link引用header.css
    $("<link rel='stylesheet' href='css/products-header.css'>").appendTo("head")
    //2.ajax请求header.html片段
    $.ajax({
        url:"http://localhost:3000/index/products-header.html",//地址
        type:"get",//方式
        success:function(res){
            $("#header").replaceWith(res)
            //1.查找触发事件元素
            var $btnSearch=$("#tosearch>span.topsearchboxGround>span"),$input=$("#topSearchInput");
            //2.绑定事件
            $btnSearch.click(function(){//点击搜索按钮事件
                //3.查找要修改的元素
                var kw=$input.val().trim();
                if(kw!="")
                    location.href=`products.html?kwords=${kw}`;
            })
            $input.keyup(function(e){//输入框回车事件：同样转到上方url
                if(e.keyCode==13) $btnSearch.click()
            })

            if(location.search.indexOf("kwords")!=-1){
                var kwords=decodeURI(
                    location.search.split("=")[1]
                )
                $input.val(kwords)
            }

            //console.log(location.href)
            //index页面：按登录键登录并跳转到原来页面
            $("#btnLogin").click(function(e){
                e.preventDefault();
                location.href=location.href.slice(0,22)+"login-register/login.html?back="+location.href;
            })

            $.ajax({//登录
                url:"http://localhost:3000/users/islogin",
                type:"get",
                dataType:"json",
                success:function(res){
                    //如果登录返回 0 隐藏uname和退出的div
                    if(res.ok==0){
                        $("#signout").show().next().hide()
                    }else{//返回1 显示div#signout
                        $("#btnLogin2").html(res.uname);
                        $("#signout").hide().next().show()
                    } 
                }
            })
            $("#btnSignout").click(function(){//注销
                $.ajax({
                    url:"http://localhost:3000/users/signout",
                    type:"get",
                    success:function(){
                        location.reload();
                    }
                })
            })
        }
    })
})