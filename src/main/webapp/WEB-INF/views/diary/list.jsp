<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOUTING-daily</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/diaryCss/list.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <div id="list-main">
        <div>
            <div id="list-img"></div>
            <div id="list-title"></div>
        </div>
    </div>


<!-- <a href="/diary/detail?diaryNo=${diary.diaryNo}">
<img src="/resources/images/diary/${diary.diaryFilename}" alt="error">         -->

    <jsp:include page="../common/footer.jsp"></jsp:include>

    <script>
        const listImg = $("#list-img");
        function diaryList(start) {
            $.ajax({

            })
        }
    </script>
</body>
</html>