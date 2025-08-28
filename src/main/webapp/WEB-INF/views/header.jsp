<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
    <!--
        날짜 : 2025/08/27
        이름 : 한탁원
        내용 : header 작성
    -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css">
</head>
<body>
	<header>
		<div>
			<div class="top">
				<p>
					<a href="#">HOME&nbsp&nbsp&nbsp|</a>
					<a href="#">&nbsp&nbsp&nbsp사이트맵&nbsp&nbsp&nbsp|</a>
					<a href="#">&nbsp&nbsp&nbsp로그인&nbsp&nbsp&nbsp|</a>
					<a href="#">&nbsp&nbsp&nbsp학생지원</a>
				</p>
			</div>
		</div>
		<!-- 로고 + 네비게이션 -->
		<div>
			<div class="nav-container">
				<a href="#"><img src="<%=request.getContextPath()%>/resources/images/header_logo.png" alt="학교 로고">
					<nav>
						<ul>
							<li>대학소개
								<ul class="submenu">
									<li><a href="#">총장 인사말</a></li>
									<li><a href="#">교육이념</a></li>
									<li><a href="#">연혁</a></li>
									<li><a href="#">조직도</a></li>
									<li><a href="#">오시는길</a></li>
								</ul>
							</li>
							<li>입학안내
								<ul class="submenu">
									<li><a href="#">공지사항</a></li>
									<li><a href="#">수시모집</a></li>
									<li><a href="#">정시모집</a></li>
									<li><a href="#">편입학</a></li>
									<li><a href="#">입학상담</a></li>
								</ul>
							</li>
							<li>대학·대학원
								<ul class="submenu">
									<li><a href="#">인문사회대학</a></li>
									<li><a href="#">자연과학대학</a></li>
									<li><a href="#">공과대학</a></li>
									<li><a href="#">사범대학</a></li>
									<li><a href="#">대학원</a></li>
								</ul>
							</li>
							<li>학사안내
								<ul class="submenu">
									<li><a href="#">공지사항</a></li>
									<li><a href="#">학사일정</a></li>
									<li><a href="#">수강신청</a></li>
									<li><a href="#">성적</a></li>
									<li><a href="#">수료 및 졸업</a></li>
									<li><a href="#">자주묻는질문</a></li>
								</ul>
							</li>
							<li>대학생활
								<ul class="submenu">
									<li><a href="#">학생회소개</a></li>
									<li><a href="#">동아리/스터디</a></li>
									<li><a href="#">식단안내</a></li>
									<li><a href="#">갤러리</a></li>
								</ul>
							</li>
							<li>커뮤니티
								<ul class="submenu">
									<li><a href="#">공지사항</a></li>
									<li><a href="#">뉴스 및 일정</a></li>
									<li><a href="#">취업정보</a></li>
									<li><a href="#">자유게시판</a></li>
								</ul>
							</li>
						</ul>
					</nav>
			</div>
		</div>
	</header>
</body>
</html>
