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

public class BoardController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;//게시판 글목록이 한페이지에 몇개씩 보여질건지 상수로 지정
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setHeader("Cache-Control", "no-cache");
//		response.addHeader("Cache-Control", "no-store");
//		response.setHeader("Pragma", "no-cache");
//		response.setDateHeader("Expires", 1L);
		
		String RequestURI = request.getRequestURI();//가져오는 주소 /board/list.jsp
		System.out.println("RequestURI :"  +RequestURI);
		String contextPath = request.getContextPath();//가져오는 주소 /board
		System.out.println("contextPath :" +contextPath);
		String command = RequestURI.substring(contextPath.length()); //가져오는 주소 /list.jsp
//		 예)/board/list.jsp=>/list.jsp
				
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
//		mapping
		if(command.equals("/BoardListAction.do")) {
			requestBoardList(request); // 게시판 목록 가져오는 사용자 정의 함수
			RequestDispatcher rd = request.getRequestDispatcher("./board/list.jsp");
			rd.forward(request, response);
		}else if(command.equals("/BoardWriteForm.do")) { //글 등록 페이지로의 요청을 받으면
			requestLoginName(request); //인증된 사용자명 가져오는 사용자 정의 함수
			RequestDispatcher rd = request.getRequestDispatcher("./board/writeForm.jsp");
			rd.forward(request, response);//request, response 매개변수를 가지고 디스패쳐 주소로 이동
		}else if(command.equals("/BoardWriteAction.do")) {
			requestBoardWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("BoardListAction.do");
			rd.forward(request, response);//request, response 매개변수를 가지고 디스패쳐 주소로 이동
		}else if(command.equals("/BoardViewAction.do")) {//선택된 글 상세 페이지 요청
			requestBoardView(request); 
			RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
			rd.forward(request, response);
		}else if(command.equals("/BoardView.do")) {//글 상세 페이지 출력하기
			RequestDispatcher rd = request.getRequestDispatcher("./board/view.jsp");
			rd.forward(request, response);
		}else if(command.equals("/BoardUpdateAction.do")) {//본인 게시글 내용 수정하기
			requestBoardUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}else if(command.equals("/BoardDeleteAction.do")) {//글 상세 페이지 출력하기
			requestBoardDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}
	}
	
//	등록된 글 목록을 가져오는 함수
	public void requestBoardList(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
		int pageNum = 1;
		int limit = LISTCOUNT;
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		
		//사용자가 게시판 하단의 검색창을 이용해서 option(items)를 선택하고 문자열(text)을 입력후 검색버튼을 클릭하며 request 객체에 저장하여 얻어와 해당 변수에 초기화
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		//옵션별로 검색한 단어와 관련된 갯수를 리턴해서 total_record에 저장
		int total_record = dao.getListCount(items, text);		
		
		boardlist = dao.getBoardList(pageNum,limit,items,text);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_record", total_record);
		
		//※검색시 검색결과 안에서 페이징되도록 추가※
		request.setAttribute("items", items);
		request.setAttribute("text", text);
		
		int total_page; //총 게시판 페이지수
		//조건에 맞는 게시글 행을 limit(5)로 나누어 나머지가 0이면 그냥 몫을 게시판 페이지수로 설정
		if(total_record % limit == 0) total_page = total_record/limit;
		else {
			total_page = total_record/limit;
			total_page = total_page+1;
		}//나머지가 0이 아니면 총 게시판 페이지수에 1을 더해 저장한다.
		
		request.setAttribute("total_page", total_page);
		request.setAttribute("boardlist", boardlist);
	}
	
	//인증된 사용자명 가져오는 함수 구현
	public void requestLoginName(HttpServletRequest request) {
		String id = request.getParameter("id");
		BoardDAO dao = BoardDAO.getInstance();
		String name = dao.getLoginNameById(id);
		request.setAttribute("name", name);
	}
	
	//새로운 글 등록하는 함수구현
	public void requestBoardWrite(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO board = new BoardDTO();
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("subject"));
		System.out.println(request.getParameter("content"));
		
		board.setHit(0);
		board.setIp(request.getRemoteAddr());
		
		dao.insertBoard(board);
	}
	
	//선택된 글의 상세 페이지 가져오는 로직
	public void requestBoardView(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num, pageNum);
		
		request.setAttribute("num",num);
		request.setAttribute("page",pageNum);
		request.setAttribute("board",board);		
	}
	
	//선택된 글 내용 수정하는 함수
	public void requestBoardUpdate(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO board = new BoardDTO();
		board.setNum(num);
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		board.setUpdate_day(request.getParameter("update_day"));
		board.setIp(request.getRemoteAddr());
		
		dao.updateBoard(board);
	}
	
	//본인글 삭제하는 함수
	public void requestBoardDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(num);		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}