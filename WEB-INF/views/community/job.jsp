<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- 
	날짜: 2025/09/11
	이름: 장진원
	내용: 취업정보 jsp
 -->
<head>
<meta charset="UTF-8">
<title>취업정보</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/community/job.css">
<style>
    /* 제목 셀의 텍스트를 왼쪽으로 정렬하고 패딩 추가 */
    .notice-table td:nth-child(3) {
        text-align: left; /* 왼쪽 정렬 */
        padding-left: 10px; /* 왼쪽 패딩 추가 */
    }

    .notice-table td:nth-child(4) {
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
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">뉴스 및 칼럼</a></li>
                        <li class="active"><a href="#">취업정보</a></li>
                        <li><a href="#">자유게시판</a></li>
                        <li><a href="#">질문과 답변</a></li>
                        <li><a href="#">자료실</a></li>
                    </ul>
                </div>
            </div>
            <div class="main-content">
                <div class="top">
                    <h2>취업정보</h2>
                     </div>
                     <br>
                    <form action="job.do" method="get">
                        <div class="search-box">
                            <select name="searchType" id="search-filter">
                                <option value="all" <c:if test="${searchType eq 'all'}">selected</c:if>>전체 </option>
                                <option value="company" <c:if test="${searchType eq 'company'}">selected</c:if>>업체</option>
                                <option value="title" <c:if test="${searchType eq 'title'}">selected</c:if>>채용정보</option>
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
                                    <th>상태</th>
                                    <th>업체</th>
                                    <th>채용정보</th>
                                    <th>작성일</th>
                                    <th>조회</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="job" items="${jobList}">
                                    <tr>
                                        <td>${job.no}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${job.status eq '모집중'}">
                                                    <span class="category1">${job.status}</span>
                                                </c:when>
                                                <c:when test="${job.status eq '마감'}">
                                                    <span class="category2">${job.status}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="category">${job.status}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${job.company}</td>
                                        <td>${job.title}</td>
                                        <td>${job.rdate}</td>
                                        <td>${job.hit}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="pagination">
                             <c:if test="${currentPage > 1}">
                                <a href="job.do?page=1&searchType=${searchType}&keyword=${keyword}">&lt;&lt;</a>
                                <a href="job.do?page=${currentPage - 1}&searchType=${searchType}&keyword=${keyword}">&lt;</a>
                            </c:if>

                            <c:forEach var="i" begin="1" end="${totalPage}">
                                <c:choose>
                                    <c:when test="${i == currentPage}">
                                        <a href="job.do?page=${i}&searchType=${searchType}&keyword=${keyword}" class="active">${i}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="job.do?page=${i}&searchType=${searchType}&keyword=${keyword}">${i}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <c:if test="${currentPage < totalPage}">
                                <a href="job.do?page=${currentPage + 1}&searchType=${searchType}&keyword=${keyword}">&gt;</a>
                                <a href="job.do?page=${totalPage}&searchType=${searchType}&keyword=${keyword}">&gt;&gt;</a>
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