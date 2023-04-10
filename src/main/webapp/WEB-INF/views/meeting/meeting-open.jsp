<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>소셜링 오픈 페이지 ㅋ</title>
    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
            }

        body {
            background-color: rgb(237, 237, 237);
            font-family: 'Pretendard-Regular';       
        }

        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>소셜링 오픈하기</h1>

    <form action="/meetingOpen" method="post">
        제목 : <input type="text" name="meetingName"> 
        <br>
        내용 : <input type="text" name="meetingDetail">
        <br>
        인원 : <input type="number" value="2" name="meetingPeople">
        <br>
        날짜 : <input type="datetime-local" name="meetingDate">
        <br>
        작성자 : <input type="number" value="3" name="readerNo">
        <br><br>

        <input type="submit" value="등록">
        <input type="button" value="닫기" onclick="self.close()">
    </form>

</body>
</html>