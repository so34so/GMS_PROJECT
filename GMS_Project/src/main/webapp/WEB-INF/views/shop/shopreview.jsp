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
			var searchKeyword    = $("#searchKeyword").val();
			var searchWord       = $("#searchWord").val();
			
			var url = "${contextPath}/shop/itemsale?";
				url	+= "onePageViewCount=" + onePageViewCount;
				url	+= "&searchKeyword=" + searchKeyword;
				url	+= "&searchWord=" + searchWord;
			
			location.href = url;
			
		}) ;
		
		
		$("#getSearchBoard").click(function(){
			
			var onePageViewCount = $("#onePageViewCount").val();
			var searchKeyword    = $("#searchKeyword").val();
			var searchWord       = $("#searchWord").val();
			
			var url = "${contextPath}/shop/itemsale?";
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
             <h1 class="mt-4" style="text-align:center;">구매후기</h1>
             <div class="container px-4 px-lg-5 my-5">
                 <div class="card-body">
                     <div class="table-responsive">
                     	<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                         	<div class="row">
                         		<div class="col-sm-12 col-md-6">
                       			</div>
                       		</div>
                          <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center;">
                              <colgroup>
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="60%">
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
									</c:otherwise>
					  			</c:choose>	
                              </tbody>										
                          </table>
                     </div>
                 </div>
             </div>
         </div>
     </div>
</body>
</html>