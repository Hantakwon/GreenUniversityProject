<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 목록</title>

<!-- 섹션별 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/manage/common/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/manage/common/aside.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/manage/common/footer.css">
<!-- 기존 공통/본문 CSS (테이블/검색/페이징 등) -->
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
					<h3>교수 목록</h3>
					<p>
						인사관리<strong>교수 목록</strong>
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
								<th>교수번호</th>
								<th>이름</th>
								<th>주민번호</th>
								<th>휴대폰</th>
								<th>이메일</th>
								<th>학과</th>
								<th>직위</th>
								<th>재직여부</th>
								<th>임용일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${dtoList}">
								<tr>
									<td>${dto.proNo}</td>
									<td>${dto.professorName}</td>
									<td>${dto.rrn}</td>
									<td>${dto.tel}</td>
									<td>${dto.email}</td>
									<td>${dto.departmentName}</td>
									<td>${dto.position}</td>
									<td><c:choose>
											<c:when test="${dto.statement eq '재직중'}">
												<span class="status status--ok">${dto.statement}</span>
											</c:when>
											<c:when test="${dto.statement eq '휴직'}">
												<span class="status status--hold">${dto.statement}</span>
											</c:when>
											<c:when test="${dto.statement eq '퇴직'}">
												<span class="status status--out">${dto.statement}</span>
											</c:when>
											<c:otherwise>
												<span class="status">${dto.statement}</span>
											</c:otherwise>
										</c:choose></td>
									<td><fmt:formatDate value="${dto.appointmentDate}"
											pattern="yyyy-MM-dd" /></td>
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
									href="${pageContext.request.contextPath}/manage/professor/list.do?page=1">
										<img
										src="${pageContext.request.contextPath}/resources/images/btn-first-page.png"
										alt=""> <span class="hide">FIRST</span>
								</a></li>
								<li class="prev pager"><a
									href="${pageContext.request.contextPath}manage/professor/list.do?page=${pagenationDTO.currentPage le 1 ? 1 : pagenationDTO.currentPage - 1}">
										<img
										src="${pageContext.request.contextPath}/resources/images/btn-prev-page.png"
										alt=""> <span class="hide">PREV</span>
								</a></li>

								<c:forEach var="num" begin="${pagenationDTO.pageGroupStart}"
									end="${pagenationDTO.pageGroupEnd}">
									<li><a
										href="${pageContext.request.contextPath}manage/professor/list.do?page=${num}"
										class="${pagenationDTO.currentPage eq num ? 'active' : ''}">${num}</a>
									</li>
								</c:forEach>

								<li class="next pager"><a
									href="${pageContext.request.contextPath}manage/professor/list.do?page=${pagenationDTO.currentPage ge pagenationDTO.lastPageNum ? pagenationDTO.lastPageNum : pagenationDTO.currentPage + 1}">
										<img
										src="${pageContext.request.contextPath}/resources/images/btn-next-page.png"
										alt=""> <span class="hide">NEXT</span>
								</a></li>
								<li class="last pager"><a
									href="${pageContext.request.contextPath}manage/professor/list.do?page=${pagenationDTO.lastPageNum}">
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
