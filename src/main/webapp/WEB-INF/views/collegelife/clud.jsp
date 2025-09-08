<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 
	날짜 :
	이름 : 박효빈
	내용 : 동아리/스터디
-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/academic/academic.css">

<body>
	<main>
		<div>
			<div class="info">
				<span id="test">
					<img src="./images/ico-home.png" alt="홈 버튼">
					> 대학생활 > 학생회 소개
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
							<li class="#"><a href="#">학생회 소개</a></li>
							<li class="active"><a href="#">동아리/스터디</a></li>
							<li><a href="#">식단안내</a></li>
							<li><a href="#">갤러리</a></li>
						
						</ul>
					</div>
				</div>
				<div class="main-content">
					<div class="top">
						<h2>동아리/스터디</h2>
					</div>
					<!-- 🔍 공지사항 검색  시작 -->
							<div class="bold-ment">
						
						<img src="./images/bullet-h4.png" alt="bullet-h4 이미지">
						<h4 class="span-bold">내용 추가 필요</h4>
						<div class="ment1">
							
							<span class="bold-span-highlight">- 내용 추가 필요</span>
							1) 내용 추가 필요<br>
							2) 내용 추가 필요<br>
							3) 내용 추가 필요<br>
							<br>
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>