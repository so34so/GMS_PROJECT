<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
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
<script>

function modify_gallery(artArtnum, attribute){
	
	var mod_gallery = document.mod_gallery;
	
	var value = "";
	
	if 	    (attribute == 'artStatus')				 value = mod_gallery.artStatus.value;
	else if (attribute == 'showName')				 value = mod_gallery.showName.value;
	else if (attribute == 'artTitle')			 	 value = mod_gallery.artTitle.value;   
	else if (attribute == 'artist')		 			 value = mod_gallery.artist.value;
	else if (attribute == 'artContent')		 	 	 value = CKEDITOR.instances.artContent.getData();
	else if (attribute == 'artPrice')		 	 	 value = mod_gallery.artPrice.value;
	else if (attribute == 'deliveryPrice')		 	 value = mod_gallery.deliveryPrice.value;
	else if (attribute == 'startDate')	{
		var temp1 = mod_gallery.startDate.value;
		var temp2 = temp1.split("-");
		value = temp2[0] + temp2[1] + temp2[2];
	}
	else if (attribute == 'endDate')	{
		var temp1 = mod_gallery.endDate.value;
		var temp2 = temp1.split("-");
		value = temp2[0] + temp2[1] + temp2[2];
	}
	
	
	$.ajax({
		type : "post",
		url : "${contextPath}/admin/modifyInfo",
		data : {
			"artArtnum"   : artArtnum,
			"attribute" : attribute,
			"value"     : value
		},
		success : function() {
			alert("정보를 수정했습니다.");
		}
	});
 }

 function modify_gallery_image(artArtnum){
  	
	 var form = $('form')[0];
     var formData = new FormData(form);
     
     formData.append("artArtnum" , artArtnum);
     formData.append("artImage" , $("#artImage").val());
     
     $.ajax({
     	url: '${contextPath}/admin/modifyImageInfo',
     	processData: false,
     	contentType: false,
     	data: formData,
     	type: 'POST',
     	success: function(result){
         	alert("이미지를 수정했습니다.");
       	}
     });
     
 }

 
 function delete_gallery(artArtnum){
		
		$.ajax({
			type : "post",
			url : "${contextPath}/admin/deleteInfo",
			data : {
				"artArtnum"   : artArtnum,
			},
			success : function() {
				alert("작품을 삭제했습니다..");
				location.href="${contextPath}/admin/admincategory";
			}
		});
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
                                            내용 수정 및 삭제
                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                   	<div class="container mt-n10">
             <div class="card mb-4">
                 <div class="card-body">
                     <form action="${contextPath }/admin/artistadd" method="post" enctype="multipart/form-data" onsubmit="return formValidationCheck()">
								 <div class="form-group">
							        <label for="artStatus">전시회 종류</label>
							        <input type="button" class="btn btn-outline-primary btn-sm" style="float:right;"value="수정" onClick="modify_gallery('${adminDto.artArtnum }','artStatus')" />
							        <select class="form-control" id="artStatus" name="artStatus" style="padding-top:11px;">
							            <option value="사진" <c:if test="${adminDto.artStatus=='사진' }">selected</c:if>>사진</option>
									<option value="그림" <c:if test="${adminDto.artStatus=='그림' }">selected</c:if>>그림</option>
							        </select>
							     </div>
							    <div class="form-group">
								<label for="showName">전시회 이름</label>
								<input type="button" class="btn btn-outline-primary btn-sm" style="float:right;" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','showName')" />
								<input name="showName" value="${adminDto.showName }" id="showName" type="text" class="form-control"/>
								</div>
							    <div class="form-group">
								<label for="artTitle">작품 이름</label>
								<input type="button" class="btn btn-outline-primary btn-sm" style="float:right;" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','artTitle')" />
								<input name="artTitle" value="${adminDto.artTitle }" id="artTitle" type="text" class="form-control"/>
								</div>
							    <div class="form-group">
								<label for="artist">작가</label>
								<input type="button" class="btn btn-outline-primary btn-sm" style="float:right;" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','artist')" />
								<input name="artist" value="${adminDto.artist }" id="artist" type="text" class="form-control"/>
								</div>
							    <div class="form-group">
								<label for="startDate">전시시작일</label>
								<input type="button" class="btn btn-outline-primary btn-sm" style="float:right;" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','startDate')" />
								<input name="startDate" value="<fmt:formatDate value='${adminDto.startDate}' pattern='yyyy-MM-dd'/>" id="startDate" type="date" class="form-control"/>
								</div>
							    <div class="form-group">
								<label for="endDate">전시종료일</label>
								<input type="button" class="btn btn-outline-primary btn-sm" style="float:right;" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','endDate')" />
								<input name="endDate" value="<fmt:formatDate value='${adminDto.endDate}' pattern='yyyy-MM-dd'/>" id="endDate" type="date" class="form-control"/>
								</div>
								<div class="form-group" style="padding-bottom:0;">
								<label for="artImage">작품 사진 : ${adminDto.artImage}</label>
								<input type="button" class="btn btn-outline-primary btn-sm" style="float:right;" value="수정" onClick="modify_gallery_image('${adminDto.artArtnum }')" />
								<input name="artImage" id="artImage" type="file" class="form-control" style="padding-top:11px;"/>
								</div>
								<div class="form-group">
								<label for="artist">작품 설명</label>
								<input type="button" class="btn btn-outline-primary btn-sm" style="float:right;" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','artContent')" />
								<textarea rows="10" cols="10" name="artContent" id="artContent">${adminDto.artContent }</textarea>
								<script>CKEDITOR.replace('artContent');</script>
								</div>
								<div class="form-group">
								<label for="artPrice">작품 가격</label>
								<input type="button" class="btn btn-outline-primary btn-sm" style="float:right;" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','artPrice')" />
								<input name="artPrice" value="${adminDto.artPrice }" id="artPrice" type="text" class="form-control"/>
								</div>
								<div class="form-group">
								<label for="deliveryPrice">배송비</label>
								<input type="button" class="btn btn-outline-primary btn-sm" style="float:right;" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','deliveryPrice')" />
								<input name="deliveryPrice" value="${adminDto.deliveryPrice }" id="deliveryPrice" type="text" class="form-control"/>
								</div>
								<p align="right">
								<input type="button" value="삭제하기" class="btn btn-outline-primary btn-sm" onClick="delete_gallery('${adminDto.artArtnum }')"/>
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
