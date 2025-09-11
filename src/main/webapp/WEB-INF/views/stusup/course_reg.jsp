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
    <header>
    <div>
        <div class="top">
            <p>
                <a href="#">HOME&nbsp&nbsp&nbsp|</a>
                <a href="#">&nbsp&nbsp&nbsp사이트맵&nbsp&nbsp &nbsp|</a>
                <a href="#">&nbsp&nbsp&nbsp로그인&nbsp&nbsp&nbsp|</a>
                <a href="#">&nbsp&nbsp&nbsp학생지원</a>
            </p>
        </div>
    </div>
    <div>
        <div class="nav-container">
            <a href="#"><img src="<%= request.getContextPath() %>/resources/images/header_logo.png" alt="학교 로고">
                <nav>
                    <ul>
                        <li>대학소개
                            <ul class="submenu">
                                <li><a href="#">총장 인사말</a></li>
                                <li><a href="#">교육이념</a></li>
                                <li><a href="#">연혁</a></li>
                                <li><a href="#">조직도</a></li>
                                <li><a href="#">오시는길</a></li>
                            </ul>
                        </li>
                        <li>입학안내
                            <ul class="submenu">
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">수시모집</a></li>
                                <li><a href="#">정시모집</a></li>
                                <li><a href="#">편입학</a></li>
                                <li><a href="#">입학상담</a></li>
                            </ul>
                        </li>
                        <li>대학·대학원
                            <ul class="submenu">
                                <li><a href="#">인문사회대학</a></li>
                                <li><a href="#">자연과학대학</a></li>
                                <li><a href="#">공과대학</a></li>
                                <li><a href="#">사범대학</a></li>
                                <li><a href="#">대학원</a></li>
                            </ul>
                        </li>
                        <li>학사안내
                            <ul class="submenu">
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">학사일정</a></li>
                                <li><a href="#">수강신청</a></li>
                                <li><a href="#">성적</a></li>
                                <li><a href="#">수료 및 졸업</a></li>
                                <li><a href="#">자주묻는질문</a></li>
                            </ul>
                        </li>
                        <li>대학생활
                            <ul class="submenu">
                                <li><a href="#">학생회소개</a></li>
                                <li><a href="#">동아리/스터디</a></li>
                                <li><a href="#">식단안내</a></li>
                                <li><a href="#">갤러리</a></li>
                            </ul>
                        </li>
                        <li>커뮤니티
                            <ul class="submenu">
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">뉴스 및 일정</a></li>
                                <li><a href="#">취업정보</a></li>
                                <li><a href="#">자유게시판</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
        </div>
    </div>
</header>
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
<footer>
    <div class="terms-wrap">
        <div class="inner">
            <ul>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">통합정보시스템</a></li>
                <li><a href="#">학사일정</a></li>
                <li><a href="#">주요민원 연락처</a></li>
                <li><a href="#">교내공지사항</a></li>
            </ul>
        </div>
    </div>
    <div class="info-wrap">
        <div class="inner">
            <div class="info-left">
                <img src="<%= request.getContextPath() %>/resources/images/footer_logo.png" alt="그린대학교 로고">
                <div class="text">
                    그린대학교<br>
                    [12345] 부산광역시 부산진구 부전대로 123 그린대학교<br>
                    대표전화 : 051-123-1000 | 입학안내 : 051-123-1302 | 팩스 : 051-123-3333<br>
                    <span>copyright ©Green University All rights reserved.</span>
                </div>
            </div>
            <div class="site">
                <select>
                    <option>주요사이트 선택</option>
                    <option>도서관</option>
                    <option>학생포털</option>
                    <option>취업정보센터</option>
                    <option>국제교류센터</option>
                </select>
            </div>
        </div>
    </div>
</footer>
<script>
    document.querySelectorAll('.reg-btn').forEach(button => {
        button.addEventListener('click', function() {
            const courseCode = this.dataset.code;
            const action = this.classList.contains('registered') ?