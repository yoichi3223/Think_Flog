// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require toastr
//= require_tree .
//= require bootstrap-sprockets
$(function(){
$('#homes-top-js').fadeIn(2200);
});

$(function(){
$('#media-all').fadeIn(2200);
});

$(function(){
  //.accordion_oneの中の.accordion_headerがクリックされたら
  $('.s_02 .accordion_one .accordion_header').click(function(){
    //クリックされた.accordion_oneの中の.accordion_headerに隣接する.accordion_innerが開いたり閉じたりする。
    $(this).next('.accordion_inner').slideToggle();
    $(this).toggleClass("open");
    //クリックされた.accordion_oneの中の.accordion_header以外の.accordion_oneの中の.accordion_headerに隣接する.accordion_oneの中の.accordion_innerを閉じる
    $('.s_02 .accordion_one .accordion_header').not($(this)).next('.accordion_one .accordion_inner').slideUp();
    $('.s_02 .accordion_one .accordion_header').not($(this)).removeClass("open");
  });
});
$(function() {
  $('#back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 1000);
    event.preventDefault();
  });
});

