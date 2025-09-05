<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사범대학</title>
<!--
	날짜 : -
    이름 : 정순권
    내용 : -
-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/college/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/college/education.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main>
		<div>
			<div class="info">
				<span id="test"> <img src="../images/ico-home.png" alt="홈 버튼">
					> 대학·대학원 > 사범대학
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
							<li><a href="./공과대학.html">공과대학</a></li>
							<li class="active"><a href="./사범대학.html">사범대학</a></li>
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
							<img src="../images/college-introduce-4.jpg" alt="사범대">
						</div>
						<div class="info-div">
							<h4>Education</h4>
							<h2>미래를 움직이는 큰 인재, 세계의 주역!</h2>
							<p>전공영역은 물론 현대 교육에 대한 학문적 탐구의 자질 및 인격 도야에 중점을 두고 있습니 다. 원격강의,
								스튜디오, 원격교육강의실, 교육매체 제작실, 멀티미디어 강의실, 어학학습실, 수업행동 분석실 등 첨단 시설을 갖춘
								교육지원센터를 운영하고 있습니다. 부속기관으로는 중등교육연수원, 과학교육연구소, 부설고등학교 등이 있습니다.</p>
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
								<td>국어교육과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김국어</td>
								<td>051-123-4001</td>
								<td></td>
							</tr>
							<tr>
								<td>영어교육과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김영어</td>
								<td>051-123-4002</td>
								<td></td>
							</tr>
							<tr>
								<td>수학교육과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김수학</td>
								<td>051-123-4003</td>
								<td></td>
							</tr>
							<tr>
								<td>윤리학과 <a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김윤리</td>
								<td>051-123-4004</td>
								<td></td>
							</tr>
							<tr>
								<td>교육학과<a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김교육</td>
								<td>051-123-4005</td>
								<td></td>
							</tr>
							<tr>
								<td>사회교육과<a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김사회</td>
								<td>051-123-4006</td>
								<td></td>
							</tr>
							<tr>
								<td>역사교육과<a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김역사</td>
								<td>051-123-4007</td>
								<td></td>
							</tr>
							<tr>
								<td>체육교육과<a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김체육</td>
								<td>051-123-4008</td>
								<td></td>
							</tr>
							<tr>
								<td>특수교육과<a href="#"><img src="../images/ico_link.png"
										alt="바로가기"></a></td>
								<td>김특수</td>
								<td>051-123-4009</td>
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