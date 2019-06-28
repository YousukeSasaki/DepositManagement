$(function() {

    $(document).on('ready', function() {
        console.log("customer.js OK");
    });

    // 一覧テーブルのリンク
    $(document).on('click', 'tr[data-link]', function(e) {
        e.preventDefault
        window.location = $(this).data('link')
    });

    // 画像選択プレビュー
    $(document).on('change', '.cus-new--right__image input[type="file"]', function(e) {
        e.preventDefault
        var file = e.target.files[0],
            reader = new FileReader(),
            $default = $(".cus-new--right__default")
            $preview = $(".cus-new--right__preview")

        // 画像ファイル以外の場合は何もしない
        if(file.type.indexOf("image") < 0) {
            return false;
        }

        // ファイル読み込みが完了した際のイベント登録
        reader.onload = (function(file) {
            return function(e) {
                // preview画像を削除する
                $default.css('display', 'none');
                $preview.empty();
                // 領域の中にロードした画像を表示するimageタグを追加
                $preview.append($('<img>').attr({
                    src: e.target.result,
                    width: "100px",
                    height: "100px",
                    id: "preview",
                    title: file.name,
                }));
            };
        })(file);
        reader.readAsDataURL(file);
    });

    // 利用者情報削除モーダルウィンドウ表示
    $(document).on('click', '#delete__modal--btn', function(e) {
        e.preventDefault();
        $(".mask").removeClass("hidden");
        $(".delete__modal").removeClass("hidden");
        $('html,body').animate( {scrollTop:0}, 1);
    });

    // モーダルウィンドウを閉じる
    $(document).on('click', '.mask', function() {
        $(".mask").addClass("hidden");
        $(".delete__modal").addClass("hidden");
    });


    var input = ".cus-new--left__amount--input > input";

    $(document).on("keyup", input, function(){
        var amount = $(input).val();
        var str = String(amount); 
        var amount_str = str.replace(/(\d)(?=(\d\d\d)+$)/g, '$1,');
        $(".cus-new--left__amount--number > p").text("¥ " + amount_str);
    });

    $(document).on('input', '#customer_amount', function() {
        var value = this.value;
        var length = this.value.length;
        var maxlength = $(this).attr('maxlength');
        
        if (length > maxlength) {
            this.value = value.slice(0, maxlength);
        }
    });
});
