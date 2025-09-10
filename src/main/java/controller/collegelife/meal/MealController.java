package controller.collegelife.meal;

import java.io.IOException;
import java.util.List;

import dao.collegelife.MealDAO;
import dto.collegelife.MealDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 * 날짜 : 2025/09/10
 * 이름 : 박효빈
 * 내용 : Meal 컨트롤러 작성
 */
@WebServlet("/collegelife/meal.do")
public class MealController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/* service, logger 추가 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* 필요 시 DB Logic 추가 */
		MealDAO dao = MealDAO.getInstance();
		List<MealDTO> mealList = dao.seleteAll();
		request.setAttribute("mealList", mealList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/collegelife/meal.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
