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

    // inputタグにおいてEnterキーをTabキーと同様に機能させる
    function fEnterChangeTab(){	
    
        var oObject = ".wrapper :input:not(:button):not(:hidden)";
        
        $(oObject).keypress(function(e) { 
        var c = e.which ? e.which : e.keyCode;
        if (c == 13) {  
            var index = $(oObject).index(this);
            var cNext = "";
            var nLength = $(oObject).length;
            for(i=index;i<nLength;i++){
                cNext = e.shiftKey ? ":lt(" + index + "):last" : ":gt(" + index + "):first";
                if ($(oObject + cNext).attr("readonly") == "readonly") {
                    if (e.shiftKey) index--; 
                    else index++;
                }
                else if ($(oObject + cNext).prop("disabled") == true) {
                    if (e.shiftKey) index--;
                    else index++;
                }
                else break;
            }
            if (index == nLength - 1) {
                if (! e.shiftKey){
                    cNext = ":eq(1)";
                }
            }
            if (index == 0) {
                if (e.shiftKey) {
                    cNext = ":eq(" + (nLength - 1) + ")";
                }
            }
            $(oObject + cNext).focus();
            e.preventDefault() 
        }  
        }); 
    } 
    
    if(window.attachEvent){
        window.attachEvent('onload',fEnterChangeTab);
    }
    else if (window.opera){
        window.addEventListener('load',fEnterChangeTab,false);
    }
    else {
        window.addEventListener('load',fEnterChangeTab,false);
    }

});
