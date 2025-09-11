<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	날짜: 2025/09/11
	이름: 장진원
	내용: 질문과답변 jsp
 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문과 답변</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/community/qna.css"/>
    <style>
        /* ... CSS 내용 ... */
    </style>
</head>
<body>
  <jsp:include page="../header.jsp" />
<main>
    <div>
        <div class="info">
            <span id="test">
                <img src="<%= request.getContextPath() %>/resources/images/ico-home.png" alt="홈 버튼">
                 > 커뮤니티 > 질문과 답변
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
                        <li class="active"><a href="#">질문과 답변</a></li>
                        <li><a href="#">자료실</a></li>
                    </ul>
                </div>
            </div>
            <div class="main-content">
                <div class="top">
                    <h2>질문과 답변</h2>
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
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="qna" items="${qnaList}">
                                <c:choose>
                                    <c:when test="${qna.cate == 1}">
                                        <tr style="background-color: #efefef">
                                            <td>${qna.no}</td>
                                            <td>
                                                <span class="lock"><img src="<%= request.getContextPath() %>/resources/images/ico-reply.png" alt="답변"></span>
                                                &nbsp;RE:${qna.title}
                                            </td>
                                            <td>${qna.writer}</td>
                                            <td>${qna.rdate}</td>
                                            <td style="color: green;">
                                                <c:if test="${qna.status == 2}">답변완료</c:if>
                                            </td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td>${qna.no}</td>
                                            <td>
                                                <c:if test="${qna.pass != null && qna.pass != ''}">
                                                    <span class="lock"><img src="<%= request.getContextPath() %>/resources/images/ico-lock.png" alt="비밀글"></span>
                                                </c:if>
                                                &nbsp;${qna.title}
                                            </td>
                                            <td>${qna.writer}</td>
                                            <td>${qna.rdate}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${qna.status == 1}"><span style="color: red;">답변대기</span></c:when>
                                                    <c:when test="${qna.status == 2}"><span style="color: green;">답변완료</span></c:when>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagination">
                        <c:if test="${currentPage > 1}">
                            <a href="qna.do?page=1">&lt;&lt;</a>
                            <a href="qna.do?page=${currentPage - 1}">&lt;</a>
                        </c:if>

                        <c:forEach var="i" begin="1" end="${totalPage}">
                            <c:choose>
                                <c:when test="${i == currentPage}">
                                    <a href="qna.do?page=${i}" class="active">${i}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="qna.do?page=${i}">${i}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${currentPage < totalPage}">
                            <a href="qna.do?page=${currentPage + 1}">&gt;</a>
                            <a href="qna.do?page=${totalPage}">&gt;&gt;</a>
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