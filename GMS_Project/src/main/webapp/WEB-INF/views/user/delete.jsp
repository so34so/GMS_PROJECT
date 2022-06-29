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
								<h1>탈퇴하기</h1>
                                <!-- Account details card-->
                                <div class="card mb-4">
                                    <div class="card-header">탈퇴하기</div>
                                    <div class="card-body">
                                        <form action="delete" method="post">
                                            <!-- Form Row-->
                                            <div class="form-row">
                                                <!-- Form Group (first name)-->
                                                <div class="form-group col-md-6">
                                                    <label class="small mb-1" for="galleryName">성명</label>
	                                                <input class="form-control" id="galleryName" name="galleryName" type="text" readonly="true" value="${memberDto.galleryName }" />
	                                            </div>
	                                                <!-- Form Group (last name)-->
	                                            <div class="form-group col-md-6">
	                                                <label class="small mb-1" for="galleryNickname">닉네임</label>
	                                                <input class="form-control" id="galleryNickname" name="galleryNickname" type="text" readonly="true" value="${memberDto.galleryNickname }" />
	                                            </div>
                                            </div>
                                            <!-- Form Group (email address)-->
                                            <div class="form-group">
                                                <label class="small mb-1" for="galleryEmail">이메일</label>
                                                <input class="form-control" id="galleryEmail" name="galleryEmail" type="email" readonly="true" value="${memberDto.galleryEmail }" />
                                            </div>
                                                                                        <!-- Form Row-->
                                            <div class="form-row">
                                                <!-- Form Group (first name)-->
                                                <div class="form-group col-md-6">
                                                    <label class="small mb-1" for="galleryPassword">비밀번호</label>
	                                                <input class="form-control" id="galleryPassword" name="galleryPassword" type="password" placeholder="비밀번호를 입력하세요."/>
	                                            </div>
                                            </div>
                                            <!-- Save changes button-->
                                            <input type="hidden" name="galleryId" value="${memberDto.galleryId}" /> 
                                            <button class="btn btn-primary" type="submit">탈퇴하기</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                            <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${contextPath }/resources/js/scripts.js"></script>
                        <!-- Bootstrap core JS-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>