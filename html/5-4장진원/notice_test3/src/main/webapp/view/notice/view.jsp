<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="./_header.jsp" %>
<main id="article">
    <section class="list">
        <nav>
            <h1>전체 글목록<span>${paginationDTO.total}건</span></h1>
            <jsp:include page="./_searchForm.jsp"></jsp:include>
        </nav>
        <table border="0">
        	<tr>
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>날짜</th>
                <th>조회</th>
            </tr>
            <c:forEach var="notice" items="${noticeList}" varStatus="status">            	
	            <tr>
	                <td>${paginationDTO.currentPageStartNum - status.index}</td>
	                <td><a href="/notice/view.do?id=${notice.id}">${notice.title}</a></td>
	                <td>${notice.nick}</td>
	                <td>${notice.created_at}</td>
	                <td>${notice.views}</td>
	            </tr>
            </c:forEach>
        </table>
        <div class="page">
        	<c:if test="${paginationDTO.pageGroupStart > 1}">
            	<a href="/notice/list.do?pg=${paginationDTO.pageGroupStart-1}" class="prev">이전</a>
            </c:if>
            <c:forEach var="num" begin="${paginationDTO.pageGroupStart}" end="${paginationDTO.pageGroupEnd}" >
            	<a href="/notice/list.do?pg=${num}" class="num ${paginationDTO.currentPage == num ? 'current' : 'off'}">${num}</a>
            </c:forEach>
            <c:if test="${paginationDTO.pageGroupEnd < paginationDTO.lastPageNum}">
            	<a href="/notice/list.do?pg=${paginationDTO.pageGroupEnd+1}" class="next">다음</a>
            </c:if>
        </div>

		<c:if test="${role != 'GUEST'}">
        	<a href="/notice/write.do" class="btn btnWrite">글쓰기</a>
        </c:if>
    </section>
</main>
<%@ include file="./_footer.jsp" %>