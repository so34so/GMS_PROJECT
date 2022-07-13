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
        <link href="${contextPath }/resources/css/styles4.css?a" rel="stylesheet" />
</head>
<body>
<!-- Portfolio Section-->
        <section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- Portfolio Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">${category.showName }</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Grid Items-->
                <div class="row justify-content-center">
                    <!-- Portfolio Item 1-->
                    <c:forEach var="art1" items="${artList }" varStatus="status1">
                    	<c:if test="${art1.showName eq category.showName }">
		                    <div class="col-md-6 col-lg-3 mb-5">
		                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal${status1.count }">
		                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
		                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
		                            </div>
		                            <img class="img-fluid" src="${contextPath}/thumbnails?artImage=${art1.artImage}" alt="${art1.artImage }" />
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
        <c:forEach var="art2" items="${artList }" varStatus="status2">
        	<c:set var="num" value="${status2.count }"></c:set>
       		<c:if test="${art2.showName eq category.showName }">
		        <div class="portfolio-modal modal fade" id="portfolioModal${num }" tabindex="-1" aria-labelledby="portfolioModal" aria-hidden="true">
		            <div class="modal-dialog modal-xl">
		                <div class="modal-content">
		                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
		                    <div class="modal-body text-center pb-5">
		                        <div class="container">
		                            <div class="row justify-content-center">
		                                <div class="col-lg-8">
		                                    <!-- Portfolio Modal - Title-->
		                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">${art2.artTitle }</h2>
		                                    <!-- Icon Divider-->
		                                    <div class="divider-custom">
		                                        <div class="divider-custom-line"></div>
		                                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
		                                        <div class="divider-custom-line"></div>
		                                    </div>
		                                    <!-- Portfolio Modal - Image-->
		                                    <img class="img-fluid rounded mb-5" src="${contextPath}/thumbnails?artImage=${art2.artImage}" alt="..." style="width: 100%; height: auto;"/>
		                                    
		                                    <!-- Portfolio Modal - Text-->
		                                    <p class="mb-4">${art2.artContent }</p>
		                                    
		                                    <%-- <button data-bs-toggle="modal" data-bs-target="#portfolioModal${num-status2.index }">
		                                    <i class="fa-solid fa-angle-left"></i>
		                                    </button> --%>
		                                    
		                                    <button class="btn btn-primary" data-bs-dismiss="modal">
		                                        <i class="fas fa-xmark fa-fw"></i>
		                                        닫기
		                                    </button>
		                                    
		                                    <%-- <button data-bs-toggle="modal" data-bs-target="#portfolioModal${num+1 }">
		                                    <i class="fa-solid fa-angle-right"></i>
		                                    </button> --%>
		                                    
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </c:if>
	    </c:forEach>
	    
	    <%-- <c:forEach var="art2" items="${artList }" varStatus="status2"> 
	    <c:if test="${art2.showName eq category.showName }">
        <div class="portfolio-modal modal fade" id="portfolioModal${status2.count }" tabindex="-1" aria-labelledby="portfolioModal" aria-hidden="true">
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
						                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${contextPath}/thumbnails?artImage=${art2.artImage}" alt="..." /></div>
						                    <div class="col-md-6">
						                        <h2 class="display-5 fw-bolder">${art2.artTitle }</h2>
						                        <div class="fs-5 mb-5">
						                            <span>작가 : ${art2.artist }</span>
						                        </div>
						                        <p class="lead">작품 설명 : ${art2.artContent }</p>
						                    </div>
						                </div>
						            </div>
                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal${num-status2.index }">
		                                    <i class="fa-solid fa-angle-left"></i>
		                                    </button>
		                                    
		                                    <button class="btn btn-primary" data-bs-dismiss="modal">
		                                        <i class="fas fa-xmark fa-fw"></i>
		                                        닫기
		                                    </button>
		                                    
		                                    <button data-bs-toggle="modal" data-bs-target="#portfolioModal${num+1 }">
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
     </c:forEach> --%>
  
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