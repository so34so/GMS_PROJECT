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
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
        <script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
		<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>  
<script>

	function formValidationCheck(){
		
		var artTitle = document.getElementById("artTitle");
		if (artTitle.value == ""){
			alert("작품 이름은 반드시 입력해야 합니다.");
			artTitle.focus();
			return false;
		}
		
		var artistArt = document.getElementById("artistArt");
		if (artistArt.value == ""){
			alert("작품파일은 추가해야 합니다.");
			artistArt.focus();
			return false;
		}
		
		var artContent = document.getElementById("artContent");
		if (artContent.value == ""){
			alert("작품설명은 반드시 입력해야 합니다.");
			artContent.focus();
			return false;
		}
		
	}
</script>
<style>
	td:first-child {
		text-align: center;
		font-weight: bold;
	}
</style>
</head>
<body>
	<form action="${contextPath }/admin/artadd" method="post" enctype="multipart/form-data" onsubmit="return formValidationCheck()">
		<h3>작품 등록창</h3>
			<div class="tab_container">
				<div class="tab_content">
					<table class="table table-bordered table-hover">			
						<tr>
							<td>작품이름</td>
							<td><input name="artTitle" id="artTitle" type="text" class="form-control"/></td>
						 </tr>
						<tr>
							<td>전시회이름</td>
							<td><input name="showName" id="showName" type="text" value="${adminDto.showName }" class="form-control" readonly/></td>
						<tr>
						<tr>
							<td>작가</td>
							<td><input name="artist" id="artist" type="text" value="${adminDto.artist }" class="form-control" readonly/></td>
						<tr>
							<td>작품파일</td>
							<td><input name="artistArt" id="artistArt" type="file" class="form-control"/></td>
						</tr>
						<tr>
							<td >작품설명</td>
							<td>
							<textarea rows="10" cols="10" name="artContent"></textarea>
		        			<script>CKEDITOR.replace('artContent');</script>
							</td>
						</tr>
						
					</table>	
				</div>
			<p align="right">
				<input type="submit" value="등록하기" class="btn btn-outline-primary btn-sm"/>
			</p>
		</div>
	</form>	
</body>
 