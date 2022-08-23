<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>AdminPage</title>
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
        <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/img/user.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
        <script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>  
    </head>
    <body class="nav-fixed">
        <nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
            <!-- Navbar Brand-->
            <!-- * * Tip * * You can use text or an image for your navbar brand.-->
            <!-- * * * * * * When using an image, we recommend the SVG format.-->
            <!-- * * * * * * Dimensions: Maximum height: 32px, maximum width: 240px-->
            <a class="navbar-brand" href="${contextPath}/member/index">P Gallery</a>
            <!-- Sidenav Toggle Button-->
            
            <!-- Navbar Search Input-->
            <!-- * * Note: * * Visible only on and above the md breakpoint-->
            <!-- Navbar Items-->
            <ul class="navbar-nav align-items-center ml-auto">
                <!-- User Dropdown-->
                <li class="nav-item dropdown no-caret mr-3 mr-lg-0 dropdown-user">
                   <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 mr-lg-2" id="sidebarToggle"><i data-feather="menu"></i></button>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sidenav shadow-right sidenav-dark">
                    <div class="sidenav-menu">
                        <div class="nav accordion" id="accordionSidenav">
                            <!-- Sidenav Menu Heading (Core)-->
                            <div class="sidenav-menu-heading"><h3 style="color:white;"><a href="${contextPath }/user/myPage" style="text-decoration:none; color:white;">${sessionScope.loginUser}님 정보</a></h3></div>
                            <!-- Sidenav Accordion (Dashboard)-->
                            <a class="nav-link collapsed" href="${contextPath }/user/userorderList">
                                <div class="nav-link-icon"><i class="fa fa-users"></i></div>
                                주문내역
                            </a>
                            <a class="nav-link collapsed" href="${contextPath }/user/update">
                                <div class="nav-link-icon"><i class="fa fa-paint-brush"></i></div>
                                정보수정
                            </a>
                            <a class="nav-link collapsed" href="${contextPath }/user/delete">
                                <div class="nav-link-icon"><i class="fa fa-picture-o"></i></div>
                                탈퇴
                            </a>
                        </div>
                    </div>
                    <!-- Sidenav Footer-->
                </nav>
            </div>
              <div id="layoutSidenav_content">
                <main>
                   	<div class="container-fluid">
                   	 <h1 class="mt-4">리뷰 등록</h1>
             <div class="card mb-4">
                 <div class="card-body">
                     <form action="${contextPath }/user/reviewwrite" method="post" enctype="multipart/form-data">			
                     			<div class="form-group">
								<label for="artTitle">리뷰작품</label>
								<input name="artTitle" id="artTitle" type="text" class="form-control" value="${artInfo.artTitle }" readonly/>
								</div>
								<div class="form-group">
								<label for="galleryNickname">리뷰작성자</label>
								<input name="galleryNickname" id="galleryNickname" type="text" class="form-control" value="${memberInfo.galleryNickname }" readonly/>
								<input type="hidden" name="galleryId" value="${memberInfo.galleryId }"/>
								</div>
								<div class="form-group">
								<label for="reviewTitle">리뷰제목</label>
								<input name="reviewTitle" id="reviewTitle" type="text" class="form-control"/>
								</div>
								<div class="form-group">
								<label for="artist">리뷰내용</label>
								<textarea rows="10" cols="10" name="reviewContent"  ></textarea>
								<script>CKEDITOR.replace('reviewContent');</script>
								</div>
								<div class="form-group">
							        <label for="reviewRate">작품 총 평</label>
							        <select name="reviewRate" id="reviewRate" class="form-control" style="padding-bottom:0; padding-top:0; height:35px;">
									<option value="작품 추천" selected>작품 추천
									<option value="작품 비추천">작품 비추천
								</select>
							    </div>
								<p align="right">
								<input type="submit" value="등록하기" class="btn btn-outline-primary btn-sm"/>
								</p>
								</form>
				             </div>
				         </div>
				     </div>
                    <!-- Main page content-->
                </main>
                <footer class="footer mt-auto footer-light">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 small">Copyright &copy; Your Website 2021</div>
                            <div class="col-md-6 text-md-right small">
                                <a href="#!">Privacy Policy</a>
                                &middot;
                                <a href="#!">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/js/scripts1.js"></script>
    </body>
</html>
