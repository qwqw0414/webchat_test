<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animation.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/css.css">
    <title>WebChat</title>

</head>

<body>
<header>
<!-- Header Start -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">WebChat</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <!-- 네비게이션 메뉴 -->
            <ul class="navbar-nav">

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/member/memberEnroll">회원가입</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">menu2</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">menu3</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">menu4</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">menu5</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">menu6</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">menu7</a>
                </li>

            </ul>
        </div>
    </nav>

<!-- Header End -->
</header>

<content>
<div id="contents">
<!-- Content Start -->