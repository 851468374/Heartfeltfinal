$(function(){
    $('.Yl-container').YlSlide({
        wrapper:'.Yl-wrapper',
        slideClass:'.Yl-slide',
        stylePrefix:'.Yl-',
        slideLength:3,
        pages:true,
        pagination:'.Yl-pagination',
        pagingSelect:'.Yl-pagination-bullet-active',
        autoplay:25000,
        imgTemplate:{
            0:['<div class="Yl-img0"></div>'],
            1:['<div class="Yl-img1"></div>'],
            2:['<div class="Yl-img2"></div>']
        },
        fontTemplate:{
            0:['<div class="Yl-font0">哈哈哈</div>','<div class="Yl-font1">哈哈哈哈哈哈</div>','<div class="Yl-font2">哈哈哈</div>'],
            1:['<div class="Yl-font0">嘻嘻嘻</div>','<div class="Yl-font1">嘻嘻嘻嘻嘻嘻</div>','<div class="Yl-font2">嘻嘻嘻</div>'],
            2:['<div class="Yl-font0">嘿嘿嘿</div>','<div class="Yl-font1">嘿嘿嘿嘿嘿嘿</div>','<div class="Yl-font2">嘿嘿嘿</div>']
        },
        fontAnimationMode:{
            0:['fadeInUp','fadeInUp','slideInLeft'],
            1:['fadeInUp','fadeInUp','slideInLeft'],
            2:['fadeInUp','fadeInUp','slideInLeft']
        },
        customTemplate:{
            0:['<div class="Yl-Button"><a href="javascript:void(0);">查看详情</a></div>'],
            1:['<div class="Yl-Button"><a href="javascript:void(0);">查看详情</a></div>'],
            2:['<div class="Yl-Button"><a href="javascript:void(0);">查看详情</a></div>']
        },
        callback:function(e){
            //整个dom加载完成后的回调函数、切换动画前的回调
        },
        before: function(e) {
            //页面切换前的回调函数
        },
        after: function(e) {
            //页面切换完成后的回调函数

        }
    });
});

$(document).ready(function () {
    var trigger = $('.hamburger'),
        overlay = $('.overlay'),
        isClosed = false;

    trigger.click(function () {
        hamburger_cross();
    });

    function hamburger_cross() {

        if (isClosed == true) {
            overlay.hide();
            trigger.removeClass('is-open');
            trigger.addClass('is-closed');
            isClosed = false;
        } else {
            overlay.show();
            trigger.removeClass('is-closed');
            trigger.addClass('is-open');
            isClosed = true;
        }
    }

    $('[data-toggle="offcanvas"]').click(function () {
        $('#wrapper').toggleClass('toggled');
    });
});