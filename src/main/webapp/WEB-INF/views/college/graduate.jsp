<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대학원</title>
<!--
	날짜 : -
    이름 : 정순권
    내용 : -
-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/college/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/college/graduate.css">

</head>
<body>
	<jsp:include page="../header.jsp" />
	<main>
		<div>
			<div class="info">
				<span id="test"> <img src="/resources/images/ico-home.png"
					alt="홈 버튼"> > 대학·대학원 > 대학원
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
							<li><a href="/college/engineering.do">공과대학</a></li>
							<li><a href="/college/education.do">사범대학</a></li>
							<li class="active"><a href="/college/graduate.do">대학원</a></li>
						</ul>
					</div>
				</div>
				<div class="main-content">
					<div class="top">
						<h2>대학원</h2>
					</div>
					<div class="uni-info-container">
						<div class="info-img">
							<img src="/resources/images/college-introduce-5.jpg" alt="자연과학대">
						</div>
						<div class="info-div">
							<h4>GRADUATE SCHOOL</h4>
							<h2>학문의 이론과 응용방법을 한층 더 심오하게 연구, 교수 및 지도자적 인격을 도야하고 창의력을 함양</h2>
							<p>대학원은 학문의 이론과 응용방법을 한층 더 심오하게 연구 · 교수한다. 동시에 인력을 도야 하고 독창력을
								함양하여 문화발전에 기여하고 있으며, 21세기의 세계화, 국제화, 개방화 시 대를 맞이하여 공학, 인문사회,
								자연과학, 예체능, 수산 및 해양과학에 관한 학문 전 분야의 균형있는 발전을 꾀하고 있다. 아울러 첨단연구와
								지도능력을 갖춘 인재양성을 위해 대학원 교육의 획기적인 강화와 제도개선 그리고 연구기능의 활성화에 적극 힘쓰고
								있으며, 우수학 생을 유치하기 위하여 연구/수업조교장학제도를 실시하며 국제화의 일환으로 외국인학생 을 유치하고
								대학원 교육의 활성화에 적극 노력하고 있다.</p>
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