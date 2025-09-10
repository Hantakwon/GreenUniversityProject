package controller.community.notice;

import dao.community.NoticeDAO;
import dto.community.NoticeDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/community/notice.do")
public class NoticeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. DAO 객체 생성 및 게시물 목록 조회
        NoticeDAO dao = NoticeDAO.getInstance();
        List<NoticeDTO> notices = dao.selectNotices();

        // 2. 조회된 목록을 request에 담기
        request.setAttribute("notices", notices);

        // 3. JSP 페이지로 포워드
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/community/notice.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}