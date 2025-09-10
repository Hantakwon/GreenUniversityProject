package controller.community.free;
/*
import java.io.IOException;
import java.util.List;

import dao.community.FreeDAO;
import dto.community.FreeDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/community/free.do")
public class FreeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private FreeDAO freeDao = new FreeDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<FreeDTO> freeList = freeDao.getFreeList();
		
		request.setAttribute("freeList", freeList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/community/free.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
*/