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
<script>
		
		$().ready(function(){
			
			$("#onePageViewCount").change(function(){
				
				var onePageViewCount = $("#onePageViewCount").val();
				var searchKeyword    = $("#searchKeyword").val();
				var searchWord       = $("#searchWord").val();
				
				var url = "${contextPath}/user/userorderList?";
					url	+= "onePageViewCount=" + onePageViewCount;
					url	+= "&searchKeyword=" + searchKeyword;
					url	+= "&searchWord=" + searchWord;
				
				location.href = url;
				
			}) ;
			
			
			$("#getSearchBoard").click(function(){
				
				var onePageViewCount = $("#onePageViewCount").val();
				var searchKeyword    = $("#searchKeyword").val();
				var searchWord       = $("#searchWord").val();
				
				var url = "${contextPath}/user/userorderList?";
					url += "onePageViewCount=" + onePageViewCount;
					url += "&searchKeyword=" + searchKeyword;
					url += "&searchWord=" + searchWord;
				
					location.href=url;
					
			});
				
			
		});
		
		
		
</script>
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
                                            주문/배송 조회
                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container mt-n10">
                        <div class="card mb-4">
                            <div class="card-header">
                            	<i class="fa fa-database" aria-hidden="true"></i>
                   				Total <span style="color: red; font-weight: bold">${totalBoardCount}</span> entries
                				</div>
                            <div class="card-body">
                                <div class="table-responsive">
                     	<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                         	<div class="row">
                         		<div class="col-sm-12 col-md-6">
                         			<div class="dataTables_length" id="dataTable_length">
                         				<label>Show 
                          				<select id="onePageViewCount" name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
                          					<option <c:if test="${onePageViewCount eq 10}"> selected</c:if> value="10">10</option>
											<option <c:if test="${onePageViewCount eq 15}"> selected</c:if> value="15">15</option>
											<option <c:if test="${onePageViewCount eq 20}"> selected</c:if> value="20">20</option>
                          				</select> 
                          				</label>
                          			</div>		                               
                       			</div>
                       		</div>
                          <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center;">
                              <colgroup>
								<col width="15%">
								<col width="15%">
								<col width="60%">
								<col width="10%">
							  </colgroup>
				              <thead>                                     
                                  <tr>
                                      <th>주문 번호</th>
                                      <th>주문 시간</th>
                                      <th>주문 내역</th>
                                      <th>배송 상태</th>
                                  </tr>
                              </thead>
                              <tbody>
								<c:choose>
	    							<c:when test="${empty orderList }">			
										<tr>
									       <td colspan="8" class="fixed"><strong>조회된 상품이 없습니다.</strong></td>
									    </tr>
								 	</c:when>
								 	<c:otherwise>
					     				<c:forEach var="order" items="${orderList}" varStatus="status">
						     				<c:if test="${order.galleryId eq loginUser }">
												<tr>       
													<td><strong>${order.orderId}</strong></td>
													<td><strong><fmt:formatDate value="${order.payOrderTime}" pattern="yyyy-MM-dd HH:mm"/></strong></td>
													<td style="text-align:left;">
														<a href="${contextPath }/user/userorderdetail?orderId=${order.orderId}&galleryId=${order.galleryId}&artTitle=${order.artTitle}">
															<strong>주문작품 : ${order.artTitle} </strong> <br>
															<strong>주문자 : ${order.galleryName} </strong> <br>
															<strong>주문자 이메일: ${order.galleryEmail} </strong> <br><br>
															<strong>수령자 : ${order.receiverName} </strong> <br>
														</a>
													</td>
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
											</c:if>
										</c:forEach>
									</c:otherwise>
					  			</c:choose>	
								<tr>
									<td colspan="8" align="left">	
										<select id="searchKeyword" class="form-control" style="width: 150px; display: inline; padding-top:11px;">
											<option <c:if test="${searchKeyword eq 'total'}"> selected</c:if> value="total">전체검색</option>
											<option <c:if test="${searchKeyword eq 'receiverName'}"> selected</c:if> value="receiverName">이름검색</option>
											<option <c:if test="${searchKeyword eq 'artTitle'}"> selected</c:if> value="artTitle">작품검색</option>
										</select>
				                             		<input type="text" style="width: 300px; display: inline;" class="form-control" id="searchWord" name="searchWord" value="${searchWord}" >
										<input type="button" class="btn btn-outline-info btn-sm" value="Search" id="getSearchBoard">
									</td>
								</tr>
                              </tbody>										
                          </table>
                         	<div style="display: table; margin-left: auto; margin-right: auto; float:left;">
                          	<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                          		<c:if test="${totalBoardCount gt 0 }">
                           		<ul class="pagination">
                           			<c:if test="${startPage gt 10 }">
                             			<li class="paginate_button page-item previous" id="dataTable_previous">
                             				<a href="${contextPath }/admin/admincategory?currentPageNumber=${startPage - 10}&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                             			</li>
                           			</c:if>
                           			<c:forEach var="i" begin="${startPage}" end="${endPage }" >
                             			<li class="paginate_button page-item">
                             				<a href="${contextPath }/admin/admincategory?currentPageNumber=${i}&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">${i}</a>
                             			</li>
                             		</c:forEach>
                           			<c:if test="${endPage le totalBoardCount && endPage ge 10}"> 
                             			<li class="paginate_button page-item next" id="dataTable_next">
                             				<a href="${contextPath }/admin/admincategory?currentPageNumber=${startPage + 10}&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
                             			</li>
                           			</c:if>
                           		</ul>
                           	</c:if>
                          	</div>
                          </div>
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
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/js/scripts1.js"></script>
        <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/js/datatables-demo.js"></script>
    </body>
</html>
