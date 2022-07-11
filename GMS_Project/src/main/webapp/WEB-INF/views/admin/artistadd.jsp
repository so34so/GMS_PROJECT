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
		
		var artist = document.getElementById("artist");
		if (artist.value == ""){
			alert("작가는 반드시 입력해야 합니다.");
			artist.focus();
			return false;
		}
		
		var artistImage = document.getElementById("artistImage");
		if (artistImage.value == ""){
			alert("작가사진을 반드시 첨부해야 합니다.");
			artistImage.focus();
			return false;
		}
		
		var artistArt = document.getElementById("artistArt");
		if (artistArt.value == ""){
			alert("작가대표작을 반드시 입력해야 합니다.(없으면 없음 이라고 적어주세요.)");
			artistArt.focus();
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
	<form action="${contextPath }/admin/artistadd" method="post" enctype="multipart/form-data" onsubmit="return formValidationCheck()">
		<h3>작가 등록창</h3>
			<div class="tab_container">
				<div class="tab_content">
					<table class="table table-bordered table-hover">			
						<tr>
							<td>작가 이름</td>
							<td><input name="artist" id="artist" type="text" class="form-control"/></td>
						 </tr>
						<tr>
						<tr>
							<td>작가 사진</td>
							<td><input name="artistImage" id="artImage" type="file" class="form-control"/></td>
						 </tr>
						<tr>
							<td>작가 대표작</td>
							<td><input name="mainArtist" id="mainArtist" type="text" class="form-control"/></td>
						 </tr>
						<tr>
							<td>작가설명</td>
							<td>
							<textarea rows="10" cols="10" name="artistComent"  ></textarea>
		        			<script>CKEDITOR.replace('artistComent');</script>
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
 