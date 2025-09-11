<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/manage/admin.css">
</head>
<body>
	<div id="admin-wrapper">

		<jsp:include page="../common2/header.jsp" />

		<main>
			<jsp:include page="../common2/aside.jsp" />

			<section id="admin-index" class="main-mini-box">
				<!-- 검색 영역 -->
				<nav class="page-toolbar">
					<h3>학생 목록</h3>
					<p>
						인사관리<strong>학생 목록</strong>
					</p>

					<div class="search">
						<form method="get"
							action="${pageContext.request.contextPath}/manage/student/list.do">
							<select name="searchType" class="search__select">
								<option value="std_no"
									${param.searchType=='std_no'?'selected':''}>학번</option>
								<option value="name_kor"
									${param.searchType=='name_kor'?'selected':''}>이름</option>
								<option value="dept_name"
									${param.searchType=='dept_name'?'selected':''}>학과</option>
							</select> <input type="text" name="keyword" value="${param.keyword}"
								placeholder="키워드 입력" class="search__input">
							<button type="submit" class="search__btn">검색</button>
						</form>
					</div>
				</nav>

				<!-- 목록 표 -->
				<div class="bn-list-common01 type01 bn-common">
					<table class="board-table">
						<colgroup>
							<col width="12%">
							<!-- 학번 -->
							<col width="10%">
							<!-- 이름 -->
							<col width="13%">
							<!-- 주민번호 -->
							<col width="13%">
							<!-- 휴대폰 -->
							<col width="">
							<!-- 이메일 -->
							<col width="12%">
							<!-- 학과 -->
							<col width="6%">
							<!-- 학년 -->
							<col width="6%">
							<!-- 학기 -->
							<col width="8%">
							<!-- 상태 -->
						</colgroup>
						<thead>
							<tr>
								<th>학번</th>
								<th>이름</th>
								<th>주민번호</th>
								<th>휴대폰</th>
								<th>이메일</th>
								<th>학과</th>
								<th>학년</th>
								<th>학기</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty dtoList}">
									<tr>
										<td colspan="9" style="text-align: center;">조회된 학생이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="dto" items="${dtoList}">
										<tr>
											<td>${dto.std_no}</td>
											<td>${dto.name_kor}</td>
											<td>${dto.rrn}</td>
											<td>${dto.tel}</td>
											<td>${dto.email}</td>
											<td><c:choose>
													<c:when test="${not empty dto.dept_name}">${dto.dept_name}</c:when>
													<c:otherwise>${dto.dept_id}</c:otherwise>
												</c:choose></td>
											<td>${dto.grade}</td>
											<td>${dto.semester}</td>
											<td><c:choose>
													<c:when
														test="${dto.statement eq '재학' || dto.statement eq '재학중'}">
														<span class="status status--ok">${dto.statement}</span>
													</c:when>
													<c:when
														test="${dto.statement eq '휴학' || dto.statement eq '휴학중'}">
														<span class="status status--hold">${dto.statement}</span>
													</c:when>
													<c:when test="${dto.statement eq '졸업'}">
														<span class="status status--info">${dto.statement}</span>
													</c:when>
													<c:when
														test="${dto.statement eq '자퇴' || dto.statement eq '제적'}">
														<span class="status status--out">${dto.statement}</span>
													</c:when>
													<c:otherwise>
														<span class="status">${dto.statement}</span>
													</c:otherwise>
												</c:choose></td>
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
										<img
										src="${pageContext.request.contextPath}/resources/images/btn-first-page.png"
										alt=""> <span class="hide">FIRST</span>
								</a></li>
								<li class="prev pager"><a
									href="${pageContext.request.contextPath}/manage/student/list.do?page=${pagenationDTO.currentPage le 1 ? 1 : pagenationDTO.currentPage - 1}">
										<img
										src="${pageContext.request.contextPath}/resources/images/btn-prev-page.png"
										alt=""> <span class="hide">PREV</span>
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
										<img
										src="${pageContext.request.contextPath}/resources/images/btn-next-page.png"
										alt=""> <span class="hide">NEXT</span>
								</a></li>
								<li class="last pager"><a
									href="${pageContext.request.contextPath}/manage/student/list.do?page=${pagenationDTO.lastPageNum}">
										<img
										src="${pageContext.request.contextPath}/resources/images/btn-last-page.png"
										alt=""> <span class="hide">LAST</span>
								</a></li>
							</ul>
						</div>
					</div>

					<button type="button" class="register-btn"
						onclick="location.href='${pageContext.request.contextPath}/manage/student/register.do'">등록</button>
				</div>

			</section>
		</main>

		<jsp:include page="/WEB-INF/views/manage/common2/footer.jsp" />

	</div>
</body>
</html>
