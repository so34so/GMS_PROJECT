<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>MyPage</title>
        <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
        <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/img/user.png" />
        <link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
    </head>
    <body class="nav-fixed">
        <nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
            <!-- Navbar Brand-->
            <!-- * * Tip * * You can use text or an image for your navbar brand.-->
            <!-- * * * * * * When using an image, we recommend the SVG format.-->
            <!-- * * * * * * Dimensions: Maximum height: 32px, maximum width: 240px-->
            <a class="navbar-brand" href="${contextPath}/member/index">P Gallery</a>
            <!-- Sidenav Toggle Button-->
            
            <!-- Navbar Search Input-->
            <!-- * * Note: * * Visible only on and above the md breakpoint-->
            <!-- Navbar Items-->
            <ul class="navbar-nav align-items-center ml-auto">
                <!-- User Dropdown-->
                <li class="nav-item dropdown no-caret mr-3 mr-lg-0 dropdown-user">
                   <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 mr-lg-2" id="sidebarToggle"><i data-feather="menu"></i></button>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sidenav shadow-right sidenav-dark">
                    <div class="sidenav-menu">
                        <div class="nav accordion" id="accordionSidenav">
                            <!-- Sidenav Menu Heading (Core)-->
                            <div class="sidenav-menu-heading"><h3 style="color:white;"><a href="${contextPath }/user/myPage" style="text-decoration:none; color:white;">${sessionScope.loginUser}님 정보</a></h3></div>
                            <!-- Sidenav Accordion (Dashboard)-->
                            <a class="nav-link collapsed" href="${contextPath }/user/userorderList">
                                <div class="nav-link-icon"><i class="fa fa-users"></i></div>
                                주문내역
                            </a>
                            <a class="nav-link collapsed" href="${contextPath }/user/update">
                                <div class="nav-link-icon"><i class="fa fa-paint-brush"></i></div>
                                정보수정
                            </a>
                            <a class="nav-link collapsed" href="${contextPath }/user/delete">
                                <div class="nav-link-icon"><i class="fa fa-picture-o"></i></div>
                                탈퇴
                            </a>
                        </div>
                    </div>
                    <!-- Sidenav Footer-->
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <header class="page-header page-header-dark pb-10" style="background-color:#080F22;">
                        <div class="container">
                            <div class="page-header-content pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="filter"></i></div>
                                            전체 정보
                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container mt-n10">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="datatable">
                                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0" style="white-space: nowrap;">
                                        <tbody>
												<tr class="dot_line">
													<td><strong>이름</strong></td>
													<td>${memberDto.galleryName}</td>
													<td><strong>닉네임</strong></td>
													<td>${memberDto.galleryNickname}</td>
												 </tr>
												 <tr class="dot_line">
													<td><strong>이메일</strong></td>
													<td colspan=3>${memberDto.galleryEmail}</td>
												 </tr>
												<tr class="dot_line">
													<td><strong>주소</strong></td>
													<td colspan=3>${memberDto.roadAddress} ${memberDto.jibunAddress} ${memberDto.namujiAddress}</td>
												</tr>
												<tr class="dot_line">
													<td><strong>가입날짜</strong></td>
													<td colspan=3><fmt:formatDate value="${memberDto.joinDate}" pattern="yyyy-MM-dd"/></td>
												</tr>
											</tboby>
										</table>
										<div class="clear"></div>
											<br>
											<br>
											<h1>1. 리뷰 정보</h1>
											<div>
												<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center;">
										              <thead>                                     
						                                  <tr>
						                                      <th>구매자 닉네임</th>
						                                      <th>구매한 날짜</th>
						                                      <th>리뷰 제목</th>
						                                      <th>리뷰 내용</th>
						                                      <th>작품 평가</th>
						                                  </tr>
						                              </thead>
						                              <tbody>
														<c:choose>
							    							<c:when test="${empty reviewList }">			
																<tr>
															       <td colspan="5" class="fixed"><strong>조회된 후기가 없습니다.</strong></td>
															    </tr>
														 	</c:when>
														 	<c:otherwise>
											     				<c:forEach var="review" items="${reviewList}">
																	<tr>       
																		<td><strong>${review.galleryNickname}</strong></td>
																		<td><fmt:formatDate value="${review.reviewDate}" pattern="yyyy-MM-dd"/></td>
																		<td>${review.reviewTitle}</td>
																		<td>${review.reviewContent}</td>
																		<td><strong>${review.reviewRate} </strong> </td>
																	</tr>
																</c:forEach>
																<tr>
															       <td colspan="5" class="fixed"><a href="${contextPath }/user/userorderList"><b>더보기</b></a></td>
															    </tr>
															</c:otherwise>
											  			</c:choose>	
						                              </tbody>										
						                          </table>
											</div>
											<div class="clear"></div>
											<br>
											<br>
											<h1>2. 주문 정보</h1>
											<div>
												<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center; white-space: nowrap;">
										              <thead>                                     
						                                  <tr>
						                                      <th>주문 작품</th>
						                                      <th>주문 시간</th>
						                                      <th>주문하신 분</th>
						                                      <th>받으실 분</th>
						                                      <th>배송상태</th>
						                                  </tr>
						                              </thead>
						                              <tbody>
														<c:choose>
							    							<c:when test="${empty orderList }">			
																<tr>
															       <td colspan="5" class="fixed"><strong>조회된 후기가 없습니다.</strong></td>
															    </tr>
														 	</c:when>
														 	<c:otherwise>
											     				<c:forEach var="order" items="${orderList}">
																	<tr>       
													<td><strong>${order.artTitle}</strong></td>
													<td><strong><fmt:formatDate value="${order.payOrderTime}" pattern="yyyy-MM-dd HH:mm"/></strong></td>
													<td><strong>${order.galleryName}</strong></td>
													<td><strong>${order.receiverName}</strong></td>
													<td width=10%>
														<c:if test="${order.deliveryState == 'deliveryPrepared'}"> 
															<div class="badge badge-pill" style="color:#fff; background-color:#00cfd5;">배송준비중</div>
														</c:if>
														<c:if test="${order.deliveryState == 'delivering'}"> 
															<div class="badge badge-secondary badge-pill"style="color:#212832; background-color:#e4ddf7;">배송중</div>
														</c:if>
														<c:if test="${order.deliveryState == 'finishedDelivering'}"> 
															<div class="badge badge-primary badge-pill"style="color:#fff; background-color:#0061f2;">배송완료</div>
														</c:if>
														<c:if test="${order.deliveryState == 'cancelOrder'}"> 
															<div class="badge badge-danger badge-pill"style="color:#fff; background-color: #e81500;">주문취소</div>
														</c:if>
														<c:if test="${order.deliveryState == 'returningGoods'}"> 
															<div class="badge badge-yellow badge-pill"style="color:#fff; background-color: #f4a100;">반품</div>
														</c:if>
													</td>
												</tr>
																</c:forEach>
																<tr>
															       <td colspan="5" class="fixed"><a href="${contextPath }/user/userorderList"><b>더보기</b></a></td>
															    </tr>
															</c:otherwise>
											  			</c:choose>	
						                              </tbody>										
						                          </table>
											</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="footer mt-auto footer-light">
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
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/js/scripts1.js"></script>
        <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/js/datatables-demo.js"></script>
    </body>
</html>
