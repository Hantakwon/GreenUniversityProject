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
	<jsp:include page="../footer.jsp" />
</body>
</html>