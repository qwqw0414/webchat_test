<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- ===================== Basic Setting ===================== -->

<div>
    <button class="btn btn-block btn-outline-warning" onclick="location = '${pageContext.request.contextPath}/test/msgList'">DB 연동 테스트</button>
</div>


<!-- ===================== Basic Setting ===================== -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />