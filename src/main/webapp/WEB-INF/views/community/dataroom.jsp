<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<!-- 
	날짜: 2025/09/11
	이름: 장진원
	내용: 자유게시판 DAO
-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자료실</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/community/dataroom.css"/>
    <style>
        .notice-table td:nth-child(2) {
            text-align: left; /* 왼쪽 정렬 */
            padding-left: 25px; /* 왼쪽 패딩 추가 */
        }
        .notice-table td:nth-child(5) {
            padding-inline: 25px; /* 왼쪽 패딩 추가 */
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
                 > 커뮤니티 > 자료실
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
                        <li><a href="#">취업정보</a></li>
                        <li><a href="#">자유게시판</a></li>
                        <li><a href="#">질문과 답변</a></li>
                        <li class="active"><a href="#">자료실</a></li>
                    </ul>
                </div>
            </div>
            <div class="main-content">
                <div class="top">
                    <h2>자료실</h2>
                </div>
                <div class="bottom">
                    <div class="search-box">
                        <select name="search-filter" id="search-filter">
                            <option value="all">전체 </option>
                            <option value="title">제목</option>
                            <option value="writer">작성자</option>
                        </select>
                        <input type="text" placeholder="검색어를 입력해 주세요">
                        <button>검색</button>
                    </div>
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
                            <c:forEach var="dataroom" items="${dataroomList}">
                                <tr>
                                    <td>${dataroom.no}</td>
                                    <td>
                                        <c:if test="${dataroom.file == 1}">
                                            <span class="ico-file01"><img src="<%= request.getContextPath() %>/resources/images/ico-file01.png" alt="첨부파일"></span>
                                        </c:if>
                                        &nbsp;${dataroom.title}
                                    </td>
                                    <td>${dataroom.writer}</td>
                                    <td>${dataroom.rdate}</td>
                                    <td>${dataroom.hit}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagination">
                        <c:if test="${currentPage > 1}">
                            <a href="dataroom.do?page=1">&lt;&lt;</a>
                            <a href="dataroom.do?page=${currentPage - 1}">&lt;</a>
                        </c:if>

                        <c:forEach var="i" begin="1" end="${totalPage}">
                            <c:choose>
                                <c:when test="${i == currentPage}">
                                    <a href="dataroom.do?page=${i}" class="active">${i}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="dataroom.do?page=${i}">${i}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${currentPage < totalPage}">
                            <a href="dataroom.do?page=${currentPage + 1}">&gt;</a>
                            <a href="dataroom.do?page=${totalPage}">&gt;&gt;</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<jsp:include page="../footer.jsp" />
</body>
</html>