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
                     <div class="container-fluid"">
                     <h1 class="mt-4" style="text-align:center;">FAQ</h1>
        <ul class="qna">
            <li>
                <input type="checkbox" id="qna-1">
                <label for="qna-1">다른 사람 명의의 계좌로 환불받을 수 있나요?</label>
                <div>
                    <p>다른 사람 명의로는 환불할 수 없습니다. 고객님 본인 명의 계좌로만 환불이 가능합니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-2">
                <label for="qna-2">등록한 환불계좌를 등록/변경하고 싶어요.</label>
                <div>
                    <p>마이페이지에서 환불계좌 등록 및 수정이 가능합니다. 환불계좌는 주문자 명의의 본인 계좌만 등록할 수 있습니다.</p>
                    <p>주문 진행 상태가 '환불진행중' 또는 '환불완료' 에서는 환불계좌를 변경할 수 없습니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-3">
                <label for="qna-3">반품 신청을 철회하고 싶어요.</label>
                <div>
                    <p>반품할 상품을 아직 보내지 않은 경우, 마이페이지에서 반품철회를 하실 수 있습니다.</p>
                    <p>반품철회 후 택배사에서 상품 수거가 된 것으로 확인될 경우 해당 주문은 반품처리한 것으로 재 변경됩니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-4">
                <label for="qna-4">배송된 상품이 부재중으로 반송된 경우 어떻게 하나요?</label>
                <div>
                    <p>부재 등의 사유로 반송된 상품은 "마이페이지 > 주문 조회"]"에서 택배사 영업소, 또는 배송 담당 택배원 연락처를 통해 재배송 요청을 할 수 있습니다. 상품이 이미 반송되어 해당 업체로 입고된 경우, 왕복 배송비를 추가 부담하셔야 합니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-5">
                <label for="qna-5">상품에 대해서 문의하려면 어떻게 해야 하나요?</label>
                <div>
                    <p>상품에 관한 내용은 상품상세 화면에 자세히 안내되어 있습니다. 마이페이지 > 주문내역에서 주문한 상품을 선택하면 상세페이지로 이동합니다.</p>
                    <p>상품 상세 내용에 표시되어 있지 않은 내용은 판매자에게 문의해 주십시오.</p>
                    <p>> 판매자에게 문의</p>
                    <p>1. "마이페이지 > 주문내역에서 상품 선택 > 배송/교환/반품 안내"에 표기된 판매자 연락처로 문의</p>
                    <p>2. "["마이페이지 > 1:1문의하기 > 문읜타입에서 판매자에게 문의하기"를 선택한 후 질의 내용 작성</p>
                </div>
            </li>
        </ul>
    </div>
                 </div>
             </div>
         </div>
         
     </div>
     
</body>
</html>