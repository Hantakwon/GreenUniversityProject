<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	날짜: 2025/09/11
	이름: 장진원
	내용: 수강신청 jsp
 -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강신청</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/stusup/course_reg.css"/>
    <style>
        .reg-btn.registered {
            background-color: #9b9a9a; /* 취소 버튼 색상 */
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
                 > 학사지원 > 수강신청
            </span>
        </div>
    </div>
    <div>
        <div class="content-wrapper">
            <div class="sidebar">
                <div class="top">
                    <h1>학사지원</h1>
                </div>
                <div class="bottom">
                    <ul>
                        <li class="active"><a href="#">수강신청</a></li>
                        <li><a href="#">수강신청내역</a></li>
                        <li><a href="#">나의교육과정</a></li>
                        <li><a href="#">성적조회</a></li>
                        <li><a href="#">학적</a></li>
                    </ul>
                </div>
            </div>
            <div class="main-content">
                <div class="top">
                    <h2>수강신청</h2>
                </div>
                <div class="bottom">
                    <div class="search-box">
                        <select name="search-filter" id="search-filter">
                            <option value="all">선택 </option>
                            <option value="subject">과목명</option>
                            <option value="professor">담당교수</option>
                        </select>
                        <input type="text" placeholder="검색어를 입력해 주세요">
                        <button>검색</button>
                    </div>
                    <table class="notice-table">
                        <thead>
                            <tr>
                                <th>개설학과</th>
                                <th>구분</th>
                                <th>학년</th>
                                <th>코드</th>
                                <th>과목명</th>
                                <th>학점</th>
                                <th>담당교수</th>
                                <th>수강인원</th>
                                <th>비고</th>
                                <th>신청</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="course" items="${courseList}">
                                <tr>
                                    <td>${course.department}</td>
                                    <td>${course.classification}</td>
                                    <td>${course.year}</td>
                                    <td>${course.code}</td>
                                    <td>${course.subject}</td>
                                    <td>${course.credit}</td>
                                    <td>${course.professor}</td>
                                    <td>${course.capacity}</td>
                                    <td>${course.note}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${course.isRegistered}">
                                                <button class="reg-btn registered" data-code="${course.code}">취소</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="category1" data-code="${course.code}">신청</button>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagination">
                        <c:if test="${currentPage > 1}">
                            <a href="course_reg.do?page=1">&lt;&lt;</a>
                            <a href="course_reg.do?page=${currentPage - 1}">&lt;</a>
                        </c:if>

                        <c:forEach var="i" begin="1" end="${totalPage}">
                            <c:choose>
                                <c:when test="${i == currentPage}">
                                    <a href="course_reg.do?page=${i}" class="active">${i}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="course_reg.do?page=${i}">${i}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${currentPage < totalPage}">
                            <a href="course_reg.do?page=${currentPage + 1}">&gt;</a>
                            <a href="course_reg.do?page=${totalPage}">&gt;&gt;</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<jsp:include page="../footer.jsp" />
<script>
    document.querySelectorAll('.reg-btn').forEach(button => {
        button.addEventListener('click', function() {
            const courseCode = this.dataset.code;
            const action = this.classList.contains('registered') ?