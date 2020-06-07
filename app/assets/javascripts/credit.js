document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("token_submit") != null) { 
      var form = $("#charge-form");
      Payjp.setPublicKey("pk_test_8e13b8dae6954376a8865e87"); 
      let btn = document.getElementById("token_submit"); 
      btn.addEventListener("click", e => { 
        e.preventDefault(); 
        let card = {
          number: document.getElementById("number_form").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        }; 
        Payjp.createToken(card, (status, response) => {
          if (status === 200) { 
            $("#number_form").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name");
            $("#charge-form").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            ); 
            document.inputForm.submit();
            alert("登録が完了しました");
          } else {
            alert("カード情報が正しくありません。"); 
          }
        });
      });
    }
  },
  false
);