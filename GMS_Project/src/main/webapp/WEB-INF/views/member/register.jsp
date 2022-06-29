<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>P Gallery - Sign Up</title>
        <link href="${contextPath}/resources/css/styles1.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/user.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
        
        <script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>  
        
<script>
    	
    	var validateGalleryId = false;
    	var validateGalleryNickname = false;

    	$().ready(function() {
    		
    		$("#userCheck").click(function(){
    			
    		    var galleryId = $("#galleryId").val();
    		    if (galleryId == ''){
    		   		alert("ID를 입력하세요");
    		   		return;
    		    }
    		   
    		    $.ajax({
    		       type : "post",
    		       url : "${contextPath}/member/userCheck",
    		       data : {"galleryId" : galleryId},
    		       success : function(isOverLapped){
    		          if (isOverLapped == "false"){
    		          	alert("사용할 수 있는 ID입니다.");
    		          	validateGalleryId = true;
    		          }
    		          else {
    		          	alert("사용할 수 없는 ID입니다.");
    		          	validateGalleryId = false;
    		          }
    		       }
    		    });
    		});	
    		
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
    	
    	function formValidationCheck(){
    		
    		var name = document.getElementById("galleryName");
    		if (name.value.length == 0) {
    			alert("이름을 입력하세요.");
    			name.focus();
    			return false;
    		}
    		var id = document.getElementById("galleryId");
    		if (id.value.length == 0) {
    			alert("아이디를 입력하세요.");
    			id.focus();
    			return false;
    		}
    		
    		if (!validateGalleryId) {
    			alert("아이디를 확인해주세요.");
    			return false;
    		}
    		
    		var nickname = document.getElementById("galleryNickname");
    		if (nickname.value.length == 0) {
    			alert("닉네임을 입력하세요.");
    			nickname.focus();
    			return false;
    		}
    		
    		if (!validateGalleryNickname) {
    			alert("닉네임을 확인해주세요.");
    			return false;
    		}
    		var email = document.getElementById("galleryEmail");
    		if (email.value.length == 0) {
    			alert("이메일을 입력하세요.");
    			email.focus();
    			return false;
    		}
    		
    		var pw = document.getElementById("galleryPassword");
    		if (pw.value.length == 0) {
    			alert("비밀번호를 입력하세요.");
    			pw.focus();
    			return false;
    		}
    		
    		return true;
    		
    	}
    	
    	</script>
    	<script>
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if (data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if (extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if (fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('roadAddress').value = fullRoadAddr;
	            document.getElementById('jibunAddress').value = data.jibunAddress;
	
	        }
	    }).open();
	}
</script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <!-- Basic registration form-->
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header justify-content-center"><h3 class="font-weight-light my-4">회원가입</h3></div>
                                    <div class="card-body">
                                        <!-- Registration form-->
                                        <form action="register" method="post" onsubmit="return formValidationCheck()">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="galleryName">이름</label>
                                                        <input class="form-control" id="galleryName" name="galleryName" type="text" autofocus/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="galleryId">아이디</label>
                                                        <input class="form-control" id="galleryId" name="galleryId" type="text"  />
                                                        <input type="button" id="userCheck" class = "btn btn-primary" value="중복확인" style="padding: 0.5em;"/>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="galleryNickname">닉네임</label>
                                                        <input class="form-control" id="galleryNickname" name="galleryNickname" type="text"  />
                                                        <input type="button" id="nameCheck" class = "btn btn-primary" value="중복확인" style="padding: 0.5em;"/>
                                                    </div>
                                            </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                   <div class="form-group">
                                                        <label class="small mb-1" for="galleryPassword">비밀번호</label>
                                                        <input class="form-control" id="galleryPassword" name="galleryPassword" type="password"  />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                   <div class="form-group">
                                                        <label class="small mb-1">비밀번호 확인</label>
                                                        <input class="form-control" type="password"  />
                                                    </div>
                                                </div>
														
                                            </div>
                                            <!-- Form Group (email address)  -->
                                            <div class="form-group">
                                                <label class="small mb-1" for="galleryEmail">이메일</label>
                                                <input class="form-control" id="galleryEmail" name="galleryEmail" type="email" />
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" >주소</label>
                                                <input class="form-control"  size="70px"  type="text" placeholder="우편번호 입력" id="zipcode" name="zipcode" style="display:inline; width:150px; padding:0">
								                <input type="button" class="btn btn-outline-primary btn-sm" onclick="javascript:execDaumPostcode()" value="검색">
								                <div></div><br>
								                도로명 주소 : <input type="text" class="form-control" id="roadAddress"  name="roadAddress" > <br>
												지번 주소 : <input type="text" class="form-control" id="jibunAddress" name="jibunAddress" > <br>
												나머지 주소: <input type="text" class="form-control" id="namujiAddress" name="namujiAddress"/>
                                            </div>
                                            <!-- Form Group (create account submit)-->
                                            <div class="form-group mt-4 mb-0"><input type="submit" value="회원가입" class = "btn btn-primary btn-block"></div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="${contextPath }/member/login">이미 회원이신가요? 로그인</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="footer mt-auto footer-dark">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 small">Copyright &copy; Your Website 2021</div>
                            <div class="col-md-6 text-md-right small">
                                <a href="#!">Privacy Policy</a>
                                &middot;
                                <a href="#!">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${context }/resources/js/scripts.js"></script>
    </body>
</html>
