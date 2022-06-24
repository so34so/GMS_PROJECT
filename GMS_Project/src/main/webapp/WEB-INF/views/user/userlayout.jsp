<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"/></title>
</head>
<body>
	
	<div style="background-color: lime; height:100px;">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<div style="background-color: skyblue; height:100px;">
		<tiles:insertAttribute name="menu"/>
	</div>
	
	<div style="background-color: white; height:500px;">
		<tiles:insertAttribute name="content"/>
	</div>
	
	<div style="background-color: pink; height:100px;">
		<tiles:insertAttribute name="footer"/>
	</div>
	
	
</body>
</html>