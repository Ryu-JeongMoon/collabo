$(".emailSend").on("click", function () {
    var email = $(".email_input").val();

    if (email == "") {
        alert("메일 주소가 입력되지 않았습니다.");
    } else {
        $.ajax({
            type: 'post',
            url: '/email/send',
            data: {
                email: email
            },
            dataType: 'json',
        });
        alert("인증번호가 전송되었습니다.")
    }
});

$('.emailCheck').click(function () {
    var emailCheckCode = $(".checkEmail_input").val();

    if (emailCheckCode == "") {
        alert("인증 번호가 입력되지 않았습니다.");
    } else {
        $.ajax({
            type: "post",
            url: "/email/check",
            data: {
                emailCheckCode: emailCheckCode
            },
            async: false,
            dataType: 'text',
            success: function (result) {
                if (result == 'success') {
                    $('.email_input_re_1').css("display", "inline-block");
                    $('.email_input_re_2').css("display", "none");
                    alert("인증 확인되었습니다");
                } else {
                    $('.email_input_re_1').css("display", "none");
                    $('.email_input_re_2').css("display", "inline-block");
                    alert("인증 실패했습니다");
                }
            }
        });
    }
});