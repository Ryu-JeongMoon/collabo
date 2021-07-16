let totalValue = 0;
let totalTag;

window.onload = function () {
    totalTag = document.getElementById("total");

    totalValue = parseInt(totalTag.value);
}

function sum(opt) {
    let optValue = parseInt(opt.value.split("/")[1]);

    if (opt.checked) {
        totalValue += optValue;
    } else {
        totalValue -= optValue;
    }

    totalTag.value = totalValue;
}

// function update_go() {
//     var con = confirm("\n수정하시겠습니까?\n◈ 악용 방지를 위해 목표 금액은 수정이 불가합니다. ◈");
//     if (con == true) {
//         location.href = "/funding/fundingUpdate";
//     } else {
//         alert("취소되었습니다.");
//     }
// }
//
// function delete_go() {
//     var con = confirm("삭제하시겠습니까?");
//     if (con == true) {
//         location.href = "/funding/deleteBoard?product_no=${funding.product_no}";
//     } else {
//         alert("취소되었습니다.");
//     }
// }

function alert_go(frm) {
    var check = $('.check:checked');

    if (check.length > 0) {
        var con =
            confirm("\n◈ 펀딩 참여 전 확인하세요! ◈\n\n펀딩은 예약 결제 신청 후,\n100% 달성 시 지정 결제일에 결제됩니다."
                + "\n펀딩은 쇼핑과 달리 결제가 진행된 이후에는\n단순 변심으로 인한 취소나 환불이 어려울 수 있습니다.\n");
        if (con == true) {
            frm.submit();
        } else {
            alert("취소되었습니다.")
        }
    } else {
        alert("리워드를 선택해주세요.");
    }
}

function alert_login(frm) {
    alert("로그인이 필요한 서비스입니다.");
    location.href = "/login";
}