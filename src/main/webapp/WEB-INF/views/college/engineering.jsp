<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공과대학</title>
<!--
	날짜 : -
    이름 : 정순권
    내용 : -
-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/college/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/college/engineering.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main>
		<div>
			<div class="info">
				<span id="test"> <img src="/resources/images/ico-home.png"
					alt="홈 버튼"> > 대학·대학원 > 공과대학
				</span>
			</div>
		</div>
		<div>
			<div class="content-wrapper">
				<div class="sidebar">
					<div class="top">
						<h1>대학·대학원</h1>
					</div>
					<div class="bottom">
						<ul>
							<li><a href="/college/human.do">인문사회대학</a></li>
							<li><a href="/college/science.do">자연과학대학</a></li>
							<li class="active"><a href="/college/engineering.do">공과대학</a></li>
							<li><a href="/college/education.do">사범대학</a></li>
							<li><a href="/college/graduate.do">대학원</a></li>
						</ul>
					</div>
				</div>
				<div class="main-content">
					<div class="top">
						<h2>공과대학</h2>
					</div>
					<div class="uni-info-container">
						<div class="info-img">
							<img src="/resources/images/college-introduce-3.jpg" alt="공대">
						</div>
						<div class="info-div">
							<h4>Engineering</h4>
							<h2>기본 공학교육 및 산업현장과 연계된 산학협동을 위한 학문을 교수·연구</h2>
							<p>공과대학은 지역 및 국가산업을 선도할 창의적이고 생산적인 전물기술인을 양성하기 위하 여 기본 공학교육의
								강화, 전공교육의 심화 및 산업현장과 연계된 산학협동의 활성화를 실현 할 관련학문을 교수, 연구하는데 교육목표를
								둔다.</p>
						</div>
					</div>
					<div class="mid">
						<p>
							<img src="/resources/images/bullet-h4.png"> 학부 및 학과
						</p>
					</div>
					<div class="department">
						<table class="dept-table">
							<tr>
								<th>학과/전공</th>
								<th>학과장</th>
								<th>학과 사무실 번호</th>
								<th>비고</th>
							</tr>
							<c:forEach var="dto" items="${dtoList}">
								<tr>
									<td>${dto.deptName}<a href="#"><img
											src="<%=request.getContextPath()%>/resources/images/ico_link.png"
											alt="바로가기"></a></td>
									<td>${dto.proName}</td>
									<td>${dto.deptTel}</td>
									<td></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>