// common.js

// 정규식 리턴 함수
function getRegExp(key) {
    const regDic = {
        id : /^[a-z]+[a-z0-9]{5,16}$/g, // 영문 시작 숫자 조합 6 ~ 16
        pwd : /^.*(?=^.{7,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/, //특문 + 영문자 대 + 소 + 숫자 8 ~ 16
        name : /^[가-힣]{2,4}$/, // 한글 2 ~ 4
        
        end : ''
    }
    return regDic[key];
}