<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ page import="com.chat.ChatDAO"%>
<%
	String memId = (String)request.getSession().getAttribute("memId");
	int chatNo = Integer.parseInt(request.getParameter("chatNo").replaceAll("'", ""));
	String chatText = request.getParameter("chatText");
	
	ChatDAO dao = new ChatDAO();
	dao.saveText(chatNo, memId, chatText);
%>
