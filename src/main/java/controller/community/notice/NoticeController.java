package controller.community.notice;
/*
날짜: 2025/09/11
이름: 장진원
내용: 공지사항 컨트롤러 (페이지네이션 기능 추가)
 */

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

    private NoticeDAO dao = NoticeDAO.getInstance();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Pagination variables
        int currentPage = 1; 
        int pageSize = 10; // 10 posts per page
        
        // Get current page number from request parameter
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                // If the parameter isn't a number, default to page 1
                currentPage = 1;
            }
        }

        // Get total post count from DAO
        int totalCount = dao.selectNoticeCount();
        int totalPage = (int) Math.ceil((double) totalCount / pageSize);

        // Calculate the starting index for the SQL query
        int start = (currentPage - 1) * pageSize;

        // Fetch posts for the current page from DAO
        List<NoticeDTO> notices = dao.selectNotices(start, pageSize);

        // Set attributes for the JSP view
        request.setAttribute("notices", notices);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("currentPage", currentPage);

        // Forward to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/community/notice.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}