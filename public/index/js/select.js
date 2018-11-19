//查找触发元素
//绑定单击事件
//查找修改元素
//修改元素
var chbAll_first=$("#cartbox>div:first>div:first>div:first>input")
var chbAll_end=$("#cartbox>div:first>div:last>div:eq(1)>div:first>div:first>input")
//console.log(chbAll_end);
var chbAll_g=$("#cartbox>div:first>div:eq(1)>div:first>input");

//console.log(chbs)
chbAll_g.onclick=function(){
    var chbAll_g=this;
    var chbs=$("#cartbox>div:first>div.m-cart:first>div.goods>ul>li>div:first>input");
    //console.log(chb)
    for(var chb of chbs){
        chb.checked=chbAll_g.checked;
    }
}