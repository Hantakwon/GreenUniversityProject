<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교</title>
<!--
	날짜 : 2025/09/08
    이름 : 정순권
    내용 : html구조 조정
-->
<!--
	날짜 : 2025/09/08
    이름 : 한탁원
    내용 : DB 작업
-->

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/college/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/college/human.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main>
		<div>
			<div class="info">
				<span id="test"> <img
					src="<%=request.getContextPath()%>/resources/images/ico-home.png"
					alt="홈 버튼"> > 대학·대학원 > 인문사회대학
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
							<li class="active"><a href="/college/human.do">인문사회대학</a></li>
							<li><a href="/college/science.do">자연과학대학</a></li>
							<li><a href="/college/engineering.do">공과대학</a></li>
							<li><a href="/college/education.do">사범대학</a></li>
							<li><a href="/college/graduate.do">대학원</a></li>
						</ul>
					</div>
				</div>
				<div class="main-content">
					<div class="top">
						<h2>${dto.name_kor}</h2>
					</div>
					<div class="uni-info-container">
						<div class="info-img">
							<img src="/resources/images/college-introduce-1.jpg"
								alt="대학 이미지">
						</div>
						<div class="info-div">
							<h4>${dto.name_eng}</h4>
							<h2>${dto.title}</h2>
							<p>${dto.content}</p>
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