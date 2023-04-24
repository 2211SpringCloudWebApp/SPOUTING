<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 날짜변환용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOUTING-point</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/adminCss/point.css">
</head>
<body>
    <jsp:include page="./adminHeader.jsp"></jsp:include>
    <div id="main-box">
        <div id="list-main">
            <div id="list-title">
                ${userName} 회원의 현재 잔액 <em>>> ${userPoint}P</em>
                <div style="text-align: center;">
                    <button class="point-btn" onclick="location.href='/admin/user'"> ←목록으로 </button>
                    <button class="point-btn" id="open-mod">포인트 조정하기</button>
                </div>  
            </div>
            <div id="list-wrapper">
                    <table id="point-list">
                        <c:forEach items="${pList}" var="point" varStatus="i">
                            <tr class="table-line">
                                <td style="width: 25%;">
                                    <fmt:formatDate value="${point.pointDate}" pattern="yyyy.MM.dd." />
                                </td>
                                <td style="width: 20%;">
                                    <c:if test="${point.pointChange > 0}">
                                        <img src="/resources/images/point/plus.png" alt="error">
                                    </c:if>
                                    <c:if test="${point.pointChange < 0}">
                                        <img src="/resources/images/point/minus.png" alt="error">
                                    </c:if>
                                </td>
                                <td style="width: 25%;">${point.pointChange}</td>
                                <td style="width: 30%;">${point.pointDetail}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
        
                <!-- 페이징 -->
                <table id="navi-box">
                    <tr>
                        <td>
                            <c:if test="${pi.currentPage ne 1}">
                                <a href="/admin/point?userNo=${userNo}&page=1" id="navi-btn1"> ≪ </a>
                            </c:if>
                            <c:if test="${pi.currentPage ne 1}">
                                <a href="/admin/point?userNo=${userNo}&page=${pi.currentPage-1}" id="navi-btn2"> ＜ </a>
                            </c:if>
                            
                            <c:forEach begin="${pi.startNavi}" end="${pi.endNavi}" var="p">
                                <c:url var="pageUrl" value="/admin/point">
                                    <c:param name="userNo" value="${userNo}"></c:param>
                                    <c:param name="page" value="${p }"></c:param>
                                </c:url>
                                <a href="${pageUrl }" class="navi-btn3">${p }</a>&nbsp;
                            </c:forEach>
        
                            <c:if test="${pi.currentPage + 1 <= pi.maxPage}">
                                <a href="/admin/point?userNo=${userNo}&page=${pi.currentPage+1}" id="navi-btn4"> ＞ </a>
                            </c:if> 
                            <c:if test="${pi.currentPage + 1 <= pi.maxPage}">
                                <a href="/admin/point?userNo=${userNo}&page=${pi.maxPage}" id="navi-btn5"> ≫ </a>
                            </c:if>
                        </td>
                    </tr>
                </table>         
        </div>
        
        <!-- 포인트 조정 모달창 -->
        <div id="modal">
            <div id="modal-content">
            <form action="/admin/managePoint" method="post">             
                <input type="hidden" value="${userNo}" name="userNo">
                <input type="text" placeholder="조정금액" name="pointChange">
                <input type="submit" value="확인" class="modal-btn"><br>
                적립은 (+) 삭감은 (-) 값으로 입력
            </form>
            <button type="button" id="close-mod" style="margin-top: 30px;" class="modal-btn">창 닫기</button>
            </div>
            <div id="modal-layer"></div>
        </div>
        
    </div>

    <script>
        //이용약관 모달창
        $("#open-mod").click(function() {
                $("#modal").fadeIn();
        })
        $("#close-mod").click(function() {
            $("#modal").attr('style','display:none;')
        })

    </script>

</body>
</html>