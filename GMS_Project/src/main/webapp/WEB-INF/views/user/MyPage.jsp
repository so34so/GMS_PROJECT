<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
        <link href="${contextPath }/resources/css/mypage.css" rel="stylesheet" />
        <link href="${contextPath }/resources/css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/user.png" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
  
</head>
<body>
<div id="page-wrapper">
  <!-- 사이드바 -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><h4>${memberDto.galleryNickname }님의 페이지</h4></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/member/update">정보 수정하기</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/member/pwupdate">비밀번호 변경하기</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/member/delete">탈퇴하기</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/member/index">메인 페이지</a></li>
                </ul>
            </div>
        </nav>
</div>

</body>
</html>