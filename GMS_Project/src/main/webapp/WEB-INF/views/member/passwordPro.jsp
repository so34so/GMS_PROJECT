<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${memberDto ne null}">
			<script>
				alert("비밀번호는 " + ${memberDto.pw} + " 입니다.");
				location.href="login";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("없는 아이디입니다. 다시 확인해주세요.");
				history.go(-1)
			</script>
		</c:otherwise>
	</c:choose>
	


</body>
</html>