<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ page import="com.chat.ChatDAO"%>
<%
	String memId = (String)request.getSession().getAttribute("memId");
	
	ChatDAO dao = new ChatDAO();
	dao.createNewChat(memId);
	int chatNo = dao.getNewChatNo(memId);
%>
<script>
	var popUrl = "chat.jsp?chatNo=<%=chatNo%>";
	var popOption = "width=470, height=600, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	
	location.href = "../main.jsp";
</script>
