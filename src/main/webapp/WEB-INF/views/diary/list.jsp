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
    <div id="main">
        <div id="list-title">
            <span>${sessionScope.loginUser.userName} SPOUTER'S 하루기록</span><br>
            <button id="diary-btn" onclick="location.href='/diary/insert'">✏기록 남기기</button>
        </div>
        <div id="list-wrapper"></div>
        <div id="list-scroll" style="text-align: center;">
            <input type="hidden" id="more-var" totalCount="${totalCount}" currentSum="0" currentCount="0">
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <script>
        const listWrapper = $("#list-wrapper");
        const moreVar = $("#more-var");
        photoMoreAjax(1);
        function photoMoreAjax(start) {
            $.ajax({
                url : "/diary/total",
                data : {"start" : start},
                type : "post",
                success : function(result) {
                    let html = "";
                    for(let i=0; i<result.length; i++) {
                        html += "<div class='dPhoto'>"
                        html += "<a href='/diary/detail?diaryNo="+result[i].diaryNo+"'>"
                        html += 	"<img src='/resources/images/diary/"+result[i].diaryFilename+"' width='100%'>";
                        html += 	"<p class='dTitle'>"+result[i].diaryTitle+"</p>";
                        html += "</a></div>";
                    }
                    moreVar.val(Number(start) +1);
                    moreVar.attr("currentSum", Number(moreVar.attr("currentSum"))+result.length); //지금까지 쿼리한 수
                    moreVar.attr("currentCount", 0); //
                    listWrapper.append(html);
                },
                error : function() {
                    alert("AJAX 처리실패");
                }

            })
        }

        //스크롤 이벤트
			$(window).scroll(function() {
				let scrollTop = $(window).scrollTop();
				let innerHeight = $(window).innerHeight();
				let scrollHeight = $("#main").prop("scrollHeight");
				if(scrollTop + innerHeight >= scrollHeight) {
					if(moreVar.attr("totalCount") != moreVar.attr("currentSum")) {
						photoMoreAjax(moreVar.val());
					}
				}
			})
    </script>
</body>
</html>