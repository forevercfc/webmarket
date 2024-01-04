package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO {
    private static BoardDAO instance;

    private BoardDAO() {
    }

    public static BoardDAO getInstance() {
        if (instance == null) {
            instance = new BoardDAO();
        }
        return instance;
    }

    public ArrayList<BoardDTO> getBoardList(int page) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from board order by num desc"; // 페이지네이션 적용 필요

        ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardDTO board = new BoardDTO();
                board.setNum(rs.getInt("num"));
                board.setId(rs.getString("id"));
                board.setName(rs.getString("name"));
                board.setSubject(rs.getString("subject"));
                board.setContent(rs.getString("content"));
                board.setHit(rs.getInt("hit"));
                board.setIp(rs.getString("ip"));
                board.setRegist_day(rs.getString("regist_day"));
                board.setUpdate_day(rs.getString("update_day"));
                list.add(board);
            }
            return list; // 저장한 게시글의 목록을 리턴
        } catch (Exception e) {
            System.out.println("getBoardList()Error : " + e);
            return new ArrayList<BoardDTO>(); // 예외 발생 시 빈 리스트 반환
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
