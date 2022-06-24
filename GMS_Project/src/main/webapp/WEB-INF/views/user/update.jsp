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
        <link href="${contextPath }/resources/css/styles6.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="col-xl-8">
								<h1>개인정보 변경</h1>
                                <!-- Account details card-->
                                <div class="card mb-4">
                                    <div class="card-header">정보 변경하기</div>
                                    <div class="card-body">
                                        <form>
                                            <!-- Form Row-->
                                            <div class="form-row">
                                                <!-- Form Group (first name)-->
                                                <div class="form-group col-md-6">
                                                    <label class="small mb-1" for="galleryName">성명</label>
	                                                <input class="form-control" id="galleryName" type="text" placeholder="Enter your username" value="username" />
	                                            </div>
	                                                <!-- Form Group (last name)-->
	                                            <div class="form-group col-md-6">
	                                                <label class="small mb-1" for="galleryNickname">닉네임</label>
	                                                <input class="form-control" id="galleryNickname" type="text" placeholder="Enter your username" value="username" />
	                                            </div>
                                            </div>

                                            <!-- Form Group (email address)-->
                                            <div class="form-group">
                                                <label class="small mb-1" for="galleryEmail">이메일</label>
                                                <input class="form-control" id="galleryEmail" type="email" placeholder="Enter your email address" value="name@example.com" />
                                            </div>
                                            <!-- Save changes button-->
                                            <button class="btn btn-primary" type="button">정보 변경하기</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
</body>
</html>