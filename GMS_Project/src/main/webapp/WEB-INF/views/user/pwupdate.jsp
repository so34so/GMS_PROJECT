<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Account Settings - Profile - SB Admin Pro</title>
        <link href="${contextPath }/resources/css/mypage.css" rel="stylesheet" />
        <link href="${contextPath }/resources/css/styles5.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="col-xl-8">
								<h1>비밀번호 변경</h1>
                                <!-- Account details card-->
                                <div class="card mb-4">
                                    <div class="card-header">비밀번호 변경</div>
                                    <div class="card-body">
                                        <form action="pwupdate" method="post">
                                            <!-- Form Group (username)-->
                                            <div class="form-group">
                                                <label class="small mb-1" for="galleryPassword">현재비밀번호</label>
                                                <input class="form-control" id="galleryPassword" name="galleryPassword" type="password"  placeholder="현재 비밀번호를 입력하세요."/>
                                            </div>
                                            <!-- Form Row-->
                                             <div class="form-group">
                                                <label class="small mb-1" for="galleryPassword">바꿀비밀번호</label>
                                                <input class="form-control" id="galleryPassword" type="password"  placeholder="바꿀 비밀번호를 입력하세요."/>
                                            </div>
                                            <!-- Save changes button-->
                                            <input type="hidden" name="galleryId" value="${memberDto.galleryId}" /> 
                                            <button class="btn btn-primary" type="submit">비밀번호 변경</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
</body>
</html>