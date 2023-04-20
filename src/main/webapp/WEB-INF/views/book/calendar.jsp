<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List" %>
    <%@page import="com.kh.spouting.book.domain.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- ajax CDN -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <!-- jquery CDN -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- fullcalendar CDN -->
        <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
        <!-- fullcalendar 언어 CDN -->
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
		<title>예약페이지에 인클루드 할 카렌다</title>
<!-- 		https://dodokong.tistory.com/41 -->
	</head>
	<body>
		 <div id="calendar"></div>
		 
		 
		 <script>
		 document.addEventListener('DOMContentLoaded', function() {
				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {
					initialView : 'dayGridMonth',
					locale : 'ko', // 한국어 설정
					headerToolbar : {
			        	start : "prev next today",
			            center : "title",
			            end : 'dayGridMonth,dayGridWeek,dayGridDay'
			            },
				selectable : true,
				
				
				//events프로퍼티: 읽기전용.
				events : [ 
			    	    <%List<Book> calendarList = (List<Book>) request.getAttribute("calendarList");%>
			            <%if (calendarList != null) {%>
			            <%for (Book vo : calendarList) {%>
			            {
			            	title : '<%=vo.getNumPeople()%>명',
			                start : '<%=vo.getStartTime()%>',
			                end : '<%=vo.getEndTime()%>',
			                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
			             },
							<%}
						}%>
						],
						//날짜클릭이벤트핸들러
						dateClick: function(info){
							//클릭한날짜의 정보 가져오기
							var date = info.dateStr;
							
							//타임그리드보여주기
							calendar.changeView('timeGridWeek', date); // 기준 날짜를 기준으로 주간 보기로 변경
							calendar.gotoDate(date); // 기준 날짜로 이동
						}
						});
						calendar.render();
					});
		 
		 
		 
		 </script>
		 
		 
		 
		 
		 
		 
	</body>
</html>