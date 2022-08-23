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
        <link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/img/user.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
        <script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>  
<script>

function formValidationCheck(){
	
	var showName = document.getElementById("showName");
	if (showName.value == ""){
		alert("전시회 이름은 반드시 입력해야 합니다.");
		showName.focus();
		return false;
	}
	
	var artist = document.getElementById("artist");
	if (artist.value == ""){
		alert("작가는 반드시 입력해야 합니다.");
		artist.focus();
		return false;
	}
	
	var startDate = document.getElementById("startDate");
	if (startDate.value == ""){
		alert("전시시작일을 반드시 입력해야 합니다.");
		startDate.focus();
		return false;
	}
	
	var endDate = document.getElementById("endDate");
	if (endDate.value == ""){
		alert("전시종료일을 반드시 입력해야 합니다.");
		endDate.focus();
		return false;
	}
	
	var mainArt = document.getElementById("mainArt");
	if (mainArt.value == ""){
		alert("작품 사진을 추가해야 합니다.");
		mainArt.focus();
		return false;
	}
	
	var artContent = document.getElementById("artContent");
	if (artContent.value == ""){
		alert("작품설명은 반드시 입력해야 합니다.");
		artContent.focus();
		return false;
	}
	
	var artPrice = document.getElementById("artPrice");
	if (artPrice.value == ""){
		alert("작품가격은 반드시 입력해야 합니다.");
		artPrice.focus();
		return false;
	}
	
	var deliveryPrice = document.getElementById("deliveryPrice");
	if (deliveryPrice.value == ""){
		alert("배송비는 반드시 입력해야 합니다.");
		deliveryPrice.focus();
		return false;
	}
	
}
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
                            <div class="sidenav-menu-heading"><h3 style="color:white;"><a href="${contextPath }/admin/adminpage" style="text-decoration:none; color:white;">관리페이지</a></h3></div>
                            <!-- Sidenav Accordion (Dashboard)-->
                            <a class="nav-link collapsed" href="${contextPath }/admin/adminuser">
                                <div class="nav-link-icon"><i class="fa fa-users"></i></div>
                                회원관리
                            </a>
                            <a class="nav-link collapsed" href="${contextPath }/admin/adminartist">
                                <div class="nav-link-icon"><i class="fa fa-paint-brush"></i></div>
                                작가관리
                            </a>
                            <a class="nav-link collapsed" href="${contextPath }/admin/admincategory">
                                <div class="nav-link-icon"><i class="fa fa-picture-o"></i></div>
                                작품관리
                            </a>
                            <a class="nav-link collapsed" href="${contextPath }/admin/adminorder">
                                <div class="nav-link-icon"><i class="fa fa-shopping-cart"></i></div>
                                주문관리
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
                                            작품등록
                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                   	<div class="container mt-n10">
             <div class="card mb-4">
                 <div class="card-body">
                     <form action="${contextPath }/admin/categoryadd" method="post" enctype="multipart/form-data" onsubmit="return formValidationCheck()">
								 <div class="form-group">
							        <label for="artStatus">전시회 종류</label>
							        <select class="form-control" id="artStatus" name="artStatus" style="padding-top:11px;">
							            <option value="사진" selected>사진
										<option value="그림">그림
							        </select>
							    </div>
							    <div class="form-group">
								<label for="showName">전시회 이름</label>
								<input name="showName" id="showName" type="text" class="form-control"/>
								</div>
							    <div class="form-group">
								<label for="artTitle">작품 이름</label>
								<input name="artTitle" id="artTitle" type="text" class="form-control"/>
								</div>
							    <div class="form-group">
								<label for="artist">작가</label>
								<input name="artist" id="artist" type="text" class="form-control"/>
								</div>
							    <div class="form-group">
								<label for="startDate">전시시작일</label>
								<input name="startDate" id="startDate" type="date" class="form-control"/>
								</div>
							    <div class="form-group">
								<label for="endDate">전시종료일</label>
								<input name="endDate" id="endDate" type="date" class="form-control"/>
								</div>
								<div class="form-group" style="padding-bottom:0;">
								<label for="artImage">작품 사진</label>
								<input name="artImage" id="artImage" type="file" class="form-control" style="padding-top:11px;"/>
								</div>
								<div class="form-check" style="padding-top:0; padding-bottom:10px">
							    <input class="form-check-input" id="mainArt" name="mainArt" type="checkbox" value="Y"/>
							    <label class="form-check-label" for="mainArt">메인페이지에 선택한 사진이 나오게 됩니다.</label>
								</div>
								<div class="form-group">
								<label for="artist">작품 설명</label>
								<textarea rows="10" cols="10" name="artContent"  ></textarea>
								<script>CKEDITOR.replace('artContent');</script>
								</div>
								<div class="form-group">
								<label for="artPrice">작품 가격</label>
								<input name="artPrice" id="artPrice" type="text" class="form-control"/>
								</div>
								<div class="form-group">
								<label for="deliveryPrice">배송비</label>
								<input name="deliveryPrice" id="deliveryPrice" type="text" class="form-control"/>
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
        <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/js/datatables-demo.js"></script>
    </body>
</html>
