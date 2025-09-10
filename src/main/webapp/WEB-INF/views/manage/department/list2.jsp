<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/manage/admin.css">
</head>
<body>
	<div id="admin-wrapper">

		<jsp:include page="../common2/header.jsp" />

		<main>
			<jsp:include page="../common2/aside.jsp" />

			<section id="admin-index" class="main-mini-box">
				<!-- ⬇️ 검색창을 nav 안으로 이동 -->
				<nav class="page-toolbar">
					<h3>학과 목록</h3>
					<p>
						대학 및 학과<strong>학과 목록</strong>
					</p>

					<div class="search">
						<form method="get" action="#">
							<select name="searchType" class="search__select">
								<option value="pro_name"
									${param.searchType=='pro_name'?'selected':''}>교수</option>
								<option value="dept_name"
									${param.searchType=='dept_name'?'selected':''}>학과</option>
							</select> <input type="text" name="keyword" value="${param.keyword}"
								placeholder="키워드 입력" class="search__input">
							<button type="submit" class="search__btn">검색</button>
						</form>
					</div>
				</nav>

				<!-- 표 -->
				<div class="bn-list-common01 type01 bn-common">
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
								<th>학과번호</th>
								<th>단과대학</th>
								<th>학과</th>
								<th>학과장</th>
								<th>학과 연락처</th>
								<th>소속 교수 수</th>
								<th>소속 학생 수</th>
								<th>개설 강의 수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${dtoList}">
								<tr>
									<td>${dto.dept_no}</td>
									<td>${dto.col_name}</td>
									<td>${dto.dept_name}</td>
									<td>-</td>
									<td>${dto.dept_tel}</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- 페이징 + 등록 버튼 -->
				<div class="paging-row">
					<div class="b-paging01 type01">
						<div class="b-paging-wrap">
							<ul>
								<li class="first pager"><a
									href="${pageContext.request.contextPath}/manage/department/list.do?page=1">
										<img
										src="${pageContext.request.contextPath}/resources/images/btn-first-page.png"
										alt=""> <span class="hide">FIRST</span>
								</a></li>
								<li class="prev pager"><a
									href="${pageContext.request.contextPath}manage/department/list.do?page=${pagenationDTO.currentPage le 1 ? 1 : pagenationDTO.currentPage - 1}">
										<img
										src="${pageContext.request.contextPath}/resources/images/btn-prev-page.png"
										alt=""> <span class="hide">PREV</span>
								</a></li>

								<c:forEach var="num" begin="${pagenationDTO.pageGroupStart}"
									end="${pagenationDTO.pageGroupEnd}">
									<li><a
										href="${pageContext.request.contextPath}manage/department/list.do?page=${num}"
										class="${pagenationDTO.currentPage eq num ? 'active' : ''}">${num}</a>
									</li>
								</c:forEach>

								<li class="next pager"><a
									href="${pageContext.request.contextPath}manage/department/list.do?page=${pagenationDTO.currentPage ge pagenationDTO.lastPageNum ? pagenationDTO.lastPageNum : pagenationDTO.currentPage + 1}">
										<img
										src="${pageContext.request.contextPath}/resources/images/btn-next-page.png"
										alt=""> <span class="hide">NEXT</span>
								</a></li>
								<li class="last pager"><a
									href="${pageContext.request.contextPath}manage/department/list.do?page=${pagenationDTO.lastPageNum}">
										<img
										src="${pageContext.request.contextPath}/resources/images/btn-last-page.png"
										alt=""> <span class="hide">LAST</span>
								</a></li>
							</ul>
						</div>
					</div>

					<button type="button" class="register-btn"
						onclick="location.href='${pageContext.request.contextPath}/manage/professor/register.do'">등록</button>
				</div>
			</section>
		</main>

		<jsp:include page="/WEB-INF/views/manage/common2/footer.jsp" />

	</div>
</body>
</html>