<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 및 칼럼</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/community/news.css">
<style>
    /* 제목 셀의 텍스트를 왼쪽으로 정렬하고 패딩 추가 */
    .notice-table td:nth-child(3) {
        text-align: left; /* 왼쪽 정렬 */
        padding-left: 10px; /* 왼쪽 패딩 추가 */
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
                        <li class="active"><a href="/community/news.do">뉴스 및 칼럼</a></li>
                        <li><a href="/community/job.do">취업정보</a></li>
                        <li><a href="/community/free.do">자유게시판</a></li>
                        <li><a href="/community/qna.do">질문과 답변</a></li>
                        <li><a href="/community/data.do">자료실</a></li>
                    </ul>
                </div>
            </div>
            <div class="main-content">
                <div class="top">
                    <h2>뉴스 및 칼럼</h2>
                </div>
                <div class="bottom">

                    <p>
                        <div class="search-box">
                            <select name="search-filter" id="search-filter">
                                <option value="all">전체 </option>
                                <option value="title">제목</option>
                                <option value="writer">작성자</option>
                            </select>
                            <input type="text" placeholder="검색어를 입력해 주세요">
                            <button>검색</button>
                        </div>
                        <div class="bottom">
                        <table class="notice-table">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>구분</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                    <th>조회</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="news" items="${newsList}">
                                <tr>
                                    <td>${news.no}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${news.category eq '공지' || news.category eq '칼럼' || news.category eq '보도'}">
                                                <span class="category1">${news.category}</span>
                                            </c:when>
                                            <c:when test="${news.category eq '뉴스'}">
                                                <span class="category2">${news.category}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="category">${news.category}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${news.title}</td>
                                    <td>${news.writer}</td>
                                    <td>${news.rdate}</td>
                                    <td>${news.hit}</td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <div class="pagination">
                            <c:if test="${currentPage > 1}">
                                <a href="news.do?page=1">&lt;&lt;</a>
                                <a href="news.do?page=${currentPage - 1}">&lt;</a>
                            </c:if>

                            <c:forEach var="i" begin="1" end="${totalPage}">
                                <c:choose>
                                    <c:when test="${i == currentPage}">
                                        <a href="news.do?page=${i}" class="active">${i}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="news.do?page=${i}">${i}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <c:if test="${currentPage < totalPage}">
                                <a href="news.do?page=${currentPage + 1}">&gt;</a>
                                <a href="news.do?page=${totalPage}">&gt;&gt;</a>
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