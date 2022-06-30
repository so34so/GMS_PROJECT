<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="icon" type="image/x-icon" href="${contextPath}/resources/img/user.png" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
        <script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
<script>
		$().ready(function() {
			
			$("#delete").click(function(){
			    $.ajax({
			       type : "get",
			       url : "${contextPath}/admin/categorydelete",
			       data : {"mainArt" : $("#mainArt").val()},
			       success : function(){
			       }
			    });
			    
			});	
			
		});
</script>
</head>
<body>
	<h3>상품 조회</h3>
		<table class="list_view">
			<tbody align="center">
				<tr style="background:blue; color:#fff; height: 50px;">
					<td width=10%>전시회종류</td>
					<td width=20%>전시회이름</td>
					<td width=10%>작가</td>
					<td width=20%>전시시작일</td>
					<td width=20%>전시종료일</td>
					<td width=20%>카테고리 사진</td>
 					<c:choose>
						<c:when test="${!empty categoryList }">
							<td width=20%>삭제</td>
						</c:when>
					</c:choose>
				</tr>
	  				<c:choose>
	    				<c:when test="${empty categoryList }">			
						<tr>
					       <td colspan="8" class="fixed"><strong>조회된 상품이 없습니다.</strong></td>
					    </tr>
				 	</c:when>
				 	<c:otherwise>
	     				<c:forEach var="category" items="${categoryList}" varStatus="i">
							<tr>       
								<td><strong>${category.artStatus}</strong></td>
								<td><a href="${contextPath}/admin/adminproduct?showName=${category.showName}"><strong>${category.showName} </strong></a> </td>
								<td><strong>${category.artist}</strong></td>
								<td><strong><fmt:formatDate value="${category.startDate}" pattern="yyyy-MM-dd"/></strong></td>
								<td><strong><fmt:formatDate value="${category.endDate}" pattern="yyyy-MM-dd"/> </strong></td>
								<td>
									<strong>${category.mainArt}</strong>
									<input type="hidden"  value="${category.mainArt}"/>
								</td>
								<td><input type="button" value="삭제" id="delete"></td>
							</tr>
						</c:forEach>
					</c:otherwise>
	  			</c:choose>	        
			</tbody>
		</table>
		<br>
		<div align="right">
			<input class="btn btn-primary btn-sm" type="button" onclick="location.href='${contextPath}/admin/categoryadd'" value="상품 등록">
		</div>
</body>
</html>