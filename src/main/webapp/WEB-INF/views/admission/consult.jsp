<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그린대학교</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admission/common.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admission/consult.css">
</head>
<!--
	날짜 : 2025/09/05
    이름 : 한탁원
    내용 : 입학상담
-->

<body>
	<jsp:include page="../header.jsp" />
	<div class="path-wrap">
		<div class="path-box">
			<div class="jwxe_navigator jw-relative">
				<ul>
					<li><a href="#"><img src="../resources/images/ico-home.png" alt="home" /></a></li>
					<li><a href="#">입학안내</a></li>
					<li>입학상담</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="sub-container">
		<div class="lnb-wrap">
			<div class="lnb">
				<div class="lnb-title-box">
					<div>
						<h2>입학안내</h2>
					</div>
				</div>

				<ul class="lnb-menu jwxe-menu-ul">
					<li><a href="/admission/notice.do">공지사항</a></li>

					<li><a href="/admission/rolling.do">수시모집</a></li>
 
					<li><a href="/admission/regular.do">정시모집</a></li>
					
					<li><a href="/admission/transfer.do">편입학</a></li>
				
					<li class="active"><a href="/admission/consult.do" class="active">입학상담</a></li>

				</ul>
			</div>
		</div>
		<div class="content-wrap">

			<div class="title">
				<div class="jwxe_mnu_template jw-relative page-title">
					<h3>입학상담</h3>
				</div>
			</div>
			<div class="content" id="jwxe_main_content">
				<div class="content-box">
					<!-- 입학상담 컨텐츠 시작 -->
						<div class="admission-main">
						    <div class="admission-bg">
						        <div class="admission-text">
						        </br>
						        </br>
						        </br>
						            <h1>미래를 움직이는 인재 그린인</h1>
						            <p>그 인재의 가치를 아는 대학, 그린대학교</p>
						            </br>
						        </br>
						        </br>
						        </div>
						        
						    </div>
						    </br>
						    </br>
						    </br>
						    </br>
						    <h4>입학 상담 문의 전화</h4>
							<h1>051-912-1000</h1>
							<h3>채팅 상담도 가능합니다.</h3>
						</div>
						<!-- 입학상담 컨텐츠 끝 -->
				</div>
			</div>
		</div>
	</div>
	<!-- 상담 버튼 -->
	<div id="chatbot-button">💬</div>
	
	<!-- 상담창 -->
	<div id="chatbot-window">
	    <div class="chatbot-header">
	        입학상담 챗봇
	        <span id="chatbot-close">✖</span>
	    </div>
	    <div class="chatbot-messages" id="chatbot-messages">
	        <div class="bot-message">안녕하세요! 입학 상담을 도와드릴게요 😊</div>
	    </div>
	    <div class="chatbot-input">
	        <input type="text" id="chatbot-text" placeholder="메시지를 입력하세요...">
	        <button id="chatbot-send">전송</button>
	    </div>
	</div>
	<!-- 상담 끝 -->
	
	<jsp:include page="../footer.jsp" />
</body>
</html>

	<!-- 상담 챗봇 JS -->
	<script>
	    const chatBtn = document.getElementById("chatbot-button");
	    const chatWin = document.getElementById("chatbot-window");
	    const chatClose = document.getElementById("chatbot-close");
	    const chatSend = document.getElementById("chatbot-send");
	    const chatInput = document.getElementById("chatbot-text");
	    const chatMessages = document.getElementById("chatbot-messages");
	
	    chatBtn.addEventListener("click", () => {
	        chatWin.style.display = "flex";
	    });
	
	    chatClose.addEventListener("click", () => {
	        chatWin.style.display = "none";
	    });
	
	    chatSend.addEventListener("click", sendMessage);
	    chatInput.addEventListener("keypress", function(e) {
	        if (e.key === "Enter") sendMessage();
	    });
	
	    function sendMessage() {
	        const text = chatInput.value.trim();
	        if (text === "") return;
	
	        const userMsg = document.createElement("div");
	        userMsg.className = "user-message";
	        userMsg.innerText = text;
	        chatMessages.appendChild(userMsg);
	        chatInput.value = "";
	
	        const botMsg = document.createElement("div");
	        botMsg.className = "bot-message";
	
	        // 키워드에 따른 버튼 제공
	        if (text.includes("수시")) {
	            botMsg.innerHTML = "수시모집 정보를 보시려면 아래 버튼을 클릭하세요.<br><button onclick=\"location.href='/admission/rolling.do'\">수시모집 바로가기</button>";
	        } else if (text.includes("정시")) {
	            botMsg.innerHTML = "정시모집 정보를 보시려면 아래 버튼을 클릭하세요.<br><button onclick=\"location.href='/admission/regular.do'\">정시모집 바로가기</button>";
	        } else if (text.includes("편입")) {
	            botMsg.innerHTML = "편입학 정보를 보시려면 아래 버튼을 클릭하세요.<br><button onclick=\"location.href='/admission/transfer.do'\">편입학 바로가기</button>";
	        } else {
	            botMsg.innerText = "문의해주셔서 감사합니다! (" + text + ")";
	        }
	
	        chatMessages.appendChild(botMsg);
	        chatMessages.scrollTop = chatMessages.scrollHeight;
	    }
	</script>
	<jsp:include page="../footer.jsp" />
</body>
</html>