package controller.collegelife.gallery;

import java.io.IOException;
import java.util.List;

import dao.collegelife.GalleryDAO;
import dto.collegelife.GalleryDTO;
import dto.collegelife.GalleryPagenationDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 * 날짜 : 2025/09/09
 * 이름 : 박효빈
 * 내용 : 갤러리 컨트롤러 작성 + 페이징 시작
 */
@WebServlet("/collegelife/gallery.do")
public class GalleryController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/* service, logger 추가 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/* 필요 시 DB Logic 추가 */
		
		// 요청 페이지 번호 수신
		String page = request.getParameter("page"); 
	
		// 페이지네이션 처리 요청 dto.collegelife.PagenationDTO;
 		//PagenationDTO pagenationDTO 

		GalleryDAO dao = GalleryDAO.getInstance();
		List<GalleryDTO> galleryList = dao.selectAll();

		request.setAttribute("galleryList", galleryList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/collegelife/gallery.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
