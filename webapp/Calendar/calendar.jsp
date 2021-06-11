<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
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

	var delay = 300;
	var timer = null;
	var event = null;
	//const dayGridPlugin = (await import('@fullcalendar/daygrid')).default;
	
	document.addEventListener('DOMContentLoaded', function() {
		var monthCalendarEl = document.getElementById('month-calendar');
	    var weekCalendarEl = document.getElementById('week-calendar');
	    //useAjax();
	    
	    var monthCalendar = new FullCalendar.Calendar(monthCalendarEl, {
	    	//plugins: [ 'interaction' ],
			editable: true,
			initialView: 'dayGridMonth',
			locale: 'ko',
			contentHeight: 'auto',
			//aspectRatio: 2,
			contentHeight: 650,
			expandRows: true,
			eventSources: [{

				    // your event source
				
				events: function(info, successCallback, failureCallback) { // put the array in the `events` property
					$.ajax({
						url: 'http://localhost:8080/Project/getEvent',
						type : "get",
						//data : "id=hong&pwd=1234", //서버쪽으로 전달하는 데이터
						dataType : "json",
						success : function(result) {
							//events: [result]
							//objectToJSON = JSON.stringify(result);
							//alert("성공 - 리턴값 : " + result);
							//?result = JSON.stringify(result);
							//?alert(result);
							//?eventArray.push(result);
							
							//HTML 출력 영역에 표시
							event = result;
							successCallback(result);
							
						},
						error : function(request,status,error) {
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					    }
					});
				
				}
				// any other event sources...
			
				
			
			}],
	    
	    dateClick: function(info) {
	    	//alert(info.dateStr); String
	    	var start_date = info.dateStr;
	    	var end_date = prompt("시작 일자 : " + start_date , "종료일자 : " + start_date);
	    	if (end_date == null) return;
	    	//var title = prompt("일정 이름 : ");
	    	$.ajax({
	    		url: 'http://localhost:8080/Project/addEventFast',
				type : "get",
				data : "start_date=" + info.dateStr + "&end_date=" + end_date, //서버쪽으로 전달하는 데이터
				//dataType : "json",
				success : function() {
					monthCalendar.refetchEvents();
					//$("#ajaxArea").html(result);
					//monthCalendar.addEventSource( source )
				},
				error : function(request,status,error) {
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
			});
		    
		    
		},
		
		eventClick: function(info) {
			var title = prompt('일정 : ' + info.event.title, info.event.title);
			var start_date = prompt('시작 일자 : ' + info.event.startStr, info.event.startStr);
			var end_date = prompt('종료 일자 : ' + info.event.endStr, info.event.endStr);
			var id = info.event.id;
			//alert(end_date);
			//alert(id);
			$.ajax({
				url: 'http://localhost:8080/Project/updateEventFast',
				type : "get",
				data : "title=" + title + "&start_date=" + start_date + "&end_date=" + end_date +"&id=" + id, //서버쪽으로 전달하는 데이터
				//dataType : "json",
				success : function() {
					monthCalendar.refetchEvents();
					//$("#ajaxArea").html(result);
					//monthCalendar.addEventSource( source )
				},
				error : function(request,status,error) {
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
			});
		},
		

		});

		
	    
		var weekCalendar = new FullCalendar.Calendar(weekCalendarEl, {
	    	initialView: 'listWeek',
			editable: true,
			droppable: true,
			// will let it receive events!
			events: function(info, successCallback, failureCallback) { // put the array in the `events` property
					$.ajax({
						url: 'http://localhost:8080/Project/getEvent',
						type: "get",
						dataType : "json",
						success : function(result) {

							successCallback(result);
							
						},
						error : function(request,status,error) {
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					    }
					});
				
				}
		});
	    
	    monthCalendar.render();
	    weekCalendar.render();
	    
	    


	}); //addEventListener end
  
	$(window).on('resize', function(){
		clearTimeout(timer);
		timer = setTimeout(function(){
			console.log('resize event!');
		}, delay);
	});
	
	
	//$("#month-calendar").fullCalendar('getDate').month();
	//monthCalendar
	
	//intervalStart = view.currentStart;
	//intervalEnd = $('#month-calendar').fullCalendar('getView').intervalEnd.format("YYYY-MM-DD");
	
	//alert(intervalStart);
	//alert(intervalEnd);

	
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
    	margin: 0 60px 60px 0;
    	border: 2px solid black;
	}

	
	#all {
		
	}

	
</style>
</head>
<body>
	<div id='all'>
		<div id='month-calendar'></div>
		<div id='week-calendar'></div>
	</div>
	<div id='ajaxArea'>
	
	</div>
</body>
</html>
