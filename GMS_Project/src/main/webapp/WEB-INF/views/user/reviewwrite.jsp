<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
	td:first-child {
		text-align: center;
		font-weight: bold;
	}
</style>
</head>
<body><div class="container-fluid">
             <h1 class="mt-4">리뷰 작성</h1>
             <div class="card mb-4">
                 <div class="card-body">
                    <form action="${contextPath }/user/reviewwrite" method="post" enctype="multipart/form-data">
			<div class="tab_container">
				<div class="tab_content">
					<table class="table table-bordered table-hover">			
						<tr>
							<td width=100>리뷰작품</td>
							<td width=200>
								${artInfo.artTitle }
								<input type="hidden" name="artTitle" value="${artInfo.artTitle }"/>
							</td>
						</tr>
						<tr>
							<td width=100>리뷰작성자</td>
							<td width=200>
								${memberInfo.galleryNickname }
								<input type="hidden" name="galleryNickname" value="${memberInfo.galleryNickname }"/>
								<input type="hidden" name="galleryId" value="${memberInfo.galleryId }"/>
							</td>
						</tr>
						<tr>
							<td>리뷰제목</td>
							<td><input name="reviewTitle" id="reviewTitle" type="text" class="form-control"/></td>
						</tr>
						<tr>
							<td>리뷰내용</td>
							<td>
							<textarea rows="10" cols="10" name="reviewContent" ></textarea>
		        			<script>CKEDITOR.replace('reviewContent');</script>
							</td>
						</tr>
						<tr>
							<td>작품 총 평</td>
							<td>
								<select name="reviewRate" id="reviewRate" class="form-control" style="padding-bottom:0; padding-top:0; height:35px;">
									<option value="작품 추천" selected>작품 추천
									<option value="작품 비추천">작품 비추천
								</select>
							</td>
						 </tr>
					</table>	
				</div>
			<p align="right">
				<input type="submit" value="등록하기" class="btn btn-outline-primary btn-sm"/>
			</p>
		</div>
	</form>	
             </div>
         </div>
     </div>
	
</body>
 