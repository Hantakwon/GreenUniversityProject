package controller.stusup.course_reg_list;
/*
날짜: 2025/09/11
이름: 장진원
내용: 수강신청내역 컨트롤러
 */
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.stusup.Course_reg_listDAO;
import dto.stusup.Course_reg_listDTO;

@WebServlet("/stusup/course_reg_list.do")
public class Course_reg_listController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private Course_reg_listDAO courseDao = new Course_reg_listDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = "20251234"; 
        
        List<Course_reg_listDTO> registeredCourses = courseDao.getRegisteredCourses(studentId);

        // 컨트롤러에서 총 취득 학점 계산
        int totalCredits = 0;
        for (Course_reg_listDTO course : registeredCourses) {
            totalCredits += course.getCredit();
        }
        
        request.setAttribute("registeredCourses", registeredCourses);
        request.setAttribute("totalCredits", totalCredits); // 계산된 총 학점을 request에 추가
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/stusup/course_reg_list.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}