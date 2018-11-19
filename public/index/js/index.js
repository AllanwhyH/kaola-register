$(function(){
    $.ajax({
        url:"http://localhost:3000/index/Products",
        type:"get",
        dataType:"json",//ajax可自动将json转为obj
        success:function(res){
            console.log(res.product)
            
            //1.轮播图---carousel[]
            var carousel = res.carousel;
            var html = "";
            html = `<li class="showImg"><a class="itm" href="#"><img class="Img" src="${carousel[0].img}" alt=""></a>
                </li>
                <li><a class="itm" href="#"><img class="Img" src="${carousel[1].img}" alt=""></a>
                </li>
                <li><a class="itm" href="#"><img class="Img" src="${carousel[2].img}" alt=""></a>
                </li>
                <li><a class="itm" href="#"><img class="Img" src="${carousel[3].img}" alt=""></a>
                </li>
                <li><a class="itm" href="#"><img class="Img" src="${carousel[4].img}" alt=""></a>
                </li>`
            divCard = document.getElementById("show_pic");
            divCard.innerHTML = html;
            //轮播的 淡入淡出 + 鼠标暂停事件 +  左右切换图片
            (function(){
                function task(){
                    //1.淡入淡出
                    //var ul=$("#show_pic");
                    var img=$("#show_pic>li.showImg");
                    //var td=$("#icon_num");
                    //var span=$("#icon_num>span>span");
                    var a=$("#icon_num>span>span>a.active");
                    a.removeClass("showImg");
                    img.removeClass("active");
                    var next=img.next();
                    var a_next=a.next();
                    if(next.length!=0 && a_next.length!=0){
                        next.siblings().removeClass("showImg")
                        next.addClass("showImg");
                        a_next.siblings().removeClass("active")
                        a_next.addClass("active");
                    }else{
                        img.parent().children().eq(0).addClass
                        ("showImg").siblings().removeClass("showImg");
                        a.parent().children().eq(0).addClass("active").siblings().removeClass("active"); 
                    }
                }
                //2.鼠标暂停事件
                var timer=setInterval(task,3000);
                $("#show_pic").hover(
                    function(){
                        clearInterval(timer);
                    },
                    function(){
                        timer = setInterval(task,3000)
                    }
                )

                //3.左右切换图片
                var $btn = $("#picBox>div>div");
                //console.log(btn)
                //var img = $()
                $btn.on("click","a",function(e){
                    e.preventDefault();
                    var $a = $(this);
                    if($a.hasClass("prev")){
                        //console.log(124);
                        var prev=$("#show_pic>li.showImg").prev();//当前图片的图片的前一张
                        var a_prev=$("#icon_num>span>span>a.active").prev();//当前小圆点的前一个
                        //console.log(prev)
                        if(prev.length==0&&a_prev.length==0){//前一张图片和前一个小圆点都有可能是  length=0  是在当前图片和小圆点都是first的时候
                            $("#show_pic>li.showImg").parent().children().eq(4).addClass("showImg").siblings().removeClass("showImg");
                            $("#icon_num>span>span>a.active").parent().children().eq(4).addClass("active").siblings().removeClass("active"); 
                        }else{//前一张图片和前一个小圆点  不是first的时候
                            prev.addClass("showImg").siblings().removeClass("showImg");
                            a_prev.addClass("active").siblings().removeClass("active");
                        }
                    }
                    if($a.hasClass("next")){
                        var next=$("#show_pic>li.showImg").next();//当前图片的图片的后一张
                        var a_next=$("#icon_num>span>span>a.active").next();//当前小圆点的后一个
                        if(next.length==0&&a_next.length==0){//后一张图片和后一个小圆点都有可能是  length=0  是在当前图片和小圆点都是last的时候
                            $("#show_pic>li.showImg").parent().children().eq(0).addClass("showImg").siblings().removeClass("showImg");
                            $("#icon_num>span>span>a.active").parent().children().eq(0).addClass("active").siblings().removeClass("active"); 
                        }else{//后一张图片和后一个小圆点  不是last的时候
                            next.addClass("showImg").siblings().removeClass("showImg");
                            a_next.addClass("active").siblings().removeClass("active");
                        }
                    }
                })
            })()
            
            

            //2.弹出列表数据---indexList[]
            var indexList = res.indexList;
            //console.log(indexList);
            var html = "";
            for(var p of indexList){
                var {img,title,tit1,tit2,tit3,tit4} = p;
                var t1 = tit1.split("?");
                var t2 = tit2.split("?");
                var t3 = tit3.split("?");
                var t4 = tit4.split("?");
                //console.log(t1)
                var html1="";
                for(var i=1;i<t1.length;i++){//1.弹出列表有4个区域 分别遍历出每个 文字
                    html1 += `<a class="f-fcred0" href="#">${t1[i]}</a>`
                }
                var html2="";
                for(var i=1;i<t2.length;i++){//2.
                    html2 += `<a class="f-fcred0" href="#">${t2[i]}</a>`
                }
                var html3="";
                for(var i=1;i<t3.length;i++){//3
                    html3 += `<a class="f-fcred0" href="#">${t3[i]}</a>`
                }
                var html4="";
                for(var i=1;i<t4.length;i++){//4
                    html4 += `<a class="f-fcred0" href="#">${t4[i]}</a>`
                }
                html += `<li class="list1">
                        <!--logo图标-->
                        <img class="icon" src="${img}" alt="">
                        <!--文字介绍-->
                        <span class="t">${title}</span>
                        <!--向右图标-->
                        <i class="iconfont i-arr">&gt;</i>
                        <!---->
                        <em class="vcenter"></em>
                        <!--分割线-->
                        <em class="seg"></em>
                        <!--弹出菜单-->
                        <div class="m-ctgcard">
                            <!--左边-->
                            <div class="f-fl m-ctglist">
                                <div class="m-ctgb1">
                                    <!--左上表-->
                                    <div class="f-cb m-ctgb1-size">
                                        <!--list列表内容-->
                                        <div class="litd">
                                            <div class="underTitleMiddleLine"></div>
                                            <div class="item">
                                                <p class="title">
                                                    <a href="#" class="cat2">${t1[0]}</a>
                                                </p>
                                                <div class="ctgnamebox">
                                                    ${html1}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="litd">
                                            <div class="item">
                                                <p class="title">
                                                    <a class="cat2" href="#">${t2[0]}</a>
                                                </p>
                                                <div class="ctgnamebox">
                                                    ${html2}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--左下表-->
                                    <div class="f-cb m-ctgb1-size">
                                        <!--下拉列表-->
                                        <div class="litd">
                                            <div class="underTitleMiddleLine"></div>
                                            <div class="item">
                                                <p class="title">
                                                    <a class="cat2" href="#">${t3[0]}</a>
                                                </p>
                                                <div class="ctgnamebox">
                                                    ${html3}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="litd">
                                            <div class="item">
                                                <p class="title">
                                                    <a class="cat2" href="#">${t4[0]}</a>
                                                </p>
                                                <div class="ctgnamebox">
                                                   ${html4}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--右边上-->
                            <div class="f-fl m-brandbox">
                                <div class="brandlist f-cb">
                                    <a href="#"><img src="img/1-rmai-1.jpg" alt=""></a>
                                    <a href="#"><img src="img/2-rmai-1.jpg" alt=""></a>
                                    <a href="#"><img src="img/3-rmai-1.jpg" alt=""></a>
                                    <a href="#"><img src="img/4-rmai-1.jpg" alt=""></a>
                                    <a href="#"><img src="img/5-rmai-1.jpg" alt=""></a>
                                    <a href="#"><img src="img/6-rmai-1.jpg" alt=""></a>
                                    <a href="#"><img src="" alt=""></a>
                                    <a href="#"><img src="" alt=""></a>
                                </div>
                            </div>
                            <!--右边下-->
                            <div class="f-fr imgbox">
                                <a href="#">
                                    <img class="u-img" src="img/List-1.jpg" alt="">
                                </a>
                            </div>
                        </div>
                    </li>`

                html 
            }
            var divCard = document.querySelector("#topCats>ul");
            divCard.innerHTML = html;
            var html = ""
            

            /*会场图片*/
            var html="";
            for(var p of res.product.slice(0,4)){
                var {img}=p;
                html+=`
                <li><a class="pic" style="height:332px;" href="#"><img src="${img}" alt=""></a></li>`
            }
            var divCard=document.querySelector("#rowOfResource>ul>li>ul");
            divCard.innerHTML=html;

            /*今日限时购*/
            var html="";
            for(var p of res.product.slice(4,8)){
                var {title,details,img,price,price_del,xcount,href}=p;
                html+=`<li class="goods f-cb">
                    <a class="pic" href="#">
                        <img src="${img}" alt="" class="img-lazyload img-lazyloaded">
                    </a>
                    <div class="detail">
                        <h3 class="intro">
                            <a href="#">${title}</a>
                        </h3>
                        <h3 class="shortTitle">
                            <a href="#">${details}</a>
                        </h3>
                        <p class="price">
                            <b>￥</b>
                            ${price}
                            <span>￥</span>
                            <del>${price_del}</del>
                        </p>
                        <div class="process process-limit">${xcount}</div>
                        <a class="btn f-hover" href="${href}">立即抢购</a>
                    </div>
                </li>
                `
            }
            var divCard=document.querySelector("#jrxsg>section>ul");
            divCard.innerHTML=html;
            var {img}=res.product[8];
            var html=`<a href="#" class="pic">
                <img src="${img}" alt="" class="img-lazyload img-lazyloaded">
            </a>`
            var divCard=document.querySelector("#jrxsg>section>aside")
            divCard.innerHTML=html;

            /*今日上新*/
            var {title,img,img2}=res.product[9];
            var html=`<li class="itm item-brand-new"><a href="#">
                        <div class="good-info">
                            <div class="image-wrap">
                                <img class="img f-hover" src="${img}" alt="">
                            </div>
                            <div class="recomds-brand-mask">
                                <p class="desc">港式老牌糕点</p>
                                <p class="profix">
                                    <span>
                                        月饼每满
                                        <i>199</i>
                                        减
                                        <i>20</i>
                                        元
                                    </span>
                                </p>
                            </div>
                        </div>
                        <div class="brand-info">
                            <div class="image-wrap">
                                <img src="${img2}" alt="">
                            </div>
                            <p class="brand-name">
                                <span>${title}</span>
                            </p>
                        </div>
                    </a>
                </li>`
            for(var p of res.product.slice(10,16)){
                var {title,img,price,price_del}=p;
                html+=`<li class="itm itm-goods">
                        <a class="pic" href="#">
                            <img src="${img}" alt="">
                        </a>
                        <a class="tit" href="#">${title}</a>
                        <p class="price">
                            <span class="cur">
                                ￥
                                <b>${price}</b>
                            </span>
                            <span class="mkt">
                                ￥
                                <del>${price_del}</del>
                            </span>
                        </p>
                    </li>`
            }
            var {img,title}=res.product[16];
            html+=`<li class="itm itm-goods">
                <a class="pic" href="#" style="background:url(${img}) left center no-repeat rgb(255,255,255);">
                </a>
                <a class="tit" href="#">${title}</a>
            </li>`
            var divCard=document.querySelector("#jrsx>div>ul")
            divCard.innerHTML=html;

            /*热门品牌*/
            var html="";
            for(var p of res.product.slice(17,20)){
                var {img,title,details}=p;
                html+=`<li class="itm">
                    <a href="#"><img class="img" src="${img}" alt=""></a>
                    <div class="txt">
                        <p class="name">${title}</p>
                        <p class="desc">${details}</p>
                    </div>
                </li>`
            }
            var divCard=document.querySelector("#pcBrandModuleId>section>div>ul")
            divCard.innerHTML=html;
            var html="";
            for(var p of res.product.slice(20,28)){
                var {img,title,details}=p;
                html+=`<li class="itm">
                    <div class="info" style="width:100%;">
                        <img class="img" src="${img}" alt="">
                        <p class="desc">${title}</p>
                    </div>
                    <div class="actions">
                        <a class="follow" href="#">+关注</a>
                        <p class="followers">${details}</p>
                        <a class="enter" href="#">进入品牌</a>
                    </div>
                </li>`
            }
            var divCard=document.querySelector("#pcBrandModuleId>section>ul")
            divCard.innerHTML=html;

            /*母婴专区-函数product进行各专区调用*/
            function product(first,startM,endM,startR,endR,rmai1,rmai2,ID){
                var {img}=res.product[first];
                var html=`<img class="img-lazyload opacity1 img-lazyloaded" src="${img}" alt="" width="330px;" height="541px;">`;
                var divCard=document.querySelector("#"+ID+">div.cont>div.part1>a")
                divCard.innerHTML=html; 
                var html="";
                for(var p of res.product.slice(startM,endM)){
                    var {title,details,img}=p;
                    html+=`<li class="itm"><a class="pic" href="#">
                        <h3 class="tit">${title}</h3>
                        <p class="desc s-fc2">${details}</p>
                        <img class="img-lazyload img-lazyloaded" src="${img}" alt="" width="180px;" height="144px;">
                    </a></li>`;
                }
                var divCard=document.querySelector("#"+ID+">div.cont>div.partm>ul")
                divCard.innerHTML=html; 
                var html="";
                for(var p of res.product.slice(startR,endR)){
                    var {title,img,price,price_del}=p;
                    html+=`<div class="itemsale clearfix">
                        <a class="pic" href="#">
                            <img width="75px;" height="75px;" src="${img}" alt="">
                        </a>
                        <div class="proinfo">
                            <h3 class="tit">
                                <a class="protitle" href="#" title="${title}">${title}</a>
                            </h3>
                            <p class="curprice">
                                <span class="symbol">￥</span>
                                <strong>${price}</strong>
                                <span class="item2">
                                    ￥
                                    <del>${price_del}</del>
                                </span>
                            </p>
                        </div>
                    </div>`
                }
                var divCard=document.querySelector("#"+ID+">div.cont>div.party>div>div")
                divCard.innerHTML=html; 
                /*母婴-热卖品牌*/
                var html="";
                for(var p of res.product.slice(rmai1,rmai2)){
                    var {img}=p;
                    html+=`<a class="pic" href="#">
                        <img src="${img}" alt="">
                        <span class="follow"></span>
                        <span class="toast">已关注</span>
                    </a>`
                }
                var divCard=document.querySelector("#"+ID+">div.w-logolist>div.brandListContainer")
                divCard.innerHTML=html; 
            }
            product(28,35,39,63,67,95,100,"my");
            /*美容彩妆*/
            product(29,39,43,67,71,100,105,"meir");
            /*服饰鞋包*/
            product(30,43,47,71,75,105,110,"shirt");
            /*家居个护*/
            product(31,47,51,75,79,110,115,"homeju");
            /*营养保健*/
            product(32,51,55,79,83,115,120,"yyang");
            /*数码家电*/
            product(33,55,59,83,87,120,125,"sma");
            /*运动户外*/
            product(34,59,63,87,91,125,130,"sport");

            /*猜你喜欢*/
            var html="";
            for(var p of res.product.slice(91,95)){
                var {img,title,price,price_del}=p;
                html+=`<li class="itm itm-goods">
                    <a class="pic" href="#">
                        <img width="180px;" height="180px;" src="${img}" alt="">
                    </a>
                    <a class="tit" href="#">${title}</a>
                    <p class="price">
                        <span class="cur">
                            ￥
                            <b>${price}</b>
                        </span>
                        <span class="mkt">
                            ￥
                            <del>${price_del}</del>
                        </span>
                    </p>
                </li>`
            }
            var divCard=document.querySelector("#ylike>div>ul")
            divCard.innerHTML=html; 

            
        }
    })
})