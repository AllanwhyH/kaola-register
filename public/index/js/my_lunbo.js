/*function task(){
    var ul=document.getElementById("show_pic");
    var img=ul.querySelector(".showImg");

    var td=document.getElementById("icon_num");
    var span=td.children[0].children[0];
    var a=span.querySelector(".active");
    a.className="";

    img.className="";
    var next=img.nextElementSibling;
    var a_next=a.nextElementSibling;
    if(next!=null && a_next!=null){
        next.className="showImg";
        a_next.className="active";
    }else{
        img.parentNode.children[0].className="showImg";
        a.parentNode.children[0].className="active";
    }

    var $btn = $("#picBox>div>div");
    //console.log(btn)
    
    $btn.on("click","a",function(e){
        e.preventDefault();
        clearInterval(timer);
        var $a = $(this);
        if($a.hasClass("prev")){
            console.log(124);
            var prev=img.prev();
            if(prev==undefined){
                img.parent().find(":last-child").addClass("showImg");
            }else{
                prev.addClass("showImg");
            }
        }
        if($a.hasClass("next")){
            console.log(431);
            var next = img.next();
            if(next==undefined){
                img.parent().find(":first-child").addClass("showImg");
            }else{
                next.addClass("showImg");
            }
        }
    })
    

}
var timer=setInterval(task,3000);
show_pic.onmouseover=function(){
    clearInterval(timer);
}
show_pic.onmouseout=function(){
    timer=setInterval(task,3000)
}
icon_num.onmouseover=function(){
    clearInterval(timer);
};
icon_num.onmouseout=function(){
    timer=setInterval(task,3000)
};*/

/*function task(){
    //clearTime();
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

    /*var $btn = $("#picBox>div>div");
    //console.log(btn)
    
    $btn.on("click","a",function(e){
        e.preventDefault();
        clearInterval(timer);
        var $a = $(this);
        if($a.hasClass("prev")){
            console.log(124);
            var prev=img.prev();
            if(prev==undefined){
                img.parent().find(":last-child").addClass("showImg");
            }else{
                prev.addClass("showImg");
            }
        }
        if($a.hasClass("next")){
            console.log(431);
            var next = img.next();
            if(next==undefined){
                img.parent().find(":first-child").addClass("showImg");
            }else{
                next.addClass("showImg");
            }
        }
    })

}

var timer=setInterval(task,3000);
function clearTime(){
    clearInterval(timer);
}
//clearTime();
//console.log(clearTime());
//clearTime();
//console.log($("#show_pic"))
var $Img = $("#show_pic");
console.log($Img)
/*$Img.hover(
    function(){
        console.log(timer);
        clearTime();
        console.log(123);
    },
    function(){
        timer = setInterval(task,3000)
    }
)

$Img.on("mouseover",function(){
    //console.log(timer);
    clearTime();
});
$Img.on("mouseout",function(){
    //console.log(timer)
    timer=setInterval(task,3000)
});*/