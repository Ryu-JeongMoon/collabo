function add_div() {
    var div = document.createElement('div');
    div.innerHTML = document.getElementById('room_type').innerHTML;
    document.getElementById('field').appendChild(div);
}

function del_div() {
    var div = document.createElement('div');
    div.innerHTML = document.getElementById('room_type').innerHTML;
    document.remove(getElementById('field').childNodes);
}

function remove_div(obj) {
    document.getElementById('field').removeChild(obj.parentNode);
}

function maxLengthCheck(obj) {
    if (obj.value.length > obj.maxLength) {
        obj.value = obj.value.slice(0, obj.maxLength);
    }
}
