<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 
	날짜: 2025/09/11
	이름: 장진원
	내용: 프로필 jsp
 -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학적</title>
    <!--
	날짜 : 2025/09/10
    이름 : 정순권
    내용 : 학적 헤더 사이드바 수정
-->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/stusup/profile.css"/>
</head>
<body>
    <jsp:include page="../header.jsp" />
    <main>
    <div>
        <div class="info">
            <span id="test">
                <img src="<%= request.getContextPath() %>/resources/images/ico-home.png" alt="홈 버튼">
                    > 학사지원 > 학적
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
                        <li><a href="/stusup/grade.do">성적조회</a></li>
                        <li class="active"><a href="/stusup/profile.do">학적</a></li>
                    </ul>
                </div>
            </div>
            <div class="main-content">
                <div class="top">
                    <h2>학적</h2>
                </div>
                <div class="bottom">
                    <h3>기본정보</h3>
                    <table class="info-table">
                        <tbody>
                            <tr>
                                <td rowspan="4" class="photo-cell">
                                    <div class="photo"></div> 
                                </td>
                                <th>학번</th>
                                <td>${profileInfo.studentId}</td>
                                <th>학과</th>
                                <td>${profileInfo.department}</td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>${profileInfo.name}</td>
                                <th>주민번호</th>
                                <td>${profileInfo.residentNumber}</td>
                            </tr>
                            <tr>
                                <th>휴대폰</th>
                                <td>${profileInfo.phoneNumber}</td>
                                <th>EMAIL</th>
                                <td>${profileInfo.email}</td>
                            </tr>
                            <tr>
                                <th>학년/학기</th>
                                <td>${profileInfo.gradeAndSemester}</td>
                                <th>상태</th>
                                <td class="status">${profileInfo.status}</td>
                            </tr>
                        </tbody>
                    </table>

                    <h3>취득학점현황</h3>
                    <table class="credit-table">
                        <thead>
                            <tr>
                                <th>구분</th>
                                <th>전공(${creditStatus.majorCredit})</th>
                                <th>교양(${creditStatus.liberalArtsCredit})</th>
                                <th>선택(${creditStatus.electiveCredit})</th>
                                <th>사회봉사</th>
                                <th>기타</th>
                                <th>총취득학점</th>
                                <th>졸업요건학점</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>취득학점</td>
                                <td>${creditStatus.majorCredit}</td>
                                <td>${creditStatus.liberalArtsCredit}</td>
                                <td>${creditStatus.electiveCredit}</td>
                                <td>${creditStatus.volunteerCredit}</td>
                                <td>${creditStatus.etcCredit}</td>
                                <td>${creditStatus.totalCredit}</td>
                                <td>${creditStatus.graduationRequirement}</td>
                            </tr>
                        </tbody>
                    </table>
                    <p class="note">- 각 괄호안의 숫자는 이수 과목수</p>

                    <h3>학년/학기별 취득학점현황</h3>
                    <table class="semester-credit-table">
                        <thead>
                            <tr>
                                <th>년도</th>
                                <th>학년</th>
                                <th>학기</th>
                                <th>신청학점</th>
                                <th>전공학점</th>
                                <th>선택학점</th>
                                <th>기타학점</th>
                                <th>총취득학점</th>
                                <th>평점평균</th>
                                <th>기타</th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach var="semesterCredit" items="${semesterCreditList}">
                                <tr>
                                    <td>${semesterCredit.year}</td>
                                    <td>${semesterCredit.grade}</td>
                                    <td>${semesterCredit.semester}</td>
                                    <td>${semesterCredit.appliedCredit}</td>
                                    <td>${semesterCredit.majorCredit}</td>
                                    <td>${semesterCredit.electiveCredit}</td>
                                    <td>${semesterCredit.etcCredit}</td>
                                    <td>${semesterCredit.totalCredit}</td>
                                    <td>${semesterCredit.gpa}</td>
                                    <td>${semesterCredit.note}</td>
                                </tr>
                             </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="../footer.jsp" />
</body>
</html>