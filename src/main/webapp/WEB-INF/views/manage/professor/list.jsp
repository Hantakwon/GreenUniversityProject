<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 목록</title>
</head>
<!-- 
	날짜 :
	이름 : 김수진
	내용 : 
-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/manage/style.css">
<script
	src="<%=request.getContextPath()%>/resources/js/manage/script.js"></script>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/sidebar.jsp" />

	<div class="mainWrap">
		<div class="page">
			<div class="page-head">
				<div class="title">교수 목록</div>
				<div class="breadcrumb">
					인사관리 &gt; <a href="professorList.html">교수 목록</a>
				</div>
			</div>

			<form method="get" action="/admission/notice/search.do">
				<fieldset class="b-search-wrap">
					<legend class="hide">게시글 검색</legend>

					<div class="b-sel-box b-cate-basic">
						<label for="search_type" class="hide">검색분류선택</label> <a
							href="#search" class="b-sel-title">전체</a>

						<!-- ★ name/id를 searchType 으로 변경 -->
						<input type="hidden" name="searchType" id="search_type" value="">

						<ul>
							<li class="selected"><a href="#search" class="searchOption"
								title="전체" data-value="">전체</a></li>
							<li><a href="#search" class="searchOption" title="교수이름"
								data-value="pro_name">교수이름</a></li>
							<li><a href="#search" class="searchOption" title="학과이름"
								data-value="dept_name">학과이름</a></li>
						</ul>
					</div>

					<!-- 키워드 입력: name을 keyword 로 -->
					<label for="keyword" class="b-sel-label"><span>검색어</span></label> <input
						type="text" id="keyword" name="keyword" placeholder="검색어를 입력해 주세요">

					<button type="submit" class="b-sel-btn">검색</button>
				</fieldset>
			</form>

			<section class="panel">
				<div class="panel-body">
					<table class="table">
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
							<c:forEach var="dto" items="${dtoList}" varStatus="status">
								<tr>
									<td>${dto.proNo }</td>
									<td>${dto.professorName}</td>
									<td>${dto.rrn}</td>
									<td>${dto.tel}</td>
									<td class="tl">${dto.email}</td>
									<td>${dto.departmentName}</td>
									<td>${dto.position}</td>
									<td class="status ok">${dto.statement}</td>
									<td>${dto.appointmentDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>

			<div class="b-paging01 type03">
				<div class="b-paging01 type01">
					<div class="b-paging-wrap">
						<ul>
							<li class="first pager"><a
								href="/admission/notice.do?page=1"> <img
									src="../resources/images/btn-first-page.png" alt="" /> <span
									class="hide">FIRST</span>
							</a></li>

							<li class="prev pager"><a
								href="/admission/notice.do?page=${pagenationDTO.currentPage le 1 ? 1 : pagenationDTO.currentPage - 1}">
									<img src="../resources/images/btn-prev-page.png" alt="" /> <span
									class="hide">PREV</span>
							</a></li>

							<!-- 페이지 번호 -->
							<c:forEach var="num" begin="${pagenationDTO.pageGroupStart}"
								end="${pagenationDTO.pageGroupEnd}">
								<li><a
									href="${pageContext.request.contextPath}/admission/notice.do?page=${num}"
									class="${pagenationDTO.currentPage eq num ? ' active' : ''}">
										${num} </a></li>
							</c:forEach>

							<li class="next pager"><a
								href="/admission/notice.do?page=${pagenationDTO.currentPage ge pagenationDTO.lastPageNum ? pagenationDTO.lastPageNum : pagenationDTO.currentPage + 1}">
									<img src="../resources/images/btn-next-page.png" alt="" /> <span
									class="hide">NEXT</span>
							</a></li>
							<li class="last pager"><a
								href="/admission/search.do?page=${pagenationDTO.lastPageNum}">
									<img src="../resources/images/btn-last-page.png" alt="" /> <span
									class="hide">LAST</span>
							</a></li>
						</ul>
					</div>
				</div>
			</div>

			<button class="btn btn-block"
				onclick="location.href='professorRegister.html'">등록</button>

		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>