package notice_test3.controller;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import notice_test3.dao.NoticeDAO;
import notice_test3.dto.NoticeDTO;

@WebServlet("/view.do")
public class ViewController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private NoticeDAO dao = NoticeDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String idStr = req.getParameter("id");
        int id = Integer.parseInt(idStr);

        // selectNotices()를 selectNotice()로 변경
        NoticeDTO notice = dao.selectNotice(id);

        req.setAttribute("notice", notice);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view.jsp");
        dispatcher.forward(req, resp);
    }
}
