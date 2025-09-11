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

<jsp:include page="../header.jsp" />
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
    
<jsp:include page="../footer.jsp" />
</body>
</html>