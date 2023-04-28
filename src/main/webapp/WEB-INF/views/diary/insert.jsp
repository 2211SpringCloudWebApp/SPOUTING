<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPOUTING-dailyWrite</title>
    <link rel="stylesheet" href="/resources/css/diaryCss/insert.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <div id="insert-title">
        <span>오늘의 SPOUTING 기록</span>
    </div>
    <div id="insert-main">
        <form action="/diary/insert" method="post" enctype="multipart/form-data">
            <input type="hidden" name="diaryNo" value="0">
            <input type="hidden" name="userNo" value="0">
           <table id="insert-detail">
                <tr>
                    <td id="img-box">
                        <div id="img-viewer">
                            <img id="img-view" width="400">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="upload-name" value="첨부파일" placeholder="첨부파일">
                        <label for="file">파일찾기</label> 
                        <input type="file" id="file" name="uploadFile" onchange="loadImg(this);">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" placeholder="하루기록 제목" id="diaryTitle" name="diaryTitle" class="input-box">
                        <textarea name="diaryDetail" id="diaryDetail" placeholder="짧은 나의 오늘을 남겨보세요🎖" class="input-box"></textarea>
                        <button type="submit" id="diary-btn" onclick="return checkInput(event)">기록하기</button>
                    </td>
                </tr>
            </table> 
        </form>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <script>
        function loadImg(obj) {
            if(obj.files.length != 0 && obj.files[0] != 0) {
                let reader = new FileReader();
                reader.readAsDataURL(obj.files[0]);
                reader.onload = function(e) {
                    $("#img-view").attr("src", e.target.result);
                } 
            }else {
                $("#img-view").attr("src", "");		
            }
        }

        $("#file").on('change', function() {
            var fileName = $("#file").val();
            $(".upload-name").val(fileName);
        })

        function checkInput() {
            const diaryTitle = $("#diaryTitle").val();
            const diaryDetail = $("#diaryDetail").val();
            if(diaryTitle === "") {
                alert("하루기록의 제목을 입력해주세요.")
                return false;
            } else if(diaryDetail === "") {
                alert("오늘 하루를 짧게 기록해봐요!")
                return false;
            }
            alert("수고하셨어요🤍 내일도 SPOUTING!")
        }
    </script>
    
</body>
</html>