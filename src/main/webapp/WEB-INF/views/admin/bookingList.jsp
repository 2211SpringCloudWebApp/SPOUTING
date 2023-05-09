<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>시 설 예 약 현 황</title>
		<style>
			@font-face {
			    font-family: 'Pretendard-Regular';
			    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
			    font-weight: 400;
			    font-style: normal;
			}
			* {
			    font-family: 'Pretendard-Regular'; 
			}
			#main-box {
			    margin: 0 auto;
			    padding: 0;
			}
			
			#user-title {
			    margin: 50px auto;
			    width: 400px;
			    height: 30px;
			    text-align: center;
			    font-size: 25px;
			    border-bottom: 2px solid #ccc;
			}
			#user-list {
			    width: 900px;
			    margin: 0 auto;
			    text-align: center;
			    line-height: 3.3;
			    border-collapse: collapse
			}
			    #user-list tr {
			        border-bottom: 1px solid #ccc;
			    }
			    #user-list tr:first-child {
			        border-bottom: 2px double #2d4680;
			    }
			    #no-one {
			        width: 500px;
			        margin: 30px auto;
			        text-align: center;
			        font-size: 18px;
			        line-height: 3;
			    }
			        #no-one a {
			            color: #2d4680;
			            background-color: rgb(216, 216, 216);
			        }
			#remo-btn {
			    border: 2px solid #2d4680;
			    padding: 5px;
			    border-radius: 50%;
			    background-color: white;
			}
			    #remo-btn:hover {
			        background-color: #2d4680;
			        color: white;
			        padding: 7px;
			        cursor: pointer;
			    }
			    a{
			    	color: #1C3879;
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
			
			
			
			/*페이징///////////////////////////////////////*/
			#navi-box {
			    width: 800px;
			    height: 150px;
			    margin: 0 auto;
			    margin-bottom: 50px;
			    text-align: center;
			    padding-top: 30px;
			}
			    #navi-box a{
			        text-decoration: none;
			        color: rgb(81, 79, 79);
			    }
			        #navi-box a:link{
			            color: rgb(81, 79, 79);
			        }
			        #navi-box a:visited{
			            color: rgb(81, 79, 79);
			        }
			    #navi-btn1{
			        border: 1px solid #cdcccc;
			        padding: 8px;
			    }
			    #navi-btn2{
			        border: 1px solid #cdcccc;
			        padding: 8px;
			        margin-right: 20px;
			    }
			    .navi-btn3{
			        border: 1px solid #cdcccc;
			        padding: 8px;
			        padding-left: 15px;
			        padding-right: 15px;
			    }
			    .navi-btn3:hover {
			        background-color: #cdcccc;
			    }
			    #navi-btn4{
			        border: 1px solid #cdcccc;
			        padding: 8px;
			        margin-left: 20px;
			    }  
			    #navi-btn5{
			        border: 1px solid #cdcccc;
			        padding: 8px;
			    }
			
			 /*검색///////////////////////////////////////*/   
			#search-box {
			    border: 1px solid #cdcccc;
			    height: 38px;
			    width: 200px;
			}
			#search-btn {
			    color: rgb(83, 83, 83);
			    border:1px solid #cdcccc;
			    border-radius: 5px;
			    background-color: white;
			    height: 40px;
			    width: 80px;
			}
			#search-select {
			    color: rgb(83, 83, 83);
			    border:1px solid #cdcccc;
			    height: 40px;
			}
			#search-btn:hover {
			    background-color: #2d4680;
			    color: white;
			}
			#search-select:focus, #search-box:focus {
			    background-color: #62bcd32a;
			}

			
		</style>
	</head>
	<body>
		<jsp:include page="./adminHeader.jsp"></jsp:include>
    <div id="main-box">
        <div id="user-title">
            회 원 예 약 현 황
        </div>
        <table id="user-list">
            <tr>
            	<th>-</th>
            	<th>예약No.</th>
                <th>지점명</th>
                <th>사용시설</th>
                <th>사용인원</th>
                <th>사용일시</th>
                <th>예약자명</th>
                <th>이메일</th>
                <th>총금액</th>
                <th>실결제금액</th>
                <th>취소요청</th>
            </tr>
            
            <c:forEach items="${bList}" var="book" varStatus="i">
            <tr>
	            <input onload="expiredColor(this)" type="hidden" class="startTimeJs" value="${book.startTime}">
            	<td style="color: #cdcccc">${i.count } &nbsp;</td>
                <td>${book.bookNo}</td>
                <td id="branchName">${book.centerName}</td>
                <td>${book.facilityName}</td>
                <td>${book.numPeople}</td>
                <td><fmt:formatDate value="${book.startTime}" pattern="MM/dd | HH시"/>
                	~<fmt:formatDate value="${book.endTime}" pattern="HH시"/></td>
                <td>${book.userName}</td>
                <td>${book.userEmail}</td>
                <td>${book.bookPrice}</td>
                <td>${book.paidPrice}</td>
            
            	<c:if test="${book.inquiryStatus == '1'}">
            		<span class="cancelDiv">
	            		<form id="cancelForm" action="/book/cancelBooking" method="post">
	               			<input type="hidden" name="userNo" value="${book.userNo }">
						    <input type="hidden" name="bookNo" value="${book.bookNo}">
						    <input type="hidden" name="paidPrice" value="${book.paidPrice}">
						    <input type="hidden" name="bookPrice" value="${book.bookPrice}">
	                		<td> <a class="cancelLink" href="javascript:void(0);" onclick="cancelBooking();">요청🙏</a></td>
	                	</form>	
                	</span>
                </c:if>
                <c:if test="${book.inquiryStatus == '0'}">
                	<td></td>
                </c:if>
                
             
            </tr>
            </c:forEach>
        </table>
        <table id="navi-box">
            <tr>
                 <td>    
                 	<input id="page" type="hidden" value="${pi.currentPage }">
					<c:if test="${pi.currentPage ne 1 }">
						<a href="/admin/bookingList?page=${pi.currentPage -1}">이전</a>&nbsp;
					</c:if> 
					<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
						<a href="/admin/bookingList?page=${p}" >${p}</a>&nbsp;
					</c:forEach> 
					<c:if test="${pi.currentPage ne pi.maxPage }">
						<a href="/admin/bookingList?page=${pi.currentPage + 1}">다음</a>&nbsp;
					</c:if>
                </td>
            </tr>
        
        </table>
      
    </div>

    <script>
    
    //브라우저 로드됐을때 tr 내부 input태그(value=타임스탬프 타입) 반복 선택
    window.onload = function() {
        var startTimeInputs = document.querySelectorAll(".startTimeJs");
        startTimeInputs.forEach(function(startTimeInput) {
            expiredColor(startTimeInput);
        });
    };
	//선택한 인풋 태그들 함수 처리
    function expiredColor(startTimeInput) {
        var startTimeDate = startTimeInput.value;
        var startTime = new Date(startTimeDate); // 예약 시작 시간
        var currentTime = new Date(); // 현재 시간

        // 예약 시작 시간이 현재 시간보다 과거인 경우
        if (startTime < currentTime) {
            
            var trElement = startTimeInput.parentNode; // 해당 tr 요소 가져오기
          
            trElement.style.backgroundColor = "#cdcccc"; // 백그라운드 컬러 변경
            trElement.style.borderBottom = "1px solid white";
        }
    }
    
//////////////////////////////////////////////////////////myBooking이랑 코드 겹침
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
		
///////////////////////////////////////////////////////////////		
    	
    </script>
	</body>
</html>