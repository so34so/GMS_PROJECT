<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
        
        <script src="${contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        
<script>
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if (data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if (extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if (fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('roadAddress').value = fullRoadAddr;
	            document.getElementById('jibunAddress').value = data.jibunAddress;
	
	        }
	    }).open();
	}
</script>

<script>
    
	function reset_all() {
		$("#receiverName").val("");
		$("#zipcode").val("");
		$("#roadAddress").val("");
		$("#jibunAddress").val("");
		$("#namujiAddress").val("");
		
	}

	
	function restore_all() {
		
		$("#receiverName").val($("#h_receiver_name").val());
		$("#zipcode").val($("#h_zipcode").val());
		$("#roadAddress").val($("#h_roadAddress").val());
		$("#jibunAddress").val($("#h_jibunAddress").val());
		$("#namujiAddress").val($("#h_namujiAddress").val());
		
	}
	
	
	
	function fn_process_pay_order(){
		
		var deliveryAddress = "우편번호:" + $("#zipcode").val() + "<br>"+
							  "도로명 주소:" + $("#roadAddress").val() + "<br>" +
							  "[지번 주소:" + $("#jibunAddress").val() + "]<br>" + $("#namujiAddress").val();
		
	    var deliveryMessage = "";
	    if ($("#deliveryMessage").val() != "") {
	    	deliveryMessage = $("#deliveryMessage").val();
	    }
	    
		var datas = {
				
			"galleryId" 	  : $("#galleryId").val(),
			"galleryName" 	  : $("#galleryName").val(),
			"galleryEmail" 	  : $("#galleryEmail").val(),
			"artArtnum" 	  : $("#artArtnum").val(),
			"artTitle" 	 	  : $("#artTitle").val(),
			"artPrice" 		  : $("#artPrice").val(),
			"receiverName"    : $("#receiverName").val(),
		    "deliveryAddress" : deliveryAddress,
		    "deliveryMessage" : deliveryMessage,
		    "deliveryMethod"  : $("#deliveryMethod").val(),
		    "cardComName"     : $("#cardComName").val(),
		    "cardPayMonth"    : $("#cardPayMonth").val(),
		}
		
		$.ajax({
			type : "POST",
			url  : "${contextPath}/shop/payOrder",
			data : datas ,
			success : function(){
				alert("주문이 성공적으로 완료 되었습니다.");
				location.href = "${contextPath}/shop/Homepage";
			}
		});
		
		
	}
</script>


</head>
<body>
	<div class="container-fluid">
             <div class="container px-4 px-lg-5 my-5">
                 <h1>1.금액정보</h1>
		<form  name="form_order">	
			<input type="hidden" id="galleryId" value="${orderInfo.galleryId}">
			<input type="hidden" id="galleryName" value="${orderInfo.galleryName}">
			<input type="hidden" id="galleryEmail" value="${orderInfo.galleryEmail}">
			<input type="hidden" id="artArtnum" value="${artInfo.artArtnum}">
			<input type="hidden" id="artTitle" value="${artInfo.artTitle}">
			<input type="hidden" id="artPrice" value="${artInfo.artPrice}">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                              <colgroup>
								<col width="10%">
								<col width="10%">
								<col width="10%">
							  </colgroup>
				              <thead>                                     
                                  <tr>
                                      <th>작품 가격</th>
                                      <th>배송비</th>
                                      <th>총 금액</th>
                                  </tr>
                              </thead>
                              <tbody>
                              		<tr>
                              			<td>${artInfo.artPrice }원</td>
                              			<td>${artInfo.deliveryPrice }원</td>
                              			<td>
                              				${artInfo.artPrice + artInfo.deliveryPrice }원
                              				<input type="hidden" id="totalOrderPrice" value="${artInfo.artPrice + artInfo.deliveryPrice}">
                              			</td>
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
							<td><input type="text" value="${orderInfo.galleryName}" readonly/></td>
						 </tr>
						 <tr class="dot_line">
							<td class="fixed_join">이메일</td>
							<td><input type="text" value="${orderInfo.galleryEmail}" readonly/></td>
						 </tr>
					
						<tr class="dot_line">
							<td class="fixed_join">배송방법</td>
							<td>
							    <input type="radio" id="deliveryMethod" name="deliveryMethod" value="일반택배" checked> 일반택배 &emsp; 
								<input type="radio" id="deliveryMethod" name="deliveryMethod" value="번개택배"> 편의점택배 &emsp;
								<input type="radio" id="deliveryMethod" name="deliveryMethod" value="해외배송"> 해외배송 &emsp;
						    </td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">배송지 선택</td>
							<td>
								<input type="radio" name="deliveryPlace"  value="기본배송지" onClick="restore_all()" checked> 기본배송지&emsp;
								<input type="radio" name="deliveryPlace"  value="새로입력"   onClick="reset_all()"> 새로입력 &emsp;
						    </td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">받으실 분</td>
							<td>
							   <input id="receiverName" name="receiverName" type="text" size="40" value="${orderInfo.galleryName }" />
							   <input type="hidden" id="h_orderer_name" name="h_orderer_name"  value="${orderInfo.galleryName }" /> 
							   <input type="hidden" id="h_receiver_name" name="h_receiver_name"  value="${orderInfo.galleryName }" />
							</td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">주소</td>
							<td><input type="text" id="zipcode" name="zipcode" size="5" value="${orderInfo.zipcode }"> 
								<a href="javascript:execDaumPostcode()">우편번호검색</a> <br>
								<p>
									지번 주소:<br>
									<input type="text" id="roadAddress" name="roadAddress" size="50" value="${orderInfo.roadAddress }" /><br>
									<br> 
									도로명 주소: 
									<input type="text" id="jibunAddress" name="jibunAddress" size="50" value="${orderInfo.jibunAddress }" /><br>
									<br> 
									나머지 주소: 
									<input type="text" id="namujiAddress"  name="namujiAddress" size="50" value="${orderInfo.namujiAddress }" /> 
								</p> 
								 <input type="hidden" id="h_zipcode" name="h_zipcode" value="${orderInfo.zipcode }" /> 
								 <input type="hidden"  id="h_roadAddress" name="h_roadAddress"  value="${orderInfo.roadAddress }" /> 
								 <input type="hidden"  id="h_jibunAddress" name="h_jibunAddress" value="${orderInfo.jibunAddress }" /> 
								 <input type="hidden"  id="h_namujiAddress" name="h_namujiAddress" value="${orderInfo.namujiAddress }" />
							</td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">배송 메시지</td>
							<td>
							   <input id="deliveryMessage" name="deliveryMessage" type="text" size="50" placeholder="택배 기사님께 전달할 메시지를 남겨주세요." />
						     </td>
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
						<tr class="dot_line" >
							    카드 선택 : &nbsp;
								  <select id="cardComName" name="cardComName">
										<option value="삼성" selected>삼성</option>
										<option value="하나SK">하나SK</option>
										<option value="현대">현대</option>
										<option value="KB">KB</option>
										<option value="신한">신한</option>
										<option value="롯데">롯데</option>
										<option value="BC">BC</option>
										<option value="시티">시티</option>
										<option value="NH농협">NH농협</option>
								  </select>
								&emsp;
								할부 기간 : &nbsp;
								<select id="cardPayMonth" name="cardPayMonth">
										<option value="일시불" selected>일시불</option>
										<option value="2개월">2개월</option>
										<option value="3개월">3개월</option>
										<option value="4개월">4개월</option>
										<option value="5개월">5개월</option>
										<option value="6개월">6개월</option>
								</select>
							   <br>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		   <div class="clear"></div>
			</form>
			<div align="center">
				<br>
				<a href="javascript:fn_process_pay_order();">  
					<input type="button" style="background-color:black; color:white; width:200px;"value="결제하기">
				</a> 
			</div>
         </div>
     </div>
</body>
</html>
			
			
			