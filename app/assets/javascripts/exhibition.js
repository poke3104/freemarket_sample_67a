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
    console.log(childrenCategory);
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