
function validate() {
    let re = /^[a-zA-Z0-9]{4,20}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
    let nameRe = /^[가-힣a-zA-Z]{2,20}$/;
    let ageRe = /^[0-9]{1,3}$/;
    let phoneRe = /^010\d{8}$/;
    let emailRe = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    let addressRe = /^[가-힣a-zA-Z ]{10,200}$/;

    //-----------------------------------------

    let id = document.getElementById("id");
    let pw = document.getElementById("password");
    let name = document.getElementById("name");
    let age = document.getElementById("age");
    let phone = document.getElementById("phone");
    let email = document.getElementById("email");
    let address = document.getElementById("address");


    if (!check(re, id, "아이디는 4~20자의 영문 대소문자와 숫자로만 입력해주세요,")) {
        return false;
    }

    if (!check(re, pw, "비밀번호는 4~20자의 영문 대소문자와 숫자로만 입력해주세요.")) {
        return false;
    }

    if (!check(nameRe, name, "이름은 2~20자의 한글 또는 영문으로 입력해주세요.")) {
        return false;
    }

    if (!check(ageRe, age, "나이는 12~120 범위만 입력해주세요.")) {
        return false;
    }

    if (!check(phoneRe, phone, "전화번호는 010으로 시작하여 10~11자리로 입력해주세요.")) {
        return false;
    }

    if (!check(addressRe, address, "주소는 최소 10자 이상 입력해야 합니다.")) {
        return false;
    }

    if (!check(emailRe, email, "적합하지 않은 이메일 형식입니다.")) {
        return false;
    }
}

function check(re, what, message) {
    if (re.test(what.value)) {
        return true;
    }
    alert(message);
    what.focus();
}

const validityMessage = {
    badInput: '잘못된 입력입니다.',
    patternMismatch: '패턴에 맞게 입력하세요.',
    rangeOverflow: '범위를 초과하였습니다.',
    rangeUnderflow: '범위에 미달하였습니다.',
    stepMismatch: '간격에 맞게 입력하세요',
    tooLong: '최대 입력 범위를 벗어났습니다.',
    tooShort: '최소 입력 범위를 벗어났습니다.',
    typeMismatch: '잘못된 형식으로 입력하셨습니다.',
    valueMissing: '빈 값을 입력할 수 없습니다.',
}

function getMessage(validity) {
    for (const key in validityMessage) {
        if (validity[key]) {
            return validityMessage[key]
        }
    }
}

function showError(input) {
    /**
     * 커스텀 메세지: setCustomValidity()
     * https://developer.mozilla.org/en-US/docs/Web/API/HTMLSelectElement/setCustomValidity
     * - 오류가 있으면 문자열 전달
     * - 오류가 없으면 빈 문자열 전달
     */
    console.log('showError', getMessage(input.validity))
    input.setCustomValidity(getMessage(input.validity) || '')
}

function onload() {
    document.querySelectorAll('input').forEach(input => {

        input.addEventListener('invalid', () => {
            document.forms[0].classList.add('was-validated')

            // 커스텀 에러메세지 설정
            showError(input)
        })

        // 인풋시
        input.addEventListener('input', () => {
            if (document.forms[0].classList.contains('was-validated')) {
                input.reportValidity()
            }
        })
    })
}

function button_event(frm) {
    if(!confirm('아이디는 복구할 수 없습니다.\n탈퇴하시겠습니까?')) {
        return false;
    }
    frm.submit();
}

document.addEventListener('DOMContentLoaded', onload);
document.addEventListener('window.onunload', validate);
document.addEventListener('window.onunload', button_event);