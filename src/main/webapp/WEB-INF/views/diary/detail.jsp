<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 날짜변환용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOUTING-daily</title>
    <link rel="stylesheet" href="/resources/css/diaryCss/detailCss.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <div id="insert-main">
        <form action="/diary/detail" method="post" enctype="multipart/form-data">
            <input type="hidden" name="userNo" value="${diary.userNo}">
            <input type="hidden" name="diaryNo" value="${diary.diaryNo}">
            <div id="insert-title">
                <span><fmt:formatDate value="${diary.diaryDate}" pattern="📗yyyy년 MM월 dd일" /></span>
            </div>
            <table id="insert-detail">
                <tr>
                    <td id="img-box">
                        <div id="img-viewer">
                            <img src="/resources/images/diary/${diary.diaryFilename}" width="400">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="diaryTitle" name="diaryTitle" class="input-box" value="${diary.diaryTitle }">
                        <textarea name="diaryDetail" id="diaryDetail" class="input-box">${diary.diaryDetail }</textarea>
                        <button type="submit" id="diary-btn" onclick="return checkInput(event)">수정하기</button>
                        <button type="button" id="delete-btn" onclick="return deleteBtn(event)">삭제하기</button>
                    </td>
                </tr>
            </table> 
        </form>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <script>
        function checkInput() {
            const diaryTitle = $("#diaryTitle").val();
            const diaryDetail = $("#diaryDetail").val();
            if(diaryTitle === "") {
                alert("하루기록의 제목을 입력해주세요.")
                return false;
            } else if(diaryDetail === "") {
                alert("본문은 비울 수 없어요!")
                return false;
            }
            alert("수정 완료!")
        }

        function deleteBtn() {
            if(window.confirm("삭제하시겠습니까?")) {
                alert("삭제 완료!")
                var diaryNo = "${diary.diaryNo}";
                location.href = "/diary/delete?diaryNo=" + diaryNo;
            }
        }
    </script>
    
</body>
</html>