$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  // 検証ツールでname.idは確認
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="commodity[images_attributes][${index}][image]"
                    id="commodity_images_attributes_${index}_image"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" image="${url}" width="100px" height="100px">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});


$(function(){
  // セレクトオプションのHTMLを作成(child => category)
  function appendSelectItem(category){
    let html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子階層のHTMLを作成
  function appnedChildrenBox(insertHTML){
    let childrenHtml = "";
    childrenHtml = `<div class="item-details__category__select-box" id="children-box">
                      <div class="item-details__category__select-box__select-area">
                        <select name="categoryId" class="category-select" id="children-category">
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
                            <select name="categoryId" class="category-select" id="grandchildren-category">
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
