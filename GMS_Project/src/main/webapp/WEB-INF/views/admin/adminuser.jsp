<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="icon" type="image/x-icon" href="assets/img/user.png" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
                <script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
</head>
<body>
	<h3>회원 조회</h3>
	<div align="right">
		<input type="button" class="btn btn-Light btn-sm" value="Excel Export" onclick="location.href='${contextPath}/admin/memberExcelExport'" />
	</div>
	<table class="list_view">
	 <colgroup>
	 	<col width="15%">
	 	<col width="10%">
	 	<col width="15%">
	 	<col width="37%">
	 	<col width="13%">
	 	<col width="10%">
	 </colgroup>
	 <tbody align=center >
	  <tr align=center style="background:blue; color:#fff; height: 50px;">
		<td width=10%>회원아이디</td>
		<td width=10%>회원이름</td>
		<td width=10%>회원닉네임</td>
		<td width=50%>주소</td>
		<td width=10%>가입일</td>
	   </tr>
	   <c:choose>
	     <c:when test="${empty userList}">			
			<tr>
		       <td colspan="5" class="fixed">
				  <strong>조회된 회원이 없습니다.</strong>
			   </td>
		     </tr>
		 </c:when>
		 <c:otherwise>
		     <c:forEach var="memberDto" items="${userList}" >
	            <tr>       
					<td>
						<strong>${memberDto.galleryId}</strong>
					</td>
					<td>
						<strong>${memberDto.galleryName}</strong><br>
					</td>
					<td>
						<strong>${memberDto.galleryNickname}</strong><br>
					</td>
					<td>
						<strong>${memberDto.roadAddress}</strong><br>
						<strong>${memberDto.jibunAddress}</strong><br>
						<strong>${memberDto.namujiAddress}</strong><br>
					</td>
					<td>
						<strong><fmt:formatDate value="${memberDto.joinDate}" pattern="yyyy-MM-dd"/></strong>
				    </td>
				</tr>
				</c:forEach>
			</c:otherwise>
		  </c:choose>	
	 </tbody>
	</table>
</body>
</html>