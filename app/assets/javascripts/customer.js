$(function() {

    $(document).on('ready', function() {
        console.log("customer.js OK");
    });

    $("tr[data-link]").click(function() {
        window.location = $(this).data('link')
    });

    $('.cus-new--right__image').on('change', 'input[type="file"]', function(e) {
        var file = e.target.files[0],
            reader = new FileReader(),
            $preview = $(".cus-new--right__preview")

        // 画像ファイル以外の場合は何もしない
        if(file.type.indexOf("image") < 0) {
            return false;
        }

        // ファイル読み込みが完了した際のイベント登録
        reader.onload = (function(file) {
            return function(e) {
                // preview画像を削除する
                $preview.empty();
                // 領域の中にロードした画像を表示するimageタグを追加
                $preview.append($('<img>').attr({
                    src: e.target.result,
                    width: "100px",
                    height: "100px",
                    id: "preview",
                    title: file.name,
                }));
                // // 編集削除ボタンを表示する
                // $('.btn-box').css('display', 'block');
            };
        })(file);
        reader.readAsDataURL(file);
    });
});
