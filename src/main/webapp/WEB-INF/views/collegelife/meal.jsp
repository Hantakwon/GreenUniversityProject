<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.*, java.time.format.DateTimeFormatter, java.time.temporal.TemporalAdjusters" %>

<%
    // URL 파라미터로 받은 날짜(weekStart)가 없으면 오늘 날짜를 기준으로 시작일 계산
    String weekStartParam = request.getParameter("weekStart");
    LocalDate startOfWeek;
    if (weekStartParam != null && !weekStartParam.isEmpty()) {
        startOfWeek = LocalDate.parse(weekStartParam);
    } else {
        // 현재 주의 월요일 날짜를 구함 (일주일의 시작을 월요일로 가정)
        LocalDate today = LocalDate.now();
        startOfWeek = today.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
    }
    
    // 주간의 마지막 날짜 (토요일) 계산
    LocalDate endOfWeek = startOfWeek.plusDays(5);

    // 날짜 포맷터 설정
    DateTimeFormatter headerFormatter = DateTimeFormatter.ofPattern("yyyy.M.d(E)");
    DateTimeFormatter displayFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단안내</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/academic/hyokongmain.css">
    
<style>
    /* 식단표 컨테이너 */
    .calendar-container {
        max-width: 950px;
        margin: 30px auto;
        font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    /* 날짜 및 내비게이션 헤더 */
    .calendar-header {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 10px;
        background-color: #f7f7f7;
        border-bottom: 1px solid #eee;
    }

    .nav-button {
        background-color: transparent;
        border: none;
        color: #333;
        font-size: 1.5em;
        cursor: pointer;
        padding: 5px 10px;
    }

    .date-title {
        font-size: 1.3em;
        font-weight: bold;
        color: #555;
        flex-grow: 1;
        text-align: center;
    }

    /* 식단표 테이블 */
    .meal-table {
        width: 100%;
        min-width : 930px;
       height : auto;
        border-collapse: collapse;
        table-layout: fixed;
    }

    /* 테이블 헤더 (날짜 및 구분) */
    .meal-table thead th {
        background-color: #084A87; /* 이미지의 회색 배경 */
        color: #ffffff; /* 이미지의 검정색 글씨 */
        padding: 12px 0;
        text-align: center;
        border-right: 1px solid #ccc; /* 헤더 사이의 경계선 */
        border-bottom: 2px solid #ccc;
        font-weight: 500;
        font-size: 14px;
        white-space: nowrap;
    }
    .meal-table thead th:last-child {
        border-right: none;
    }
    
    /* "구분" 열 헤더 */
    .meal-table thead th.category-header {
        background-color: #084A87; /* 이미지의 파란색 배경 */
        color: white;
    }
    
    /* 테이블 본문 셀 (식단 내용) */
    .meal-table tbody td {
        border: 1px solid #dedede;
        vertical-align: top;
        min-height: 100px;
        padding: 10px;
    }

    /* "조식/중식/석식" 열 */
    .meal-category {
        background-color: #ffffff;
        color: black;
        text-align: center;
        vertical-align: middle;
        font-weight: bold;
        width: 10%;
    }
    
    /* 메뉴 내용 스타일 */
    .meal-content {
        line-height: 1.4;
        font-size: 14px;
    }
    
    .meal-price {
        background-color: #E0FFFF;
        color: #008B8B;
        padding: 2px 15px;
        border-radius: 3px;
        font-weight: bold;
        font-size: 0.85em;
        margin-bottom: 5px;
        display: inline-block;
    }

    .no-meal {
        color: #999;
        font-style: italic;
        text-align: center;
        font-size: 0.9em;
    }
</style>
</head>
<body>
	<main>
	    <jsp:include page="../header.jsp" />
		<div>
			<div class="info">
				<span> <img src="<%=request.getContextPath()%>/resources/images/ico-home.png" alt="홈 버튼">
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
					<div class="calendar-container">
						<div class="calendar-header">
							<
							button class="nav-button" id="prev-week" onclick="location.href='meal.jsp?weekStart=<%= startOfWeek.minusWeeks(1) %>';">&lt;</button>
							<div class="date-title" id="date-range-display">
							<%= startOfWeek.format(displayFormatter) %> ~ <%= endOfWeek.format(displayFormatter) %>
							</div>
							<button class="nav-button" id="next-week" onclick="location.href='meal.jsp?weekStart=<%= startOfWeek.plusWeeks(1) %>';">&gt;</button>
						</div>
						<table class="meal-table">
							<thead>
								<tr>
									<th class="category-header">구분</th>
                                    <% for (LocalDate date = startOfWeek; !date.isAfter(endOfWeek); date = date.plusDays(1)) { %>
									<th class="date-header"><%= date.format(headerFormatter) %></th>
                                    <% } %>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="meal" items="${mealList}">
									<tr>
										<td>
											<fmt:formatDate value="${meal.mealdate}" pattern="yyyy.MM.dd(E)" />
										</td>
										<td>
											<c:choose>
												<c:when test="${not empty meal.breakfast}">
													<div class="meal-menu">${meal.breakfast}</div>
												</c:when>
												<c:otherwise>
													<span class="no-meal">미운영</span>
												</c:otherwise>
											</c:choose>
										</td>
										<td>
											<c:choose>
												<c:when test="${not empty meal.lunch}">
													<div class="meal-menu">${meal.lunch}</div>
												</c:when>
												<c:otherwise>
													<span class="no-meal">미운영</span>
												</c:otherwise>
											</c:choose>
										</td>
										<td>
											<c:choose>
												<c:when test="${not empty meal.dinner}">
													<div class="meal-menu">${meal.dinner}</div>
												</c:when>
												<c:otherwise>
													<span class="no-meal">미운영</span>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="bottom-message">
						<p>
							<span>※</span>항상 그린 식당을 이용해 주셔서 감사합니다.
						</p>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>