package controller.community.news;

/*
날짜: 2025/09/11
이름: 장진원
내용: 뉴스 컨트롤러 (페이지네이션 기능 추가)
 */
import java.io.IOException;
import java.util.List;

import dao.community.NewsDAO;
import dto.community.NewsDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/community/news.do")
public class NewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private NewsDAO newsDao = NewsDAO.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        // 페이지네이션 변수 설정
        int currentPage = 1;
        int pageSize = 10; // 한 페이지에 10개씩 표시

        // 현재 페이지 번호 파라미터 받기
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                // 파라미터가 숫자가 아닌 경우 기본값 1로 설정
                currentPage = 1;
            }
        }

        // 전체 게시글 수와 총 페이지 수 계산
        int totalCount = newsDao.getNewsCount();
        int totalPage = (int) Math.ceil((double) totalCount / pageSize);

        // 페이지별 게시글 시작 인덱스 계산
        int start = (currentPage - 1) * pageSize;

        // 페이지에 맞는 게시글 목록 조회
		List<NewsDTO> newsList = newsDao.getNewsList(start, pageSize);
		
		// JSP에 데이터 전달
		request.setAttribute("newsList", newsList);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("currentPage", currentPage);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/community/news.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}