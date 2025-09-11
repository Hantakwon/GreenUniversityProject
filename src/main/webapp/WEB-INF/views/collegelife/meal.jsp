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
<!--
    날짜 : 2025/09/11
    이름 : 정순권
    내용 : meal sidebar 수정, header main태그 밖으로 이동
    <!--
    날짜 : 2025/09/11
    이름 : 박효빈
    내용 : meal jsp - 데이터 insert 확인 중
-->

<body>
	<jsp:include page="../header.jsp" />
	<main>
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
							<li><a href="/collegelife/studentunion.do">학생회 소개</a></li>
							<li><a href="/collegelife/clud.do">동아리/스터디</a></li>
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
							<button class="nav-button" id="prev-week" onclick="location.href='meal.jsp?weekStart=<%= startOfWeek.minusWeeks(1) %>';">&lt;</button>
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