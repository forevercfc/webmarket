package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.DBConnection;

//데이터 엑세스하는 클래스
public class BoardDAO {
	private static BoardDAO instance;
	private BoardDAO() {
		
	}
	public static BoardDAO getInstance() {
		if(instance == null)
			instance = new BoardDAO();
		return instance;
	}
	
	/* 게시판 하단의 페이징과 검색기능 구현을 위해 board테이블에서 원하는 조건에 맞는 레코드 개수를 얻어오는 함수생성 */
	public int getListCount(String items, String text) {//items: 컬럼명, text:사용자가 입력한 키워드 문자열
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0; //선택된 총 게시글의 갯수
		
		String sql;
		
		//검색어가 없으면 리스트 모두 가져오고 검색어가 있으면 검색한 리스트 가져올 때 매개변수로 받은 items와 text의 값이 들어갈 수 있도록 한다.
		if(items == null && text == null) sql="select count(*) from board";
		else sql="select count(*) from board where "+items+" like '%"+text+"%'";
		
		try {
			conn= DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) x = rs.getInt(1);
			//rs의 첫번째 결과값을 가지고 와서 정수타입의 x(선택된 총 게시글의 갯수)에 저장
			
		} catch (Exception e) {
			System.out.println("getBoardList()에러"+e);
		} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return x; //선택된 총 게시글의 갯수를 리턴
	}
	
	//board 테이블의 레코드 목록 가져오는 page를 매개변수로 가지는 함수 생성
	public ArrayList<BoardDTO> getBoardList(int page){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from board order by num desc";
		//최신글이 맨 앞에 오도록 오름차순으로 읽어옴
		
		ArrayList<BoardDTO> list = new ArrayList<>();
		
		try {
			conn= DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setUpdate_day(rs.getString("regist_day"));
				list.add(board);
			}			
			return list; //저장한 게시글의 목록을 리턴
			
		} catch (Exception e) {
			System.out.println("getBoardList()에러"+e);
		} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return null;
	}
	
	//board 테이블의 레코드 목록 가져오는 page, limit, items, text 네개의 매개변수를 가지는 함수 생성
		public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int total_record = getListCount(items, text);
			//현재 페이지 넘버에서 1을 뺀 후 limit(5)를 곱한 값을 start에 저장=>0,5,10,15...
			int start = (page-1)*limit;
			//rs에서 활용할 index를 정의
			int index = start+1; //1,6,11...
			
			String sql;
			
			//검색어가 없으면 최신글이 맨 앞에 오도록 오름차순으로 모든 게시글을 읽어옴
			if(items==null && text ==null) sql = "select * from board order by num desc";
			else sql = "select * from board where "+items+" like '%"+text+"%' order by num desc";
			
			ArrayList<BoardDTO> list = new ArrayList<>();
			
			try {
				conn= DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				//rs.absolute(index)를 사용하기 위해 매개변수를 sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY를 사용함.=>TYPE_SCROLL_INSENSITIVE:rs에서 화면이동하는데 사용할 수 있는 커서로 rs.next()를 사용하면 다음 결과 행을 가져오고 다음에는 이전 값을 사용 못하지만 이 옵션을 설정하여 rs를 만들면 한 번 커서가 지나간 다음에도 다시 커서를 앞으로 되돌릴 수 있다. CONCUR_READ_ONLY:rs로 가져온 row의 값을 insert, update로 사용하지 않고 데이터를 읽기만 하겠다.
				rs = pstmt.executeQuery();
				
				while(rs.absolute(index)) { //absolute(index): rs 커서를 원하는 위치(index)의 검색행으로 이동하는 메소드로 rs에서 가져온 행의 1, 6, 11...이런식으로 loop를 돌면서 dto객체를 생성하고 각 컬럼의 데이터를 얻어와 설정함
					BoardDTO board = new BoardDTO();
					board.setNum(rs.getInt("num"));
					board.setId(rs.getString("id"));
					board.setName(rs.getString("name"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setHit(rs.getInt("hit"));
					board.setIp(rs.getString("ip"));
					board.setRegist_day(rs.getString("regist_day"));
					board.setUpdate_day(rs.getString("regist_day"));
					list.add(board);
					
					if(index < (start+limit) && index <= total_record) index++;
					//page:1, start:0, limit:5, index:1, total_record:6이라고 가정
					
					//1<(0+5) && 1<=6 =>index:2		//6<(5+5) && 6<=6 => index:7
					//2<(0+5) && 2<=6 =>index:3		//7<(5+5) && 7<=6 => index는 1증가 안하고:7
					//4<(0+5) && 4<=6 =>index:5
					//5<(0+5) && 5<=6 =>index는 1증가 안하고:5
					else break;
				}			
				return list; //저장한 게시글의 목록을 리턴
				
			} catch (Exception e) {
				System.out.println("getBoardList()에러"+e);
			} finally {
					try {
						if(rs != null) rs.close();
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
			return null;
		}
	
		//member 테이블에서 인증된 id의 사용자명을 가져오는 함수
		public String getLoginNameById(String id) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String name=null;
			String sql="select * from member where id=?";
			
			try {
				conn= DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) name = rs.getString("name");
				return name;
				
			} catch (Exception e) {
				System.out.println("getLoginNameById()에러"+e);
			} finally {
					try {
						if(rs != null) rs.close();
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
			return null;
		}
		
		public void insertBoard(BoardDTO board) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn= DBConnection.getConnection();
				String sql = "insert into board values ( num.nextval, ?, ? , ?, ?,?,?,sysdate,sysdate)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, board.getId());
				pstmt.setString(2, board.getName());
				pstmt.setString(3, board.getSubject());
				pstmt.setString(4, board.getContent());
				pstmt.setInt(5, board.getHit());
				pstmt.setString(6, board.getIp());
				
				pstmt.executeUpdate();
						
			} catch (Exception e) {
				System.out.println("insertBoard()에러"+e);
			} finally {
					try {
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		}
		
		//선택된 글 상세 내용 가져오는 함수
		public BoardDTO getBoardByNum(int num, int page) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			BoardDTO board = null;
			
			//내가 본 글의 조회수를 증가시키는 함수
			updateHit(num);
			
			String sql="select * from board where num=?";
			
			try {
				conn= DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					board = new BoardDTO();
					board.setNum(rs.getInt("num"));
					board.setId(rs.getString("id"));
					board.setName(rs.getString("name"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setHit(rs.getInt("hit"));
					board.setIp(rs.getString("ip"));
					board.setRegist_day(rs.getString("regist_day"));
					board.setUpdate_day(rs.getString("update_day"));
				}
				
			} catch (Exception e) {
				System.out.println("getBoardByNum()에러"+e);
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return board;
		}
		
		//조회수 증가 기능
		public void updateHit(int num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn= DBConnection.getConnection();
				
				String sql="select hit from board where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				int hit = 0;
				
				if(rs.next()) hit = rs.getInt("hit")+1;
				
				sql="update board set hit=? where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, hit);
				pstmt.setInt(2, num);
				pstmt.executeQuery();
				
			} catch (Exception e) {
				System.out.println("updateHit()에러"+e);
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		//본인이 올린 글 내용 수정하는 기능
		public void updateBoard(BoardDTO board) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			String sql="update board set subject=?, content=?, ip=?, update_day=sysdate where num=?";			
			
			try {
				conn= DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				//conn.setAutoCommit(false);
				
				pstmt.setString(1,board.getSubject());
				pstmt.setString(2,board.getContent());
				pstmt.setString(3,board.getIp());
				pstmt.setInt(4,board.getNum() );
				
				pstmt.executeUpdate();
				//conn.commit();
				
			} catch (Exception e) {
				System.out.println("updateBoard()에러"+e);
			} finally {
				try {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}			
		}
	
		//본인글 삭제하는 기능
		public void deleteBoard(int num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			String sql="delete from board where num=?";
			
			try {
				conn= DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("deleteBoard()에러"+e);
			} finally {
				try {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
}














