package controller.stusup.grade;
/*
날짜: 2025/09/11
이름: 장진원
내용: 성적조회 컨트롤러
 */
import java.io.IOException;
import java.util.List;

import dao.stusup.GradeDAO;
import dto.stusup.GradeDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 학생 성적 목록을 처리하는 서블릿입니다.
 * URL 패턴 "/stusup/grade.do"에 대한 GET 요청을 처리합니다.
 */
@WebServlet("/stusup/grade.do")
public class GradeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private GradeDAO gradeDAO;

    public void init() throws ServletException {
        // 서블릿 초기화 시 DAO 객체를 생성합니다.
        gradeDAO = new GradeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1. DAO를 통해 모든 성적 데이터를 조회합니다.
            List<GradeDTO> gradeList = gradeDAO.getAllGrades();

            // 2. 총 취득 학점을 계산합니다.
            int totalCredits = 0;
            for (GradeDTO grade : gradeList) {
                totalCredits += grade.getCredit();
            }

            // 3. 조회된 데이터와 계산된 총 학점을 Request 속성(attribute)에 저장합니다.
            request.setAttribute("gradeList", gradeList);
            request.setAttribute("totalCredits", totalCredits);

            // 4. 성적 목록을 보여주는 JSP 페이지로 요청을 전달(포워딩)합니다.
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/stusup/grade.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "성적 데이터 처리 중 오류가 발생했습니다.");
        }
    }
}