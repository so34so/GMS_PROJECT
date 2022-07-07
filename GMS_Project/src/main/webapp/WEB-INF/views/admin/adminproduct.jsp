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
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
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
		else if (attribute == 'artContent')		 	 	 value = mod_gallery.artContent.value;
		else if (attribute == 'artPrice')		 	 	 value = mod_gallery.artPrice.value;
		else if (attribute == 'deliveryPrice')		 	 value = mod_gallery.deliveryPrice.value;
		
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
<body>
	<form method="post" name="mod_gallery">
		<h3>내용 수정 및 삭제</h3>
			<div class="tab_container">
				<div class="tab_content">
					<table class="table table-bordered table-hover">	
						<colgroup>
							<col width="25%">
							<col width="65%">
							<col width="10%">
						</colgroup>		
						<tr>
							<td width=100>전시회 종류</td>
							<td width=200>
								<select name="artStatus" id="artStatus" class="form-control" style="padding-bottom:0; padding-top:0; height:35px;">
									<option value="사진" <c:if test="${adminDto.artStatus=='사진' }">selected</c:if>>사진</option>
									<option value="그림" <c:if test="${adminDto.artStatus=='그림' }">selected</c:if>>그림</option>
								</select>
							</td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','artStatus')" /></td>
						</tr>
						<tr>
							<td>전시회 이름</td>
							<td><input name="showName" id="showName" type="text" class="form-control" value="${adminDto.showName }" /></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','showName')" /></td>
						 </tr>
						<tr>
						<tr>
							<td>작품 이름</td>
							<td><input name="artTitle" id="artTitle" type="text" class="form-control" value="${adminDto.artTitle }"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','artTitle')" /></td>
						 </tr>
						<tr>
							<td>작가</td>
							<td><input name="artist" id="artist" type="text" class="form-control" value="${adminDto.artist }"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','artist')" /></td>
						</tr>
						<tr>
							<td >전시시작일</td>
							<td><input name="startDate" id="startDate" type="date" class="form-control" value="<fmt:formatDate value='${adminDto.startDate}' pattern='yyyy-MM-dd'/>" /></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','startDate')" /></td>
						</tr>
						<tr>
							<td>전시종료일</td>
							<td><input name="endDate" id="endDate" type="date" class="form-control" value="<fmt:formatDate value='${adminDto.endDate}' pattern='yyyy-MM-dd'/>" /></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','endDate')" /></td>
						</tr>
						<tr>
							<td>작품 사진</td>
							<td>파일명 : ${adminDto.artImage}
							<input name="artImage" id="artImage" type="file" class="form-control"/>
							</td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="modify_gallery_image('${adminDto.artArtnum }')" /></td>
						</tr>
						<tr>
							<td>작품설명</td>
							<td>
								<textarea rows="50" cols="50" name="artContent" id="artContent">${adminDto.artContent }</textarea>
			        			<script>CKEDITOR.replace('artContent');</script>
							</td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','artContent')" /></td>
						</tr>
						<tr>
							<td>작품 가격</td>
							<td><input name="artPrice" id="artPrice" type="text" class="form-control" value="${adminDto.artPrice }"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','artPrice')" /></td>
						 </tr>
						 <tr>
							<td>배송비</td>
							<td><input name="deliveryPrice" id="deliveryPrice" type="text" class="form-control" value="${adminDto.deliveryPrice }"/></td>
							<td><input type="button" class="btn btn-outline-primary btn-sm" value="수정" onClick="modify_gallery('${adminDto.artArtnum }','deliveryPrice')" /></td>
						 </tr>
					</table>	
				</div>
			<p align="right">
				<input type="button" value="삭제하기" class="btn btn-outline-primary btn-sm" onClick="delete_gallery('${adminDto.artArtnum }')"/>
			</p>
		</div>
	</form>	
</body>
</html>