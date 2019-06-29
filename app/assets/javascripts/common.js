$(function() {

    // 一覧テーブルのリンク
    $(document).on('click', 'tr[data-link]', function(e) {
        e.preventDefault
        window.location = $(this).data('link')
    });

    // 削除モーダルウィンドウ表示
    $(document).on('click', '#delete__modal--btn', function(e) {
        e.preventDefault();
        $(".mask").removeClass("hidden");
        $(".delete__modal").removeClass("hidden");
        $('html,body').animate( {scrollTop:0}, 1);
    });

    // 削除モーダルウィンドウを閉じる
    $(document).on('click', '.mask', function() {
        $(".mask").addClass("hidden");
        $(".delete__modal").addClass("hidden");
    });

});
