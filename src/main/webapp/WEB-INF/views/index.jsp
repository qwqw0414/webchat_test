<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- ===================== CSS ===================== -->
<style>
.curtain{
    position: absolute;
    width: 100%;
    height: 100vh;
    background-color: rgb(48, 48, 48);
    overflow: hidden;
}
.curtain-call{
    font-family: 'BMHANNAPro', sans-serif;
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
<div id="index">
    <div class="curtain">
        <div id="snowZip">
        </div>

        <div class="row h-100">
            <div class="col-sm-12 my-auto">
                <div class="text-center">
                    <p class="title" id="curtainCall">I</p>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- ===================== JS ===================== -->
<script>
    $("#curtainCall").click(function () {
        // location.href = "<%=request.getContextPath()%>/product/productView";
    });

    function snowDrop() {
        var $inner = $("#snowZip");
        var line = 14;
        var drop = "*";
        var rndSize;
        var rndWidth;

        for (var i = 0; i < line; i++) {
            $inner.append("<div class='snow'></div>")
        }

        var $snow = $(".snow");

        for (var j = 0; j < line; j++) {

            for (var i = 0; i < 10; i++) {
                rndWidth = Math.random() * 100;
                rndSize = Math.round(Math.random() * 7) + 1;
                $snow.eq(j).append("<span style='left: " + rndWidth + "vw;''><h" + rndSize + ">" + drop + "</h" + rndSize + "></span>");
                $snow.eq(j).css("animation-delay", j * 0.3 + "s");
                $snow.eq(j).css("animation-duration", 2 + (j / line) * j + "s");
            }
        }
    }
    snowDrop();

    (() => {
        var $drop = $(".snow");

        $("#curtainCall").hover(function () {
            $drop.css("color", "lightgoldenrodyellow");
            $drop.children().children().text("★");
        }, function () {
            $drop.css("color", "rgb(206, 231, 245)");
            $drop.children().children().text("*");
        });

    })();
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />