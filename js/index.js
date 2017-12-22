function getTotalTop(elem){
    var sum=0;
    do{
        sum+=elem.offsetTop;
        elem=elem.offsetParent;
    }while(elem);
    return sum;
};

/*异步加载页面内容*/
$(function () {
  $.ajax({
    url: 'data/product/index.php',
    success: function (data) {
      //1.加载轮播广告项
      var adHtml = '';
      var indicatorHtml = '';
      for (var i = 0; i < data.carouselItems.length; i++) {
        var c = data.carouselItems[i];
        adHtml += `
				<div class="${i==0 ? 'item active' :'item'}">
                    <a href="${c.href}"><img src="${c.img}"></a>
                </div>
                `;
        indicatorHtml += `
                    <li data-slide-to="${i}" class="${i==0 ? 'active' :''}" data-target="#banners"></li>
                `;
      }
	  $("#banners>.carousel-inner").html(adHtml);
	  $("#banners>.carousel-indicators").html(indicatorHtml);
        /*adHtml+=`
            <li>
                <a href="${data.carouselItems[0].href}"><img src="${data.carouselItems[0].img}"></a>
            </li>
        `;
      $('.ck-slide .ck-slide-wrapper').html(adHtml);
      $('.dot-wrap').html(indicatorHtml);
        var list=$('.ck-slide .ck-slide-wrapper'),
            i=0,
            timer=null,
            width=1000,//图片宽度
            li=$(".ck-slide .ck-slide-wrapper>li");
        list.css("width",width*li.length+"px");
        console.log(li);
        function move(){
            timer=setTimeout(()=>{
                if(i<li.length-1){
                    i++;
                    console.log(i);
                    list.css("left",-width*i+"px");
                    if(i<li.length-1){
                        $(".dot-wrap>li:eq("+i+")").addClass("current").siblings().removeClass("current");
                    }else{
                        $(".dot-wrap>li:first").addClass("current").siblings().removeClass("current");
                    }
                }else{
                    list.css("left",0);
                    list.css("transition","");
                    setTimeout(()=>{
                        i=1;
                        console.log(i);
                        $(".dot-wrap>li:eq("+i+")").addClass("current").siblings().removeClass("current");
                        list.css("transition","all 1s linear");
                        list.css("left",-width*i+"px");
                    },50);
                }
                console.log();
                move();
            },2000);
        }
        move();
        document.querySelector('.dot-wrap').onmouseenter=document.querySelector('.ck-slide .ck-slide-wrapper').onmouseenter=function(){//图块显示区域鼠标移入事件
            clearTimeout(timer);
        }
       document.querySelector('.dot-wrap').onmouseleave=document.querySelector('.ck-slide .ck-slide-wrapper').onmouseleave=function(){//图块显示区域鼠标移处事件
            move();
        }

        document.querySelector(".dot-wrap").onmouseover=function(e){
            var s=e.target;
            console.log(s);
            if(s.nodeName=="LI"){
                if(s.className!="current"){
                    i=[].indexOf.call(s.parentNode.querySelectorAll(s.tagName),s);
                    console.log(i);
                    list.css("transition","all 1s linear");
                    list.css("left",-width*i+"px");
                    $(".dot-wrap li:eq("+i+")").addClass("current").siblings("").removeClass("current");
                }
            }

        };
        $(".ck-slide .ck-prev").click(function(){
            var i=$(".dot-wrap .current").index();
            console.log(i);
            if(i>=1){
                i--;
                list.css("left",-width*i+"px");
                $(".dot-wrap>li:eq("+i+")").addClass("current").siblings().removeClass("current");
            }else if(i==0){
                i=li.length-2;
                list.css("left",-width*i+"px");
                $(".dot-wrap>li:eq("+i+")").addClass("current").siblings().removeClass("current");
            }
        });
        $(".ck-slide .ck-next").click(function(){
            var i=$(".dot-wrap .current").index();
            console.log(i);
            if(i>=0&&i<li.length-2){
                i++;
                console.log(i);
                list.css("left",-width*i+"px");
                $(".dot-wrap>li:eq("+i+")").addClass("current").siblings().removeClass("current");
            }else{
                console.log(i);
                i++;
                list.css("left",-width*i+"px");
                $(".dot-wrap>li:first").addClass("current").siblings().removeClass("current");
                setTimeout(()=>{
                    list.css("left",0);
                    list.css("transition","");
                },50);
            }

        });*/
      /*$('.ck-slide').ckSlide({
        autoPlay: true,//默认为不自动播放，需要时请以此设置
        dir: 'x',//默认效果淡隐淡出，x为水平移动，y 为垂直滚动
        interval: 3000//默认间隔2000毫秒
      });*/
		console.log(data);
      //2.加载“首页推荐”
      var html = `
            <div>
              <div class="desc">
                <p class="name">${data.recommendedItems[0].title}</p>
                <p class="details">${data.recommendedItems[0].details}</p>
                <p class="price">￥${data.recommendedItems[0].price}</p>
                <a href="${data.recommendedItems[0].href}" class="view">查看详情</a>
              </div>
              <img src="${data.recommendedItems[0].pic}">
            </div>
            <div>
              <img src="${data.recommendedItems[1].pic}">
              <div class="desc">
                <p class="name">${data.recommendedItems[1].title}</p>
                <p class="details">${data.recommendedItems[1].details}</p>
                <p class="price">￥${data.recommendedItems[1].price}</p>
                <a href="${data.recommendedItems[1].href}" class="view">查看详情</a>
              </div>
            </div>
            <div>
              <div class="desc">
                <p class="name">${data.recommendedItems[2].title}</p>
                <p class="price">￥${data.recommendedItems[2].price}</p>
                <a href="${data.recommendedItems[2].href}" class="view">查看详情</a>
              </div>
              <img src="${data.recommendedItems[2].pic}">
            </div>
            <div class="product ">
              <img src="${data.recommendedItems[3].pic}" alt=""/>
              <h2>${data.recommendedItems[3].title}</h2>
              <p>￥${data.recommendedItems[3].price}</p>
              <a href="${data.recommendedItems[3].href}">查看详情</a>
            </div>
            <div class="product ">
              <img src="${data.recommendedItems[4].pic}" alt=""/>
              <h2>${data.recommendedItems[4].title}</h2>
              <p>￥${data.recommendedItems[4].price}</p>
              <a href="${data.recommendedItems[4].href}">查看详情</a>
            </div>
            <div class="product ">
              <img src="${data.recommendedItems[5].pic}" alt=""/>
              <h2>${data.recommendedItems[5].title}</h2>
              <p>￥${data.recommendedItems[5].price}</p>
              <a href="${data.recommendedItems[5].href}">查看详情</a>
            </div>
            `;
      $('#f1 .floor_content').html(html);

      //2.加载“最新上架 /F2”
      var html = `
            <div>
              <div class="desc">
                <p class="name">${data.newArrivalItems[0].title}</p>
                <p class="details">${data.newArrivalItems[0].details}</p>
                <p class="price">￥${data.newArrivalItems[0].price}</p>
                <a href="${data.newArrivalItems[0].href}" class="view">查看详情</a>
              </div>
              <img src="${data.newArrivalItems[0].pic}">
            </div>
            <div>
              <img src="${data.newArrivalItems[1].pic}">
              <div class="desc">
                <p class="name">${data.newArrivalItems[1].title}</p>
                <p class="details">${data.newArrivalItems[1].details}</p>
                <p class="price">￥${data.newArrivalItems[1].price}</p>
                <a href="${data.newArrivalItems[1].href}" class="view">查看详情</a>
              </div>
            </div>
            <div>
              <div class="desc">
                <p class="name">${data.newArrivalItems[2].title}</p>
                <p class="price">￥${data.newArrivalItems[2].price}</p>
                <a href="${data.newArrivalItems[2].href}" class="view">查看详情</a>
              </div>
              <img src="${data.newArrivalItems[2].pic}">
            </div>
            <div class="product ">
              <img src="${data.newArrivalItems[3].pic}" alt=""/>
              <h2>${data.newArrivalItems[3].title}</h2>
              <p>￥${data.newArrivalItems[3].price}</p>
              <a href="${data.newArrivalItems[3].href}">查看详情</a>
            </div>
            <div class="product ">
              <img src="${data.newArrivalItems[4].pic}" alt=""/>
              <h2>${data.newArrivalItems[4].title}</h2>
              <p>￥${data.newArrivalItems[4].price}</p>
              <a href="${data.newArrivalItems[4].href}">查看详情</a>
            </div>
            <div class="product ">
              <img src="${data.newArrivalItems[5].pic}" alt=""/>
              <h2>${data.newArrivalItems[5].title}</h2>
              <p>￥${data.newArrivalItems[5].price}</p>
              <a href="${data.newArrivalItems[5].href}">查看详情</a>
            </div>
            `;
      $('#f2 .floor_content').html(html);

      //2.加载“热卖单品 /F3”
      var html = `
            <div>
              <div class="desc">
                <p class="name">${data.topSaleItems[0].title}</p>
                <p class="details">${data.topSaleItems[0].details}</p>
                <p class="price">￥${data.topSaleItems[0].price}</p>
                <a href="${data.topSaleItems[0].href}" class="view">查看详情</a>
              </div>
              <img src="${data.topSaleItems[0].pic}">
            </div>
            <div>
              <img src="${data.topSaleItems[1].pic}">
              <div class="desc">
                <p class="name">${data.topSaleItems[1].title}</p>
                <p class="details">${data.topSaleItems[1].details}</p>
                <p class="price">￥${data.topSaleItems[1].price}</p>
                <a href="${data.topSaleItems[1].href}" class="view">查看详情</a>
              </div>
            </div>
            <div>
              <div class="desc">
                <p class="name">${data.topSaleItems[2].title}</p>
                <p class="price">￥${data.topSaleItems[2].price}</p>
                <a href="${data.topSaleItems[2].href}" class="view">查看详情</a>
              </div>
              <img src="${data.topSaleItems[2].pic}">
            </div>
            <div class="product ">
              <img src="${data.topSaleItems[3].pic}" alt=""/>
              <h2>${data.topSaleItems[3].title}</h2>
              <p>￥${data.topSaleItems[3].price}</p>
              <a href="${data.topSaleItems[3].href}">查看详情</a>
            </div>
            <div class="product ">
              <img src="${data.topSaleItems[4].pic}" alt=""/>
              <h2>${data.topSaleItems[4].title}</h2>
              <p>￥${data.topSaleItems[4].price}</p>
              <a href="${data.topSaleItems[4].href}">查看详情</a>
            </div>
            <div class="product ">
              <img src="${data.topSaleItems[5].pic}" alt=""/>
              <h2>${data.topSaleItems[5].title}</h2>
              <p>￥${data.topSaleItems[5].price}</p>
              <a href="${data.topSaleItems[5].href}">查看详情</a>
            </div>
            `;
      $('#f3 .floor_content').html(html);

        var f1TotalTop=getTotalTop(//红
            document.getElementById("f1")
        );

        var lift=document.getElementById("lift");
        window.addEventListener("scroll",()=>{
            var scrollTop=document.body.scrollTop||document.documentElement.scrollTop;
            lift.style.display=f1TotalTop<=scrollTop+innerHeight/2?"block":"none";
            if(lift.style.display=="block"){
                var FHEIGHT=699;
                var fs=document.querySelectorAll(".floor");
                for(var i=0;i<fs.length;i++){
                    var totalTop=getTotalTop(fs[i]);
                    var start=totalTop-innerHeight/2;
                    var end=start+FHEIGHT;
                    if(scrollTop>=start&&scrollTop<end)
                        break;
                }
                var currLi=lift.querySelector(".lift_item_on")
                if(currLi)currLi.className="lift_item";
                lift.querySelector(`li:nth-child(${i+1})`).className="lift_item_on";
            }
        });

        var as=lift.querySelectorAll(".lift_item>a");
        for(let i=0;i<as.length;i++){
            as[i].onclick=()=>{
                fi=document.getElementById("f"+(i+1));
                var totalTop=getTotalTop(fi);
                $("html,body").animate({
                    scrollTop:totalTop-70
                },500);
            }
        }
    }
  });
});