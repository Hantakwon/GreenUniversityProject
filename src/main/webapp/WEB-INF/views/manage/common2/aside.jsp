<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/manage/common/aside.css">
</head>
<body>
	<aside>
		<ul id="gnb">
			<li><a href="#"> <img
					src="${pageContext.request.contextPath}/resources/images/ico-admin-setting.png"
					alt="" class="icon"> 환경설정
			</a>
				<ol>
					<li><a
						href="${pageContext.request.contextPath}/manage/config/info.do">기본환경정보</a></li>
					<li><a
						href="${pageContext.request.contextPath}/manage/config/terms.do">약관관리</a></li>
				</ol></li>
			<li><a href="#"> <img
					src="${pageContext.request.contextPath}/resources/images/ico-admin-academic.png"
					alt="" class="icon"> 학사운영
			</a>
				<ol>
					<li><a href="#">교육 운영 현황</a></li>
					<li><a href="#">학년별 학생 현황</a></li>
					<li><a href="#">학과별 학생 현황</a></li>
					<li><a href="#">강의 목록</a></li>
					<li><a href="#">강의 등록</a></li>
					<li><a href="#">수강 현황</a></li>
				</ol></li>
			<li><a href="#"> <img
					src="${pageContext.request.contextPath}/resources/images/ico-admin-persons.png"
					alt="" class="icon"> 인사관리
			</a>
				<ol>
					<li><a
						href="${pageContext.request.contextPath}/manage/student/list.do">학생
							목록 및 등록</a></li>
					<li><a
						href="${pageContext.request.contextPath}/manage/professor/list.do">교수
							목록 및 등록</a></li>
					<li><a href="#">임직원 목록 및 등록</a></li>
				</ol></li>
			<li><a href="#"> <img
					src="${pageContext.request.contextPath}/resources/images/ico-admin-college.png"
					alt="" class="icon"> 대학 및 학과
			</a>
				<ol>
					<li><a href="#">대학 및 학과 목록</a></li>
					<li><a href="#">대학 및 학과 등록</a></li>
				</ol></li>
			<li><a href="#"> <img
					src="${pageContext.request.contextPath}/resources/images/ico-admin-board.png"
					alt="" class="icon"> 게시판관리
			</a>
				<ol>
					<li><a href="#">입학안내 공지사항</a></li>
					<li><a href="#">학사안내 공지사항</a></li>
					<li><a href="#">커뮤니티 공지사항</a></li>
					<li><a href="#">입학상담</a></li>
					<li><a href="#">질문 및 답변</a></li>
					<li><a href="#">식단안내</a></li>
					<li><a href="#">자료실</a></li>
				</ol></li>
		</ul>
	</aside>
</html>