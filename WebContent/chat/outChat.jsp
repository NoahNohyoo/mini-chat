<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ page import="com.chat.ChatDAO"%>
<%
	int chatNo = Integer.parseInt(request.getParameter("chatNo").replaceAll("'", ""));
	String memId = (String)request.getSession().getAttribute("memId");
	
	ChatDAO dao = new ChatDAO();
	dao.outChat(chatNo, memId);
%>
<script>
	opener.parent.location.reload();
	window.close();
</script>
