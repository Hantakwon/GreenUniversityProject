<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="./_header.jsp" %>
<script>	
	document.addEventListener('DOMContentLoaded', function(){
		
		const formComment = document.formComment;
		const noticeId = ${noticeDTO.id}; // 게시물 ID를 JS 변수에 할당
		
		// 댓글 입력
		formComment.addEventListener('submit', function(e){
			e.preventDefault();
			
			const formData = new FormData();
			formData.append('id', formComment.id.value);
			formData.append('content', formComment.content.value);
			
			fetch('/notice/comment/write.do', {
				method: 'POST',
				body: formData
			})
				.then(response => response.json())
				.then(data => {
					console.log(data);					
					const commentArticle = `<article>
								                <span class="date">\${data.created_at}</span>
								                <p class="content">\${data.content}</p>                        
								                <div>
								                    <a href="#" class="remove">삭제</a>
								                    <a href="#" class="modify">수정</a>
								                </div>
								            </article>`;
					
		            commentList.insertAdjacentHTML('beforeEnd', commentArticle);
					empty.remove();
								            
					formComment.reset();
										
				})
				.catch(err => {
					console.log(err);
				});
			
		}); // 댓글 입력 끝
		
		
		// 댓글 목록 출력
		const commentList = document.getElementsByClassName('commentList')[0];
		const empty = commentList.getElementsByClassName('empty')[0];
		
		fetch('/notice/comment/list.do?id='+noticeId)
			.then(resp => resp.json())
			.then(data => {
				console.log(data);
				
				for(const comment of data){
					const commentArticle = `<article>
								                <span class="date">\${comment.created_at}</span>
								                <p class="content">\${comment.content}</p>                        
								                <div>
								                    <a href="#" class="remove">삭제</a>
								                    <a href="#" class="modify">수정</a>
								                </div>
								            </article>`;								            
					
					commentList.insertAdjacentHTML('beforeEnd', commentArticle);
					empty.remove();
				}
			})
			.catch(err => {
				console.log(err);
			});
		
		
		// 글삭제
		const btnRemove = document.getElementsByClassName('btnRemove')[0];
		
		btnRemove.addEventListener('click', function(e){
			
			if(!confirm('정말 삭제 하시겠습니까?')){
				e.preventDefault();		
			}
		});
	});
</script>

<main id="article">
    <section class="view">
        <nav>
            <h1>글보기</h1>
        </nav>
        <table border="0">                    
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="${noticeDTO.title}" readonly/></td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" readonly>${noticeDTO.content}</textarea>
                </td>
            </tr>                    
        </table>
        
        <div>
	        <a href="/notice/delete.do?id=${noticeDTO.id}" class="btn btnRemove">삭제</a>
	        <a href="/notice/modify.do" class="btn btnModify">수정</a>
            <a href="/notice/list.do" class="btn btnList">목록</a>
        </div>

        <section class="commentList">
            <h3>댓글목록</h3>
            <p class="empty">등록된 댓글이 없습니다.</p>
		</section>
		
        <section class="commentForm">
            <h3>댓글쓰기</h3>
            <form name="formComment">
            	<input type="hidden" name="id" value="${noticeDTO.id}">
                <textarea name="content" placeholder="댓글 입력"></textarea>
                <div>
                    <a href="#" class="btn btnCancel">취소</a>
                    <input type="submit" value="작성완료" class="btn btnComplete"/>
                </div>
            </form>
        </section>

    </section>
</main>
<%@ include file="./_footer.jsp" %>