$(function(){
    if(location.search.indexOf("lid=")!=-1){
        var lid=location.search.split("=")[1];
        (async function(){
            var res=await $.ajax({
                url:"http://localhost:3000/details",
                type:"get",
                data:{lid},
                dataType:"json",
                success:function(res){
                    console.log(res)
                    //解构返回的数据信息--product[]
                    var {img_country,country,name,title,details,price,price_del,img1,img2}=res.product[0];
                    //头信息    
                    var html=`<img src="${img_country}" alt="">
                        <span>${country}</span>
                        <span class="split">|</span>
                        <a href="javascript:;" class="brand">${name}</a>`;
                    var divCard=document.querySelector("#SP>dt.orig-country")
                    divCard.innerHTML=html;  
                    var html=`<span>${title}</span>`;
                    var divCard=document.getElementById("Title");
                    divCard.innerHTML=html;

                    //详情介绍
                    var html=`<dt class="subTit">${details}</dt>`
                    var divCard=document.getElementById("Details");
                    divCard.innerHTML=html;

                    //价格
                    var html=`<div class="m-price">
                        <span class="m-line-title m-price-title j-price-title">售价</span>
                        <div class="m-price-cnt">
                            <span class="PInfo_r currentPrice">￥<span>${price.toFixed(2)}</span>
                            </span>
                            <span class="PInfo_r marketPrice addprice j-marketprice">参考价格&nbsp;&nbsp;￥<span>${price_del.toFixed(2)}</span>
                            </span>
                        </div>
                    </div>`
                    var divCard=document.getElementById("Price");
                    divCard.innerHTML=html;

                    //服务
                    var html=`<img class="postage-img" src="${img_country}" alt="">
                        <p class="postage-title" >
                            <span class="m-tit">全球直采</span>
                        </p>
                        <span class="postage-line active"></span>`
                    var divCard=document.getElementById("country")
                    divCard.innerHTML=html;
                    
                    //商品颜色图片
                    var html=`<li class="imgbox selectedLi" data-vid="" title="银色">
                            <a href="javascript:void(0);" hidefoucs="true">
                                <img src="${img1}" alt="" width="50px;" height="50px;">
                            </a>
                        </li>
                        <li class="imgbox" data-vid="" title="深空灰">
                            <a href="javascript:void(0);" hidefoucs="true">
                                <img src="${img2}" alt="" width="50px;" height="50px;">
                            </a>
                        </li>
                        `
                    var divCard=document.getElementById("j_skuwrap").children[1].children[1].children[0];
                    divCard.innerHTML=html;

                    //相关推荐
                    var html="";
                    for(var p of res.product.slice(1)){
                        var {title,img1,price,price_del,p_text}=p;
                        html+=`<div class="newRecomItemWrap newRecomItemWrap-1">
                            <a href="#" class="itemIng">
                                <img src="${img1}" alt="" style="opacity:1;" width="110px;" height="110px;">
                            </a>
                            <p class="itemTitle">
                                <a class="protitle" href="#">${title}</a>
                            </p>
                            <div class="itemInfo clearfix">
                                <p class="price">
                                    <span class="symbol">￥</span>${price}
                                    <span class="marprice">￥
                                        <del>${price_del}</del>
                                    </span>
                                </p>
                                <a href="#" class="comment">${p_text}</a>
                            </div>
                        </div>`
                    }
                    var divCard=document.querySelector("#j-listsimilar>div");
                    divCard.innerHTML=html;

                    //获得的----imglist[]
                    var html = "";
                    var pics = res.imglist[0].imglist.split("?");
                    //console.log(pics);
                    var mp4 = pics[0].split(".")[1];
                    if(mp4 == "mp4"){//如果是MP4格式的就用video标签
                        html +=`<p style="text-align:center;">
                            <video width="100%" controls="controls" poster="${pics[1]}" src="${pics[0]}"></video>
                        </p>`
                    }else if(mp4 == "jpg" || mp4 == "png"){//如果是  .jpg/.png/....就用img的标签
                        html += `<p style="text-align:center;">
                            <img class="img-lazyload img-lazyloaded" src="${pics[0]}" >
                        </p>
                        <p style="text-align:center;">
                            <img class="img-lazyload img-lazyloaded" src="${pics[1]}" >
                        </p>`
                    }
                    for(var i=2;i<pics.length-5;i++){
                            html +=  `<p style="text-align:center;">
                            <img class="img-lazyload img-lazyloaded" src="${pics[i]}" >
                        </p>`
                    }
                    var divCard = document.getElementById("textareabox");
                    divCard.innerHTML = html;
                    //考拉的宣传：末尾
                    var html = ""
                    var pics_end = pics.slice(pics.length-5);
                    //console.log(pics_end)
                    html = `<img class="img-lazyload img-lazyloaded" height="542px" src="${pics_end[0]}">
                        <img class="img-lazyload img-lazyloaded" src="${pics_end[1]}" >
                        <div class="f-hkdn">
                            <p style="display:inline-block;width:710px;">
                                <img class="img-lazyload img-lazyloaded" src="${pics_end[2]}" >
                            </p>
                            <video id="qualityvideo" loop="loop" style="width:710px;margin-left:-3px" controls="true" poster="${pics_end[3]}" src="${pics_end[4]}"></video>
                        </div>`
                    var divCard = document.querySelector("#goodsDetail>div.packdate");
                    divCard.innerHTML = html;


                    //大中小图片---pic[]
                    var html=""
                    for(var p of res.pics){
                        var {sm,md,lg}=p;
                        html+=` <li><a href="javascript:;">
                            <img src="${sm}" alt="" data-md="${md}" data-lg="${lg}">
                        </a>
                    </li>`
                    }
                    var ul=document.getElementById("litimgUl");
                    ul.innerHTML=html;
                    ul.style.width=64*res.pics.length+"px";

                    //找中图片位置，并从数据库替换
                    var mImg=document.querySelector("#showImgBox>img");
                    mImg.src=res.pics[0].md;
                    //找大图片位置，并从数据库替换
                    var lgImg=document.getElementById("showImgBig")
                    lgImg.src=res.pics[0].lg;

                    //鼠标进入切换中图片和大图片
                    ul.onmouseover=function(e){
                        if(e.target.nodeName==="IMG"){
                            var img=e.target;
                            var md=img.dataset.md;
                            var lg=img.dataset.lg;
                            mImg.src=`${md}`;
                            lgImg.src=`${lg}`;
                            
                        }
                    }
                    
                    
                    
                    //小图片的左右移动
                    var $ul=$("#litimgUl");
                    //左边的按钮-后退功能
                    var $left=$("#j-producthead>div>div>a:first");
                    //右边的按钮-前进功能
                    var $right=$left.next();
                    //console.log($right,$left)
                    //如果pics中的图片总数<=4
                    if(res.pics.length<=4)
                        //右边按钮添加 class="disabled" 
                        $right.addClass("disabled")
                    var moved=0;//记录已经左移的图片个数
                    $left.on("click",function(){
                        var $left=$(this);
                        if(!$left.is(".disabled")){
                            moved--;//已经左移的图片-1
                            //ul的marginLeft始终等于：-1i宽度的*64左移图片个数
                            $ul.css("marginLeft",-81*moved)//不用加px
                            $right.removeClass("disabled")
                            if(moved==0)
                                $left.addClass("disabled")
                        }
                    })
                    $right.on("click",function(){
                        var $right=$(this);
                        if(!$right.is(".disabled")){
                            moved++//已经左移的图片+1
                            $ul.css("marginLeft",-81*moved)
                            //让左移的按钮去除disabled
                            $left.removeClass("disabled")
                            //如果pics中图总数个数-move次数==4
                            if(res.pics.length-moved==4)
                                //为右边按钮加上disabled
                                $right.addClass("disabled")
                        }
                    })
                    
                    //放大镜效果
                    var $mImg=$(mImg),//中图片
                        $lgDiv=$("#showDetails"),//大图片
                        $mask=$("#mask"),//半透明罩
                        $smask=$("#super-mask");
                    var MSIZE=200,//mask的大小
                        MAX=400-MSIZE;//top和left的最大值
                    $smask.hover(
                        function(){
                            $mask.toggleClass("d-none");
                            $lgDiv.toggleClass("d-none");
                        }
                    )
                    .mousemove(function(e){
                        var left=e.offsetX-MSIZE/2;
                        var top=e.offsetY-MSIZE/2;
                        if(left<0) left=0;
                        else if(left>MAX) left=MAX;
                        if(top<0) top=0;
                        else if(top>MAX) top=MAX;
                        $mask.css({left,top});
                        $("#showImgBig").css("left",`-${16/7*left}px`); 
                        $("#showImgBig").css("top",`-${16/7*top}px`)
                    })

                    //颜色区：图片的点击选中
                    var colPic = $("#j_skuwrap>div:last-child>div>ul");
                    //console.log(colPic);
                    colPic.on("click","li",function(){
                        var $li = $(this);
                            $li.addClass("selectedLi");
                            $li.siblings().removeClass("selectedLi")
                    })

                    //点击加减 数量 提交 到后台 数据库
                    var $btnul=$("#j_buyboxnum")
                    $btnul.on("click","a",function(){
                        var $btn=$(this);
                        //var count=$btn.parent().find("input")
                        //console.log($btn)
                        (async function (){
                            var shop_id=location.search.split("=")[1];
                            var count=$btn.parent().find("input");
                            var n = parseInt(count.val());
                            if($btn.html()=="+"){
                                n++;
                            }else if(n>0){
                                n--;
                            }
                            count.val(n);
                            var count =$btn.parent().find("input").val();
                        })() 
                    })

                    //加减商品数量 添加到 数据库  
                    $("#addCart").on("click",function(e){ 
                        e.preventDefault();
                        (async function(){
                            var res = await $.ajax({//是否登录成功 返回0/1
                                url:"http://localhost:3000/users/islogin",
                                type:"get",
                                dataType:"json"
                            })
                            if(res.ok==1){//返回 1
                                var count =$("#j_buyboxnum>span>input").val();
                                var lid=location.search.split("=")[1];
                                $.ajax({
                                    url:"http://localhost:3000/cart/add",
                                    type:"get",
                                    data:{lid,count}//商品shop_id编号
                                })
                                alert(`已新增${count}件`);
                            }else{//返回 0
                                alert("请先登录!")//提示用户请先登录
                            }
                        })()
                    });
                    
                }   
            })
        })();

    }
})