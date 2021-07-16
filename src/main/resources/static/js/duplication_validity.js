$('.id_input').on("propertychange change keyup paste input", function () {
    var id = $('.id_input').val();			// .id_input에 입력되는 값
    var data = {id: id}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

    $.ajax({
        type: "post",
        url: "/members/check",
        data: data,
        success: function (result) {
            if (result == 'success') {
                $('.id_input_re_1').css("display", "inline-block");
                $('.id_input_re_2').css("display", "none");
                $('.id_input_re_3').css("display", "none");
            } else if (result == 'short') {
                $('.id_input_re_1').css("display", "none");
                $('.id_input_re_2').css("display", "none");
                $('.id_input_re_3').css("display", "inline-block");
            } else {
                $('.id_input_re_3').css("display", "none");
                $('.id_input_re_2').css("display", "inline-block");
                $('.id_input_re_1').css("display", "none");
            }
        }// success 종료
    }); // ajax 종료
});

function setDisplay() {
    if ($('input:radio[id=forSales]').is(':checked')) {
        $('#license').show();
    } else {
        $('#license').hide();
    }
}

function initialShow() {
    if(document.getElementById('forSales').is(':checked'))
        $('#license').show();
}

document.addEventListener('DOMContentLoaded', initialShow);
document.addEventListener('DOMContentLoaded', setDisplay);