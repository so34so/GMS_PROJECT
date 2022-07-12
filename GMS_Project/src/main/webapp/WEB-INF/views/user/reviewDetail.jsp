<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<html>
<head>
		<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		<link rel="icon" type="image/x-icon" href="${contextPath}/resources/img/user.png" />
		<link href="${contextPath }/resources/css/styles1.css?a" rel="stylesheet" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
        <script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
        <script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>  
        
        
<script>

	 function delete_gallery(artTitle){
			
			$.ajax({
				type : "get",
				url : "${contextPath}/user/deleteReview",
				data : {
					"artTitle"   : artTitle,
				},
				success : function() {
					alert("작품을 삭제했습니다.");
					location.href="${contextPath}/user/userorderList";
				}
			});
		 }
</script>
</head>
<body><main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-9">
                                <!-- Basic login form-->
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header justify-content-center"><h3 class="font-weight-light my-4">내용 수정 및 삭제</h3></div>
                                    <div class="card-body">
                                        <!-- Login form-->
                                        <form method="post" name="mod_gallery">
			<div class="tab_container">
				<div class="tab_content">
					<table class="table table-bordered table-hover">	
						<colgroup>
							<col width="25%">
							<col width="65%">
							<col width="10%">
						</colgroup>		
						<tr>
							<td width=100>작품 이름</td>
							<td width=200>
								${Review.artTitle }
							</td>
						</tr>
						<tr>
							<td>리뷰 닉네임</td>
							<td>${Review.galleryNickname }</td>
						 </tr>
						<tr>
						<tr>
							<td>작성 날짜</td>
							<td><fmt:formatDate value="${Review.reviewDate}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td>리뷰 제목</td>
							<td>${Review.reviewTitle }</td></tr>
						</tr>
						<tr>
							<td>리뷰 내용</td>
							<td>${Review.reviewContent }</td></tr>
						</tr>
						<tr>
							<td>작품 평가</td>
							<td>${Review.reviewRate }</td></tr>
						</tr>
					</table>	
				</div>
			<p align="right">
				<input type="button" value="삭제하기" class="btn btn-outline-primary btn-sm" onClick="delete_gallery('${Review.artTitle }')"/>
			</p>
		</div>
	</form>	
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
	
</body>
</html>