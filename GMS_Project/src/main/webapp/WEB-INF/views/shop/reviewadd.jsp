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
	<form action="${contextPath }/admin/categoryadd" method="post" enctype="multipart/form-data" onsubmit="return formValidationCheck()">
			<div class="container px-4 px-lg-5 my-5">
				<div class="tab_content">
					<table class="table table-bordered table-hover">			
						<tr>
							<td width=100>전시회 종류</td>
							<td width=200>
								<select name="artStatus" id="artStatus" class="form-control" style="padding-bottom:0; padding-top:0; height:35px;">
									<option value="사진" selected>사진
									<option value="그림">그림
								</select>
							</td>
						</tr>
						<tr>
							<td>전시회 이름</td>
							<td><input name="showName" id="showName" type="text" class="form-control"/></td>
						 </tr>
						<tr>
						<tr>
							<td>작품 이름</td>
							<td><input name="artTitle" id="artTitle" type="text" class="form-control"/></td>
						 </tr>
						<tr>
							<td>작가</td>
							<td><input name="artist" id="artist" type="text" class="form-control"/></td>
						</tr>
						<tr>
							<td >전시시작일</td>
							<td><input name="startDate" id="startDate" type="date" class="form-control"/></td>
						</tr>
						<tr>
							<td>전시종료일</td>
							<td><input name="endDate" id="endDate" type="date" class="form-control"/></td>
						</tr>
						<tr>
							<td>작품 사진</td>
							<td>
							<input name="artImage" id="artImage" type="file" class="form-control"/>
							</td>
						</tr>
						<tr>
							<td>메인페이지 설정</td>
							<td>
							<input name="mainArt" id="mainArt" type="radio" style="width:10px;"class="form-control" value="Y"/>
							<label for="mainArt" >메인페이지에 이 사진이 나오게 됩니다.</label>
							</td>
						</tr>
						<tr>
							<td>작품설명</td>
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
 