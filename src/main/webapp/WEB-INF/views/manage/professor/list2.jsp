<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 목록</title>
</head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/manage/admin.css">
<body>
	<div id="admin-wrapper">
		<header>
			<nav>
				<div class="top-header-box" style="max-width: 1400px;">
					<ul>
						<li><a href="#" title="HOME 바로가기">HOME</a></li>
						<li><a href="#" title="사이트맵 보기" class="sitemap-btn">사이트맵</a></li>
						<li class="login"><a href="#">로그아웃</a></li>
					</ul>
				</div>
			</nav>
			<div>
				<div class="gnb">
					<a href="./index.html" class="logo"><img
						src="<%=request.getContextPath()%>/resources/images/admin_logo.png"
						alt="admin_logo" /></a>
				</div>
			</div>
		</header>
		<main>
			<aside>
				<!-- Global Navigation Bar -->
				<ul id="gnb">
					<li><a href="#"> <img
							src="<%=request.getContextPath()%>/resources/images/ico-admin-setting.png"
							alt="" class="icon"> 환경설정
					</a>
						<ol>
							<li><a href="./config/info.html">기본환경정보</a></li>
							<li><a href="./config/banner.html">약관관리</a></li>
						</ol></li>
					<li><a href="#"> <img
							src="<%=request.getContextPath()%>/resources/images/ico-admin-academic.png"
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
							src="<%=request.getContextPath()%>/resources/images/ico-admin-persons.png"
							alt="" class="icon"> 인사관리
					</a>
						<ol>
							<li><a href="#">학생 목록 및 등록</a></li>
							<li><a href="#">교수 목록 및 등록</a></li>
							<li><a href="#">임직원 목록 및 등록</a></li>
						</ol></li>
					<li><a href="#"> <img
							src="<%=request.getContextPath()%>/resources/images/ico-admin-college.png"
							alt="" class="icon"> 대학 및 학과
					</a>
						<ol>
							<li><a href="#">대학 및 학과 목록</a></li>
							<li><a href="#">대학 및 학과 등록</a></li>
						</ol></li>
					<li><a href="#"> <img
							src="<%=request.getContextPath()%>/resources/images/ico-admin-board.png"
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
			<section id="admin-index" class="main-mini-box">
				<nav>
					<h3>교수 목록</h3>
					<p>
						인사관리<strong>교수 목록</strong>
					</p>
				</nav>
				<article>
					<div class="search">
						<form method="get" action="#">
							<select>
								<option value="1">검색조건</option>
								<option value="1">과목코드</option>
								<option value="2">학과</option>
								<option value="3">과목명</option>
								<option value="4">교수</option>
							</select> <input type="text" name="keyword" placeholder="키워드 입력">
							<input type="submit" value="검색">
						</form>
					</div>
					<div class="bn-list-common01 type01 bn-common bn-common">
						<table class="board-table">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="13%">
								<col width="13%">
								<col width="">
								<col width="10%">
								<col width="10%">
								<col width="8%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">교수번호</th>
									<th scope="col">이름</th>
									<th scope="col">주민번호</th>
									<th scope="col">휴대폰</th>
									<th scope="col">이메일</th>
									<th scope="col">학과</th>
									<th scope="col">직위</th>
									<th scope="col">재직여부</th>
									<th scope="col">임용일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="dto" items="${dtoList}" varStatus="status">
									<tr class="">
										<td>${dto.proNo}</td>
										<td>${dto.professorName}</td>
										<td>${dto.rrn}</td>
										<td>${dto.tel}</td>
										<td>${dto.email}</td>
										<td>${dto.departmentName}</td>
										<td>${dto.position}</td>
										<td style="color: green;">${dto.statement}</td>
										<td>${dto.appointmentDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- 페이지 + 등록버튼 행 -->
					<div class="paging-row">
						<div class="b-paging01 type01">
							<div class="b-paging-wrap">
								<ul>
									<li class="first pager"><a
										href="${pageContext.request.contextPath}/admission/notice.do?page=1">
											<img
											src="${pageContext.request.contextPath}/resources/images/btn-first-page.png"
											alt=""><span class="hide">FIRST</span>
									</a></li>
									<li class="prev pager"><a
										href="${pageContext.request.contextPath}/admission/notice.do?page=${pagenationDTO.currentPage le 1 ? 1 : pagenationDTO.currentPage - 1}">
											<img
											src="${pageContext.request.contextPath}/resources/images/btn-prev-page.png"
											alt=""><span class="hide">PREV</span>
									</a></li>

									<c:forEach var="num" begin="${pagenationDTO.pageGroupStart}"
										end="${pagenationDTO.pageGroupEnd}">
										<li><a
											href="${pageContext.request.contextPath}/admission/notice.do?page=${num}"
											class="${pagenationDTO.currentPage eq num ? 'active' : ''}">${num}</a>
										</li>
									</c:forEach>

									<li class="next pager"><a
										href="${pageContext.request.contextPath}/admission/notice.do?page=${pagenationDTO.currentPage ge pagenationDTO.lastPageNum ? pagenationDTO.lastPageNum : pagenationDTO.currentPage + 1}">
											<img
											src="${pageContext.request.contextPath}/resources/images/btn-next-page.png"
											alt=""><span class="hide">NEXT</span>
									</a></li>
									<li class="last pager"><a
										href="${pageContext.request.contextPath}/admission/notice.do?page=${pagenationDTO.lastPageNum}">
											<img
											src="${pageContext.request.contextPath}/resources/images/btn-last-page.png"
											alt=""><span class="hide">LAST</span>
									</a></li>
								</ul>
							</div>
						</div>

						<!-- 등록 버튼 -->
						<button type="button" class="register-btn"
							onclick="location.href='${pageContext.request.contextPath}/manage/professor/register.do'">등록</button>
					</div>
	</div>
	</article>


	</section>
	</main>
	<footer>
		<div>
			<p>Copyright &copy;Green University All rights reserved.
				ADMINISTRATOR Version 1.4.1</p>
		</div>
	</footer>
	</div>
</body>
</html>