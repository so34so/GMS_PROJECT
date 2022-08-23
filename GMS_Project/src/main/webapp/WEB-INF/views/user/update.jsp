<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
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
        <link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
<script>
	$().ready(function() {
		
		    	var validateGalleryNickname = false;
    	
	    		$("#nameCheck").click(function(){
	    			
	    			var galleryNickname = $("#galleryNickname").val();
	    		    if (galleryNickname == ''){
	    		   		alert("닉네임을 입력하세요");
	    		   		return;
	    		    }
	    		    
	    		    $.ajax({
	    		       type : "post",
	    		       url : "${contextPath}/member/nameCheck",
	    		       data : {"galleryNickname" : galleryNickname},
	    		       success : function(isOverLapped){
	    		          if (isOverLapped == "false"){
	    		          	alert("사용할 수 있는 닉네임입니다.");
	    		          	validateGalleryNickname = true;
	    		          }
	    		          else {
	    		          	alert("사용할 수 없는 닉네임입니다.");
	    		          	validateGalleryNickname = false;
	    		          }
	    		       }
	    		    });
	    		});	
	    		
	    	});
</script>        
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
                    <header class="page-header page-header-dark pb-10" style="background-color:#080F22;">
                        <div class="container">
                            <div class="page-header-content pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="filter"></i></div>
                                            정보 수정
                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container mt-n10">
                        <div class="card mb-4">
                            <div class="card-body">
                                        <!-- Login form-->
                                        <form action="update" method="post">
                                            <!-- Form Row-->
                                            <div class="form-row">
                                                <!-- Form Group (first name)-->
                                                <div class="form-group col-md-6">
                                                    <label class="small mb-1" for="galleryName">성명</label>
	                                                <input class="form-control" id="galleryName" name="galleryName" type="text" readonly="true" value="${memberDto.galleryName }" />
	                                            </div>
	                                                <!-- Form Group (last name)-->
	                                            <div class="form-group col-md-6">
	                                                <label class="small mb-1" for="galleryNickname">닉네임</label>
	                                                <input class="form-control" id="galleryNickname" name="galleryNickname" type="text" placeholder="닉네임을 입력하세요." />
	                                           		<input type="button" id="nameCheck" class = "btn btn-primary" value="중복확인" style="padding: 0.5em;"/>
	                                            </div>
                                            </div>
                                            <!-- Form Group (email address)-->
                                            <div class="form-group">
                                                <label class="small mb-1" for="galleryEmail">이메일</label>
                                                <input class="form-control" id="galleryEmail" name="galleryEmail" type="email" placeholder="이메일을 입력하세요."/>
                                            </div>
                                            <div class="form-row">
                                                <!-- Form Group (first name)-->
                                                <div class="form-group col-md-6">
                                                    <label class="small mb-1" for="galleryPassword">비밀번호</label>
	                                                <input class="form-control" id="galleryPassword" name="galleryPassword" type="password" placeholder="비밀번호를 입력하세요." />
	                                            </div>
	                                        </div>
                                            <!-- Save changes button-->
                                            <input type="hidden" name="galleryId" value="${memberDto.galleryId}" /> 
                                            <button class="btn btn-primary" type="submit">정보 변경하기</button>
                                        </form>
                                    </div>
                        </div>
                    </div>
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
