$(function() {

    // 画像選択プレビュー
    $(document).on('change', '.ins-new--right__image input[type="file"]', function(e) {
        e.preventDefault
        var file = e.target.files[0],
            reader = new FileReader(),
            $default = $(".ins-new--right__default")
            $preview = $(".ins-new--right__preview")

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
});
