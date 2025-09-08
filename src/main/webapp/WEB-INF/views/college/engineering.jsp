<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<span id="test"> <img src="../images/ico-home.png" alt="홈 버튼">
					> 대학·대학원 > 공과대학
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
							<li><a href="./인문사회대학.html">인문사회대학</a></li>
							<li><a href="./자연과학대학.html">자연과학대학</a></li>
							<li class="active"><a href="./공과대학.html">공과대학</a></li>
							<li><a href="./사범대학.html">사범대학</a></li>
							<li><a href="./대학원.html">대학원</a></li>
						</ul>
					</div>
				</div>
				<div class="main-content">
					<div class="top">
						<h2>공과대학</h2>
					</div>
					<div class="uni-info-container">
						<div class="info-img">
							<img src="../images/college-introduce-3.jpg" alt="공대">
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
							<img src="../images/bullet-h4.png"> 학부 및 학과
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
							<tr>
								<td>기계공학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김기계</td>
								<td>051-123-3001</td>
								<td></td>
							</tr>
							<tr>
								<td>전자공학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김전자</td>
								<td>051-123-3002</td>
								<td></td>
							</tr>
							<tr>
								<td>전기공학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김전기</td>
								<td>051-123-3003</td>
								<td></td>
							</tr>
							<tr>
								<td>컴퓨터공학과 <a href="#"><img
										src="../images/ico_link.png" alt="바로가기"></a></td>
								<td>김컴공</td>
								<td>051-123-3004</td>
								<td></td>
							</tr>
							<tr>
								<td>건축공학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김건축</td>
								<td>051-123-3005</td>
								<td></td>
							</tr>
							<tr>
								<td>재료공학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김재료</td>
								<td>051-123-3006</td>
								<td></td>
							</tr>
							<tr>
								<td>화학공학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김화학</td>
								<td>051-123-3007</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>