<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.id eq null}">
			<script>
				alert("로그인 후 이용 가능합니다.");
				history.go(-1);
			</script>
		</c:when>
		<c:otherwise>
			<script>
				location.href="confirm";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>