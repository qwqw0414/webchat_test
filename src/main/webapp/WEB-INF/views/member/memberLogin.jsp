<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- ===================== CSS ===================== -->
<style>
#memberLogin{
    width: 500px;
    margin: auto;
    margin-top: 200px;
}
</style>
<!-- ===================== HTML ===================== -->
<div id="memberLogin">
    <div class="form-group">
        <input type="text" id="memberId" class="form-control" placeholder="아이디">
    </div>
    <div class="form-group">
        <input type="password" id="pwd" class="form-control" placeholder="비밀번호">
    </div>
    <div class="form-group">
        <button class="btn btn-dark btn-block btn-lg" id="loginBtn">로그인</button>
    </div>
</div>
<!-- ===================== JS ===================== -->
<script>
$(()=>{

    $("#memberLogin #loginBtn").click(()=>{
        var memberId = $("#memberLogin #memberId").val().trim();
        var password = $("#memberLogin #pwd").val().trim();

        if(memberId.length == 0 || password.length == 0)
            return;

        console.log(memberId, password);

        $.ajax({
            url: '${pageContext.request.contextPath}/member/loginValidCheck',
            mimeType: "post",
            data: { 
                memberId: memberId,
                password: password
            },
            dataType: 'json',
            success: (data) => {
                if(data){
                    location.href = '${pageContext.request.contextPath}/';
                }
                else{
                    alert("로그인 실패");
                }
            },
            error: (x, s, e) => {
                console.log(x, s, e);
            }
        });

    });

})

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />