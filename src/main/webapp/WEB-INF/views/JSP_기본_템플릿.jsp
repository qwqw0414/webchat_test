<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- ===================== CSS ===================== -->
<style>
.curtain{
    position: absolute;
    z-index: 9999;
    width: 100%;
    height: 100vh;
    background-color: rgb(48, 48, 48);
    overflow: hidden;
}
.curtain-call{
    /* animation: scale-out-ver-top 0.5s cubic-bezier(0.550, 0.085, 0.680, 0.530) both; */
    /* animation: slide-out-fwd-center 0.7s cubic-bezier(0.550, 0.085, 0.680, 0.530) both; */
    /* animation: slide-out-blurred-top 0.45s cubic-bezier(0.755, 0.050, 0.855, 0.060) both; */
    /* animation: flicker-out-1 2s linear both; */
    /* animation: scale-out-center 0.5s cubic-bezier(0.550, 0.085, 0.680, 0.530) both; */
    animation: slide-out-top 0.5s cubic-bezier(0.550, 0.085, 0.680, 0.530) both;
}
.curtain .title{
    color:white;
    text-shadow: lightskyblue 0 0 15px;
    font-size: 8ch;
    animation: vibrate-1 0.3s linear infinite both;
}
.curtain .info{
    color:white;
    text-shadow: lightskyblue 0 0 15px;
    font-size: 2ch;
}
.curtain .title:hover {
    animation: jello-horizontal 0.9s both;
}
.snow{
    position: absolute;
    color:rgb(206, 231, 245);
    text-shadow: lightskyblue 0 0 20px;
    opacity: 0.8;
    transition-duration: 0.5s;
    animation: slide-in-top 7s ease-in infinite both;
    opacity: 0;
    font-family: 'Jua', sans-serif;
}
.snow span{
    position: relative;
}
</style>
<!-- ===================== HTML ===================== -->
<div id="jsp 파일명 아이디로 지정 필수">
    <div class="curtain">
        <div id="snowZip">
        </div>

        <div class="row h-100">
            <div class="col-sm-12 my-auto">
                <div class="text-center">
                    <p class="title" id="curtainCall">semi-project</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ===================== JS ===================== -->
<script>
    
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />