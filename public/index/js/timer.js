function task(){
    var end=new Date("2019/01/01 00:00:00");
    var now=new Date();
    var s=parseInt((end-now)/1000);
    if(s>0){
        var d=parseInt(s/3600/24);
        if(d<10) d="0"+d;
        //s/3600/24，再下取整
        var span=document.getElementById("j-dltimebox");
        var h=parseInt(s%(3600*24)/3600);
        var i1=span.children[0];
        var i2=span.children[1];
        var h1=parseInt(h/10);
        var h2=parseInt(h%10);
        if(h>9)
            i1.innerHTML=h1;
            i2.innerHTML=h2;
        
        var m=parseInt(s%3600/60);
        var i3=span.children[3];
        var i4=span.children[4];
        var m1=parseInt(m/10);
        var m2=parseInt(m%10);
        if(m>9)
            i3.innerHTML=m1;
            i4.innerHTML=m2;
        
        s%=60;
        var i5=span.children[6];
        var i6=span.children[7];
        var s1=parseInt(s/10);
        var s2=parseInt(s%10);
        if(s>9)
            i5.innerHTML=s1;
            i6.innerHTML=s2; 
        
    }else{
        clearInterval(timer);
        var span=document.getElementById("j-dltimebox");
    }
}
task();
var timer=setInterval(task,1000)
