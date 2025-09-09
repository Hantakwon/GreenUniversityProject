<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자연과학대학</title>
<!--
	날짜 : -
    이름 : 정순권
    내용 : -
-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/college/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/college/science.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main>
		<div>
			<div class="info">
				<span id="test"> <img src="../images/ico-home.png" alt="홈 버튼">
					> 대학·대학원 > 자연과학대학
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
							<li class="active"><a href="./자연과학대학.html">자연과학대학</a></li>
							<li><a href="./공과대학.html">공과대학</a></li>
							<li><a href="./사범대학.html">사범대학</a></li>
							<li><a href="./대학원.html">대학원</a></li>
						</ul>
					</div>
				</div>
				<div class="main-content">
					<div class="top">
						<h2>자연과학대학</h2>
					</div>
					<div class="uni-info-container">
						<div class="info-img">
							<img src="../images/college-introduce-2.jpg" alt="자연과학대">
						</div>
						<div class="info-div">
							<h4>Natural Sciences</h4>
							<h2>자연과학의 기초 이론 교수와 연구, 융합 및 응용과학의 토대 제공</h2>
							<p>자연과학대학은 미래 첨단과학기술사회의 학계, 연구소, 산업계 등을 주도적으로 이끌어 나 갈 기초과학 인재
								양성을 교육목표로 한다. 자연과학의 근간이 되는 물리, 화학, 응용수학, 미 생물학, 과학컴퓨팅 및 간호학의 기초
								이론을 교수·연구하고 융합 및 응용과학의 토대를 제 공할 것이다.</p>
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
								<td>수학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김수학</td>
								<td>051-123-2001</td>
								<td></td>
							</tr>
							<tr>
								<td>물리학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김물리</td>
								<td>051-123-2002</td>
								<td></td>
							</tr>
							<tr>
								<td>화학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김화학</td>
								<td>051-123-2003</td>
								<td></td>
							</tr>
							<tr>
								<td>천문학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김천문</td>
								<td>051-123-2004</td>
								<td></td>
							</tr>
							<tr>
								<td>지구과학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김지구</td>
								<td>051-123-2005</td>
								<td></td>
							</tr>
							<tr>
								<td>생명과학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김생명</td>
								<td>051-123-2006</td>
								<td></td>
							</tr>
							<tr>
								<td>미생물학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김생물</td>
								<td>051-123-2007</td>
								<td></td>
							</tr>
							<tr>
								<td>해양학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김해양</td>
								<td>051-123-2008</td>
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