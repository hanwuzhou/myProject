/***加载指定编号的产品详情***/
$.ajax({
  url: 'data/product/details.php',
  data: 'lid='+location.search.split('=')[1],
  success: function(result){
    $('body > .loading').hide();
    console.log(result);
    var details = result.details;
    var family = result.family;
    $('#fname').html(family.fname);

    $('#mImg').attr('src', details.picList[0].md);

    console.log(details.picList[0].lg);
    $('#largeDiv').css('background-image',`url("${details.picList[0].lg}")`);
    //缩略图
    var html = '';
    $.each(details.picList, function(i, pic){
      if(i<5){
        html += `<li class= "${i==0 ? "hover" : ""}"><img src="${pic.sm}" data-md="${pic.md}" data-lg="${pic.lg}"></li>`;
      }
    })
    $('#icon_list').html(html);

    /************放大镜***************/
    /************移动小图片***************/
    var mImg=document.getElementById("mImg"),
        largeDiv=document.getElementById("largeDiv"),
        icon_list=document.getElementById("icon_list");
    var aForward=document.querySelector("#preview>h1>.forward");
    var aBackward=document.querySelector("#preview>h1>.backward");
    console.log(aForward);
    console.log(aBackward);
    var moved=0,LIWIDTH=62;
    if(details.picList.length>0&&details.picList.length<=5){
      aForward.className="forward disabled";
      aBackward.className="backward disabled";
    }
    aForward.onclick=function(){
      if(this.className.indexOf("disabled")==-1){
        moved++;
        move();
      }
    }
    aBackward.onclick=function(){
      if(this.className.indexOf("disabled")==-1){
        moved--;
        move();
      }
    }
    function move(){
      $('#icon_list').css("left",(-moved*LIWIDTH+20)+"px");
      $("#icon_list li:eq("+moved+")").addClass("hover").siblings().remove();
      checkA();
    }
    function checkA(){
      if(details.picList.length==moved)
        aForward.className="forward disabled";
      else if(moved==0)
        aBackward.className="backward disabled";
      else{
        aForward.className="forward";
        aBackward.className="backward";
      }
    }
    /**鼠标进入小图片切换小图片和大图片**/

    icon_list.onmouseover=e=>{
      var tar=e.target;
      if(tar.nodeName=="IMG"){
        mImg.src=tar.dataset.md;
        //tar.parent().addClass("hover").siblings().remove();
        largeDiv.style.backgroundImage=`url(${tar.dataset.lg})`;
      }
    }
    /******鼠标进入中图片启动放大镜*****/
    var superMask=document.getElementById("superMask");
    console.log(superMask);
    var mask=document.getElementById("mask");
    console.log(mask);
    superMask.onmouseover=function(){
      mask.style.display="block";
      largeDiv.style.display="block";
    }
    superMask.onmouseout=function(){
      mask.style.display="none";
      largeDiv.style.display="none";
    }
    var MSIZE=175;
    var SMSIZE=350;
    superMask.onmousemove=function(e){
      var top=e.offsetY-MSIZE/2;
      var left=e.offsetX-MSIZE/2;
      if(top<0) top=0;
      else if(top>SMSIZE-MSIZE) top=SMSIZE-MSIZE;

      if(left<0) left=0;
      else if(left>SMSIZE-MSIZE) left=SMSIZE-MSIZE;

      mask.style.top=top+"px";
      mask.style.left=left+"px";
      largeDiv.style.backgroundPosition=`${-left*16/7}px ${-top*16/7}px`;
    }


    $('.right_detail .title').html(details.title);
    $('.right_detail .subtitle').html(details.subtitle);
    $('#pro_price span').html('￥'+details.price);
    $('.price .promise').html('<b>服务承诺：</b>'+details.promise);
    //规格
    var html = '<s>规格：</s><div>';
    $.each(family.laptopList, function(i, laptop){
      html += `<a href="product_details.html?lid=${laptop.lid}" class="avenge ${laptop.lid===details.lid?'borderChange':''}">${laptop.spec}</a>`;
    });
    html += '</div>';
    $('.spec').html(html);
    //详细参数
    var html = `
      <li><a href="#">商品名称：${details.lname}</a></li>
      <li><a href="#">系统：${details.os}</a></li>
      <li><a href="#">内存容量：${details.memory}</a></li>
      <li><a href="#">分辨率：${details.resolution}</a></li>
      <li><a href="#">显卡型号：${details.video_card}</a></li>
      <li><a href="#">处理器：${details.cpu}</a></li>
      <li><a href="#">显存容量：${details.video_memory}</a></li>
      <li><a href="#">分类：${details.category}</a></li>
      <li><a href="#">硬盘容量:${details.disk}</a></li>
    `;
    $('#parm ul').html(html);
    //详细介绍
    $('#product_introduction').append(details.details);

    //显示产品细节主体
    $('.product_details').show();
  }
})

/**监听商品缩略图单击事件，显示对应的中等尺寸图片**/
$('#icon_list').on('click', 'li img', function(){
  $('#mImg').attr('src', $(this).data('md'));
})

/**添加到购物车 立即购买 收藏部分**/
$(function () {
  var nav = $("#tab"); //得到导航对象
  var aside = $(".aside_nav");//右侧导航
  var win = $(window); //得到窗口对象
  var sc = $(document);//得到document文档对象。
  win.scroll(function () {
    if (sc.scrollTop() >= 1000) {
      nav.addClass("fixed_tab");
      aside.addClass("fixed_aside");
    }
    else {
      nav.removeClass("fixed_tab");
      aside.removeClass("fixed_aside");
    }
  })

  win.scroll(function () {
    if (sc.scrollTop() >= 60 && sc.scrollTop() < 1000) {
      $("#top").addClass("fixed_nav");
    }
    else {
      $("#top").removeClass("fixed_nav");
    }
  })
  //介绍区域右侧导航
  $("#iteminfo .right p").click(function () {
    //$(this).addClass("clic").siblings().removeClass("clic");
    $(this).css("background-color", "#0AA1ED").siblings().css("background-color", "#e8e8e8");
    $(this).find("a").css("color", "#fff").parent().siblings().find("a").css("color", "#828282")
  })
  /**选择商品进行添加 悬停效果**/
  $(".spec").on('mouseenter', '.avenge',function () {
    $(this).css({"border": "1px solid #0AA1ED", "color": "#0AA1ED"});
  }).on('mouseleave', '.avenge', function () {
    $(this).css({"border": "1px solid #666", "color": "#666"})
  })

  /**添加到收藏**/
  $("#collect").click(function (e) {
    e.preventDefault();
    location.href = "my_collect.html";
  })
  /**数量添加**/
  var n = $("#buy-num").val() * 1;
  $(".numberMinus").click(function () {
    if (n >= 1) {
      $("#buy-num").val(n -= 1);
    }
  })
  $(".numberAdd").click(function () {
    $("#buy-num").val(n += 1);
  })
})
//加入购物车操作
$("body").on('click', "#add_cart,#buy_now", function (e) {
  e.preventDefault();
  //获取购买数量
  console.log(1111);
  var buyCount = $("#buy-num").val();
  console.log(buyCount);
  $.ajax({
    type: 'POST',
    url: 'data/cart/add.php',
    data: {lid:location.search.split('=')[1],buyCount: buyCount},
    success: function(result){
      console.log(result);
      if(result.code===300){
        alertMsg('您尚未登录！');
        $('#alertMsg_btn1').click(function () {
          location.href = 'login.html';
        });
      }else if(result.code===200){
        alertMsg('添加成功！');
        $('#alertMsg_btn1').click(function () {
          location.href = 'cart.html';
        });
      }else {
        alertMsg('<b添加失败！</b><p>错误原因为：'+result.msg+'</p>');
      }
    }
  })

})