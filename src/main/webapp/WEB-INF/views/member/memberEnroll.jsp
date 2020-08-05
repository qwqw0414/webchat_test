<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- ===================== Basic Setting ===================== -->

<div id="memberEnroll">
    <div class="form-group">
        <div class="row">
            <div class="col">
                <!-- 아이디 -->
                <input type="text" id="memberId" class="form-control" placeholder="아이디">
                <div class="invalid-feedback feedback" id="feedbackId">
                    다시 확인해주세요
                </div>
                <div class="valid-feedback feedback">
                    사용 가능한 아이디임
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="row">
            <div class="col">
                <!-- 비밀번호 -->
                <input type="password" id="pwd" class="form-control"
                    placeholder="비밀번호 (영소대문자, 숫자, 특수문자 조합)">
                <div class="invalid-feedback feedback">
                    다시 확인해주세요
                </div>
                <div class="valid-feedback feedback">
                    사용 가능한 비밀번호
                </div>
            </div>
        </div>
    </div>
    
    <div class="form-group">
        <div class="row">
            <div class="col">
                <!-- 비밀번호 확인 -->
                <input type="password" id="pwdCk" class="form-control"
                    placeholder="비밀번호 확인">
                <div class="invalid-feedback feedback">
                    다시 확인해주세요
                </div>
                <div class="valid-feedback feedback">
                    동일한 비밀번호
                </div>
            </div>
        </div>
    </div>
    
    <div class="form-group">
        <div class="row">
            <div class="col">
                <!-- 명 -->
                <input type="text" id="memberName" class="form-control" placeholder="이름">
                <div class="invalid-feedback feedback">
                    이름을 입력
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <button class="btn btn-dark btn-block btn-lg" id="submit">회원 가입</button>
    </div>

</div>

<script>

$(()=>{
    const root = 'div#memberEnroll ';
    const $memberId = $(root + "#memberId");
    const $pwd = $(root + "#pwd");
    const $pwdCk = $(root + "#pwdCk");
    const $memberName = $(root + "#memberName");
    const $submit = $(root + "#submit");
    let idValid = false;

    $memberId.change(()=>{
        var memberId = $memberId.val();

        if(getRegExp('id').test(memberId)){
            idValidCheck(memberId);
        }

    });

    $submit.click(()=>{

        if(!getRegExp('id').test($memberId.val())){
            alert('잘못된 아이디');
            return;
        }
        if(!idValid){
            alert('중복된 아이디');
            return;
        }
        if(!getRegExp('pwd').test($pwd.val())){
            alert('잘못된 비밀번호')
            return;
        }
        if($pwd.val() !== $pwdCk.val()){
            alert('같지 않은 비밀번호')
            return;
        }
        if(!getRegExp('name').test($memberName.val())){
            alert('잘못된 이름')
            return;
        }

        var member = {
            memberId : $memberId.val(),
            password : $pwd.val(),
            memberName : $memberName.val()
        }

        submit(member);
    });


    // 아이디 중복 검사
    function idValidCheck(memberId) {
        $.ajax({
            url: '${pageContext.request.contextPath}/member/idDuplicate',
            data: { memberId: memberId },
            dataType: 'json',
            success: (data) => {
                idValid = data == 0;
                console.log(idValid);
            },
            error: (x, s, e) => {
                console.log(x, s, e);
            }
        });
    }

    // 회원 가입
    function submit(member) {
        $.ajax({
            url: '${pageContext.request.contextPath}/member/memberEnrollEnd',
            data: member,
            dataType: 'json',
            success: (data) => {
                console.log(data);

                if (data != 0)
                    alert('회원 가입 성공');
                else
                    alert('회원 가입 실패')
            },
            error: (x, s, e) => {
                console.log(x, s, e);
            },
            complete: (data) => {
                location.href = '${pageContext.request.contextPath}/';
            }
        });
    }

});
</script>

<!-- ===================== Basic Setting ===================== -->

<jsp:include page="/WEB-INF/views/common/footer.jsp" />