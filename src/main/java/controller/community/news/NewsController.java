package controller.community.news;

import dao.community.NewsDAO;
import dto.community.NewsDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/*
 * 날짜 : -
 * 이름 : 장진원
 * 내용 : 뉴스 및 칼럼 컨트롤러
 */
@WebServlet("/community/news.do")
public class NewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private NewsDAO newsDao = new NewsDAO(); // NewsDAO 객체 생성
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<NewsDTO> newsList = newsDao.getNewsList(); // DB에서 뉴스 목록 가져오기
		
		request.setAttribute("newsList", newsList); // 요청(request) 객체에 뉴스 목록 담기
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/community/news.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}