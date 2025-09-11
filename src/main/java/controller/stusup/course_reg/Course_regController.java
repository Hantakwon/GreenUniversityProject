package controller.stusup.course_reg;
/*
날짜: 2025/09/11
이름: 장진원
내용: 수강신청 컨트롤러
 */
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.stusup.Course_regDAO;
import dto.stusup.Course_regDTO;

@WebServlet("/stusup/course_reg.do")
public class Course_regController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private Course_regDAO courseDao = new Course_regDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        List<Course_regDTO> courseList = courseDao.getCourseList();
        
        request.setAttribute("courseList", courseList);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/stusup/course_reg.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
