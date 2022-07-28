<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
</head>
<body>
                    <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-9">
                                <!-- Basic login form-->
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header justify-content-center"><h3 class="font-weight-light my-4">전체 정보</h3></div>
                                    <div class="card-body">
                                        <!-- Login form-->
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
						                              <colgroup>
														<col width="15%">
														<col width="15%">
														<col width="10%">
														<col width="50%">
														<col width="10%">
													  </colgroup>
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
												<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center;">
						                              <colgroup>
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
													  </colgroup>
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