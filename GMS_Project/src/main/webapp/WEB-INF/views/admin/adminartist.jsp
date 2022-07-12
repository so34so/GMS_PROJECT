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
		
		function deleteReview(artistId){
			
			$.ajax({
				type : "get",
				url : "${contextPath}/admin/deleteartist",
				data : {
					"artistId" : artistId
				},
				success : function() {
					alert("작가 정보를 삭제하였습니다.");
					location.href = "${contextPath}/admin/adminartist";
				}
			}); 
			
		}		
		
		
		
		$().ready(function(){
			
			$("#onePageViewCount").change(function(){
				
				var onePageViewCount = $("#onePageViewCount").val();
				var searchKeyword    = $("#searchKeyword").val();
				var searchWord       = $("#searchWord").val();
				
				var url = "${contextPath}/admin/adminartist?";
					url	+= "onePageViewCount=" + onePageViewCount;
					url	+= "&searchKeyword=" + searchKeyword;
					url	+= "&searchWord=" + searchWord;
				
				location.href = url;
				
			}) ;
			
			
			$("#getSearchBoard").click(function(){
				
				var onePageViewCount = $("#onePageViewCount").val();
				var searchKeyword    = $("#searchKeyword").val();
				var searchWord       = $("#searchWord").val();
				
				var url = "${contextPath}/admin/adminartist?";
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
             <h1 class="mt-4">작가 조회</h1>
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
                       			<div class="col-sm-12 col-md-6">
                       				<input type="button" class="btn btn-Light btn-sm" style="float: right; background-color:#bd5d38; color:white;" value="Write" onclick="location.href='${contextPath }/admin/artistadd'">
                       			</div>
                       		</div>
                          <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                              <colgroup>
								<col width="10%">
								<col width="20%">
								<col width="60%">
								<col width="10%">
							  </colgroup>
				              <thead>                                     
                                  <tr>
                                      <th>작가이름</th>
                                      <th>작가사진</th>
                                      <th>작가설명란</th>
                                      <th>삭제</th>
                                  </tr>
                              </thead>
                              <tbody>
                              <c:choose>
	    							<c:when test="${empty artistList }">			
										<tr>
									       <td colspan="3" class="fixed"><strong>조회된 작가가 없습니다.</strong></td>
									    </tr>
								 	</c:when>
									 	<c:otherwise>
						     				<c:forEach var="artist" items="${artistList}" varStatus="status">
													<tr>       
														<td><strong>${artist.artist}</strong></td>
														<td>
														  		<img width="75" alt="작가사진" src="${contextPath}/image?artistImage=${artist.artistImage}">
														</td>
														<td><strong>${artist.artistComent} </strong> </td>
														<td><button onclick="deleteReview('${artist.artistId}')">삭제</button> </td>
													</tr>
											</c:forEach>
										</c:otherwise>
					  			</c:choose>
								<tr>
									<td colspan="8" align="center">	
										<select id="searchKeyword" class="form-control" style="width: 150px; display: inline;">
											<option <c:if test="${searchKeyword eq 'total'}"> selected</c:if> value="total">전체검색</option>
											<option <c:if test="${searchKeyword eq 'artist'}"> selected</c:if> value="artist">작가검색</option>
											<option <c:if test="${searchKeyword eq 'artistArt'}"> selected</c:if> value="artistArt">대표작검색</option>
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