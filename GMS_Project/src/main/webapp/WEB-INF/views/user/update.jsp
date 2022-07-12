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
        <link href="${contextPath }/resources/css/styles1.css?a" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
<script>
	$().ready(function() {
		
		    	var validateGalleryNickname = false;
    	
	    		$("#nameCheck").click(function(){
	    			
	    			var galleryNickname = $("#galleryNickname").val();
	    		    if (galleryNickname == ''){
	    		   		alert("닉네임을 입력하세요");
	    		   		return;
	    		    }
	    		    
	    		    $.ajax({
	    		       type : "post",
	    		       url : "${contextPath}/member/nameCheck",
	    		       data : {"galleryNickname" : galleryNickname},
	    		       success : function(isOverLapped){
	    		          if (isOverLapped == "false"){
	    		          	alert("사용할 수 있는 닉네임입니다.");
	    		          	validateGalleryNickname = true;
	    		          }
	    		          else {
	    		          	alert("사용할 수 없는 닉네임입니다.");
	    		          	validateGalleryNickname = false;
	    		          }
	    		       }
	    		    });
	    		});	
	    		
	    	});
</script>
</head>
<body>
                    <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-9">
                                <!-- Basic login form-->
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header justify-content-center"><h3 class="font-weight-light my-4">개인정보 변경</h3></div>
                                    <div class="card-body">
                                        <!-- Login form-->
                                        <form action="update" method="post">
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
	                                                <input class="form-control" id="galleryNickname" name="galleryNickname" type="text" placeholder="닉네임을 입력하세요." />
	                                           		<input type="button" id="nameCheck" class = "btn btn-primary" value="중복확인" style="padding: 0.5em;"/>
	                                            </div>
                                            </div>
                                            <!-- Form Group (email address)-->
                                            <div class="form-group">
                                                <label class="small mb-1" for="galleryEmail">이메일</label>
                                                <input class="form-control" id="galleryEmail" name="galleryEmail" type="email" placeholder="이메일을 입력하세요."/>
                                            </div>
                                            <div class="form-row">
                                                <!-- Form Group (first name)-->
                                                <div class="form-group col-md-6">
                                                    <label class="small mb-1" for="galleryPassword">비밀번호</label>
	                                                <input class="form-control" id="galleryPassword" name="galleryPassword" type="password" placeholder="비밀번호를 입력하세요." />
	                                            </div>
	                                        </div>
                                            <!-- Save changes button-->
                                            <input type="hidden" name="galleryId" value="${memberDto.galleryId}" /> 
                                            <button class="btn btn-primary" type="submit">정보 변경하기</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
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