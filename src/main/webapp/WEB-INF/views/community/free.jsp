<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- 
	날짜: 2025/09/11
	이름: 장진원
	내용: 자유게시판 jsp
 -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/community/free.css">
    <style>
        /* 제목 셀의 텍스트를 왼쪽으로 정렬하고 패딩 추가 */
        .notice-table td:nth-child(2) {
            text-align: left; /* 왼쪽 정렬 */
            padding-left: 25px; /* 왼쪽 패딩 추가 */
        }
    </style>
</head>
<body>

<jsp:include page="../header.jsp" />
<main>
    <div>
        <div class="info">
            <span id="test">
                <img src="<%= request.getContextPath() %>/resources/images/ico-home.png" alt="홈 버튼">
                 > 대학소개 > 총장 인사말 
            </span>
        </div>
    </div>
    <div>
        <div class="content-wrapper">
            <div class="sidebar">
                <div class="top">
                    <h1>커뮤니티</h1>
                </div>
                <div class="bottom">
                    <ul>
                        <li><a href="/community/notice.do">공지사항</a></li>
                        <li><a href="/community/news.do">뉴스 및 칼럼</a></li>
                        <li><a href="/community/job.do">취업정보</a></li>
                        <li><a href="/community/free.do">자유게시판</a></li>
                        <li class="active"><a href="/community/qna.do">질문과 답변</a></li>
                        <li><a href="/community/data.do">자료실</a></li>
                    </ul>
                </div>
            </div>
            <div class="main-content">
                <div class="top">
                    <h2>자유게시판</h2>
                     </div>
                     <br>
                    <form action="free.do" method="get">
                        <div class="search-box">
                            <select name="searchType" id="search-filter">
                                <option value="all" <c:if test="${searchType eq 'all'}">selected</c:if>>전체 </option>
                                <option value="title" <c:if test="${searchType eq 'title'}">selected</c:if>>제목</option>
                                <option value="writer" <c:if test="${searchType eq 'writer'}">selected</c:if>>작성자</option>
                            </select>
                            <input type="text" name="keyword" value="${keyword}" placeholder="검색어를 입력해 주세요">
                            <button type="submit">검색</button>
                       
                    </form>
                </div>
                <div class="bottom">
                    <p>
                        <div class="bottom">
                        <table class="notice-table">
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
                                <c:forEach var="free" items="${freeList}">
                                    <tr>
                                        <td>${free.no}</td>
                                        <td>${free.title}</td>
                                        <td>${free.writer}</td>
                                        <td>${free.rdate}</td>
                                        <td>${free.hit}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <c:if test="${currentPage > 1}">
                                <a href="free.do?page=1&searchType=${searchType}&keyword=${keyword}">&lt;&lt;</a>
                                <a href="free.do?page=${currentPage - 1}&searchType=${searchType}&keyword=${keyword}">&lt;</a>
                            </c:if>

                            <c:forEach var="i" begin="1" end="${totalPage}">
                                <c:choose>
                                    <c:when test="${i == currentPage}">
                                        <a href="free.do?page=${i}&searchType=${searchType}&keyword=${keyword}" class="active">${i}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="free.do?page=${i}&searchType=${searchType}&keyword=${keyword}">${i}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <c:if test="${currentPage < totalPage}">
                                <a href="free.do?page=${currentPage + 1}&searchType=${searchType}&keyword=${keyword}">&gt;</a>
                                <a href="free.do?page=${totalPage}&searchType=${searchType}&keyword=${keyword}">&gt;&gt;</a>
                            </c:if>
                        </div>
                    </div>
                    </p>
                </div>
            </div>
        </div>
    </div>
</main>

	<jsp:include page="../footer.jsp" />
</body>
</html>