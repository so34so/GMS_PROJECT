<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>P Gallery</title>
  <link rel="icon" type="image/x-icon" href="${contextPath }/resources/img/iconmonstr-picture-1-240.png" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&family=Roboto+Mono:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${contextPath}/resources/fonts/icomoon/style.css">

  <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/css/magnific-popup.css">
  <link rel="stylesheet" href="${contextPath}/resources/css/jquery-ui.css">
  <link rel="stylesheet" href="${contextPath}/resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${contextPath}/resources/css/owl.theme.default.min.css">

  <link rel="stylesheet" href="${contextPath}/resources/css/lightgallery.min.css">    

  <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap-datepicker.css">

  <link rel="stylesheet" href="${contextPath}/resources/fonts/flaticon/font/flaticon.css">

  <link rel="stylesheet" href="${contextPath}/resources/css/swiper.css">

  <link rel="stylesheet" href="${contextPath}/resources/css/aos.css">

  <link rel="stylesheet" href="${contextPath}/resources/css/style.css">
  
	<script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
		
		var pwCheck = document.getElementById("PasswordCheck");
		var pw = document.getElementById("galleryPassword");
		if (pw.value.length == 0) {
			alert("비밀번호를 입력하세요.");
			pw.focus();
			return false;
		}
		
		if(pwCheck.value != pw.value){
			alert("비밀번호가 일치하지 않습니다.");
			pwCheck.focus();
			return false;
		}
	
		return true;
		
	}

	function movegallery(artTitle){
		
		var loginUser = document.getElementById("loginUser").value;
		
		if(loginUser == null || loginUser == ""){
			alert("로그인 후 이용가능합니다.");
			location.href = "${contextPath}/member/login";
			return;
		}
		else{
			location.href = "${contextPath}/gallery/In?artTitle="+artTitle;
		}
			
	}	
	
	function moveshop(){
		
		var loginUser = document.getElementById("loginUser").value;
		
		if(loginUser == null || loginUser == ""){
			alert("로그인 후 이용가능합니다.");
			location.href = "${contextPath}/member/login";
			return;
		}
		else{
			location.href = "${contextPath }/shop/Homepage";
		}
			
	}	
	
	function moveAllGallery(){
		
		var loginUser = document.getElementById("loginUser").value;
		
		if(loginUser == null || loginUser == ""){
			alert("로그인 후 이용가능합니다.");
			location.href = "${contextPath}/member/login";
			return;
		}
		else{
			location.href = "${contextPath }/gallery/All";
		}
			
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
<body>
<input type="hidden" name="loginUser" id="loginUser" value="${loginUser}"/>
  <div class="site-wrap">

    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
    



    <header class="site-navbar py-3" role="banner">

      <div class="container-fluid">
        <div class="row align-items-center">

          <div class="col-6 col-xl-2" data-aos="fade-down">
            <h1 class="mb-0"><a href="${contextPath}/member/index" class="text-white h2 mb-0">P Gallery</a></h1>
          </div>
          <div class="col-10 col-md-8 d-none d-xl-block" data-aos="fade-down">
            <nav class="site-navigation position-relative text-right text-lg-center" role="navigation">

              <ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
                <li><a href="${contextPath}/member/index">Home</a></li>
                <li class="has-children">
                  <a href="javascript:moveAllGallery();">Gallery</a>
                  <ul class="dropdown">
                    <li class="has-children">
                      <a href="#">Photo</a>
                      <ul class="dropdown">
                     		<c:forEach var="item1" items="${photoList }">
	                    		<c:if test="${item1.mainArt eq 'Y' }">
			                        <li><a onclick="movegallery('${item1.artTitle}')">${item1.showName }</a></li>
		                        </c:if>
	                        </c:forEach>
                      </ul>
                    </li>
                    <li class="has-children">
                      <a href="#">Picture</a>
                      <ul class="dropdown">
                        <c:forEach var="item2" items="${paintList }">
	                    		<c:if test="${item2.mainArt eq 'Y' }">
			                        <li><a onclick="movegallery('${item2.artTitle}')">${item2.showName }</a></li>
		                        </c:if>
	                        </c:forEach>
                      </ul>
                    </li>
                  </ul>
                </li>
                <li><a href="javascript:moveshop();">Shop</a></li>
                <c:choose>
                        <c:when test="${isLogOn == true and loginUser == 'admin'}">
        	            	<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/admin/adminpage">AdminPage</a></li>
		                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/member/logout">Logout</a></li>
        	            </c:when>
                    	<c:when test="${isLogOn == true and not empty loginUser}">
        	            	<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/user/myPage">MyPage</a></li>
		                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/member/logout">Logout</a></li>
        	            </c:when>
        	            <c:otherwise>
							<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/member/login">Login</a></li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/member/register">Join</a></li>
        	            </c:otherwise>	
               </c:choose>
              </ul>
            </nav>
          </div>

          <div class="col-6 col-xl-2 text-right" data-aos="fade-down">
            <div class="d-none d-xl-inline-block">
              <ul class="site-menu js-clone-nav ml-auto list-unstyled d-flex text-right mb-0" data-class="social">
                <li>
                  <a href="https://www.facebook.com" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
                </li>
                <li>
                  <a href="https://www.twitter.com" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
                </li>
                <li>
                  <a href="https://www.instagram.com" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
                </li>
                <li>
                  <a href="https://www.youtube.com" class="pl-3 pr-3"><span class="icon-youtube-play"></span></a>
                </li>
              </ul>
            </div>

            <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle text-white js-menu-toggle"><span class="icon-menu h3"></span></a></div>

          </div>

        </div>
      </div>
      
    </header>


    <div class="site-section"  data-aos="fade">
      <div class="container">

        <div class="row justify-content-center">

          <div class="col-md-7">
            <div class="row mb-5">
              <div class="col-12 ">
                <h2 class="site-section-heading text-center">Join</h2>
              </div>
            </div>
          </div>

        </div>
        
            <form action="register" method="post" onsubmit="return formValidationCheck()">

			  <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-white" for="galleryName">이름</label> 
                  <input type="text" id="galleryName" name="galleryName" class="form-control">
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-6 mb-3 mb-md-0">
                  <label class="text-white" for="galleryId">아이디</label>
                  <input class="form-control" id="galleryId" name="galleryId" type="text" />
                  <input type="button" id="userCheck" class = "btn btn-primary" value="중복확인" style="float:right;"/>
                </div>
                <div class="col-md-6">
                  <label class="text-white" for="galleryNickname">닉네임</label>
                  <input class="form-control" id="galleryNickname" name="galleryNickname" type="text"  />
                  <input type="button" id="nameCheck" class = "btn btn-primary" value="중복확인" style="float:right;"/>
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-6 mb-3 mb-md-0">
                  <label class="text-white" for="galleryPassword">비밀번호</label>
                  <input class="form-control" id="galleryPassword" name = "galleryPassword" type="password" />
                </div>
                <div class="col-md-6">
                  <label class="text-white" for="PasswordCheck">비밀번호 확인</label>
                  <input class="form-control" id="PasswordCheck" name="PasswordCheck" type="password"  />
                </div>
              </div>

			  <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-white" for="galleryEmail">이메일</label> 
                  <input type="email" id="galleryEmail" name="galleryEmail" class="form-control">
                </div>
              </div>
              
              <div class="row form-group">
	              <div class="col-md-12">
	                <label class="text-white mb-1" >주소</label>
	                <input class="form-control"  size="70px"  type="text" placeholder="우편번호 입력" id="zipcode" name="zipcode" style="display:inline; width:150px; padding:0">
					<input type="button" class="btn btn-outline-primary py-2 text-white" onclick="javascript:execDaumPostcode()" value="검색">
				  </div><br><br>
				  <div class="col-md-12">
				<label class="text-white" for="roadAddress">도로명 주소</label>  : <input type="text" class="form-control" id="roadAddress"  name="roadAddress" > <br>
				</div>
				<div class="col-md-12">
				<label class="text-white" for="jibunAddress">지번 주소</label>  : <input type="text" class="form-control" id="jibunAddress" name="jibunAddress" > <br>
				</div>
				<div class="col-md-12">
				<label class="text-white" for="namujiAddress">나머지 주소</label> : <input type="text" class="form-control" id="namujiAddress" name="namujiAddress"/>
            	</div>
             </div>
             
             <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="회원가입" class="btn btn-primary py-2 px-4 text-white" style="float:right;">
                </div>
              </div>
              
            </form>
        </div>
    </div>

    <div class="footer py-4">
      <div class="container-fluid text-center">
        <p>
          <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
          <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
        </p>
      </div>
    </div>

</div>

  <script src="${contextPath}/resources/js/jquery-3.3.1.min.js"></script>
  <script src="${contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${contextPath}/resources/js/jquery-ui.js"></script>
  <script src="${contextPath}/resources/js/popper.min.js"></script>
  <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${contextPath}/resources/js/owl.carousel.min.js"></script>
  <script src="${contextPath}/resources/js/jquery.stellar.min.js"></script>
  <script src="${contextPath}/resources/js/jquery.countdown.min.js"></script>
  <script src="${contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${contextPath}/resources/js/bootstrap-datepicker.min.js"></script>
  <script src="${contextPath}/resources/js/swiper.min.js"></script>
  <script src="${contextPath}/resources/js/aos.js"></script>

  <script src="${contextPath}/resources/js/picturefill.min.js"></script>
  <script src="${contextPath}/resources/js/lightgallery-all.min.js"></script>
  <script src="${contextPath}/resources/js/jquery.mousewheel.min.js"></script>

  <script src="${contextPath}/resources/js/main.js"></script>

  <script>
    $(document).ready(function(){
      $('#lightgallery').lightGallery();
    });
  </script>
</body>
</html>
