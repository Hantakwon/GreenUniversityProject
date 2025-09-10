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
import service.collegelife.GalleryService;

/*
 * 날짜 : 2025/09/09 ~ 2025/09/10
 * 이름 : 박효빈
 * 내용 : 갤러리 컨트롤러 작성 + 페이징 완료
 */
@WebServlet("/collegelife/gallery.do")
public class GalleryController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	GalleryService service = GalleryService.INSTANCE;
	/* service, logger 추가 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/* 필요 시 DB Logic 추가 */
		
		 // 1. 파라미터 받기 ( 현재 페이지 )
	    String page = request.getParameter("page"); 
	    int currentPage = (page == null) ? 1 : Integer.parseInt(page);
	    
	    int pageSize = 6; // 한 페이지 당 게시물 수
	    int start = (currentPage - 1) * pageSize;
	    
	    // 2. 전체 게시물 수
	    int totalCount = service.getTotalCount();
	    
	    // 3. 페이징 계산
	    int lastPageNum = (int) Math.ceil(totalCount / (double) pageSize);
	    
	    // 4. 현재 페이지에 해당하는 데이터 가져오기
	    List<GalleryDTO> galleryList = service.getGalleryList(start, pageSize);

	    // 5. JSP에 전달
	    request.setAttribute("galleryList", galleryList); // ✅ 이걸로 통일
	    request.setAttribute("currentPage", currentPage);
	    request.setAttribute("lastPageNum", lastPageNum);

	    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/collegelife/gallery.jsp");
	    dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
