<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		 아 어차피 빼면 인클루드 해도 데이터 안불러와지자너... 시험용
		 
		 
		 
		 <script>
		 	document.addEventListener('DOMContentLoaded', function(){
		 		$(function(){
		 			var request = $.ajax({
		 				url: "/book/calendar",
		 				method: "GET",
		 				dataType: "json"
		 			});
		 			request.done(function (data){
		 				console.log(data);
		 				
		 				var calendarEl = document.getElementById('calendar');
		 				var calendar = new FullCalendar.Calendar(calendarEl, {
		 					initialDate: '2023-04-14',
		 					initialView: 'timeGridWeek',
		 					headerToolbar:{
		 						left: 'prev, next today',
		 						center: 'title',
		 						right: 'dayGridMonth, timeGridWeek, timeGridDay,listWeek'
		 					},
		 					editable: false,
		 					droppable: false,
		 					events: data;
		 				});
		 				calendar.render();
		 			})
		 			request.fail(function(jqXHR, textStatus){
		 				alert(textStatus);
		 			})
		 		})
		 	})
		 
		 
		 
		 </script>
		 
		 
		 
		 
		 
		 
	</body>
</html>