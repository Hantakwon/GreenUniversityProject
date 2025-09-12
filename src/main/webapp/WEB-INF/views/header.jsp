<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!--
    날짜 : 2025/09/03
    이름 : 한탁원
    내용 : header 수정
-->
<!--
    날짜 : 2025/09/11
    이름 : 정순권
    내용 : header 수정
-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common/header.css">
<body>
	<header>
		<div class="top-header-wrap">
			<div class="top-header-box">
				<ul>
					<li><a href="/" title="HOME 바로가기">HOME</a></li>
					<li><a href="#" title="사이트맵 보기" class="sitemap-btn">사이트맵</a></li>
					<li class="login"><a href="/member/login.do">로그인</a></li>
					<li class="login"><a href="/stusup/course_reg.do">학생지원</a></li>
				</ul>
			</div>
		</div>
		<div class="bottom-header-wrap">
			<div class="bottom-header-box">
				<h1>
					<a href="/" title="그린대학교 바로가기"> <img
						src="/resources/images/header_logo.png" alt="그린대학교">
					</a>
				</h1>
				<div class="gnb">
					<ul class="gnb-ul jwxe-menu-ul">
						<li><a href="/introduce/greeting.do">대학소개</a>
							<ul class="sub-mn">
								<li><a href="/introduce/greeting.do">총장 인사말</a></li>
								<li><a href="/introduce/ideology.do">교육이념</a></li>
								<li><a href="/introduce/history.do">연혁</a></li>
								<li><a href="/introduce/organization.do">조직도</a></li>
								<li><a href="/introduce/direction.do">오시는길</a></li>
							</ul></li>
						<li><a href="/admission/notice.do">입학안내</a>
							<ul class="sub-mn">
								<li><a href="/admission/notice.do">공지사항</a></li>
								<li><a href="/admission/rolling.do">수시모집</a></li>
								<li><a href="/admission/regular.do">정시모집</a></li>
								<li><a href="/admission/transfer.do">편입학</a></li>
								<li><a href="/admission/consult.do">입학상담</a></li>
							</ul></li>
						<li><a href="/college/human.do">대학·대학원</a>
							<ul class="sub-mn">
								<li><a href="/college/human.do">인문사회대학</a></li>
								<li><a href="/college/science.do">자연과학대학</a></li>
								<li><a href="/college/engineering.do">공과대학</a></li>
								<li><a href="/college/education.do">사범대학</a></li>
								<li><a href="/college/graduate.do">대학원</a></li>
							</ul></li>
						<li><a href="/academic/notice.do">학사안내</a>
							<ul class="sub-mn">
								<li><a href="/academic/notice.do">공지사항</a></li>
								<li><a href="/academic/calander.do">학사일정</a></li>
								<li><a href="/academic/registration.do">수강신청</a></li>
								<li><a href="/academic/grade.do">성적</a></li>
								<li><a href="/academic/graduation.do">수료 및 졸업</a></li>
								<li><a href="/academic/faq.do">자주묻는질문</a></li>
							</ul></li>
						<li><a href="/collegelife/studentunion.do">대학생활</a>
							<ul class="sub-mn">
								<li><a href="/collegelife/studentunion.do">학생회소개</a></li>
								<li><a href="/collegelife/clud.do">동아리/스터디</a></li>
								<li><a href="/collegelife/meal.do">식단안내</a></li>
								<li><a href="/collegelife/gallery.do">갤러리</a></li>
							</ul></li>
						<li><a href="/community/notice.do">커뮤니티</a>
							<ul class="sub-mn">
								<li><a href="/community/notice.do">공지사항</a></li>
								<li><a href="/community/news.do">뉴스 및 칼럼</a></li>
								<li><a href="/community/job.do">취업정보</a></li>
								<li><a href="/community/free.do">자유게시판</a></li>
								<li><a href="/community/qna.do">질문과 답변</a></li>
								<li><a href="/community/data.do">자료실</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</header>

</body>
</html>