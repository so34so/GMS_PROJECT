<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>P_Gallery</title>
        <link rel="icon" type="image/x-icon" href="${contextPath }/resources/img/iconmonstr-picture-1-240.png" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <span class="d-block d-lg-none">P_Gallery</span>
                <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-3 mx-auto mb-2" src="${contextPath }/resources/img/20200830_142314.jpg" alt="..." /></span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">P_Gallery</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#experience">사진 전시</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#education">그림 전시</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#skills">전시인물 소개</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#awards">FAQ</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/shop/Homepage">작품판매쳐</a></li>
                    <c:choose>
                        <c:when test="${isLogOn == true and loginUser == 'admin'}">
        	            	<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/admin/adminpage">관리페이지</a></li>
		                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/member/logout">로그아웃</a></li>
        	            </c:when>
                    	<c:when test="${isLogOn == true and not empty loginUser}">
        	            	<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/member/myPage">마이페이지</a></li>
		                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/member/logout">로그아웃</a></li>
        	            </c:when>
        	            <c:otherwise>
							<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/member/login">로그인</a></li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath }/member/register">회원가입</a></li>
        	            </c:otherwise>	
                    </c:choose>
                </ul>
            </div>
        </nav>
        <!-- Page Content-->
        <div class="container-fluid p-0">
            <!-- About-->
            <section class="resume-section" id="about">
                <div class="resume-section-content">
                    <h1 class="mb-0">
                        P GALLERY
                        <span class="text-primary"></span>
                    </h1>
                    <div class="subheading mb-5">
                        오프라인으로 즐기던 전시회를 온라인으로!
                    </div>
                    <p class="lead mb-5">사진 및 그림 작가들의 다양한 작품을 바로 이곳에서 즐기세요!<br>보시다 원하는게 있으면 바로 구매 가능합니다!</p>
                    <div class="social-icons">
                        <a class="social-icon" href="https://www.instagram.com"><i class="fab fa-linkedin-in"></i></a>
                        <a class="social-icon" href="https://www.youtube.com"><i class="fa-brands fa-youtube"></i></a>
                        <a class="social-icon" href="https://www.twitter.com"><i class="fab fa-twitter"></i></a>
                        <a class="social-icon" href="https://www.facebook.com"><i class="fab fa-facebook-f"></i></a>
                    </div>
                </div>
            </section>
            <hr class="m-0" />
            <!-- Experience-->
            <section class="section-meals resume-section"id="experience">
                <div class="resume-section-content">
                    <h2 class="mb-5">사진 전시</h2>
                     	<div class="row">
	                    	<c:forEach var="item1" items="${photoList }" varStatus="status">
	                    		<c:if test="${item1.mainArt eq 'Y' }">
			                        <div class="col-lg-6">
			                            <div class="team-member">
			                                <a href="${contextPath }/gallery/In?artImage=${item1.artImage}"><img class="img-fluid img-profile rounded-3 mx-auto mb-2" src="${contextPath}/thumbnails?artImage=${item1.artImage}" alt="카테고리 사진"style="width:250px;height:250px;" /></a>
			                                <h4>${item1.showName } 전시회</h4>
			                                <p class="text-muted">${item1.artist }</p>
			                                <p><strong>전시기한 : <fmt:formatDate value="${item1.startDate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${item1.endDate}" pattern="yyyy-MM-dd"/></strong></p>
			                                <div class="d-grid gap-2"><a class="btn btn-lg btn-danger" href="${contextPath }/gallery/In?artImage=${item1.artImage}" role="button">보러가기</a></div>
			                            </div>
			                        </div>
		                        </c:if>
	                        </c:forEach>
                    </div>
                </div>
            </section>
            <hr class="m-0"/>
            <!-- Education-->
 			<section class="resume-section" id="education">
                <div class="resume-section-content">
                    <h2 class="mb-5">그림 전시</h2>
                    <div class="row">
                    	<c:forEach var="item2" items="${paintList }" varStatus="status"> 
	                    	<c:if test="${item2.mainArt eq 'Y' }">
		                        <div class="col-lg-6">
		                            <div class="team-member">
		                                <a href="${contextPath }/gallery/In?artImage=${item2.artImage}"><img class="img-fluid img-profile rounded-3 mx-auto mb-2" src="${contextPath}/thumbnails?artImage=${item2.artImage}" alt="..."style="width:250px;height:250px;" /></a>
		                                <h4>${item2.showName } 전시회</h4>
			                                <p class="text-muted">${item2.artist }</p>
			                                <p><strong>전시기한 : <fmt:formatDate value="${item2.startDate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${item2.endDate}" pattern="yyyy-MM-dd"/></strong></p>
		                                <div class="d-grid gap-2"><a class="btn btn-lg btn-danger" href="${contextPath }/gallery/In?sartImage=${item2.artImage}" role="button">보러가기</a></div>
		                            </div>
		                        </div>
		                    </c:if>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <hr class="m-0" />
            <!-- Skills-->
            <section class="resume-section" id="skills">
                <div class="resume-section-content">
                    <h2 class="mb-5">전시인물 소개</h2>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="team-member">
                                <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="${contextPath }/resources/img/20200830_142314.jpg" alt="..."style="width:250px;height:250px;" />
                                <h4>김민석</h4>
                                <p class="text-muted">대학생(졸업예정자)</p>
                                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand Twitter Profile" data-bs-toggle="modal" data-bs-target="#Infomation"><i class="fa-solid fa-book"></i></a>
                                <a class="btn btn-dark btn-social mx-2" href="https://www.facebook.com" aria-label="Parveen Anand Facebook Profile"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-dark btn-social mx-2" href="https://www.instagram.com" aria-label="Parveen Anand LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="team-member">
                                <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="${contextPath }/resources/img/blank-profile-picture-g35fe79848_640.png" alt="..."style="width:250px;height:250px;" />
                                <h4>누구든 환영</h4>
                                <p class="text-muted">당신은 최고!</p>
                                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Diana Petersen Twitter Profile"><i class="fa-solid fa-book"></i></a>
                                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Diana Petersen Facebook Profile"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Diana Petersen LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="team-member">
                                <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="${contextPath }/resources/img/blank-profile-picture-g35fe79848_640.png" alt="..."style="width:250px;height:250px;" />
                                <h4>누구든 환영</h4>
                                <p class="text-muted">당신은 최고!</p>
                                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Larry Parker Twitter Profile"><i class="fa-solid fa-book"></i></a>
                                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Larry Parker Facebook Profile"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Larry Parker LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <hr class="m-0" />
            <!-- Interests-->
            <section class="resume-section" id="awards">
                <div class="resume-section-content">
                    <h2 class="mb-5">FAQ</h2>
                    <ul class="qna">
                        <li>
                            <input type="checkbox" id="qna-1">
                            <label for="qna-1">다른 사람 명의의 계좌로 환불받을 수 있나요?</label>
                            <div>
                                <p>다른 사람 명의로는 환불할 수 없습니다. 고객님 본인 명의 계좌로만 환불이 가능합니다.</p>
                            </div>
                        </li>
                        <li>
                            <input type="checkbox" id="qna-2">
                            <label for="qna-2">등록한 환불계좌를 등록/변경하고 싶어요.</label>
                            <div>
                                <p>마이페이지에서 환불계좌 등록 및 수정이 가능합니다. 환불계좌는 주문자 명의의 본인 계좌만 등록할 수 있습니다.</p>
                                <p>주문 진행 상태가 '환불진행중' 또는 '환불완료' 에서는 환불계좌를 변경할 수 없습니다.</p>
                            </div>
                        </li>
                        <li>
                            <input type="checkbox" id="qna-3">
                            <label for="qna-3">반품 신청을 철회하고 싶어요.</label>
                            <div>
                                <p>반품할 상품을 아직 보내지 않은 경우, 마이페이지에서 반품철회를 하실 수 있습니다.</p>
                                <p>반품철회 후 택배사에서 상품 수거가 된 것으로 확인될 경우 해당 주문은 반품처리한 것으로 재 변경됩니다.</p>
                            </div>
                        </li>
                        <li>
                            <input type="checkbox" id="qna-4">
                            <label for="qna-4">배송된 상품이 부재중으로 반송된 경우 어떻게 하나요?</label>
                            <div>
                                <p>부재 등의 사유로 반송된 상품은 "마이페이지 > 주문 조회"]"에서 택배사 영업소, 또는 배송 담당 택배원 연락처를 통해 재배송 요청을 할 수 있습니다. 상품이 이미 반송되어 해당 업체로 입고된 경우, 왕복 배송비를 추가 부담하셔야 합니다.</p>
                            </div>
                        </li>
                        <li>
                            <input type="checkbox" id="qna-5">
                            <label for="qna-5">상품에 대해서 문의하려면 어떻게 해야 하나요?</label>
                            <div>
                                <p>상품에 관한 내용은 상품상세 화면에 자세히 안내되어 있습니다. 마이페이지 > 주문내역에서 주문한 상품을 선택하면 상세페이지로 이동합니다.</p>
                                <p>상품 상세 내용에 표시되어 있지 않은 내용은 판매자에게 문의해 주십시오.</p>
                                <p>> 판매자에게 문의</p>
                                <p>1. "마이페이지 > 주문내역에서 상품 선택 > 배송/교환/반품 안내"에 표기된 판매자 연락처로 문의</p>
                                <p>2. "마이페이지 > 1:1문의하기 > 문읜타입에서 판매자에게 문의하기"를 선택한 후 질의 내용 작성</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </section>
            <hr class="m-0" />
        </div>
        
        
                <!-- Portfolio Modal 1-->
        <div class="portfolio-modal modal fade" id="Infomation" tabindex="-1" aria-labelledby="Infomation" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
						            <div class="container px-4 px-lg-5 my-5">
						                <div class="row gx-4 gx-lg-5 align-items-center">
						                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${contextPath}/resources/img/20200830_142314.jpg" alt="..." /></div>
						                    <div class="col-md-6">
						                        <h2 class="display-5 fw-bolder">작가 : 김민석</h2>
						                        <div class="fs-5 mb-5">
						                            <span>대학생(졸업예정자)</span>
						                        </div>
						                        <p class="lead">나이 : 25세</p>
						                        <p class="lead">대표작품 : 없음</p>
						                    </div>
						                </div>
						            </div>
                                    <button style="color:white;"class="btn btn-primary" data-bs-dismiss="modal">
                                        <i class="fas fa-xmark fa-fw"></i>
                                        닫기
                                    </button>
                                </div>
                            </div>
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
