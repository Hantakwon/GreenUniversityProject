<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/college/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/college/human.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main>
		<div>
			<div class="info">
				<span id="test"> <img src="../images/ico-home.png" alt="홈 버튼">
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
							<li><a href="./자연과학대학.html">자연과학대학</a></li>
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
							<img src="../images/college-introduce-1.jpg" alt="인문대">
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
								<td>국어국문학과 <a href="#"><img
										src="../images/ico_link.png" alt="바로가기"></a></td>
								<td>김국어</td>
								<td>051-123-1001</td>
								<td></td>
							</tr>
							<tr>
								<td>영어영문학과 <a href="#"><img
										src="../images/ico_link.png" alt="바로가기"></a></td>
								<td>김영어</td>
								<td>051-123-1002</td>
								<td></td>
							</tr>
							<tr>
								<td>일어일문학과 <a href="#"><img
										src="../images/ico_link.png" alt="바로가기"></a></td>
								<td>김일어</td>
								<td>051-123-1003</td>
								<td></td>
							</tr>
							<tr>
								<td>중어중문학과 <a href="#"><img
										src="../images/ico_link.png" alt="바로가기"></a></td>
								<td>김중어</td>
								<td>051-123-1004</td>
								<td></td>
							</tr>
							<tr>
								<td>역사학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김역사</td>
								<td>051-123-1005</td>
								<td></td>
							</tr>
							<tr>
								<td>경제학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김경제</td>
								<td>051-123-1006</td>
								<td></td>
							</tr>
							<tr>
								<td>경영학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김경영</td>
								<td>051-123-1007</td>
								<td></td>
							</tr>
							<tr>
								<td>법학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김법학</td>
								<td>051-123-1008</td>
								<td></td>
							</tr>
							<tr>
								<td>철학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김철학</td>
								<td>051-123-1009</td>
								<td></td>
							</tr>
							<tr>
								<td>정치외교학과 <a href="#"><img
										src="../images/ico_link.png" alt="바로가기"></a></td>
								<td>김정치</td>
								<td>051-123-1010</td>
								<td></td>
							</tr>
							<tr>
								<td>행정학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김행정</td>
								<td>051-123-1011</td>
								<td></td>
							</tr>
							<tr>
								<td>사회복지학과 <a href="#"><img
										src="../images/ico_link.png" alt="바로가기"></a></td>
								<td>김사회</td>
								<td>051-123-1012</td>
								<td></td>
							</tr>
							<tr>
								<td>유아교육학과 <a href="#"><img
										src="../images/ico_link.png" alt="바로가기"></a></td>
								<td>김유아</td>
								<td>051-123-1013</td>
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