$(document).on('turbolinks:load', function(){
  $(function () {
    // メソッドの定義
    var methods = {
      price: function (value, element) {
        return this.optional(element) || /^\d+$/.test(value);
      },
    }
    // メソッドの追加
    $.each(methods, function (key) {
      $.validator.addMethod(key, this);
    });

    $.validator.addMethod('my_rule', function(value, element) {
      // お決まりの定型文
      // 検証対象の要素にこのルールが設定されているか
      if ( this.optional( element ) ) {
          return true;
      }
      if (value === '選択して下さい') {
        return false;
      }
      else {
        return true;
      }
    }, '選択して下さい');

    
    // commodity_formのバリデーションの実行
    $("#commodity_form").validate({
      // ルール設定
      rules: {
        "commodity[name]": {
          required: true,
          rangelength: [1, 40]

        },
        "commodity[text]": {
          required: true,
          rangelength: [1, 1000]
        },
        "commodity[category_id]": {
          my_rule: true
        },
        "commodity[category_id]": {
          my_rule: true
        },
        "commodity[category_id]": {
          my_rule: true
        },
        "commodity[condition]": {
          required: true
        },
        "commodity[shipping_charge]": {
          required: true
        },
        "commodity[shipping_method_id]": {
          required: true
        },
        "commodity[prefecture_id]": {
          required: true
        },
        "commodity[day_to_ship]": {
          required: true
        },
        "commodity[price]": {
          required: true,
          price: true,
          range: [300, 9999999]
        },
      },
      // エラーメッセージの定義
      messages: {
        "commodity[name]": {
          required: "入力してください",
          rangelength: "40文字以内で入力してください"
        },
        "commodity[text]": {
          required: "入力してください",
          rangelength: "1000文字以内で入力してください"
        },
        "commodity[category_id]": {
          my_rule: "選択してください"
        },
        "commodity[category_id]": {
          my_rule: "選択してください"
        },
        "commodity[category_id]": {
          my_rule: "選択してください"
        },
        "commodity[condition]": {
          required: "選択してください"
        },
        "commodity[shipping_charge]": {
          required: "選択してください"
        },
        "commodity[shipping_method_id]": {
          required: "選択してください"
        },
        "commodity[prefecture_id]": {
          required: "選択してください"
        },
        "commodity[day_to_ship]": {
          required: "選択してください"
        },
        "commodity[price]": {
          required: "300以上9999999以下で入力してください",
          price: "半角数字で入力してください",
          range: "300以上9999999以下で入力してください"
        },
      },
      errorClass: "invalid",
      errorElement: "label",
      validClass: "valid",
    });
    // 入力欄or選択欄をフォーカスアウトしたときにバリデーションを実行
    $("#commodity_name, #commodity_text, #parent_category, #child_category, #grandchild_category, #commodity_condition, #commodity_shipping_charge, #commodity_shipping_method_id, #commodity_prefecture_id, #commodity_day_to_ship, #commodity_price").blur(function () {
      $(this).valid();
    });
  });
});

