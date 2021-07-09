function validate() {
    let re = /^[a-zA-Z0-9]{4,20}$/
    let emailRe = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    let nameRe = /^[가-힣a-zA-Z]{2,20}$/;
    let phoneRe = /^010\d{8}$/;

    let name = document.getElementById("name");
    let phone = document.getElementById("phone");
    let email = document.getElementById("email");

    // ------------ 이메일 까지 -----------
    if (!check(nameRe, name, "이름은 2~20자의 한글 또는 영문으로 입력해주세요.")) {
        return false;
    }

    if (!check(phoneRe, phone, "전화번호는 010으로 시작하여 10~11자리로 입력해주세요.")) {
        return false;
    }

    if (email.value == "") {
        alert("이메일을 입력해 주세요");
        email.focus();
        return false;
    }

    if (!check(emailRe, email, "적합하지 않은 이메일 형식입니다.")) {
        return false;
    }

    var con =
        confirm("\n◈ 펀딩 참여 전 확인하세요! ◈\n\n가장 빠른 지정 결제일은 ♤마감 후 일주일 뒤♤ 입니다."
            + "\n지정 결제일에 결제 수단을 선택할 수 있습니다.\n");
    if (con == true) {
        alert("참여가 완료되었습니다.")
    } else {
        alert("취소되었습니다. 목록으로 이동합니다.")
        location.href = "fundingList.jsp";
    }
}

function check(re, what, message) {
    if (re.test(what.value)) {
        return true;
    }
    alert(message);
    // what.value = "";
    what.focus();
}

document.addEventListener('window.onunload', validate);