<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/academic/notice.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/academic/hyokongmain.css">
</head>
<!-- 
	날짜 : 2025/09/04
	이름 : 한탁원
	내용 : 게시판, 페이지 수정
-->
<body>
	<jsp:include page="../../header.jsp"/>

	<main>
		<div>
			<div class="info">
				<span id="test"> <img
					src="<%=request.getContextPath()%>/resources/images/ico-home.png"
					alt="홈 버튼"> > 학사안내 > 공지사항
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
							<li class="active"><a href="/academic/notice.do">공지사항</a></li>
							<li><a href="/academic/calander.do">학사일정</a></li>
							<li><a href="/academic/registration.do">수강신청</a></li>
							<li><a href="/academic/grade.do">성적</a></li>
							<li><a href="/academic/graduation.do">수료 및 졸업</a></li>
							<li><a href="/academic/faq.do">자주 묻는 질문</a></li>
						</ul>
					</div>
				</div>
				<div class="main-content">
					<div class="top">
						<h2>공지사항</h2>
					</div>
					<!-- 🔍 공지사항 검색  시작 -->
					<div class="search-container">
						<div class="search-div">
							<form action="/academic/notice/search.do" method="get">
								<select name="searchType">
									<option value="title">제목</option>
									<option value="writer">작성자</option>
									<option value="content">내용</option>
								</select> <input type="text" name="keyword" placeholder="검색어를 입력하세요">
								<button type="submit">검색</button>
							</form>
						</div>
					</div>

					<!-- 📋 공지사항 목록 테이블 시작 -->
					<div class="notice-list-wrapper">
						<div class="notice-list">
							<table>
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dto" items="${dtoList}" varStatus="status">
										<tr>
											<td>${pagenationDTO.currentPageStartNum - status.index}</td>
											<td><a href="#">${dto.title}</a></td>
											<td>${dto.writer}</td>
											<td>${dto.created_at}</td>
											<td>${dto.views}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<div class="page-wrapper">
					  <div class="page">
					
					    <!-- 첫 페이지 -->
					    <c:choose>
					      <c:when test="${pagenationDTO.currentPage > 1}">
					        <a href="${pageContext.request.contextPath}/academic/notice.do?page=1">
					          <img src="${pageContext.request.contextPath}/resources/images/btn-first-page.png"
					               alt="첫 페이지" class="pagination-arrow first">
					        </a>
					      </c:when>
					      <c:otherwise>
					        <img src="${pageContext.request.contextPath}/resources/images/btn-first-page.png"
					             alt="첫 페이지" class="pagination-arrow first disabled">
					      </c:otherwise>
					    </c:choose>
					
					    <!-- 이전 페이지 (currentPage - 1) -->
					    <c:choose>
					      <c:when test="${pagenationDTO.currentPage > 1}">
					        <a href="${pageContext.request.contextPath}/academic/notice.do?page=${pagenationDTO.currentPage - 1}">
					          <img src="${pageContext.request.contextPath}/resources/images/btn-prev-page.png"
					               alt="이전 페이지" class="pagination-arrow prev">
					        </a>
					      </c:when>
					      <c:otherwise>
					        <img src="${pageContext.request.contextPath}/resources/images/btn-prev-page.png"
					             alt="이전 페이지" class="pagination-arrow prev disabled">
					      </c:otherwise>
					    </c:choose>
					
					    <!-- 페이지 번호 -->
					    <c:forEach var="num" begin="${pagenationDTO.pageGroupStart}" end="${pagenationDTO.pageGroupEnd}">
					      <a href="${pageContext.request.contextPath}/academic/notice.do?page=${num}"
					         class="page-btn ${pagenationDTO.currentPage == num ? 'active' : ''}">
					        ${num}
					      </a>
					    </c:forEach>
					
					    <!-- 다음 페이지 (currentPage + 1) -->
					    <c:choose>
					      <c:when test="${pagenationDTO.currentPage < pagenationDTO.lastPageNum}">
					        <a href="${pageContext.request.contextPath}/academic/notice.do?page=${pagenationDTO.currentPage + 1}">
					          <img src="${pageContext.request.contextPath}/resources/images/btn-next-page.png"
					               alt="다음 페이지" class="pagination-arrow next">
					        </a>
					      </c:when>
					      <c:otherwise>
					        <img src="${pageContext.request.contextPath}/resources/images/btn-next-page.png"
					             alt="다음 페이지" class="pagination-arrow next disabled">
					      </c:otherwise>
					    </c:choose>
					
					    <!-- 마지막 페이지 -->
					    <c:choose>
					      <c:when test="${pagenationDTO.currentPage < pagenationDTO.lastPageNum}">
					        <a href="${pageContext.request.contextPath}/academic/notice.do?page=${pagenationDTO.lastPageNum}">
					          <img src="${pageContext.request.contextPath}/resources/images/btn-last-page.png"
					               alt="마지막 페이지" class="pagination-arrow last">
					        </a>
					      </c:when>
					      <c:otherwise>
					        <img src="${pageContext.request.contextPath}/resources/images/btn-last-page.png"
					             alt="마지막 페이지" class="pagination-arrow last disabled">
					      </c:otherwise>
					    </c:choose>
					
					  </div>
					</div>
					<!-- 
					<div class="page-wrapper">
						<div class="page">
							<img
								src="<%=request.getContextPath()%>/resources/images/btn-first-page.png"
								alt="첫 페이지" class="pagination-arrow first"> <img
								src="<%=request.getContextPath()%>/resources/images/btn-prev-page.png"
								alt="이전 페이지" class="pagination-arrow prev">
							<button class="page-btn active">1</button>
							<button class="page-btn">2</button>
							<button class="page-btn">3</button>
							<img
								src="<%=request.getContextPath()%>/resources/images/btn-next-page.png"
								alt="다음 페이지" class="pagination-arrow next"> <img
								src="<%=request.getContextPath()%>/resources/images/btn-last-page.png"
								alt="마지막 페이지" class="pagination-arrow last">
						</div>
					</div>
					-->
				</div>
			</div>
		</div>
	</main>

	<jsp:include page="../../footer.jsp" />
</body>
</html>