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
        <title>P Gallery Shop</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath }/resources/img/shopping-cart.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/css/styles2.css" rel="stylesheet" />
        <script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
    </head>
    
<script>
    $().ready(function(){
		
		$("#onePageViewCount").change(function(){
			
			var onePageViewCount = $("#onePageViewCount").val();
			var searchKeyword    = $("#searchKeyword").val();
			var searchWord       = $("#searchWord").val();
			
			var url = "${contextPath}/shop/Homepage?";
				url	+= "onePageViewCount=" + onePageViewCount;
				url	+= "&searchKeyword=" + searchKeyword;
				url	+= "&searchWord=" + searchWord;
			
			location.href = url;
			
		}) ;
		
		
		$("#getSearchBoard").click(function(){
			
			var onePageViewCount = $("#onePageViewCount").val();
			var searchKeyword    = $("#searchKeyword").val();
			var searchWord       = $("#searchWord").val();
			
			var url = "${contextPath}/shop/Homepage?";
				url += "onePageViewCount=" + onePageViewCount;
				url += "&searchKeyword=" + searchKeyword;
				url += "&searchWord=" + searchWord;
			
				location.href=url;
				
		});
			
		
	});
</script>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${contextPath }/shop/Homepage">P Gallery Shop</a>
                
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="${contextPath }/member/index">Home</a></li>
                    </ul>
                        </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">P Gallery Shop</h1>
                </div>
            </div>
        </header>
        <div class="container-fluid">
             <br>
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
                          					<option <c:if test="${onePageViewCount eq 12}"> selected</c:if> value="12">12</option>
											<option <c:if test="${onePageViewCount eq 16}"> selected</c:if> value="16">16</option>
											<option <c:if test="${onePageViewCount eq 24}"> selected</c:if> value="24">24</option>
                          				</select> 
                          				</label>
                          			</div>		                               
                       			</div>
                       		</div>
                          <!-- Section-->
						        <section class="py-5">
						            <div class="container px-4 px-lg-5 mt-5">
						                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
						               		<c:forEach var="artList" items="${artList }" varStatus="status">
							                    <div class="col mb-5">
							                        <div class="card h-100">
							                            <!-- Product image-->
							                            <img class="card-img-top" src="${contextPath}/thumbnails?artImage=${artList.artImage}" alt="..." />
							                            <!-- Product details-->
							                            <div class="card-body p-4">
							                                <div class="text-center">
							                                    <!-- Product name-->
							                                    <h5 class="fw-bolder">${artList.artTitle }</h5>
							                                    <!-- Product reviews-->
							                                    <div class="d-flex justify-content-center small text-warning mb-2">
							                                    </div>
							                                    <!-- Product price-->
							                                    <span> ${artList.artPrice }원</span>
							                                </div>
							                            </div>
							                            <!-- Product actions-->
							                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${contextPath }/shop/itemsale?artTitle=${artList.artTitle}">사러가기</a></div>
							                            </div>
							                        </div>
							                    </div>
						                    </c:forEach>
						            </div>
						        </section>
						        <select id="searchKeyword" class="form-control" style="width: 150px; display: inline;">
											<option <c:if test="${searchKeyword eq 'total'}"> selected</c:if> value="total">전체검색</option>
											<option <c:if test="${searchKeyword eq 'artist'}"> selected</c:if> value="artist">작가검색</option>
											<option <c:if test="${searchKeyword eq 'artTitle'}"> selected</c:if> value="artTitle">작품검색</option>
											<option <c:if test="${searchKeyword eq 'showName'}"> selected</c:if> value="showName">전시회검색</option>
								</select>
		                             		<input type="text" style="width: 300px; display: inline;" class="form-control" id="searchWord" name="searchWord" value="${searchWord}" >
								<input type="button" class="btn btn-outline-info btn-sm" value="Search" id="getSearchBoard">
                         	<div style="display: table; margin-left: auto; margin-right: auto">
                          	<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                          		<c:if test="${totalBoardCount gt 0 }">
                           		<ul class="pagination">
                           			<c:if test="${startPage gt 10 }">
                             			<li class="paginate_button page-item previous" id="dataTable_previous">
                             				<a href="${contextPath }/shop/Homepage?currentPageNumber=${startPage - 10}&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                             			</li>
                           			</c:if>
                           			<c:forEach var="i" begin="${startPage}" end="${endPage }" >
                             			<li class="paginate_button page-item">
                             				<a href="${contextPath }/shop/Homepage?currentPageNumber=${i}&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">${i}</a>
                             			</li>
                             		</c:forEach>
                           			<c:if test="${endPage le totalBoardCount && endPage ge 10}"> 
                             			<li class="paginate_button page-item next" id="dataTable_next">
                             				<a href="${contextPath }/shop/Homepage?currentPageNumber=${startPage + 10}&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
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
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${contextPath }/resources/js/scripts.js"></script>
    </body>
</html>
