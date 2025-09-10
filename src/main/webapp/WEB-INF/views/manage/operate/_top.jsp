<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>그린대학교 학사관리시스템</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>    
    <script src="/resources/js/gnb.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    
	<link rel="stylesheet" type="text/css" href="/resources/css/manage/board.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/manage/user.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/manage/content.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/manage/admin.css" />
    
</head>
<body>
<body>
    <div id="admin-wrapper">
        <header>
            <nav>
                <div class="top-header-box" style="max-width: 1400px;">                    
                    <ul>
                        <li><a href="#" title="HOME 바로가기">HOME</a></li>
                        <li><a href="#" title="사이트맵 보기" class="sitemap-btn">사이트맵</a></li>
                        <li class="login"><a href="#">로그아웃</a></li>
                    </ul>
                </div>
            </nav>
            <div>
                <div class="gnb">
                    <a href="./index.html" class="logo"><img src="/resources/images/admin_logo.png" alt="admin_logo"/></a>
                </div>
            </div>
        </header>
        <main>
            <aside>
                <!-- Global Navigation Bar -->
                <ul id="gnb">
                    <li>
                        <a href="#">
                            <img src="/resources/images/ico-admin-setting.png" alt="" class="icon">
                            환경설정
                        </a>
                        <ol>
                            <li><a href="./config/info.html">기본환경정보</a></li>
                            <li><a href="./config/banner.html">약관관리</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <img src="/resources/images/ico-admin-academic.png" alt="" class="icon">
                            학사운영</a>
                        <ol>
                            <li><a href="#">교육 운영 현황</a></li>
                            <li><a href="#">학년별 학생 현황</a></li>
                            <li><a href="#">학과별 학생 현황</a></li>
                            <li><a href="#">강의 목록</a></li>
                            <li><a href="#">강의 등록</a></li>
                            <li><a href="#">수강 현황</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <img src="/resources/images/ico-admin-persons.png" alt="" class="icon">
                            인사관리
                        </a>
                        <ol>
                            <li><a href="#">학생 목록 및 등록</a></li>
                            <li><a href="#">교수 목록 및 등록</a></li>
                            <li><a href="#">임직원 목록 및 등록</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <img src="/resources/images/ico-admin-college.png" alt="" class="icon">
                            대학 및 학과</a>
                        <ol>
                            <li><a href="#">대학 및 학과 목록</a></li>
                            <li><a href="#">대학 및 학과 등록</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <img src="/resources/images/ico-admin-board.png" alt="" class="icon">
                            게시판관리</a>
                        <ol>
                            <li><a href="#">입학안내 공지사항</a></li>
                            <li><a href="#">학사안내 공지사항</a></li>
                            <li><a href="#">커뮤니티 공지사항</a></li>
                            <li><a href="#">입학상담</a></li>
                            <li><a href="#">질문 및 답변</a></li>
                            <li><a href="#">식단안내</a></li>
                            <li><a href="#">자료실</a></li>
                        </ol>
                    </li>
                </ul>
            </aside>