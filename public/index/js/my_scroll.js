window.onscroll=function(){
    var $fs=$("#mainBgWrapHome").find("article")//所有楼层
    //console.log($fs)
    var $f1=$fs.first();//第一个楼层：今日限时购
    //console.log($f1)
    var offsetTop=$f1.offset().top;//获取第一个楼层到顶部的高度
    var scrollTop=$("html,body").scrollTop();//获取网页到顶部的距离
    //document.documentElement.scrollTop;
    var indexleft=document.getElementById("indexleft");//获取的电梯按钮
    //var indexright=document.getElementById("indexBarNew");

    //1.显示隐藏
    if(innerHeight/2+scrollTop>offsetTop){//窗口高度一半+
        indexleft.style.display="block";
        //indexright.style.display="block";
    }else{
        indexleft.style.display="none";
        //indexright.style.display="none";
    }
   
    //2.遍历每个楼层,添加电梯楼层灯效果
    var $indexleft=$(indexleft)
    $fs.each((i,f)=>{
        offsetTop=$(f).offset().top;//获取当前楼层距离body的距离
        if(innerHeight/2+scrollTop>offsetTop){//如果楼层过中线
            if(i<3){
                $indexleft.find("ul.floor>li").removeClass("btn-danger")
                $indexleft.find(`ul.channel>li:eq(${i})`).addClass("btn-danger")//给当前电梯按钮显示 亮
                .siblings().removeClass("btn-danger")//移除其他按钮的样式
            }else if(i>=3){
                $indexleft.find("ul.channel>li").removeClass("btn-danger");
                $indexleft.find(`ul.floor>li:eq(${i-3})`).addClass("btn-danger")//给当前电梯按钮显示 亮
                .siblings().removeClass("btn-danger")
            }  
        }
    })
    
    //3.点击事件：轮动 对应楼层
    var $ul1 = $("#indexleft>ul.channel");//今+今+热 的 ul 
    //console.log($ul1)
    $ul1.on("click","li",function(){
        //获取点击的第几个按钮
        var i=$(this).index();
        //console.log(i)
        var offsetTop=$("#mainBgWrapHome").children(`article:not(:first-child):not(:last-child):eq(${i})`).offset().top;//获取对应楼层距离页面顶部的总距离
        //console.log(offsetTop)
        //让页面滚动到和楼层距离body顶部总距离相同的位置
        
        $("html").stop().animate({// stop(stopAll,goToEnd)是否清空动画列表,是否将当前动画执行到最后 
            scrollTop:offsetTop,//scrollTop: jquery新增属性 让页面滚动到 offsetTop的高度 相当于css焦点属性
        },1000);
    });

    var $ul2 = $("#indexleft>ul.floor");
    $ul2.on("click","li",function(){
        //获取点击的第几个按钮
        var i=$(this).index();
        //console.log(i)
        var offsetTop=$("#j-productfloor").find(`article:eq(${i})`).offset().top;//获取对应楼层距离页面顶部的总距离
        //console.log(offsetTop)
        //让页面滚动到和楼层距离body顶部总距离相同的位置
        $("html").stop().animate({//stop(true,false) stop() 
            scrollTop:offsetTop
        },1000)
    })
};
