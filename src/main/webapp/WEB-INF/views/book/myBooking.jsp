<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- ajax CDN -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <!-- jquery CDN -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<title>결 제 내 역 조 회</title>
		 <style>
		 @font-face {
		    font-family: 'Chosunilbo_myungjo';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
        .bookingEachDiv{
            width: 100%;
            height: 280px;
            --border: 1px solid black;
            display: flex;
            justify-content: center;
            align-items: center;

        }
        .branchPhotoDiv{ 
            width: 250px;
            height: 250px;
            --border: 1px solid blue;
            margin-right: 20px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .branchPhotoDiv >img{
            width: 90%;
            height: 90%;
        }
        .bookingInfoDiv{
            width: 250px;
            height: 250px;
            --border: 1px solid green;
            margin-left: 20px;
            padding: 10px;
            box-sizing: border-box; /*이거 줘야 패딩값에 따라 width,height 안움직임*/
        }
        .dateDiv{
         	font-family: 'Chosunilbo_myungjo';
            font-size: 3em;
            font-weight: 800;
            color: #1C3879;
            border-bottom: 1px solid #607EAA;
            padding-bottom: 5px;
            margin-bottom: 20px;
        }
        p{
        padding-top: 20px;
        line-height: 150%;
        padding-bottom: 10px;
        }
        form{
        	border-top: 1px solid #607EAA;
        	padding-top: 10px;
        	
        }
        .cancelDiv{
        	
        }
        .cancelLink{
        	font-size: smaller;
        	color: #607EAA;
        	        	
        	margin-left: 180px;
        	 
        }
        #pastBookingDiv{
        	border-top: 1px dotted #607EAA;
        	--margin-top: 30px;
        	padding-top: 30px;
        	opacity: 70%;
        }
       
        #btnDiv{
        	text-align: center;
        	opacity: 100%;
        }
        #pastBookingBtn{
		    margin-top: 30px;
		    margin-bottom: 30px;
		    
		    position: relative;
		    border: 0;
		    border-radius: 5px;
		    padding: 15px 25px;
		    display: inline-block;
		    text-align: center;
		    color: white;
		    background-color: #1C3879;
   		 }
   		 .expiredDiv{
   			border-top: 1px solid #607EAA;
        	padding-top: 10px;
   		 	color: red;
   		 	
   		 }
    /* 모달 창 스타일 */
     .modal {
    position: fixed;
    top: 50%;
    left: 30%;
    right: 30%;
    bottom: 0;
    --background-color: rgba(0, 0, 0, 0.5); /* 배경 투명도 조절 가능 */
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .modal-content {
    background-color: white;
    border: 1px solid #1C3879;
    --padding: 20px;
    border-radius: 5px;
    text-align: center;
    margin: auto;
  }
  .modal-content p {
    --margin: 0;
    --padding: 0;
    padding-top: 30px;
  }
  .modal-content button {
    margin-top: 10px;
   
	margin-bottom: 30px;
	
	position: relative;
	border: 0;
	border-radius: 5px;
	padding: 15px 25px;
	display: inline-block;
	text-align: center;
	margin-left: 10px;
	margin-right: 10px;
	color: white;
	background-color: #1C3879;
  }

/*왼쪽내비*/
#left-nav {
    width: 200px;
    list-style: none;
    border: 1px solid rgb(242, 242, 242);
    float: left;
    position: fixed;
}
    #left-nav li {
        height: 50px;
        text-align: center;
        border-top: 1px solid rgb(242, 242, 242);
    }
    #left-nav a {
        padding: 14px 15px 14px 15px;
        display: block;
        text-decoration: none;
        color: rgb(102, 102, 102);
        font-size: 15px;
    }
        #left-nav li:hover {
            cursor: pointer;
            font-weight: 700;
            background-color: rgb(242, 242, 242);
        }
        #left-nav a:hover {
            color: #1c4197;
        }
        .selected { 
            font-weight: 700;
            background-color: rgb(242, 242, 242);
            color: #1c4197;
        }

img{
 	object-fit: cover;
}

    </style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		<main>
		  <ul id="left-nav">
	        <li class="selected"><a href="/book/myBooking?userNo=${sessionScope.loginUser.userNo}">예약내역</a></li>
	        <li><a href="/order/list">주문내역</a></li>
	        <li><a href="/meeting/myMeetingList">나의 커뮤니티</a></li>
	        <li><a href="/inquiry/myInquiry">나의 문의</a></li>
	        <li><a href="/point/detail">포인트 관리</a></li>
	        <li><a href="/mypage/myinfo">개인정보 수정</a></li>
		</ul>
		
		
		
	        <input type="hidden" id="hiddenUserNo" value="${loginUser.userNo }" name="userNo">
			<c:forEach items="${bList }" var="book">
				<div class="bookingEachDiv">
		            <div class="branchPhotoDiv">
						 <img src="/${book.centerFilepath1.substring(book.centerFilepath1.indexOf('resources'))}" alt="branchPhoto">
		            </div>
		            <div class="bookingInfoDiv">
		                <span class="dateDiv"><fmt:formatDate pattern="MM/dd" value="${book.useDate}"/></span>
		                <p>${book.centerName} <br>
		                ${book.facilityName}<br>
		                <fmt:formatDate pattern="hh시" value="${book.startTime}"/>~
		                <fmt:formatDate pattern="hh시" value="${book.endTime}"/><br>
		                ${book.numPeople}인 이용 예정<br></p><br>
		                
		                <span class="cancelDiv">
		               		<form id="cancelForm" action="/book/cancelBooking" method="post">
		               			<input type="hidden" name="userNo" value="${book.userNo }">
							    <input type="hidden" name="bookNo" value="${book.bookNo}">
							    <input type="hidden" name="paidPrice" value="${book.paidPrice}">
							    <input type="hidden" name="bookPrice" value="${book.bookPrice}">
							    <a class="cancelLink" href="javascript:void(0);" onclick="cancelBooking();">예약취소</a>
							

							</form>
		                </span>
		            </div>
		        </div>
	        </c:forEach>
        	<div id="btnDiv">
        		<button id="pastBookingBtn">지난이용내역보기</button> 
        	</div>
	        <div id="pastBookingDiv"> 
				<!-- Ajax로 데이터 꽂기 -->
	        </div>
		</main>
		
		<script>
			let pastBookingVisible = false; //일단 데이터 안보임			
			
			//버튼 클릭시 지난 예약정보 불러오기 Ajax
			document.querySelector("#pastBookingBtn").addEventListener("click", function(){
				let userNo = document.querySelector("#hiddenUserNo").value;
				$.ajax({
					url: "/book/myPastBooking",
					data: {"userNo": userNo},
					type: "get",
					success: function(pList){
						var bookingHtml="";
						for( var i=0; i<pList.length; i++){
							var pbook = pList[i];
							var filepath1 = pbook.centerFilepath1.substring(pbook.centerFilepath1.indexOf('resources'));
							bookingHtml += 
								'<div class="bookingEachDiv">'+
								'<div class="branchPhotoDiv">' +
								'<img src="/' + filepath1 + '" alt="branchPhoto">' +
								'</div>' +
								'<div class="bookingInfoDiv">' +
								'<span class="dateDiv">' + new Intl.DateTimeFormat('ko-KR', {month: '2-digit', day: '2-digit'}).format(new Date(pbook.useDate)).replace('.','/').replace(' ','').replace('.','') + '</span>' +
		                        '<p>' + pbook.centerName + '<br>' +
		                        pbook.facilityName + '<br>' +
		                        new Intl.DateTimeFormat('ko-KR', {hour: '2-digit'}).format(new Date(pbook.startTime)) + '~' +
		                        new Intl.DateTimeFormat('ko-KR', {hour: '2-digit'}).format(new Date(pbook.endTime)) + '<br>' +
		                        pbook.numPeople + '인<br></p><br>' +
		                        '<span class="expiredDiv">이용만료</span>' +
		                        '</div>' +
		                        '</div>';
		                }
		                
		                // 예약 정보를 화면에 업데이트
		                document.querySelector("#pastBookingDiv").innerHTML = bookingHtml;
		             	// 버튼의 상태에 따라 데이터를 보여주거나 숨김
						if (pastBookingVisible) {
							document.querySelector("#pastBookingBtn").innerHTML="지난이용내역보기";
							document.querySelector("#pastBookingDiv").style.display = "none";
							pastBookingVisible = false;
						} else {
							document.querySelector("#pastBookingBtn").innerHTML="지난이용내역닫기";
							document.querySelector("#pastBookingDiv").style.display = "block";
							pastBookingVisible = true;
						}
						
					},
		            
					error: function(){
						console.log("ajax 처리시리패패패래필failfial");
					}
				});
			})
			
			//게시글 삭제하기 버튼 눌렀을때 확인 거치기
        	function cancelBooking() {
			    showModal("정말 취소하시겠어요?", function(result) {
			        if (result) {
			            document.getElementById('cancelForm').submit();
			        }
			    });
			}
			
			function showModal(msg, callback) {
			    // 모달 창 요소 생성
			    var modal = document.createElement("div");
			    modal.className = "modal";
			    modal.innerHTML =
			        '<div class="modal-content">' +
			        '<p>' + msg + '</p>' +
			        '<button onclick="modalResult(true, ' + callback + ')">확인</button>' +
			        '<button onclick="modalResult(false, ' + callback + ')">취소</button>' +
			        '</div>';
			    document.body.appendChild(modal);
			
			    // 모달 창 표시 로직 추가
			    modal.style.display = "block";
			}
			
			function modalResult(result, callback) {
			    callback(result);
			    closeModal();
			}
			
			function closeModal() {
			    var modal = document.querySelector(".modal");
			    modal.parentNode.removeChild(modal);
			}
			
			
			
			
		</script>
		
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>