<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교</title>
</head>
<!--
	날짜 : 2025/09/05
    이름 : 한탁원
    내용 : 공지사항
-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/admission/common.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/admission/notice.css">
<script
	src="<%=request.getContextPath()%>/resources/js/admission/notice.js"></script>
<body>
	<jsp:include page="../../header.jsp" />
	<div class="path-wrap">
		<div class="path-box">
			<div class="jwxe_navigator jw-relative">
				<ul>
					<li><a href="/"><img
							src="../resources/images/ico-home.png" alt="home" /></a></li>
					<li><a href="#">입학안내</a></li>
					<li>공지사항</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="sub-container">
		<div class="lnb-wrap">
			<div class="lnb">
				<div class="lnb-title-box">
					<div>
						<h2>입학안내</h2>
					</div>
				</div>

				<ul class="lnb-menu jwxe-menu-ul">
					<li class="active"><a href="/admission/notice.do"
						class="active">공지사항</a></li>

					<li><a href="/admission/rolling.do">수시모집</a></li>

					<li><a href="/admission/regular.do">정시모집</a></li>

					<li><a href="/admission/transfer.do">편입학</a></li>

					<li><a href="/admission/consult.do">입학상담</a></li>

				</ul>
			</div>
		</div>
		<div class="content-wrap">

			<div class="title">
				<div class="jwxe_mnu_template jw-relative page-title">
					<h3>공지사항</h3>
				</div>
			</div>
			<div class="content" id="jwxe_main_content">
				<div class="content-box">
					<!-- 게시판 시작 -->
					<div class="ko board list co-board type01">
						<div class="common">
							<div class="bn-search01 type01">
								<form method="get" action="/admission/notice/search.do">
									<fieldset class="b-search-wrap">
										<legend class="hide">게시글 검색</legend>

										<!-- 새 검색 시 1페이지로 
										<input type="hidden" name="page" value="0">
										-->
										<div class="b-sel-box b-cate-basic">
											<label for="search_type" class="hide">검색분류선택</label> <a
												href="#search" class="b-sel-title">전체</a>

											<!-- ★ name/id를 searchType 으로 변경 -->
											<input type="hidden" name="searchType" id="search_type"
												value="">

											<ul>
												<li class="selected"><a href="#search"
													class="searchOption" title="전체" data-value="">전체</a></li>
												<li><a href="#search" class="searchOption" title="제목"
													data-value="title">제목</a></li>
												<li><a href="#search" class="searchOption" title="내용"
													data-value="content">내용</a></li>
												<li><a href="#search" class="searchOption" title="작성자"
													data-value="writer">작성자</a></li>
											</ul>
										</div>

										<!-- 키워드 입력: name을 keyword 로 -->
										<label for="keyword" class="b-sel-label"><span>검색어</span></label>
										<input type="text" id="keyword" name="keyword"
											placeholder="검색어를 입력해 주세요">

										<button type="submit" class="b-sel-btn">검색</button>
									</fieldset>
								</form>

							</div>
							<div class="bn-list-common01 type01">
								<div class="b-top-info-wrap"></div>
								<table class="board-table">
									<colgroup>
										<col class="b-col01">
										<col class="b-col02">
										<col class="b-col03">
										<col class="b-col04">
										<col class="b-col05">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">작성일</th>
											<th scope="col" class="b-no-right">조회</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="dto" items="${dtoList}" varStatus="status">
										<tr class="">
											<td class="b-num-box">${pagenationDTO.currentPageStartNum - status.index}</td>
											<td class="b-td-left">
												<div class="b-title-box">
													<!-- 추후 new 여부 추가 -->
													<a href="#" class="new">${dto.title}</a>
													<div class="b-etc-box"></div>
													<div class="b-m-con">
														<span class="b-writer">${dto.writer}</span> <span class="b-date">${dto.created_at}</span>
														<span class="hit">${dto.views}</span>
													</div>
												</div>
											</td>
											<td>${dto.writer}</td>
											<td>${dto.created_at}</td>
											<td>${dto.views}</td>
										</tr>
										</c:forEach>
										
									</tbody>
								</table>
							</div>
							<div class="b-paging01 type03">
								<div class="b-paging01 type01">
									<div class="b-paging-wrap">
										<ul>
											<li class="first pager"><a
												href="/admission/notice.do?page=1"> <img
													src="../resources/images/btn-first-page.png" alt="" /> <span
													class="hide">FIRST</span>
											</a></li>

											<li class="prev pager">
											<a href="/admission/notice.do?page=${pagenationDTO.currentPage le 1 ? 1 : pagenationDTO.currentPage - 1}">
													<img src="../resources/images/btn-prev-page.png" alt="" />
													<span class="hide">PREV</span>
											</a></li>

											<!-- 페이지 번호 -->
											<c:forEach var="num" begin="${pagenationDTO.pageGroupStart}"
												end="${pagenationDTO.pageGroupEnd}">
												<li><a
													href="${pageContext.request.contextPath}/admission/notice.do?page=${num}"
													class="${pagenationDTO.currentPage eq num ? ' active' : ''}">
														${num} </a></li>
											</c:forEach>

											<li class="next pager">
											<a href="/admission/notice.do?page=${pagenationDTO.currentPage ge pagenationDTO.lastPageNum ? pagenationDTO.lastPageNum : pagenationDTO.currentPage + 1}">
													<img src="../resources/images/btn-next-page.png" alt="" />
													<span class="hide">NEXT</span>
											</a></li>
											<li class="last pager"><a
												href="/admission/search.do?page=${pagenationDTO.lastPageNum}">
													<img src="../resources/images/btn-last-page.png" alt="" />
													<span class="hide">LAST</span>
											</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../footer.jsp" />
</body>
</html>