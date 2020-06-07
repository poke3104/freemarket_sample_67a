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

  $(".edit-box__delete").on("click", function(){
    $(".gray-back").fadeIn("show");
    $(".delete-comfirmation").fadeIn("show")

    $(".gray-back").on("click", function(){
      $(".gray-back").fadeOut("show")
      $(".delete-comfirmation").fadeOut("show")
    })
    $(".cancel-btn").on("click", function(){
      $(".gray-back").fadeOut("show")
      $(".delete-comfirmation").fadeOut("show")
    })
  })
})