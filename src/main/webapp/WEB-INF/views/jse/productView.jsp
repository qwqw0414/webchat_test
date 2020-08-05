<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- css -->
<style>
div#contents > div#productView #productList .card {
	margin: 10px;
}
div#contents > div#productView #productList{
	font-family: 'BMHANNAPro';
}

div#contents > div#productView #slideProduct img{
	height: 300px;

}

div#contents > div#productView #productList .sold-out-view{
	width: 100%;
	height: 330px;
	background-color: rgba(255, 255, 255, 0.5);
	position: absolute;
	z-index: 1;
}

div#contents > div#productView #productList .sold-out-msg{
	font-size: 3em;
	position: absolute;
	color: white;
	width: 100%;
	text-align: center;
	top: 100px;
	text-shadow: 0 0 10px #592F59;
}

div#contents > div#productView #productList .card-text{
	font-family: 'Jua', sans-serif;
	font-size: 1.2em;
	
}
div#contents > div#productView #productList .sale-view{
	position: absolute;
	width: 65px;
	height: 65px;
	background: rgba(221, 160, 221, 0.85);
	z-index: 1;
	color: white;
	padding: 5px 10px 5px 10px;
	font-family: 'BMHANNAPro';
}
div#contents > div#productView #productList .discount{
	color: rgb(146, 146, 146);
	text-decoration: line-through;
}
div#contents > div#productView #productList .price{
	color: rgb(65, 127, 209);
}
div#contents > div#productView #productList .card-title{
	font-size: 1.5em;
}
div#contents > div#productView #productList .image{
	overflow: hidden;
}
div#contents > div#productView #productList .card{
	cursor: pointer;
	overflow: hidden;
}
div#contents > div#productView .ani-photo-in{
	animation: kenburns-top 0.5s ease-out both;
}

div#contents > div#productView #productList .wishList{
	position: absolute;
	left: 16.4em;
	top: 17.2em;
	width: 45px;
	padding: 10px;
	opacity: 0.75;
	border-radius: 2em;
	background-color: darkcyan;
	z-index: 1;
}
</style>
<!-- ===================== Basic Setting ===================== -->
<div id="productView">
    <div id="productList">
        <div class="row w-100" style="margin: auto;">
        </div>
    </div>
</div>

<script>
    $(() => {
        function showProduct() {
            $.ajax({
                url: '${pageContext.request.contextPath}/jse/productList',
                data: {},
                dataType: 'json',
                success: (data) => {
                    let html = '';
                    var cnt = 0;

                    data.forEach(p => {
						html += '<div class="card" style="width: 16rem; height: 440px;">';
						if (p.DISCOUNT != 0) {
							var discount = (Number)(p.DISCOUNT) * 100;
							html += '<span class="sale-view">SALE<br><h4>' + discount + '<small>%</small></h4></span>'
						}
						html += '<div class="image">';
						html += '<img src="/resources/img/product/' + p.PHOTO + '" class="card-img-top" ></div>'
						html += '<div class="card-body">';
						html += '<h5 class="card-title">' + p.PNAME + '</h5>';
						html += '<p class="card-text price">' + p.PRICE + '원</p>'
						html += '</div></div>';
                    });

                    $("#productView #productList div").html(html);
                },
                error: (x, s, e) => {
                    console.log(x, s, e);
                }
            });
        }
        showProduct();
    });
</script>
<!-- ===================== Basic Setting ===================== -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />