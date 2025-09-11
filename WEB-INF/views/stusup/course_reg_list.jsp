<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<!-- 
	날짜: 2025/09/11
	이름: 장진원
	내용: 수강신청내역 jsp
 -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강신청내역</title>
<!--
	날짜 : 2025/09/10
    이름 : 정순권
    내용 : 수강신청내역 헤더 사이드바 수정
-->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/stusup/course_reg_list.css"/>
</head>
<body>
    <jsp:include page="../header.jsp" />
    <main>
        <div>
            <div class="info">
                <span id="test">
                    <img src="<%= request.getContextPath() %>/resources/images/ico-home.png" alt="홈 버튼">
                     > 학사지원 > 수강신청내역
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
                        <li class="active"><a href="/stusup/course_reg_list.do">수강신청내역</a></li>
                        <li><a href="/stusup/curriculum.do">나의교육과정</a></li>
                        <li><a href="/stusup/grade.do">성적조회</a></li>
                        <li><a href="/stusup/profile.do">학적</a></li>
                    </ul>
                </div>
                </div>
                <div class="main-content">
                    <div class="top">
                        <h2>수강신청내역</h2>
                    </div>
                    <div class="bottom">
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
                                    이수과목수 ${fn:length(registeredCourses)} 과목, 총 취득학점 ${totalCredits} 학점
                                </p>
                            </div>
                        </div>
                        <table class="notice-table">
                            <thead>
                                <tr>
                                    <th>교과목코드</th>
                                    <th>과목명</th>
                                    <th>대상학년</th>
                                    <th>담당교수</th>
                                    <th>학점</th>
                                    <th>이수구분</th>
                                    <th>강의시간</th>
                                    <th>강의장</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="course" items="${registeredCourses}">
                                    <tr>
                                        <td>${course.courseCode}</td>
                                        <td>${course.subject}</td>
                                        <td>${course.targetYear}</td>
                                        <td>${course.professor}</td>
                                        <td>${course.credit}</td>
                                        <td>${course.classification}</td>
                                        <td>${course.classTime}</td>
                                        <td>${course.classroom}</td>
                                        <td><button class="category2">취소</button></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="pagination">
                            <a href="#">&lt;</a>
                            <a href="#" class="active">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">&gt;</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
	<jsp:include page="../footer.jsp" />
</body>
</html>