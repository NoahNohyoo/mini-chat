<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="com.chat.ChatDAO"%>
<%
	int chatNo = Integer.parseInt(request.getParameter("chatNo").replaceAll("'", ""));
	String memId = (String)request.getSession().getAttribute("memId");
	
	ChatDAO dao = new ChatDAO();
	JSONArray data = dao.getText(chatNo, memId);
	
	out.write(data.toJSONString());
%>