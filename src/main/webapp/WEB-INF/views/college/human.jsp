<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인문사회대학</title>
<!--
	날짜 : -
    이름 : 정순권
    내용 : -
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
				<span id="test"> <img src="<%=request.getContextPath()%>/resources/images/ico-home.png" alt="홈 버튼">
					> 대학·대학원 > 인문사회대학
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
							<li class="active"><a href="./인문사회대학.html">인문사회대학</a></li>
							<li><a href="/college/science.do">자연과학대학</a></li>
							<li><a href="./공과대학.html">공과대학</a></li>
							<li><a href="./사범대학.html">사범대학</a></li>
							<li><a href="./대학원.html">대학원</a></li>
						</ul>
					</div>
				</div>
				<div class="main-content">
					<div class="top">
						<h2>인문사회대학</h2>
					</div>
					<div class="uni-info-container">
						<div class="info-img">
							<img src="<%=request.getContextPath()%>/resources/images/college-introduce-1.jpg" alt="인문대">
						</div>
						<div class="info-div">
							<h4>Humanities And Social Sciences</h4>
							<h2>인문, 사회분야의 다양하고 심화된 이론을 연구</h2>
							<p>인문사회과학대학은 민족의 문화적 유산과 전통을 창조적으로 계승.발전시킬 열린 민족인, 세계화된 지식,
								정보사회를 주도할 수 있는 국제적인 식견을 갖춘 전문인, 법, 정치 경제, 언 론등 우리사회의 중심을 이루는
								영역에서 정의로운 사명감을 가지고 일 할 양심적인 봉사자, 그리고 창의적인 디자인 활동을 할 개성적인 인재를
								양성하기 위해서 인문, 사회, 디자인 영 역의 다양하고 심화된 이론과 실제를 교수.연구하는데 교육목표를 둔다.</p>
						</div>
					</div>
					<div class="mid">
						<p>
							<img src="<%=request.getContextPath()%>/resources/images/bullet-h4.png"> 학부 및 학과
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
											src="<%=request.getContextPath()%>/resources/images/ico_link.png" alt="바로가기"></a></td>
									<td>${dto.proName}</td>
									<td>${dto.deptTel }</td>
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