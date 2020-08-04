<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- ===================== Basic Setting ===================== -->

<div id="memberEnroll">
    <input type="hidden" id="idValid" value="0">
    <input type="text" id="memberId" placeholder="아이디" class="form-control">
    <br>
    <span id="msg-valid-id"></span>
    <br>
    <input type="password" id="pwd" placeholder="비밀번호" class="form-control">
    <br>
    <input type="password" id="pwd_ck" placeholder="비밀번호 확인" class="form-control">
    <br>
    <input type="text" id="memberName" placeholder="이름" class="form-control">
    <br>
    <button id="submit" class="btn btn-outline-info btn-block">가입</button>

</div>

<script>

$(()=>{
    const root = 'content div#contents div#memberEnroll ';
    let $submit = $(root + '#submit');
    let $memberId = $(root + '#memberId');
    let $pwd = $(root + "#pwd");
    let $pwd_ck = $(root + "#pwd_ck");
    let $memberName = $(root + "#memberName");
    let $idValid = $(root + "#idValid");
    let $msgValidId = $(root + "#msg-valid-id");

//  정규식
    let reg_id = /^[a-z]+[a-z0-9]{5,16}$/g; // 영문 시작 숫자 조합 6 ~ 16
    let reg_pwd = /^.*(?=^.{7,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; //특문 + 영문자 대 + 소 + 숫자 8 ~ 16
    let reg_name = /^[가-힣]{2,4}$/;    // 한글 2 ~ 4

    $memberId.keyup(()=>{
        idValidCheck();
    });

    $submit.click(()=>{
        
        if(!reg_id.test($memberId.val())){
            alert("ID - 영문 시작 숫자 조합 6 ~ 16");
            $memberId.focus();
            return;
        }

        if($idValid.val() == 0){
            alert("중복된 아이디입니다.");
            $memberId.focus();
            return;
        }

        if(!reg_pwd.test($pwd.val())){
            alert("Password - 특문 + 영문자 대 + 소 + 숫자 8 ~ 16");
            $pwd.focus();
            return;
        }

        if($pwd.val() !== $pwd_ck.val()){
            alert("서로 다른 비밀번호");
            $pwd.focus();
            return;
        }

        if(!reg_name.test($memberName.val())){
            alert("잘못된 이름");
            $memberName.focus();
            return;
        }

        var member = {
            memberId : $memberId.val(),
            password : $pwd.val(),
            memberName : $memberName.val()
        };


        $.ajax({
            url: '${pageContext.request.contextPath}/member/memberEnrollEnd',
            data: member,
            dataType: 'json',
            success: (data) => {
                console.log(data);
                
                if(data != 0) 
                    alert('회원 가입 성공');
                else
                    alert('회원 가입 실패')
            },
            error: (x,s,e) =>{
                console.log(a,b,c);
            },
            complete: (data) => {
                location.href = '${pageContext.request.contextPath}/';
            }
        });
    });

    // 아이디 중복 검사
    function idValidCheck(){

        var memberId = $memberId.val();

        if(memberId.trim().length > 6){

            if(reg_id.test(memberId)){

                $.ajax({
                    url: '${pageContext.request.contextPath}/member/idDuplicate',
                    data: {memberId : memberId},
                    dataType: 'json',
                    success: (data) => {
                        console.log(data);

                        if (data == 0){
                            $msgValidId.text("사용 가능한 아이디");
                            $idValid.val(1);
                            return;
                        }
                        else{
                            $msgValidId.text("사용중인 아이디");
                        }
                    },
                    error: (x, s, e) => {
                        console.log(a, b, c);
                    }
                });

            }
        }
        else{
            $msgValidId.text('');
        }
        $idValid.val(0);
    }

});

</script>

<!-- ===================== Basic Setting ===================== -->

<jsp:include page="/WEB-INF/views/common/footer.jsp" />