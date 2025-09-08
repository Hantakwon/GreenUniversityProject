<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 
	날짜 :
	이름 : 박효빈
	내용 : 식단안내
-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/academic/academic.css">
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.17/index.global.min.js'></script>
    <!-- FullCalendar Month-view 플러그인 (월별 달력 보기에 필요) -->
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.17/index.global.min.js'></script>
    <!-- 한국어 언어팩 (선택 사항) -->
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.17/locales/ko.global.min.js'></script>

    <script>
        // 문서의 DOM 콘텐츠가 모두 로드된 후에 FullCalendar를 초기화합니다.
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar'); // 캘린더를 띄울 div 요소 선택

            var calendar = new FullCalendar.Calendar(calendarEl, {
                // 캘린더 설정 객체
                initialView: 'dayGridMonth', // 초기 뷰를 월별 달력으로 설정
                locale: 'ko', // 한국어 설정
                headerToolbar: { // 상단 툴바 설정 (버튼과 타이틀 위치)
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,dayGridWeek,dayGridDay' // 월, 주, 일별 뷰 버튼
                },
                // 여기에 이벤트 데이터 등을 추가할 수 있습니다.
                // events: [
                //     { title: '학사일정 1', date: '2024-09-01' },
                //     { title: '학사일정 2', date: '2024-09-15', color: '#ff9f89' }
                // ]
            });

            calendar.render(); // 캘린더를 화면에 렌더링
        });
    </script>
<body>
    <main>
        <div>
            <div class="info">
                <span id="test">
                    <img src="./images/ico-home.png" alt="홈 버튼">
                    > 대학생활 > 식단안내
                </span>
            </div>
        </div>
        <div>
            <div class="content-wrapper">
                <div class="sidebar">
                    <div class="top">
                        <h1>대학생활</h1>
                    </div>
                    <div class="bottom">
                        <ul>
                            <li class="#"><a href="#">학생회 소개</a></li>
                            <li><a href="#">동아리/스터디</a></li>
                            <li class="active"><a href="#">식단안내</a></li>
                            <li class="#"><a href="#">갤러리</a></li>

                        </ul>
                    </div>
                </div>
                <div class="main-content">
                    <div class="top">
                        <h2>식단안내</h2>
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
</body>
</html>