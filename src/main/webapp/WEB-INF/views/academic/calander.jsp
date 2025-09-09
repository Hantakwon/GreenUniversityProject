<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교 학사일정</title>
</head>
<!-- 
	날짜 : 2025/09/09 
	이름 : 박효빈
	내용 : 학사일정 JSP 작성 // 종료일 (End_date +1) 추가 작업 필요 
-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/academic/hyokongmain.css">
<body>
	<main>
		<div>
			<div class="info">
				<span id="test"> <img
					src="<%=request.getContextPath()%>/resources/images/ico-home.png"
					alt="홈 버튼"> > 학사안내 > 학사일정
				</span>
			</div>
		</div>
		<div>
			<div class="content-wrapper">
				<div class="sidebar">
					<div class="top">
						<h1>학사안내</h1>
					</div>
					<div class="bottom">
						<ul>
							<li class="#"><a href="./학사안내-공지사항.html">공지사항</a></li>
							<li class="active"><a href="./학사안내-학사일정.html">학사일정</a></li>
							<li><a href="./학사안내-수강신청.html">수강신청</a></li>
							<li><a href="./학사안내-성적.html">성적</a></li>
							<li><a href="./학사안내-수료및졸업">수료 및 졸업</a></li>
							<li><a href="./학사안내-자주묻는질문">자주 묻는 질문</a></li>
						</ul>
					</div>
				</div>
				<div class="main-content">
					<div class="top">
						<h2>학사일정</h2>
					</div>
					<div>
						<div id="calendar"></div>
					</div>
					<div class="bottom">
						<p>😭자세한 일정내용은 공지사항 보세요😭😭</p>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- FullCalendar JavaScript 라이브러리 추가 (body 태그 닫히기 직전에 넣는 것이 성능상 좋습니다) -->
	<!-- FullCalendar Core 라이브러리 -->
	<script
		src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.17/index.global.min.js'></script>
	<!-- FullCalendar Month-view 플러그인 (월별 달력 보기에 필요) -->
	<script
		src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.17/index.global.min.js'></script>
	<!-- 한국어 언어팩 (선택 사항) -->
	<script
		src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.17/locales/ko.global.min.js'></script>




<script>
    document.addEventListener('DOMContentLoaded', function () {
        var calendarEl = document.getElementById('calendar');
        
        var eventData=[]; // 풀캘린더에 전달한 이벤트 데이터 배열 생성
        
        <c:forEach var="calander" items="${calanderList}">
        eventData.push({
        	title:'<c:out value="${calander.title}"/>',
        	start:'<c:out value="${calander.start_date}"/>',
        	end: '<c:out value="${calander.end_date}"/>'
        });
        </c:forEach>

        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            locale: 'ko',
            headerToolbar: {
                left: 'prev',
                center: 'title',
                right: 'next'
            },
            titleFormat: { year: 'numeric', month: '2-digit' }, // 2025.09 형식
            dayHeaderFormat: { weekday: 'short' }, // 요일 영어 약어 (Sun, Mon, ...)
     		events : eventData,
            nowIndicator: true,
            displayEventTime: false
        });

        calendar.render();
    });
</script>



</body>
</html>