$(function(){
  var menuItem = $(".tree-displayNone")
  var timer;

  $(".left-contents__item--first").hover(
    function(){
      $("#category").css('color', '#ffb340');

      menuItem.show();
      menuItem.hover(
        function(){
          clearTimeout(timer)
          $(this).show();
        }, 
        function(){
          $(this).hide();
        }
      );
    }, 
    function(){
      $("#category").css('color', '');

      timer = setTimeout(function(){
        menuItem.hide();
      }, 500);
    }
  );

  $(".category-type__item").find("a").hover(
    function(){
      $(this).css('color', '#ffb340');
    },
    function(){
      $(this).css('color', '');
    }
  )

  $(".left-contents__item").hover(
    function(){
      $("#brand").css('color', '#ffb340');
    },
    function(){
      $("#brand").css('color', '');
    }
  );

  $(".btn-app").hover(
    function(){
      $(this).css('opacity', '0.5');
    },
    function(){
      $(this).css('opacity', '');
    }
  );

  $(".btn-google").hover(
    function(){
      $(this).css('opacity', '0.5');
    },
    function(){
      $(this).css('opacity', '');
    }
  );

  $(".product-list").hover(
    function(){
      $(this).css('opacity', '0.5');
    },
    function(){
      $(this).css('opacity', '');
    }
  )

  $(".footer-lists").find("a").hover(
    function(){
      $(this).css('text-decoration', 'underline');
    },
    function(){
      $(this).css('text-decoration', '');
    }
  )
});