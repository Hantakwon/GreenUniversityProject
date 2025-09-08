<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 
	날짜 :
	이름 : 박효빈
	내용 : 갤러리
-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/academic/academic.css">

<body>
    <main>
        <div>
            <div class="info">
                <span id="test">
                    <img src="./images/ico-home.png" alt="홈 버튼">
                    > 대학생활 > 학생회 소개
                </span>
            </div>
        </div>
        <div>
            <div class="content-wrapper">
                <div class="sidebar">
                    <div class="top">
                        <h1>대학생활</h1>
                    </div>
                    <div class="bottom">
                        <ul>
                            <li class="#"><a href="#">학생회 소개</a></li>
                            <li class="#"><a href="#">동아리/스터디</a></li>
                            <li><a href="#">식단안내</a></li>
                            <li class="active"><a href="#">갤러리</a></li>

                        </ul>
                    </div>
                </div>
<div class="main-content">
    <div class="top">
        <h2>갤러리</h2>
    </div>
    <div class="bold-ment">
        <div class="gallery-container">
            <div class="gallery-item">
                <div class="img-box">
                    <img src="./images/gallary_sample1.jpg" alt="갤러리 이미지" />
                </div>
                <div class="text-box">
                    <p class="title">제40회 1995학년도 학위수여식</p>
                    <div class="details">
                        <span class="view-count">조회수 18</span>
                        <span class="divider">|</span>
                        <span class="date">글 등록일 25.02.28</span>
                    </div>
                </div>
            </div>
            <div class="gallery-item">
                <div class="img-box">
                    <img src="./images/gallary_sample2.jpg" alt="갤러리 이미지" />
                </div>
                <div class="text-box">
                    <p class="title">제41회 1995학년도 학위수여식</p>
                    <div class="details">
                        <span class="view-count">조회수 23</span>
                        <span class="divider">|</span>
                        <span class="date">글 등록일 25.02.28</span>
                    </div>
                </div>
            </div>
            <div class="gallery-item">
                <div class="img-box">
                    <img src="./images/gallary_sample3.jpg" alt="갤러리 이미지" />
                </div>
                <div class="text-box">
                    <p class="title">제40회 1995학년도 학위수여식</p>
                    <div class="details">
                        <span class="view-count">조회수 33</span>
                        <span class="divider">|</span>
                        <span class="date">글 등록일 25.02.28</span>
                    </div>
                </div>
            </div>
            <div class="gallery-item">
                <div class="img-box">
                    <img src="./images/gallary_sample4.png" alt="갤러리 이미지" />
                </div>
                <div class="text-box">
                    <p class="title">제40회 1995학년도 학위수여식</p>
                    <div class="details">
                        <span class="view-count">조회수 23</span>
                        <span class="divider">|</span>
                        <span class="date">글 등록일 25.02.28</span>
                    </div>
                </div>
            </div>
            <div class="gallery-item">
                <div class="img-box">
                    <img src="./images/gallary_sample5.jpg" alt="갤러리 이미지" />
                </div>
                <div class="text-box">
                    <p class="title">제41회 1995학년도 학위수여식</p>
                    <div class="details">
                        <span class="view-count">조회수 23</span>
                        <span class="divider">|</span>
                        <span class="date">글 등록일 25.02.28</span>
                    </div>
                </div>
            </div>
            </div>
        <div class="page-wrapper">
            <div class="page">
                <img src="./images/btn-first-page.png" alt="첫 페이지" class="pagination-arrow first" />
                <img src="./images/btn-prev-page.png" alt="이전 페이지" class="pagination-arrow prev" />
                <button class="page-btn active">1</button>
                <button class="page-btn">2</button>
                <button class="page-btn">3</button>
                <img src="./images/btn-next-page.png" alt="다음 페이지" class="pagination-arrow next" />
                <img src="./images/btn-last-page.png" alt="마지막 페이지" class="pagination-arrow last" />
            </div>
        </div>
    </div>
</div>
    </main>
</body>
</html>