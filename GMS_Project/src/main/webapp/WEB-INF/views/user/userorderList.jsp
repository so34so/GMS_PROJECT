<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="icon" type="image/x-icon" href="${contextPath}/resources/img/user.png" />
		<link href="${contextPath }/resources/css/styles1.css?a" rel="stylesheet" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
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
<body>
	<div class="container-fluid">
             <h1 class="mt-4">주문 내역 조회</h1>
             <div class="card mb-4">
                 <div class="card-header">
                     <i class="fas fa-table mr-1"></i>
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
                          					<option <c:if test="${onePageViewCount eq 5}"> selected</c:if> value="5">5</option>
											<option <c:if test="${onePageViewCount eq 7}"> selected</c:if> value="7">7</option>
											<option <c:if test="${onePageViewCount eq 10}"> selected</c:if> value="10">10</option>
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
                                      <th>주문번호</th>
                                      <th>주문시간</th>
                                      <th>주문내역</th>
                                      <th>배송상태</th>
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
									<td colspan="8" align="center">	
										<select id="searchKeyword" class="form-control" style="width: 150px; display: inline;">
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
                         	<div style="display: table; margin-left: auto; margin-right: auto">
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
</body>
</html>