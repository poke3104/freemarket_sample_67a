$(function(){
  $(".reveal_password").on("click", function(){

    let input1 = $("#password1")
    if (input1.attr("type") == "password") {
      input1.attr("type", "text");
    } else {
      input1.attr("type", "password");
    }

    let input2 = $("#password2")
    if (input2.attr("type") == "password") {
      input2.attr("type", "text");
    } else {
      input2.attr("type", "password");
    }

  })
})