<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="${contextPath }/resources/css/styles1.css?a" rel="stylesheet" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
        
        <script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        

</head>
<body>
	<div class="container-fluid">
	 <h1 class="mt-4">주문 내역</h1>
	<div class="card mb-4">
                 <div class="card-body">
             <div class="container px-4 px-lg-5 my-5">
                 <h1>1.주문 상세정보</h1>
                 <div class="table-responsive">
                     	<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
		<form  name="form_order">	
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center;">
                          <colgroup>
							<col width="15%">
							<col width="10%">
							<col width="20%">
							<col width="15%">
							<col width="15%">
						  </colgroup>
					            <thead>                                     
	                              <tr>
	                                  <th>주문번호</th>
	                                  <th colspan=2>주문상품명</th>
	                                  <th>작품가격</th>
	                                  <th>배송비</th>
	                                  <th>총 금액</th>
	                              </tr>
	                          </thead>
	                          <tbody>
	                          		<tr>
									    <td>${orderMap.orderId }</td>
										<td>
										  <a href="${contextPath}/shop/itemsale?artTitle=${orderMap.artTitle }">
										  	<img width="75" alt="상품 이미지" src="${contextPath}/thumbnails?artImage=${orderMap.artImage}">
										  </a>
										</td>
										<td><h2><a href="${contextPath}/shop/itemsale?artTitle=${orderMap.artTitle }">${orderMap.artTitle}</a></h2></td>
										<td><h2>${orderMap.artPrice}원</h2></td>
										<td><h2>${orderMap.deliveryPrice }원</h2></td>
										<td><h2>${orderMap.artPrice + orderMap.deliveryPrice}원</h2></td>
									</tr>
	                          </tbody>
            </table>
			<div class="clear"></div>
			<br>
			<br>
			<h1>2.배송 정보</h1>
			<div>
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tbody>
						<tr>
							<td>이름</td>
							<td>${orderMap.galleryName}</td>
						 </tr>
						 <tr class="dot_line">
							<td class="fixed_join">이메일</td>
							<td>${orderMap.galleryEmail}</td>
						 </tr>
					
						<tr class="dot_line">
							<td class="fixed_join">배송방법</td>
							<td>${orderMap.deliveryMethod}</td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">받으실 분</td>
							<td>${orderMap.receiverName}</td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">주소</td>
							<td>${orderMap.deliveryAddress}</td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">배송 메시지</td>
							<td>${orderMap.deliveryMessage}</td>
						</tr>
					</tboby>
				</table>
			</div>
			<div class="clear"></div>
			<br>
			<br>
		
			<h1>3.결제정보</h1>
			<div class="detail_table">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tbody>
						<tr class="dot_line">
							<td class="fixed_join">결제카드</td>
							<td>${orderMap.cardComName}</td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">할부기간</td>
							<td> ${orderMap.cardPayMonth }</td>
						</tr>
					</tbody>
				</table>
			</div>
		   <div class="clear"></div>
			</form>
			<div align="center">
				<br>
					<c:choose>
						<c:when test="${Review == true }">
							<input type="button" style="background-color:black; color:white; width:200px;"value="리뷰보기" onclick="location.href='${contextPath}/user/reviewDetail?artTitle=${orderMap.artTitle}&galleryId=${orderMap.galleryId }'">
						</c:when>
						<c:otherwise>
							<input type="button" style="background-color:black; color:white; width:200px;"value="작품리뷰쓰기" onclick="location.href='${contextPath}/user/reviewwrite?artTitle=${orderMap.artTitle}'">
						</c:otherwise>
					</c:choose>
			</div>
         </div>
     </div>
     </div>
     </div>
     </div>
     </div>
</body>
</html>
			
			
			