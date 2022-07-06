<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gallery</title>
        <link rel="icon" type="image/x-icon" href="${contextPath }/resources/img/iconmonstr-picture-1-240.png" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath }/resources/css/styles4.css" rel="stylesheet" />
</head>
<body>
<!-- Portfolio Section-->
        <section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- Portfolio Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">GALLERY</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Grid Items-->
                <div class="row justify-content-center">
                    <!-- Portfolio Item 1-->
                    <c:forEach var="art" items="${artList }" varStatus="status1">
                    	<c:if test="${art.showName eq category.showName }">
		                    <div class="col-md-6 col-lg-3 mb-5">
		                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal"+${status1.count }>
		                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
		                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
		                            </div>
		                            <img class="img-fluid" src="${contextPath}/thumbnails?artImage=${art.artImage}" alt="${art.artImage }" />
		                        </div>
		                    </div>
		                </c:if>
                     </c:forEach>
                </div>
                <input type="button" value="Go Homepage" class="btn btn-primary" onclick="location.href='${contextPath}/member/index'" >

            </div>
        </section>
        
        
                <!-- Portfolio Modals-->
        <!-- Portfolio Modal 1-->
        <c:forEach var="art" items="${artList }" varStatus="status2">
       		<c:if test="${art.showName eq category.showName }">
		        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
		            <div class="modal-dialog modal-xl">
		                <div class="modal-content">
		                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
		                    <div class="modal-body text-center pb-5">
		                        <div class="container">
		                            <div class="row justify-content-center">
		                                <div class="col-lg-8">
		                                    <!-- Portfolio Modal - Title-->
		                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">${art.artTitle }</h2>
		                                    <!-- Icon Divider-->
		                                    <div class="divider-custom">
		                                        <div class="divider-custom-line"></div>
		                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
		                                        <div class="divider-custom-line"></div>
		                                    </div>
		                                    <!-- Portfolio Modal - Image-->
		                                    <img class="img-fluid rounded mb-5" src="${contextPath}/thumbnails?artImage=${art.artImage}" alt="..." />
		                                    <!-- Portfolio Modal - Text-->
		                                    <p class="mb-4">${art.artContent }</p>
		                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal8">
		                                    <i class="fa-solid fa-angle-left"></i>
		                                    </button>
		                                    <button class="btn btn-primary" data-bs-dismiss="modal">
		                                        <i class="fas fa-xmark fa-fw"></i>
		                                        닫기
		                                    </button>
		                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal2">
		                                    <i class="fa-solid fa-angle-right"></i>
		                                    </button>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </c:if>
	    </c:forEach>
        <!-- <!-- Portfolio Modal 2
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" aria-labelledby="portfolioModal2" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    Portfolio Modal - Title
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">그랜빌 아일랜드 퍼블릭 마켓</h2>
                                    Icon Divider
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    Portfolio Modal - Image
                                    <img class="img-fluid rounded mb-5" src="assets/img/미니어쳐2.png" alt="..." />
                                    Portfolio Modal - Text
                                    <p class="mb-4">요트 정착장</p>
                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal1">
                                    <i class="fa-solid fa-angle-left"></i>
                                    </button>
                                    <button class="btn btn-primary" data-bs-dismiss="modal">
                                        <i class="fas fa-xmark fa-fw"></i>
                                        닫기
                                    </button>
                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal3">
                                    <i class="fa-solid fa-angle-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        Portfolio Modal 3
        <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" aria-labelledby="portfolioModal3" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    Portfolio Modal - Title
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">비내리는 날</h2>
                                    Icon Divider
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    Portfolio Modal - Image
                                    <img class="img-fluid rounded mb-5" src="assets/img/미니어쳐3.png" alt="..." />
                                    Portfolio Modal - Text
                                    <p class="mb-4">호수에 닿은 물방울</p>
                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal2">
                                    <i class="fa-solid fa-angle-left"></i>
                                    </button>
                                    <button class="btn btn-primary" data-bs-dismiss="modal">
                                        <i class="fas fa-xmark fa-fw"></i>
                                        닫기
                                    </button>
                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal4">
                                    <i class="fa-solid fa-angle-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        Portfolio Modal 4
        <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" aria-labelledby="portfolioModal4" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    Portfolio Modal - Title
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">두바이 전망대</h2>
                                    Icon Divider
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    Portfolio Modal - Image
                                    <img class="img-fluid rounded mb-5" src="assets/img/미니어쳐4.png" alt="..." />
                                    Portfolio Modal - Text
                                    <p class="mb-4">이날 날씨 좋았는데 이상하다</p>
                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal3">
                                    <i class="fa-solid fa-angle-left"></i>
                                    </button>
                                    <button class="btn btn-primary" data-bs-dismiss="modal">
                                        <i class="fas fa-xmark fa-fw"></i>
                                        닫기
                                    </button>
                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal5">
                                    <i class="fa-solid fa-angle-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        Portfolio Modal 5
        <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" aria-labelledby="portfolioModal5" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    Portfolio Modal - Title
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">숙소에서 한장</h2>
                                    Icon Divider
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    Portfolio Modal - Image
                                    <img class="img-fluid rounded mb-5" src="assets/img/미니어쳐5.png" alt="..." />
                                    Portfolio Modal - Text
                                    <p class="mb-4">집이 이쁜 장소</p>
                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal4">
                                    <i class="fa-solid fa-angle-left"></i>
                                    </button>
                                    <button class="btn btn-primary" data-bs-dismiss="modal">
                                        <i class="fas fa-xmark fa-fw"></i>
                                        닫기
                                    </button>
                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal6">
                                    <i class="fa-solid fa-angle-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        Portfolio Modal 6
        <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" aria-labelledby="portfolioModal6" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    Portfolio Modal - Title
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">카파도키아 열기구</h2>
                                    Icon Divider
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    Portfolio Modal - Image
                                    <img class="img-fluid rounded mb-5" src="assets/img/미니어쳐6.png" alt="..." />
                                    Portfolio Modal - Text
                                    <p class="mb-4">운이 좋았던 나</p>
                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal5">
                                    <i class="fa-solid fa-angle-left"></i>
                                    </button>
                                    <button class="btn btn-primary" data-bs-dismiss="modal">
                                        <i class="fas fa-xmark fa-fw"></i>
                                        닫기
                                    </button>
                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal7">
                                    <i class="fa-solid fa-angle-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        Portfolio Modal 7
        <div class="portfolio-modal modal fade" id="portfolioModal7" tabindex="-1" aria-labelledby="portfolioModal7" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    Portfolio Modal - Title
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">숙소에서 한장</h2>
                                    Icon Divider
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    Portfolio Modal - Image
                                    <img class="img-fluid rounded mb-5" src="assets/img/미니어쳐7.png" alt="..." />
                                    Portfolio Modal - Text
                                    <p class="mb-4">집이 이쁜 장소</p>
                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal6">
                                    <i class="fa-solid fa-angle-left"></i>
                                    </button>
                                    <button class="btn btn-primary" data-bs-dismiss="modal">
                                        <i class="fas fa-xmark fa-fw"></i>
                                        닫기
                                    </button>
                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal8">
                                    <i class="fa-solid fa-angle-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        Portfolio Modal 8
        <div class="portfolio-modal modal fade" id="portfolioModal8" tabindex="-1" aria-labelledby="portfolioModal8" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    Portfolio Modal - Title
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">유적지</h2>
                                    Icon Divider
                                    <div class="divider-custom">
                                        <div class="divider-custom-line"></div>
                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                        <div class="divider-custom-line"></div>
                                    </div>
                                    Portfolio Modal - Image
                                    <img class="img-fluid rounded mb-5" src="assets/img/미니어쳐8.png" alt="..." />
                                    Portfolio Modal - Text
                                    <p class="mb-4">또 가고 싶다</p>
                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal7">
                                    <i class="fa-solid fa-angle-left"></i>
                                    </button>
                                    <button class="btn btn-primary" data-bs-dismiss="modal">
                                        <i class="fas fa-xmark fa-fw"></i>
                                        닫기
                                    </button>
                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal1">
                                    <i class="fa-solid fa-angle-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> --> 
                <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${contextPath }/resources/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>