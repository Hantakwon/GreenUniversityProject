<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
	날짜 :
	이름 : 박효빈
	내용 : 수강신청
-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/academic/registration.css">
</head>
<body>
	<main>
	<jsp:include page="../header.jsp" />
		<div>
			<div class="info">
				<span id="test"> <img src="<%=request.getContextPath()%>/resources/images/ico-home.png" alt="홈 버튼">
					> 학사안내 > 수강신청
				</span>
			</div>
		</div>
		<div>
			<div class="content-wrapper">
				<div class="sidebar">
					<div class="top">
						<h1>학사안내</h1>
					</div>
					<div class="bottom">
						<ul>
							<li class="#"><a href="./학사안내-공지사항.html">공지사항</a></li>
							<li class="#"><a href="./학사안내-학사일정.html">학사일정</a></li>
							<li class="active"><a href="./학사안내-수강신청.html">수강신청</a></li>
							<li><a href="#">성적</a></li>
							<li><a href="#">수료 및 졸업</a></li>
							<li><a href="#">자주 묻는 질문</a></li>
						</ul>
					</div>
				</div>
				<div class="main-content">
					<div class="top">
						<h2>수강신청</h2>
					</div>
					<div class="bold-ment">
						<img src="<%=request.getContextPath()%>/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
						<h4 class="span-bold">수강신청기간</h4>
						<div class="ment1">
							- 매학기 수강신청은 개강 전에 실시, 학생은 수강신청 공고를 충분히 숙지한 다음, 수강신청 기간에 인터넷을 통해
							신청과목을 입력<br> - 필요한 경우 학과사무실의 학사상담이나 지도교수의 지도를 받을 수 있으며, 반드시
							학년별 지정된 날짜에 수강신청 완료<br> - 자세한 설명은 학사일정 공지사항 게시판 참조
						</div>
						<img src="<%=request.getContextPath()%>/resources/images/bullet-h4.png" alt="bullet-h4 이미지">
						<h4 class="span-bold">수강신청 학점</h4>
						<div class="ment2">- 학기당 이수학점 : 18학점 이내(논문과목 별도) [대학 학칙
							제20조]</div>
					</div>
					<div class="bottom">
						<p>컨텐츠 내용 구역입니다.</p>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>