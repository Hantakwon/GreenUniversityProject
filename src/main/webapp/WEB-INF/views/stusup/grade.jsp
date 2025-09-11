<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 
	날짜: 2025/09/11
	이름: 장진원
	내용: 성적조회 jsp
 -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성적조회</title>
    <!--
	날짜 : 2025/09/10
    이름 : 정순권
    내용 : 성적조회 헤더 사이드바 수정
-->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/stusup/grade.css"/>
</head>
<body>
    <jsp:include page="../header.jsp" />
    <main>
        <div>
            <div class="info">
                <span>
                    <img src="<%= request.getContextPath() %>/resources/images/ico-home.png" alt="홈 버튼">
                    > 학사지원 > 성적조회
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
                        <li><a href="/stusup/course_reg.do">수강신청</a></li>
                        <li><a href="/stusup/course_reg_list.do">수강신청내역</a></li>
                        <li><a href="/stusup/curriculum.do">나의교육과정</a></li>
                        <li class="active"><a href="/stusup/grade.do">성적조회</a></li>
                        <li><a href="/stusup/profile.do">학적</a></li>
                        </ul>
                    </div>
                </div>
                <div class="main-content">
                    <div class="top">
                        <h2>성적조회</h2>
                    </div>
                    <br>
                    <div class="score-summary">
                        <select name="year">
                            <option value="2025">2025</option>
                            <option value="2024">2024</option>
                            <option value="2023">2023</option>
                        </select>
                        <p>년</p>
                        <select name="semester">
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                        <p>학기</p>
                        <div class="score-search">
                            <p class="score-sarch-right">
                                이수과목수 <span-2>${fn:length(gradeList)}</span-2>과목, 총 취득학점 <span-2>${totalCredits}</span-2>학점
                            </p>
                        </div>
                    </div>
                    <div class="bottom">
                        <table class="notice-table">
                            <thead>
                                <tr>
                                    <th>교과목코드</th>
                                    <th>과목명</th>
                                    <th>대상학년</th>
                                    <th>담당교수</th>
                                    <th>이수구분</th>
                                    <th>점수</th>
                                    <th>등급</th>
                                    <th>취득학점</th>
                                    <th>기타</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="grade" items="${gradeList}">
                                    <tr>
                                        <td>${grade.courseCode}</td>
                                        <td>${grade.subject}</td>
                                        <td>${grade.targetYear}</td>
                                        <td>${grade.professorName}</td>
                                        <td>${grade.classification}</td>
                                        <td>${grade.score}</td>
                                        <td>${grade.grade}</td>
                                        <td>${grade.credit}</td>
                                        <td><button class="category1">${grade.note}</button></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <p class="note-message">
                            ※ 점수 이의신청은 학생지원실에 문의하시기 바랍니다.
                        </p>
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
</body>
</html>