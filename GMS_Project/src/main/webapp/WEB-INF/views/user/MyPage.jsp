<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
        <link rel="icon" type="image/x-icon" href="assets/img/user.png" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
  		<link href="${contextPath }/resources/css/mypage.css?a" rel="stylesheet" />
</head>
<body>
<div id="page-wrapper">
 <!-- 사이드바 -->
			<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
	            <a class="navbar-brand js-scroll-trigger" href="#page-top">
	                <span class="d-block d-lg-none">P_Gallery</span>
	                <span class="d-none d-lg-block"></span>
	            </a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <h6>${sessionScope.loginUser }님의 페이지</h6>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/user/userorderList">주문 내역보기</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/user/update">정보 수정하기</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/user/pwupdate">비밀번호 변경하기</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/user/delete">탈퇴하기</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/member/index">메인 페이지</a></li>
                </ul>
            </div>
        </nav>
</div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${contextPath }/resources/js/scripts.js"></script>
                        <!-- Bootstrap core JS-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>