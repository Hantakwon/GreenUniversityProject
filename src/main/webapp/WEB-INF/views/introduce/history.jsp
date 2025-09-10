<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/introduce/common.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/introduce/introduce.css">
</head>


<!--
	날짜 : 2025/09/05
    이름 : 한탁원
    내용 : 연혁
-->

<body class="introduce-page">
	<jsp:include page="../header.jsp" />
	<div class="path-wrap">
		<div class="path-box">
			<div class="jwxe_navigator jw-relative">
				<ul>
					<li><a href="#"><img src="../resources/images/ico-home.png" alt="home" /></a></li>
					<li><a href="#">대학소개</a></li>
					<li>연혁</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="sub-container">
		<div class="lnb-wrap">
			<div class="lnb">
				<div class="lnb-title-box">
					<div>
						<h2>대학소개</h2>
					</div>
				</div>

				<ul class="lnb-menu jwxe-menu-ul">
					<li><a href="/introduce/greeting.do">총장 인사말</a></li>

					<li><a href="/introduce/ideology.do">교육이념</a></li>
 
					<li class="active"><a href="/introduce/history.do" class="active">연혁</a></li>

					<li><a href="/introduce/organization.do">조직도</a></li>

					<li><a href="/introduce/direction.do">오시는길</a></li>
				</ul>
			</div>
		</div>
		<div class="content-wrap">

			<div class="title">
				<div class="jwxe_mnu_template jw-relative page-title">
					<h3>연혁</h3>
				</div>
			</div>
			<div class="content" id="jwxe_main_content">
				<div class="content-box">
					<div class="year">2025년</div>
				    <div class="month">3월</div>
				    <div class="event">- 학부대학 신설</div>
				
				    <div class="divider"></div>
				
				    <div class="year">2024년</div>
				    <div class="month">3월</div>
				    <div class="event">- 데이터사이언스전문대학원 신설</div>
				    <div class="month">5월</div>
				    <div class="event">- 제22대 총장 최그린 박사 취임</div>
				    <div class="month">9월</div>
				    <div class="event">- 융합의생명과학대학원 신설</div>
				
				    <div class="divider"></div>
				
				    <div class="year">2023년</div>
				    <div class="month">3월</div>
				    <div class="event">- 학사조직개편 (생활환경대학 → 생활과학대학으로 개편, 스포츠과학부 → 스포츠과학과로 변경)</div>
				    <div class="month">11월</div>
				    <div class="event">- 글로컬대학 선정 (2027년 그린교대와 통합)</div>
				
				    <div class="divider"></div>
				
				    <div class="year">2022년</div>
				    <div class="month">4월</div>
				    <div class="event">- 그린2캠퍼스 나노생명과학도서관 리모델링 개관</div>
				    <div class="month">4월</div>
				    <div class="event">- 그린캠퍼스 새벽벌도서관 1층 리모델링 개관</div>
				    <div class="month">12월</div>
				    <div class="event">- 그린캠퍼스 새벽벌도서관 24시간 열람 공간 '새벽 별당' 개관</div>
				
				    <div class="divider"></div>
				
				    <div class="year">2020년</div>
				    <div class="month">3월</div>
				    <div class="event">- 정보의생명공학대학 신설</div>
				    <div class="month">5월</div>
				    <div class="event">- 제21대 총장 차그린 박사 취임</div>
								
				
				
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>