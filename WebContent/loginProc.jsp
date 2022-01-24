<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	
	
	if (null != id && !"".equals(id)) {
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(60 * 30); // 세션 30분 유지
		session.setAttribute("memId", id);
		
		response.sendRedirect("main.jsp");
		
	} else {
		response.sendRedirect("intro.jsp?err=fail");

	}
%>