<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 
	날짜: 2025/09/11
	이름: 장진원
	내용: 커리큘럼 jsp
 -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 교육과정</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/stusup/curriculum.css"/>
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
                 > 학사지원 > 나의 교육과정
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
                        <li><a href="#">수강신청</a></li>
                        <li><a href="#">수강신청내역</a></li>
                        <li class="active"><a href="#">나의교육과정</a></li>
                        <li><a href="#">성적조회</a></li>
                        <li><a href="#">학적</a></li>
                    </ul>
                </div>
            </div>
            <div class="main-content">
                <div class="top">
                    <h2>교과과정</h2>
                </div>
                
                <h3>공통과목(전공)</h3>
                <table class="course-table">
                    <thead>
                        <tr>
                            <th>학년</th>
                            <th>이수구분</th>
                            <th>교과목코드</th>
                            <th>교과목명</th>
                            <th>학점</th>
                            <th>비고</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="course" items="${curriculumList}">
                            <c:if test="${course.subjectType eq '전공필수' || course.subjectType eq '전공선택'}">
                                <tr>
                                    <td>${course.semester.substring(0, 1)}학년</td>
                                    <td>${course.subjectType}</td>
                                    <td>${course.subjectNumber}</td>
                                    <td>${course.subjectName}</td>
                                    <td>${course.subjectCredit}</td>
                                    <td>${course.prerequisite}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
                <hr>
                <h3>선택과목(교양)</h3>
                <table class="course-table">
                    <thead>
                        <tr>
                            <th>학년</th>
                            <th>이수구분</th>
                            <th>교과목코드</th>
                            <th>교과목명</th>
                            <th>학점</th>
                            <th>비고</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="course" items="${curriculumList}">
                            <c:if test="${course.subjectType eq '교양필수' || course.subjectType eq '교양선택'}">
                                <tr>
                                    <td>${course.semester.substring(0, 1)}학년</td>
                                    <td>${course.subjectType}</td>
                                    <td>${course.subjectNumber}</td>
                                    <td>${course.subjectName}</td>
                                    <td>${course.subjectCredit}</td>
                                    <td>${course.prerequisite}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
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
</body>
</html>