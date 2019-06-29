$(function() {

    $(document).on('ready', function() {
        console.log("customer.js OK");
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

    $(document).on('keyup', '.cus-new--left__amount--input > input', function(){
        var input = ".cus-new--left__amount--input > input";
            amount = $(input).val();
            str = String(amount); 
            amount_str = str.replace(/(\d)(?=(\d\d\d)+$)/g, '$1,');
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
