package com.chat;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.chat.ConnectionUtil;


public class ChatDAO {
	
	// 기존 채팅 데이터 가져오기
	@SuppressWarnings("unchecked")
	public JSONArray getText(int chatNo, String memId) throws Exception {
			
		String sql = "select c.chat_no, c.mem_id, c.chat_text, m.mem_entrance_date		"
					+"		,to_char(c.chat_regdate,'yyyy-mm-dd') as chat_regdate			"
					+"		,to_char(c.chat_regdate,'hh:mi') as chat_regtime				"
					+"		,to_char(c.chat_regdate,'am') as chat_regampm					"
					+"		,to_char(c.chat_regdate,'day') as chat_regday					"
					+"from tb_board_chat c, tb_board_chat_member m						"		
					+"where c.CHAT_NO = m.chat_no										"			
					+"and c.chat_regdate > m.MEM_ENTRANCE_DATE							"		
					+"and c.chat_no = ?													"	
					+"and m.MEM_ID = ?													"	
					+"order by c.chat_regdate asc";

		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, chatNo);
		pstmt.setString(2, memId);
		ResultSet rs = pstmt.executeQuery();
		
		JSONArray dataList = new JSONArray();
		while (rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("chatNo", rs.getInt("chat_no"));
			obj.put("memId", rs.getString("mem_id"));
			obj.put("chatText", rs.getString("chat_text"));
			obj.put("chatRegdate", rs.getString("chat_regdate"));
			obj.put("chatRegtime", rs.getString("chat_regtime"));
			obj.put("chatRegampm", rs.getString("chat_regampm"));
			obj.put("chatRegday", rs.getString("chat_regday"));
			dataList.add(obj);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return dataList;
		
	}
	
	// 채팅 데이터 저장하기
	public void saveText(int chatNo, String memId, String chatText) throws Exception {
		
		String sql = "insert into TB_BOARD_CHAT(chat_no, mem_id, chat_text)	"
					+"values(?, ?, ?)";
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, chatNo);
		pstmt.setString(2, memId);
		pstmt.setString(3, chatText);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	// 새로운 채팅 생성
	public void createNewChat(String memId) throws Exception {
		
		String sql = "insert into tb_board_chat_member(chat_no, mem_id)	"
					+"values(seq_chat_no.nextval, ?)";
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memId);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
	}
	
	// 생성한 채팅방 번호 가져오기
	public int getNewChatNo(String memId) throws Exception {
		
		String sql = "select max(chat_no) as chat_no	"
					+"from tb_board_chat_member 		"
					+"where mem_id = ?";
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memId);
		ResultSet rs = pstmt.executeQuery();
		
		int result = 0;
		if (rs.next()) {
			result = rs.getInt("chat_no");
		}

		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 해당 채팅방 나가기 처리
	public void outChat(int chatNo, String memId) throws Exception {
		
		String sql = "delete from tb_board_chat_member	"
					+"where chat_no = ?					"
					+"and mem_id = ?";
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, chatNo);
		pstmt.setString(2, memId);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
	}
	
	// 내가 참여중인 채팅목록 가져오기
	@SuppressWarnings("unchecked")
	public JSONArray loadChatList(String memId) throws Exception {
			
		String sql = "select chat_no				"
					+"from tb_board_chat_member		"
					+"where mem_id = ?				"
					+"order by chat_no desc";

		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memId);
		ResultSet rs = pstmt.executeQuery();
		
		JSONArray dataList = new JSONArray();
		while (rs.next()) {
			JSONObject obj = new JSONObject();
			obj.put("chatNo", rs.getInt("chat_no"));
			dataList.add(obj);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return dataList;
		
	}
	
	// 채팅방에서 친구 초대하기
		public void inviteChat(int chatNo, String friend) throws Exception {
			
			String sql = "insert into tb_board_chat_member(chat_no, mem_id)	"
						+"values(?,?)";
			
			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chatNo);
			pstmt.setString(2, friend);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
		}
	
}