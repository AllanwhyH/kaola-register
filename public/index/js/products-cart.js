$(function(){
    async function loadCart(){
        var res = await $.ajax({
            url:"http://localhost:3000/users/islogin",
            type:"get",
            datatype:"json"
        });
        if(res.ok==0)
            alert("暂未登录,无法使用购物车");
        else{
            var res = await $.ajax({//加载购物车
                url:"http://localhost:3000/cart/items",
                type:"get",
                dataType:"json"
            })
            //console.log(res)
            var html="",total=0,allCount=0;
            //console.log(res)
            for(var item of res){//从数据库返回用户id 和加入购物车的商品信息
                var {id,img,price,price_del,title,count,shop_id}=item
                total+=price*count;
                allCount+=count;
                html+=`<li data-err="0" class="gooditm z-selected">
                    <div class="col col0">
                        <input type="checkbox" class="u-chk" name="selectGood" checked="checked">
                    </div>
                    <div class="col col2">
                        <!--图片-->
                        <a href="#" target="_blank" class="imgwrap">
                            <img src="${img}" alt="">
                        </a>
                        <!--详情-->
                        <div class="txtwrap">
                            <h3 class="goodtlt">
                                <a href="#" title="${title}">${title}</a>
                            </h3>
                            <p class="returninfo f-toe" title="不支持7天无理由退货">
                                <img src="img/7toe.png" alt="">
                                <span class="z-error">不支持7天无理由退货</span>
                            </p>
                            <div class="goodtax f-vama">
                                <p>
                                    <span class="m-actlabel" >
                                        <em>特价
                                            <i class="u-icnft arr icon-arrow-down"></i>
                                        </em>
                                    </span>
                                </p>
                            </div>
                            <div class="m-serviceSel">
                                <div class="btn">
                                    <i class="u-serviceicon"></i>
                                    <span>选服务</span>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="col col3">
                        <del class="oldrice">${price_del}</del>
                        <div class="newprice">
                            <span>${price}</span>
                        </div>
                    </div>
                    <div class="col col4">
                        <span class="u-setcount">
                            <span class="minus z-dis" data-sid="${id}" data-id="${shop_id}">-</span>
                            <input type="text" class="ipt" name="tempBuyAmount"  value="${count}">
                            <span class="plus z-dis" data-sid="${id}" data-id="${shop_id}">+</span>
                        </span>
                        <p class="limitmsg">每日限购1件</p>
                    </div>
                    <div class="col col5">
                        <span class="sum sumrow">￥${(price*count)}</span>
                    </div>
                    <div class="col col6">
                        <a id="del" class="u-opt" data-sid="${id}" data-id="${shop_id}">删除</a>
                        <span class="u-opt">移入我的收藏</span>
                    </div>
                </li>`; 
            }
            //console.log(res)
            var ul=$("#shopbtn1")
            ul.next().find("div.allsum>span>em").html(`￥${total.toFixed(2)}`);//总价
            $("#pay").parent().find("p.allgoods>span>em").html(`￥${total.toFixed(2)}`);//总价
            $("#pay").parent().find("p.allgoods>em").html(`${allCount}`);//总数量
            ul.html(html)
        }
    }
    loadCart();

    var $ul=$("#shopbtn1")
    $ul.on("click","span.z-dis",function(){
        var $btn=$(this);
        //var count=$btn.parent().find("input")
        //console.log(count)
        (async function(){
            var id=$btn.attr("data-sid");
            var count=$btn.parent().find("input").val()
            //console.log(count)
            //console.log(id)
            //console.log($btn)
            if($btn.html()=="+"){
                count++;
            }else if($btn.html()=="-"){
                count--;
            }
            //console.log(count)
            if(count==0)
                if(!confirm("是否删除该商品?"))
                    return;
            
            await $.ajax({
                url:"http://localhost:3000/cart/update",
                type:"get",
                data:{count,id}//id 是商品id不是编号
            })
            loadCart()
        })()
    })
    
    

})