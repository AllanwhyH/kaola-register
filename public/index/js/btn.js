var form=document.getElementById("cartForm").parentNode
form.onclick=function(e){
    var btn=e.target;
    if(!((btn.className.indexOf("z-dis"))==-1)){//触发事件 如果按下的元素
        var input=btn.parentNode.children[1];//找到input输入框
        var n=parseInt(input.value)
        if(btn.innerHTML=="+")
            n++;
        else if(n>0)
            n--;
        input.value=n;

        //查找修改元素
        var price=parseFloat(
            btn.parentNode.parentNode.previousElementSibling.children[1].children[0].innerHTML
        )//单价
        var subtotal=price*n;
        btn.parentNode.parentNode.nextElementSibling.children[0].innerHTML=subtotal.toFixed(2)//单件商品的总价

        //数量之和-自营国内仓
        var nums_g=document.querySelectorAll(
            "ul#shopbtn1>li>div:nth-child(5)>span"
        );
        //console.log(nums_g)
        var g_count=0;
        for(var num_g of nums_g){
            g_count+=parseFloat(num_g.innerHTML)
        }
        var price1=form.children[2].children[1].children[1].children[1].children[0].children[0];
        price1.innerHTML="￥"+g_count.toFixed(2);
        /*数量之和-自营海外仓
        var nums_w=document.querySelectorAll(
            "ul#shopbtn2>li>div:nth-child(5)>span"
        );
        var w_count=0;
        for(var num_w of nums_w){
            w_count+=parseFloat(num_w.innerHTML)
        }
        var price2=form.children[3].children[1].children[1].children[1].children[0].children[0];
        price2.innerHTML="￥"+w_count.toFixed(2);*/
        //数量之和--总计
        var nums=document.querySelectorAll(
            "#cartbox>div>div.m-cart>div.goods>ul>li>div:nth-child(4)>span>input"
        );
        var count=0;
        for(var num of nums){
            count+=parseFloat(num.value)
        }
        allCount=form.children[4].children[1].children[0].children[1].children[0].children[0];
        allCount.innerHTML=count;
        //结算的总价变化
        var allprice=form.children[4].children[1].children[0].children[1].children[0].children[1].children[0];
        //console.log(allprice)
        allprice.innerHTML="￥"+(parseInt(price1.innerHTML.slice(1))+parseInt(price2.innerHTML.slice(1))).toFixed(2);



    }
}

