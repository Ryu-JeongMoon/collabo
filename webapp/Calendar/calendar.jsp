<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/fullcalendar@5.7.2/main.js"></script>

<link href='css/main.css' rel='stylesheet' />
<script src='js/main.js'></script>
<script>
	var width = '600';
	var height = '500';
	var left = Math.ceil(( window.screen.width - width )/2);
	var pop = "width="+ width + ", height="+ height + ", left=" + (left+75) + ", top=110";
    var datePattern = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
	
	document.addEventListener('DOMContentLoaded', function() {
		var monthCalendarEl = document.getElementById('month-calendar');
	    var weekCalendarEl = document.getElementById('week-calendar');
	    
	    var monthCalendar = new FullCalendar.Calendar(monthCalendarEl, {
			editable: true,
			initialView: 'dayGridMonth',
			locale: 'ko',
			contentHeight: 'auto',
			contentHeight: 650,
			expandRows: true,
			
			
			customButtons: {
				myCustomButton: {
					text: 'ADD',
					click: function() {
						var addForm = window.open( "AddEvent.jsp" , "Add Event", pop);

					}
			    }
			},
			
			headerToolbar: {
				right: 'myCustomButton today prev,next',
			    left: 'title',
			    
			},
			 
			eventSources: [{
				
				events: function(info, successCallback, failureCallback) {
					$.ajax({
						url: "/Project/getEvent",
						type : "get",
						dataType : "json",
						success : function(result) {

							event = result;
							successCallback(result);
							
						},
						error : function(request,status,error) {
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					    }
					});
				
				}
			
			}],
			
			
	    dateClick: function(info) {
	    	var start_date = info.dateStr;
	    	var end_date = prompt("시작 일자\n" + start_date + "\n\n종료일자", start_date);
	    	if (end_date == null) return;
	    	if (!datePattern.test(end_date)) {
	    		alert("날짜 입력 형식 : YYYY-MM-DD/n");
	    		return;
	    	}

	    	$.ajax({
	    		url: '/Project/addEvent',
				type : "get",
				data : "title=임시" + "&start_date=" + start_date + "&end_date=" + end_date, //서버쪽으로 전달하는 데이터
				success : function() {
					monthCalendar.refetchEvents();
					weekCalendar.refetchEvents();

					//$("#ajaxArea").html(result);
					//monthCalendar.addEventSource( source )
				},
				error : function(request,status,error) {
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
			});
		    
		    
		},
		
		eventClick: function(info) {
			var id = info.event.id;
			window.open( "EditEvent.jsp?id="+id , "Edit Event", pop);
			
			

		}
		

		});

		
	    
		var weekCalendar = new FullCalendar.Calendar(weekCalendarEl, {
	    	initialView: 'listWeek',
			editable: true,
			droppable: true,
			// will let it receive events!
			events: function(info, successCallback, failureCallback) { // put the array in the `events` property
					$.ajax({
						url: '/Project/getEvent',
						type: "get",
						dataType : "json",
						success : function(result) {

							successCallback(result);
							
						},
						error : function(request,status,error) {
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					    }
					});
				
				},
			eventClick: function(info) {
				var result = confirm("정말 삭제하시겠습니까?");
				
				if(result) {
					var id = info.event.id;
					$.ajax({
						url: '/Project/deleteEvent',
						type: "get",
						data: "id=" + id,
						success : function(result) {
							alert("삭제되었습니다.");
							monthCalendar.refetchEvents();
							weekCalendar.refetchEvents();
						},
						error : function(request,status,error) {
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					    }
					});
					
					onthCalendar.fullCalendar ('refetchEvents');
					weekCalendar.fullCalendar ('refetchEvents');
				}
				
					
					

			},
		});
	    
	    monthCalendar.render();
	    weekCalendar.render();
	    
	    


	}); //addEventListener end
  
	$(window).on('resize', function(){
		//clearTimeout(timer);
		//timer = setTimeout(function(){
		//	console.log('resize event!');
		//});
	});

	
</script>
<style>

	body {
    	margin: 50px 0 0 60px;
    	font-size: 14px;
    	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    	
	}

	#month-calendar,
	#week-calendar {
    	float: left;
    	width: 900px;
    	margin: 50px 60px 60px 0;
    	border: 2px solid black;
	}

	
	#all {
		
	}

	#footer {

    position:absolute;
    bottom:0;
    width:100%;
    height:70px;   
    background:#ccc;

	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/bit/html/navbar.jsp" %>
	<div id='all'>
		<div id='month-calendar'></div>
		<div id='week-calendar'></div>
	</div>
	<div id='ajaxArea'>
	</div>
<div id="footer">
<footer>
<%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>
</div>
</body>
</html>
