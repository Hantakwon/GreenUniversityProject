<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.time.*, java.time.format.DateTimeFormatter, java.time.temporal.TemporalAdjusters"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- fn:substring 함수를 사용하기 위해 JSTL Functions 라이브러리 추가 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
// URL 파라미터로 받은 날짜(weekStart)가 없으면 오늘 날짜 기준 월요일
String weekStartParam = request.getParameter("weekStart");
LocalDate startOfWeek;
if (weekStartParam != null && !weekStartParam.isEmpty()) {
	startOfWeek = LocalDate.parse(weekStartParam);
} else {
	LocalDate today = LocalDate.now();
	startOfWeek = today.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
}
LocalDate endOfWeek = startOfWeek.plusDays(6); // 월요일부터 6일 후면 일요일까지 (총 7일)

DateTimeFormatter headerFormatter = DateTimeFormatter.ofPattern("M.d(E)"); // 월.일(요일)
DateTimeFormatter displayFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd"); // 년.월.일
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단안내</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/academic/hyokongmain.css">
<style>
/* 스타일은 기존 그대로 사용 */
.calendar-container {
	max-width: 950px;
	margin: 30px auto;
	font-family: 'Malgun Gothic';
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	overflow: hidden;
}

.calendar-header {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 10px;
	background: #f7f7f7;
	border-bottom: 1px solid #eee;
}

.nav-button {
	background: transparent;
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

.meal-table {
	width: 100%;
	min-width: 930px;
	border-collapse: collapse;
	table-layout: fixed;
}

.meal-table thead th {
	background: #084A87;
	color: white;
	padding: 12px 0;
	text-align: center;
	border-right: 1px solid #ccc;
	border-bottom: 2px solid #ccc;
	font-weight: 500;
	font-size: 14px;
	white-space: nowrap;
}

.meal-table thead th:last-child {
	border-right: none;
}

.meal-table thead th.category-header {
	background: #084A87;
}

.meal-table tbody td {
	border: 1px solid #dedede;
	vertical-align: top;
	min-height: 100px;
	padding: 10px;
}

.meal-category {
	background: white;
	color: black;
	text-align: center;
	vertical-align: middle;
	font-weight: bold;
	width: 10%;
}

.meal-content {
	line-height: 1.4;
	font-size: 14px;
}

.meal-price {
	background: #E0FFFF;
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
-
<!--
    날짜 : 2025/09/11
    이름 : 정순권
    내용 : meal sidebar 수정, header main태그 밖으로 이동
    <!--
    날짜 : 2025/09/11
    이름 : 박효빈
    내용 : meal jsp - 데이터 insert 진행
    -->
<body>
	<jsp:include page="../header.jsp" />
	<main>
		<div>
			<div class="info">
				<span><img
					src="<%=request.getContextPath()%>/resources/images/ico-home.png"
					alt="홈 버튼"> > 대학생활 > 식단안내</span>
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
							<li><a href="/collegelife/studentunion.do">학생회 소개</a></li>
							<li class="#"><a href="/collegelife/clud.do">동아리/스터디</a></li>
							<li class="active"><a href="/collegelife/meal.do">식단안내</a></li>
							<li><a href="/collegelife/gallery.do">갤러리</a></li>
						</ul>
					</div>
				</div>

				<div class="main-content">
					<div class="top">
						<h2>식단안내</h2>
					</div>
					<div class="calendar-container">
						<div class="calendar-header">
							<button class="nav-button"
								onclick="location.href='meal.do?weekStart=<%=startOfWeek.minusWeeks(1)%>';">&lt;</button>
							<div class="date-title"><%=startOfWeek.format(displayFormatter)%>
								~
								<%=endOfWeek.format(displayFormatter)%></div>
							<button class="nav-button"
								onclick="location.href='meal.do?weekStart=<%=startOfWeek.plusWeeks(1)%>';">&gt;</button>
						</div>

						<table class="meal-table">
							<thead>
								<tr>
									<th class="category-header">구분</th>
									<%
									for (java.time.LocalDate date = startOfWeek; !date.isAfter(endOfWeek); date = date.plusDays(1)) {
									%>
									<th class="date-header"><%=date.format(headerFormatter)%></th>
									<%
									}
									%>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="meal-category">조식</td>
									<%
									for (java.time.LocalDate date = startOfWeek; !date.isAfter(endOfWeek); date = date.plusDays(1)) {
									%>
									<td>
										<%
										String currentDateStr = date.toString();
										pageContext.setAttribute("currentDateStr", currentDateStr);
										%> <c:set var="found" value="false" /> <c:forEach
											var="meal" items="${mealList}">
											<c:if
												test="${fn:substring(meal.meal_date, 0, 10) eq currentDateStr and meal.meal_type.trim() eq '조식'}">
												<span class="meal-price">${meal.meal_price}</span>
												<div class="meal-content">${meal.meal_name}</div>
												<c:set var="found" value="true" />
											</c:if>
										</c:forEach> <c:if test="${found == false}">
											<span class="no-meal">미운영</span>
										</c:if>
									</td>
									<%
									}
									%>
								</tr>
								<tr>
									<td class="meal-category">중식</td>
									<%
									for (java.time.LocalDate date = startOfWeek; !date.isAfter(endOfWeek); date = date.plusDays(1)) {
									%>
									<td>
										<%
										String currentDateStr = date.toString();
										pageContext.setAttribute("currentDateStr", currentDateStr);
										%> <c:set var="found" value="false" /> <c:forEach
											var="meal" items="${mealList}">
											<c:if
												test="${fn:substring(meal.meal_date, 0, 10) eq currentDateStr and meal.meal_type.trim() eq '중식'}">
												<span class="meal-price">${meal.meal_price}</span>
												<div class="meal-content">${meal.meal_name}</div>
												<c:set var="found" value="true" />
											</c:if>
										</c:forEach> <c:if test="${found == false}">
											<span class="no-meal">미운영</span>
										</c:if>
									</td>
									<%
									}
									%>
								</tr>
								<tr>
									<td class="meal-category">석식</td>
									<%
									for (java.time.LocalDate date = startOfWeek; !date.isAfter(endOfWeek); date = date.plusDays(1)) {
									%>
									<td>
										<%
										String currentDateStr = date.toString();
										pageContext.setAttribute("currentDateStr", currentDateStr);
										%> <c:set var="found" value="false" /> <c:forEach
											var="meal" items="${mealList}">
											<c:if
												test="${fn:substring(meal.meal_date, 0, 10) eq currentDateStr and meal.meal_type.trim() eq '석식'}">
												<span class="meal-price">${meal.meal_price}</span>
												<div class="meal-content">${meal.meal_name}</div>
												<c:set var="found" value="true" />
											</c:if>
										</c:forEach> <c:if test="${found == false}">
											<span class="no-meal">미운영</span>
										</c:if>
									</td>
									<%
									}
									%>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="bottom-message">
						<p>※ 항상 그린 식당을 이용해 주셔서 감사합니다.</p>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>
F
