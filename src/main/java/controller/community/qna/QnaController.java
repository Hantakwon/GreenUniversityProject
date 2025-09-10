package controller.community.qna;
/*
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.community.QnaDAO;
import dto.community.QnaDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/community/qna.do")
public class QnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private QnaDAO qnaDao = new QnaDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<QnaDTO> qnaList = qnaDao.getQnaList();
		
		request.setAttribute("qnaList", qnaList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/community/qna.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}*/