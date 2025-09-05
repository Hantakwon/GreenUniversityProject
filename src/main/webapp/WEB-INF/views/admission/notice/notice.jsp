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
										<input type="hidden" name="mode" value="list">
										<div class="b-sel-box b-cate-basic">
											<label for="search_key" class="hide">검색분류선택</label> <a
												href="#search" class="b-sel-title">전체</a> <input
												type="hidden" name="srSearchKey" id="search_key" value="">
											<ul>
												<li class="selected"><a href="#search"
													class="searchOption" title="전체" data-value="">전체</a></li>
												<li><a href="#search" class="searchOption" title="제목"
													data-value="article_title">제목</a></li>
												<li><a href="#search" class="searchOption" title="내용"
													data-value="article_text">내용</a></li>
												<li><a href="#search" class="searchOption" title="작성자"
													data-value="writer_nm">작성자</a></li>
											</ul>
										</div>
										<label for="search_val" class="b-sel-label"> <span>검색어</span>
										</label> <input type="text" id="search_val" name="srSearchVal"
											value="" placeholder="검색어를 입력해 주세요">
										<button type="submit" class="b-sel-btn">검색</button>
									</fieldset>
								</form>
							</div>
							<div class="bn-list-common01 type01">
								<div class="b-top-info-wrap"></div>
								<table summary="연구/프로젝트1" class="board-table">
									<caption class="hide">연구/프로젝트1</caption>
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
										<tr class="">
											<td class="b-num-box">3</td>
											<td class="b-td-left">
												<div class="b-title-box">
													<a href="#" class="new">2025학년도 신입학 3차 추가모집 모집요강 및 모집인원
														공지</a>
													<div class="b-etc-box"></div>
													<div class="b-m-con">
														<span class="b-writer">담당자</span> <span class="b-date">24.04.09</span>
														<span class="hit">조회수 160</span>
													</div>
												</div>
											</td>
											<td>담당자</td>
											<td>24.04.09</td>
											<td>160</td>
										</tr>
										<tr class="">
											<td class="b-num-box">2</td>
											<td class="b-td-left">
												<div class="b-title-box">
													<a href="#" class="new">2025학년도 신입학 2차 추가모집 모집요강 및 모집인원
														안내</a>
													<div class="b-etc-box"></div>
													<div class="b-m-con">
														<span class="b-writer">담당자</span> <span class="b-date">24.04.09</span>
														<span class="hit">조회수 160</span>
													</div>
												</div>
											</td>
											<td>담당자</td>
											<td>24.04.09</td>
											<td>160</td>
										</tr>
										<tr class="">
											<td class="b-num-box">1</td>
											<td class="b-td-left">
												<div class="b-title-box">
													<a href="#">2025학년도 신입학 추가모집 모집요강 및 모집인원 공지</a>
													<div class="b-etc-box"></div>
													<div class="b-m-con">
														<span class="b-writer">담당자</span> <span class="b-date">24.04.09</span>
														<span class="hit">조회수 160</span>
													</div>
												</div>
											</td>
											<td>담당자</td>
											<td>24.04.09</td>
											<td>160</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="b-paging01 type03">
								<div class="b-paging01 type01">
									<div class="b-paging-wrap">
										<ul>
											<li class="first pager"><a href="/admission/notice.do?page=1"> <img
													src="../resources/images/btn-first-page.png" alt="" /> <span
													class="hide">FIRST</span>
											</a></li>
											
											<li class="prev pager"><a href="/admission/notice.do?page=${pagenationDTO.currentPage - 1}"> <img
													src="../resources/images/btn-prev-page.png" alt="" /> <span
													class="hide">PREV</span>
											</a></li>

											<!-- 페이지 번호 -->
										    <c:forEach var="num" begin="${pagenationDTO.pageGroupStart}" end="${pagenationDTO.pageGroupEnd}">
										    	<li>
											    	<a href="${pageContext.request.contextPath}/admission/notice.do?page=${num}"
												    	class="${pagenationDTO.currentPage eq num ? ' active' : ''}">
												    	${num}
												    </a>
										    	</li>
										    </c:forEach>
										    
											<li class="next pager"><a href="/admission/notice.do?page=${pagenationDTO.currentPage + 1}"> <img
													src="../resources/images/btn-next-page.png" alt="" /> <span
													class="hide">NEXT</span>
											</a></li>
											<li class="last pager"><a href="/admission/notice.do?page=${pagenationDTO.lastPageNum}"> <img
													src="../resources/images/btn-last-page.png" alt="" /> <span
													class="hide">LAST</span>
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