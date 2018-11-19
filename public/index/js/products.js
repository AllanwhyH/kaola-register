$(function(){
    if(location.search.indexOf("kwords=")!=-1){
        var kwords = decodeURI(
            location.search.split("=")[1]
        );
        var pno = 0;
        function loadPage(no=0){//新页号
            pno = no;
            $.ajax({
                url:"http://localhost:3000/products",
                type:"get",
                data:{kwords,pno},
                dataType:"json",
                success:function(output){
                    console.log(output);
                    var { products,pageCount }=output;
                    var html="";
                    for(var p of products){
                        var {lid,img,title,youhui,details,price,price_del}=p;
                        html+=`<li class="g-col col-1x5">
                            <div class="goods-bd">
                                <div class="goods-bd-border" style="border:1px solid;">
                                    <!--图片+title+details+price+btn-->
                                    <div class="goods-img">
                                        <a href="details.html?lid=${lid}">
                                            <img class="img u-loaded" src="${img}" alt="">
                                        </a>
                                        <div class="m-tagitem3">
                                            <div class="u-tagbtn u-tagbtn-1">${youhui}</div>
                                        </div>
                                    </div>
                                    <h5 class="goods-title">
                                        <a href="details.html?lid=${lid}">${title}</a>
                                    </h5>
                                    <h6 class="goods-introduce">${details}</h6>
                                    <div class="m-priceitem" style="color:rgb(255,30,50);">
                                        <span class="price">
                                            <i class="rmb">￥</i>${price}
                                        </span>
                                        <span class="mktprice">
                                            <del>￥${price_del}</del>
                                        </span> 
                                    </div>
                                    <a href="javascript:;" class="goods-btn" style="background-color:rgb(255,30,50);">
                                        <span id="btn" data-lid=${lid}>加入购物车</span>
                                    </a>
                                </div> 
                            </div>
                        </li>`
                    }
                    $ulist.html(html);

                    //页数的按钮1 2 3 4
                    var html="";
                    console.log(pageCount)
                    for(var i=1;i<=pageCount;i++){
                        html+=`<${i==pno+1?'span':'a'} style="${i==pno+1?'color:#fff':''}" >${i}</${i==pno+1?'span':'a'}>`
                    }
                    //删除中间li:
                    $pbtn.children(":not(:first-child):not(:last-child)").remove();
                    $pbtn.children().first().after(html)//追加到 上一页 后
                    if(pno==0){//如果当前页是第一页就禁用 ：上一页
                        $pbtn.children().first().addClass("disabled")
                    }else{//否则就启用：上一页
                        $pbtn.children().first().removeClass("disabled")
                    }
                    if(pno==pageCount-1){
                        $pbtn.children().last().addClass("disabled")
                    }else{
                        $pbtn.children().last().removeClass("disabled")
                    }
                }
            })
        }
        loadPage();

        var $ulist=$("#ulist");
        var $pbtn=$("#pbtn");
        //只在页面首次加载时，分页按钮的父元素上绑定一次
        $pbtn.on("click","a",function(e){
            e.preventDefault();
            var $a=$(this);
            //除了禁用和当前正在激活的按钮之外才能点击
            if(!$a.is(".disabled,.active")){
                if($a.is(":first-child"))//上一页
                    var no=pno-1;//新页号：当前页号 —1
                else if($a.is(":last-child"))
                    var no=pno+1;//新页号：当前页号 +1
                else//1,2,3,4
                    var no=$a.html()-1//新页号按内容-1
                loadPage(no);//重新加载新页面
            }
        });

        //点击:添加购物车能够在数据库给登录的用户添加商品记录商品编号+数量  
        //问题:需要将相同编号的商品整合,不能点一下 增加一行
        $ulist.on("click","span#btn",function(e){
            e.preventDefault();
            var $btn=$(this);
            (async function(){
                var res = await $.ajax({//是否登录成功 返回0/1
                    url:"http://localhost:3000/users/islogin",
                    type:"get",
                    dataType:"json"
                })
                if(res.ok==1){//返回 1
                    var count = 1;
                    var lid = $btn.attr("data-lid")//商品lid 在data-lid中
                    await $.ajax({//发送请求将商品的lid和 count添加到数据库中;
                        url:"http://localhost:3000/cart/add",
                        type:"get",
                        data:{lid,count}
                    })
                    alert("添加成功!")//提示添加成功
                }else{//返回 0
                    //console.log(location.href)
                    alert("请先登录!")//提示用户请先登录
                    //跳转到登录页
                    location.href=location.href.slice(0,22)+"login-register/login.html?back="+location.href;
                    //console.log(location.href)
                }
            })()
        });
    }
})