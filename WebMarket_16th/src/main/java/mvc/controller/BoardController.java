package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static final int LISTCOUNT = 5; // 한 페이지에 글 목록이 몇 개 보일지 설정

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implement your doPost logic here if needed.
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        System.out.println("requestURI : " + requestURI);
        String contextPath = request.getContextPath();
        System.out.println("contextPath : " + contextPath);
        String command = requestURI.substring(contextPath.length());

        response.setContentType("text/html; charset=utf-8");

        // Mapping
        if (command.equals("/BoardListAction.do")) {
            requestBoardList(request);
            RequestDispatcher rd = request.getRequestDispatcher("./board/list.jsp");
            rd.forward(request, response);
        }
    }

    public void requestBoardList(HttpServletRequest request) {
        BoardDAO dao = BoardDAO.getInstance();
        List<BoardDTO> boardlist = new ArrayList<BoardDTO>();

        int pageNum = 1;
        int limit = LISTCOUNT;

        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }
        boardlist = dao.getBoardList(pageNum);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("boardlist", boardlist);
    }
}
