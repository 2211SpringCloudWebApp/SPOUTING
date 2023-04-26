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
            	<th>
            	<th>-</th>
                <th>지점명</th>
                <th>사용시설</th>
                <th>사용인원</th>
                <th>사용일시</th>
                <th>예약자명</th>
                <th>이메일</th>
                <th>총금액</th>
                
                <th>실결제금액</th>
            </tr>
            
            <c:forEach items="${bList}" var="book" varStatus="i">
            <tr>
            	<td style="color: #cdcccc">${i.count } &nbsp;</td>
                <td>${book.bookNo}</td>
                <td id="branchName">${book.centerName.substring(5, 8)}</td>
                <td>${book.facilityName}</td>
                <td>${book.numPeople}</td>
                <td><fmt:formatDate value="${book.startTime}" pattern="MM/dd | HH시"/>
                	~<fmt:formatDate value="${book.endTime}" pattern="HH시"/></td>
                <td>${book.userName}</td>
                <td>${book.userEmail}</td>
                <td>${book.bookPrice}</td>
                <td>${book.paidPrice}</td>
            
                
                
                
                <c:if test="${user.userType != '1'}">
                    <td><input type="button" id="remo-btn" value="탈퇴" onclick="removeUser('${user.userId}')"></td>
                </c:if>
                <c:if test="${user.userType == '1'}">
                    <td style="color: rgb(255, 136, 0);">관리자</td>
                </c:if>
                <c:if test="${user.userType != '1'}">
                    <td><input type="button" id="remo-btn" value="조회" onclick="location.href='/admin/point?userNo=${user.userNo}'"></td>
                </c:if>
                <c:if test="${user.userType == '1'}">
                    <td style="color: rgb(255, 136, 0);">관리자</td>
                </c:if>      
                
            </tr>
            </c:forEach>
        </table>
        <table id="navi-box">
            <tr>
                <td>                  
                    <c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="p">
                        <c:url var="pageUrl" value="/admin/userSearch">
                            <c:param name="page" value="${p } "></c:param>
                            <c:param name="searchValue" value="${search.searchValue }"></c:param>
							<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
                        </c:url>
                        <a href="${pageUrl }" class="navi-btn3">${p }</a>&nbsp;
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <td >
                    <form action="/admin/userSearch" method="get">
                        <select name="searchCondition" id="search-select">
                            <option value="userId">ID</option>
                            <option value="userName">NAME</option>
                        </select>
                        <input type="text" id="search-box" name="searchValue" placeholder="검색어를 입력하세요.">
                        <input type="submit" id="search-btn" value="검색">
                    </form>
                </td>                       
            </tr>
        </table>
    </div>

    <script>
    	//기한 지난 예약건 색깔 바꾸기!
    	//노드~선택하기~귀차나~~~히잏잏잉
    
    
    	//복붙한부분()
        function removeUser(userId) {
            if(window.confirm("해당 회원을 탈퇴시키겠습니까?")) {
                alert("처리 완료")
                location.href = "/admin/delete?userId=" + userId;
            }
        }
    </script>
	</body>
</html>