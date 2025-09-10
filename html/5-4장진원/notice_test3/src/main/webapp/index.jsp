<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Board Project</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css" />
</head>
<body>
    <div id="wrapper">
        <header>
            <h3>
                <a href="/index.jsp" class="title">Board Project</a>
            </h3>
        </header>

        <main>
            <section class="overview">
                <h4>프로젝트 개요</h4>
                <p>
                    본 프로젝트는 JSP를 활용하여 CRUD 기능을 제공하는 게시판을 개발하는 것입니다.<br>
                    사용자들은 게시글을 작성, 조회, 수정, 삭제할 수 있으며, 회원가입 및 로그인 기능도 포함합니다.<br>
                    이 프로젝트를 통해 JSP 및 서블릿 및 스프링 기반 웹 애플리케이션 개발의 기본 개념을 익히고, 실전 경험을 쌓을 수 있습니다.
                </p>
            </section>
            
            <section class="main-features">
                <h4>주요기능</h4>
                <ul>
                    <li><a href="/notice_test3/notice/list.do">공지사항</a></li>
                    <li><a href="#">자유게시판</a></li>
                    <li><a href="#">자료실</a></li>
                </ul>
            </section>
            
            <section class="tech-stack">
                <h4>기술스택</h4>
                <ul>
                    <li>HTML5, CSS3, Javascript</li>
                    <li>JSP, Servlet, Spring</li>
                    <li>MySQL, Tomcat</li>
                </ul>
            </section>
        </main>
    </div>    
</body>
</html>