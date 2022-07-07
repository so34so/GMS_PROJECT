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
				
				var url = "${contextPath}/admin/admincategory?";
					url	+= "onePageViewCount=" + onePageViewCount;
				
				location.href = url;
				
			}) ;
			
			
			$("#getSearchBoard").click(function(){
				
				var onePageViewCount = $("#onePageViewCount").val();
				
				var url = "${contextPath}/admin/admincategory?";
					url += "onePageViewCount=" + onePageViewCount;
				
					location.href=url;
					
			});
				
			
		});
		
</script>
</head>
<body>
	<div class="container-fluid">
             <h1 class="mt-4" style="text-align:center;">구매후기</h1>
             <div class="container px-4 px-lg-5 my-5">
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
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							  </colgroup>
				              <thead>                                     
                                  <tr>
                                      <th>구매 작품</th>
                                      <th>작가</th>
                                      <th>구매자 닉네임</th>
                                      <th>구매한 날짜</th>
                                  </tr>
                              </thead>
                              <tbody>
								<c:choose>
	    							<c:when test="${empty categoryList }">			
										<tr>
									       <td colspan="8" class="fixed"><strong>조회된 후기가 없습니다.</strong></td>
									    </tr>
								 	</c:when>
								 	<c:otherwise>
					     				<c:forEach var="category" items="${categoryList}">
											<tr>       
												<td><strong>${category.artArtnum}</strong></td>
												<td><strong>${category.artStatus}</strong></td>
												<td><strong>${category.showName} </strong> </td>
												<td>
													<a href="${contextPath}/admin/adminproduct?artArtnum=${category.artArtnum}"><strong>${category.artTitle} </strong></a>
												</td>
												<td><strong>${category.artist}</strong></td>
												<td><strong><fmt:formatDate value="${category.startDate}" pattern="yyyy-MM-dd"/></strong></td>
												<td><strong><fmt:formatDate value="${category.endDate}" pattern="yyyy-MM-dd"/> </strong></td>
												<td><strong>${category.mainArt} </strong> </td>
											</tr>
										</c:forEach>
									</c:otherwise>
					  			</c:choose>	
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