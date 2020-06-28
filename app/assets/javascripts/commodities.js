$(document).on('turbolinks:load', function(){
  $(function(){
    //プレビューのhtmlを定義
    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="update-box">
                        <label class="edit_btn">編集</label>
                      </div>
                      <div class="delete-box" id="delete_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }

    // ラベルのwidth操作
    function setLabel() {
      //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
      $('input').prop('disabled', false);
    }

    // プレビューの追加
    $(document).on('change', '.hidden-field', function() {
      setLabel();
      //hidden-fieldのidの数値のみ取得
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      //labelボックスのidとforを更新
      $('.label-box').attr({id: `label-box--${id}`,for: `commodity_images_attributes_${id}_image`});
      //選択したfileのオブジェクトを取得
      var file = this.files[0];
      var reader = new FileReader();
      //readAsDataURLで指定したFileオブジェクトを読み込む
      reader.readAsDataURL(file);
      //読み込み時に発火するイベント
      reader.onload = function() {
        var image = this.result;
        //プレビューが元々なかった場合はhtmlを追加
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          //ラベルの直前のプレビュー群にプレビューを追加
          var prevContent = $('.label-content').prev();
          $(prevContent).append(html);
        }
        //イメージを追加
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        //プレビューが5個あったらラベルを隠す 
        if (count == 5) { 
          $('.label-content').hide();
        }

        //ラベルのwidth操作
        setLabel();
        //ラベルのidとforの値を変更
        if(count < 5){
          //プレビューの数でラベルのオプションを更新する
          $('.label-box').attr({id: `label-box--${count}`,for: `commodity_images_attributes_${count}_image`});
        }
      }
    });

    // 画像の削除
    $(document).on('click', '.delete-box', function() {
      var count = $('.preview-box').length;
      setLabel(count);
      //item_images_attributes_${id}_image から${id}に入った数字のみを抽出
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      //取得したidに該当するプレビューを削除
      $(`#preview-box__${id}`).remove();
      //フォームの中身を削除 
      $(`#commodity_images_attributes_${id}_image`).val("");

      //削除時のラベル操作
      var count = $('.preview-box').length;
      //5個めが消されたらラベルを表示
      if (count == 4) {
        $('.label-content').show();
      }
      setLabel(count);

      if(id < 5){
        //削除された際に、空っぽになったfile_fieldをもう一度入力可能にする
        $('.label-box').attr({id: `label-box--${id}`,for: `commodity_images_attributes_${id}_image`});
      }
    });
  });



  $(function(){
    // セレクトオプションのHTMLを作成(child => category)
    function appendSelectItem(category){
      let html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子階層のHTMLを作成
    function appnedChildrenBox(insertHTML){
      let childrenHtml = "";
      childrenHtml = `<div class="item-details__category__select-box" id="children-box">
                        <div class="item-details__category__select-box__select-area">
                          <select name="commodity[category_id]" class="category-select" id="children-category">
                            <option value="選択して下さい" data-category="選択して下さい">選択して下さい</option>
                            ${insertHTML}
                          </select>
                          <svg aria-hidden="true" fill-rule="evenodd" fill="#888888" height="24" viewBox="0 0 24 24" width="24">
                            <path d="M12,15.66a1.73,1.73,0,0,1-1.2-.49L5.21,9.54a.7.7,0,0,1,1-1l5.62,5.62c.15.15.27.15.41,0L17.8,8.6a.71.71,0,0,1,1,0,.69.69,0,0,1,0,1l-5.57,5.58A1.71,1.71,0,0,1,12,15.66Z">
                            </path>
                          </svg>
                        </div>
                      </div>`;
      $(".item-details__category").append(childrenHtml);
    }
    // 孫階層のHTMLを作成
    function appendGrandchildrenBox(insertHTML){
      let grandchildrenHtml = "";
      grandchildrenHtml = `<div class="item-details__category__select-box" id="grandchildren-box">
                            <div class="item-details__category__select-box__select-area">
                              <select name="commodity[category_id]" class="category-select" id="grandchildren-category">
                                <option value="選択して下さい" data-category="選択して下さい">選択して下さい</option>
                                ${insertHTML}
                              </select>
                              <svg aria-hidden="true" fill-rule="evenodd" fill="#888888" height="24" viewBox="0 0 24 24" width="24">
                                <path d="M12,15.66a1.73,1.73,0,0,1-1.2-.49L5.21,9.54a.7.7,0,0,1,1-1l5.62,5.62c.15.15.27.15.41,0L17.8,8.6a.71.71,0,0,1,1,0,.69.69,0,0,1,0,1l-5.57,5.58A1.71,1.71,0,0,1,12,15.66Z">
                                </path>
                              </svg>
                            </div>
                          </div>`;
      $(".item-details__category").append(grandchildrenHtml);
    }
    // 親階層のカテゴリーが選択されたときの動作
    $("#category-parent").on("change", function(){
      // 親要素のバリューを取得
      let parentCategory = document.getElementById("category-parent").value;
      // 初期値ではないことを確認し非同期通信で”category_childrenアクション”にデータを送信
      if(parentCategory != "選択して下さい"){
        $.ajax({
          url: "category_children",
          type: "GET",
          data: { parent_name: parentCategory },
          dataType: "json"
        })
        .done(function(children){
          // 親が変更された時子以下を削除
          $("#children-box").remove();
          $("#grandchildren-box").remove();
          let insertHTML = "";
          children.forEach(function(child){
            insertHTML += appendSelectItem(child)
          });
          appnedChildrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })  
      }else{
        $("#children-box").remove();
        $("#grandchildren-box").remove();
      }
    })
    // 子階層のカテゴリーが選択されたときの動作
    $(".item-details__category").on("change", "#children-category", function(){
      let childrenCategory = document.getElementById("children-category").value;
      if(childrenCategory != "選択して下さい"){
        $.ajax({
          url: "category_grandchildren",
          type: "GET",
          data: { child_name: childrenCategory },
          dataType: "json"
        })
        .done(function(grandchildren){
          // 子が変更された時孫以下を削除
          $("#grandchildren-box").remove();
          let insertHTML = "";
          grandchildren.forEach(function(grandchild){
            insertHTML += appendSelectItem(grandchild)
          });
          appendGrandchildrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $("#grandchildren-box").remove();
      }
    })
  })
})

$(function(){
  $('.text-form__price-input').on('input', function(){   //リアルタイムで表示したいのでinputを使う｡入力の度にイベントが発火するようになる｡
    var data = $('.text-form__price-input').val(); // val()でフォームのvalueを取得(数値)
    var profit = Math.round(data * 0.9)  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡
    var fee = (data - profit) // 入力した数値から計算結果(profit)を引く｡それが手数料となる｡
    $('.fee-price').html(fee) //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡
    $('.fee-price').prepend('¥') // 手数料の前に¥マークを付けたいので
    $('.profit-price').html(profit)
    $('.profit-price').prepend('¥')
    $('#price').val(profit) // 計算結果を格納用フォームに追加｡もし､入力値を追加したいのなら､今回はdataを引数に持たせる｡
    if(profit == '') {   // もし､計算結果が''なら表示も消す｡
    $('.profit-price').html('');
    $('.fee-price').html('');
    }
  })
})

$(function(){
  $(".alert").fadeOut(5000);
});

