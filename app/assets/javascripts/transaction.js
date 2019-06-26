$(function() {

    $(document).on('ready', function() {
        console.log("transaction.js OK");
    });

    $(document).on("keyup", "#subject-number", function() {
        var input = $("#subject-number").val();
        $.ajax({
            type: 'GET',
            url: '/api/transactions/number',
            data: {number: input},
            dataType: 'json'
        })
        .done(function(subject) {
            var id = subject.id
            var option = $(`#transaction_subject_id > option[value=${id}]`)
            option.attr("selected","selected");
        })
        .fail(function() {
        });
    });

    var input = ".tra-new--left__amount--input > input";

    $(document).on("keyup", input, function(){
        var amount = $(input).val();
        var str = String(amount); 
        var amount_str = str.replace(/(\d)(?=(\d\d\d)+$)/g, '$1,');
        $(".tra-new--left__amount--number > p").text("¥ " + amount_str);
    });

    function sliceMaxLength(elem, maxLength) {  
        elem.value = elem.value.slice(0, maxLength);  
    }  
});
