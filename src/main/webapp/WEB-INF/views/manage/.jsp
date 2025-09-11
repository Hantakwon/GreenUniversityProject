<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 목록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/manage/admin.css">
</head>
<body>
	<div id="admin-wrapper">

		<jsp:include page="../common2/header.jsp" />

		<main>
			<!-- 공통 aside 인클루드 -->
			<jsp:include page="../common2/aside.jsp" />

			<!-- 메인 컨텐츠 -->
			<section id="admin-index" class="main-mini-box">
				<!-- 페이지 툴바 -->
				<nav class="page-toolbar">
					<h3>강의 목록</h3>
					<p>
						학사운영&nbsp;>&nbsp;<strong>강의 목록</strong>
					</p>

					<!-- 검색 -->
					<div class="search">
						<form method="get"
							action="${pageContext.request.contextPath}/manage/student/list.do">
							<select name="searchType" class="search__select">
								<option value="std_no"
									${param.searchType=='std_no'   ? 'selected' : ''}>학번</option>
								<option value="name_kor"
									${param.searchType=='name_kor' ? 'selected' : ''}>이름</option>
								<option value="dept_name"
									${param.searchType=='dept_name'? 'selected' : ''}>학과</option>
							</select> <input type="text" name="keyword" value="${param.keyword}"
								placeholder="키워드 입력" class="search__input">
							<button type="submit" class="search__btn">검색</button>
						</form>
					</div>
				</nav>

				<!-- 목록 표 -->
				<article>
					<div class="bn-list-common01 type01 bn-common">
						<table class="board-table">
							<colgroup>
								<col width="8%">
								<col width="8%">
								<col width="6%">
								<col width="8%">
								<col width="13%">
								<col width="6%">
								<col width="6%">
								<col width="13%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>과목코드</th>
									<th>학과</th>
									<th>학년</th>
									<th>구분</th>
									<th>과목명</th>
									<th>교수</th>
									<th>학점</th>
									<th>수업시간</th>
									<th>강의실</th>
									<th>최대 수강 인원</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty dtoList}">
										<tr>
											<td colspan="9" style="text-align: center;">조회된 강의가
												없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="dto" items="${dtoList}">
											<tr>
												<td>${dto.lec_no}</td>
												<td>${dto.dept_name}</td>
												<td>${dto.grade}</td>
												<td>${dto.category}</td>
												<td>${dto.lec_name}</td>
												<td>${dto.professor_name}</td>
												<td>${dto.credit}</td>
												<td>${dto.schedule}</td>
												<td>${dto.classroom}</td>
												<td>${dto.max_enrollment}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>

					<!-- 페이징 + 등록 버튼 -->
					<div class="paging-row">
						<div class="b-paging01 type01">
							<div class="b-paging-wrap">
								<ul>
									<li class="first pager"><a
										href="${pageContext.request.contextPath}/manage/student/list.do?page=1">
											<span class="hide">FIRST</span>
									</a></li>
									<li class="prev pager"><a
										href="${pageContext.request.contextPath}/manage/student/list.do?page=${pagenationDTO.currentPage le 1 ? 1 : pagenationDTO.currentPage - 1}">
											<span class="hide">PREV</span>
									</a></li>

									<c:forEach var="num" begin="${pagenationDTO.pageGroupStart}"
										end="${pagenationDTO.pageGroupEnd}">
										<li><a
											href="${pageContext.request.contextPath}/manage/student/list.do?page=${num}"
											class="${pagenationDTO.currentPage eq num ? 'active' : ''}">${num}</a>
										</li>
									</c:forEach>

									<li class="next pager"><a
										href="${pageContext.request.contextPath}/manage/student/list.do?page=${pagenationDTO.currentPage ge pagenationDTO.lastPageNum ? pagenationDTO.lastPageNum : pagenationDTO.currentPage + 1}">
											<span class="hide">NEXT</span>
									</a></li>
									<li class="last pager"><a
										href="${pageContext.request.contextPath}/manage/student/list.do?page=${pagenationDTO.lastPageNum}">
											<span class="hide">LAST</span>
									</a></li>
								</ul>
							</div>
						</div>

						<button type="button" class="register-btn"
							onclick="location.href='${pageContext.request.contextPath}/manage/lecture/register.do'">등록</button>
					</div>
				</article>
			</section>
		</main>
		<jsp:include page="/WEB-INF/views/manage/common2/footer.jsp" />

	</div>
</body>
</html>
