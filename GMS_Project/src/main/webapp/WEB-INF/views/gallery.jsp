<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>P Gallery</title>
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
	
<script>

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
      <div class="container-fluid">

        <div class="row justify-content-center">

          <div class="col-md-7">
            <div class="row mb-5">
              <div class="col-12 ">
                <h2 class="site-section-heading text-center">${category.showName }</h2>
              </div>
            </div>
          </div>

        </div>
        <div class="row" id="lightgallery">
        <c:forEach var="art1" items="${artList}" varStatus="status1">
        <c:if test="${art1.showName eq category.showName }">
          <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3 item" data-aos="fade" data-src="${contextPath}/thumbnails?artImage=${art1.artImage}" data-sub-html="<h3>${art1.artTitle }</h3><p>${art1.artContent }</p>">
            <a href="#"><img src="${contextPath}/thumbnails?artImage=${art1.artImage}" alt="IMage" class="img-fluid"></a>
          </div>
          </c:if>
          </c:forEach>
        </div>
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