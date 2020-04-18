$(function(){
  $(".header-nav").find("a").hover(
    function(){
      $(this).css('color', 'mediumturquoise')
    },
    function(){
      $(this).css('color', '')
    }
  )

  $(".like-btn").hover(
    function(){
      $(this).css('opacity', '0.5');
    },
    function(){
      $(this).css('opacity', '');
    }
  )

  $(".option-btn").hover(
    function(){
      $(this).css('opacity', '0.5');
    },
    function(){
      $(this).css('opacity', '');
    }
  )
})