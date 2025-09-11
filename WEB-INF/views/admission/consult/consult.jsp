<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/admission/common.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/admission/consult.css">
<script
	src="<%=request.getContextPath()%>/resources/js/admission/notice.js"></script>
</head>
<!--
	날짜 : 2025/09/05
    이름 : 한탁원
    내용 : 입학상담
-->
<body>
	<jsp:include page="../../header.jsp" />
	<div class="path-wrap">
		<div class="path-box">
			<div class="jwxe_navigator jw-relative">
				<ul>
					<li><a href="#"><img
							src="../resources/images/ico-home.png" alt="home" /></a></li>
					<li><a href="#">입학안내</a></li>
					<li>입학상담</li>
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
					<li><a href="/admission/notice.do">공지사항</a></li>

					<li><a href="/admission/rolling.do">수시모집</a></li>

					<li><a href="/admission/regular.do">정시모집</a></li>

					<li><a href="/admission/transfer.do">편입학</a></li>

					<li class="active"><a href="/admission/consult.do"
						class="active">입학상담</a></li>

				</ul>
			</div>
		</div>
		<div class="content-wrap">

			<div class="title">
				<div class="jwxe_mnu_template jw-relative page-title">
					<h3>입학상담</h3>
				</div>
			</div>
			<div class="content" id="jwxe_main_content">
				<div class="content-box">
					<div class="ko board list co-board type01">
						<div class="common">
							<div class="bn-search01 type01">
								<form method="get" action="/admission/consult/search.do">
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
							<div class="bn-list-common01 type01 bn-common bn-common">
								<div class="b-top-info-wrap"></div>
								<table summary="연구/프로젝트1" class="board-table">
									<caption class="hide">연구/프로젝트1</caption>
									<colgroup>
										<col style="width: 10%;">
										<col style="width: 15%;">
										<col>
										<col style="width: 10%;">
										<col style="width: 15%;">
										<col style="width: 15%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">구분</th>
											<th scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">작성일</th>
											<th scope="col" class="b-no-right">상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="dto" items="${dtoList}" varStatus="status">
											<tr>
												<!-- 번호 -->
												<td class="b-num-box">
													${pagenationDTO.currentPageStartNum - status.index}</td>

												<!-- 구분 -->
												<td class="b-num-box"><c:out value="${dto.category}" />
												</td>

												<!-- 제목 (항상 lock 아이콘 클래스 부여) -->
												<td class="b-td-left">
													<div class="b-title-box">
														<a class="lock"
															href="${pageContext.request.contextPath}/admission/consult/view.do?id=${dto.id}">
															<img
															src="<%=request.getContextPath()%>/resources/images/ico-lock.png" />&nbsp<c:out
																value="${dto.title}" />
														</a>
													</div>
												</td>

												<!-- 작성자 -->
												<td><c:out value="${dto.writer}" /></td>

												<!-- 작성일 -->
												<td>
													<!-- created_at이 java.util.Date/LocalDateTime 이면 fmt 사용 권장 -->
													<%-- <fmt:formatDate value="${dto.created_at}" pattern="yy.MM.dd" /> --%>
													${dto.created_at}
												</td>

												<!-- 상태(답변여부: boolean) -->
												<td><c:choose>
														<c:when test="${dto.is_answered}">
															<span style="color: green;">답변완료</span>
														</c:when>
														<c:otherwise>
															<span style="color: red;">답변대기</span>
														</c:otherwise>
													</c:choose></td>
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
												href="/admission/consult.do?page=1"> <img
													src="../resources/images/btn-first-page.png" alt="" /> <span
													class="hide">FIRST</span>
											</a></li>

											<li class="prev pager"><a
												href="/admission/consult.do?page=${pagenationDTO.currentPage le 1 ? 1 : pagenationDTO.currentPage - 1}">
													<img src="../resources/images/btn-prev-page.png" alt="" />
													<span class="hide">PREV</span>
											</a></li>

											<!-- 페이지 번호 -->
											<c:forEach var="num" begin="${pagenationDTO.pageGroupStart}"
												end="${pagenationDTO.pageGroupEnd}">
												<li><a
													href="${pageContext.request.contextPath}/admission/consult.do?page=${num}"
													class="${pagenationDTO.currentPage eq num ? ' active' : ''}">
														${num} </a></li>
											</c:forEach>

											<li class="next pager"><a
												href="/admission/consult.do?page=${pagenationDTO.currentPage ge pagenationDTO.lastPageNum ? pagenationDTO.lastPageNum : pagenationDTO.currentPage + 1}">
													<img src="../resources/images/btn-next-page.png" alt="" />
													<span class="hide">NEXT</span>
											</a></li>
											<li class="last pager"><a
												href="/admission/consult.do?page=${pagenationDTO.lastPageNum}">
													<img src="../resources/images/btn-last-page.png" alt="" />
													<span class="hide">LAST</span>
											</a></li>
										</ul>
									</div>
								</div>

								<a class="b-btn-type01 b-btn-c-blue" style="float: right;"
									href="#">문의하기</a>
							</div>
							<div class="b-btn-wrap"></div>
							<form name="admin-form">
								<input type="hidden" name="mode"> <input type="hidden"
									name="articles"> <input type="hidden"
									name="confirmMode">
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- 상담 버튼 -->
	<div id="chatbot-button">💬</div>

	<!-- 상담창 -->
	<div id="chatbot-window">
		<div class="chatbot-header">
			입학상담 챗봇 <span id="chatbot-close">✖</span>
		</div>
		<div class="chatbot-messages" id="chatbot-messages">
			<div class="bot-message">안녕하세요! 입학 상담을 도와드릴게요 😊</div>
		</div>
		<div class="chatbot-input">
			<input type="text" id="chatbot-text" placeholder="메시지를 입력하세요...">
			<button id="chatbot-send">전송</button>
		</div>
	</div>
	<!-- 상담 끝 -->
	<jsp:include page="../../footer.jsp" />

	<script>
    const chatBtn = document.getElementById("chatbot-button");
    const chatWin = document.getElementById("chatbot-window");
    const chatClose = document.getElementById("chatbot-close");
    const chatSend = document.getElementById("chatbot-send");
    const chatInput = document.getElementById("chatbot-text");
    const chatMessages = document.getElementById("chatbot-messages");

    // 버튼 클릭 → 상담창 열기
    chatBtn.addEventListener("click", () => {
        chatWin.style.display = "flex";
    });

    // 닫기 버튼
    chatClose.addEventListener("click", () => {
        chatWin.style.display = "none";
    });

    // 메시지 전송
    chatSend.addEventListener("click", sendMessage);
    chatInput.addEventListener("keypress", function(e) {
        if (e.key === "Enter") sendMessage();
    });

    function sendMessage() {
        const text = chatInput.value.trim();
        if (text === "") return;
        
        // 사용자 메시지 추가
        const userMsg = document.createElement("div");
        userMsg.className = "user-message";
        userMsg.innerText = text;
        chatMessages.appendChild(userMsg);

        chatInput.value = "";

        // 간단한 봇 응답 (테스트용)
        const botMsg = document.createElement("div");
        botMsg.className = "bot-message";
        botMsg.innerText = "문의해주셔서 감사합니다! (" + text + ")";
        chatMessages.appendChild(botMsg);

        chatMessages.scrollTop = chatMessages.scrollHeight;
    }
</script>
</body>
</html>
<!-- 상담 챗봇 js -->

<!-- 상담 챗봇 js 끝 -->