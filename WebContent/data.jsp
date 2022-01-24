<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<% 

	Object[][] sampleArr = { 
	       {"아아","시크릿","가수",21} 
	       ,{"나나","에이핑크","텔런트",22} 
	       ,{"다다","미스에이","영화배우",21} 
	    }; 
	
	String json = "{json:'<tr><th>이름</th><th>그룹명</th><th>직업</th><th>나이</th><tr>"; 
	   for(int i=0;i<sampleArr.length;i++){ 
	      json+="<tr><td>"+sampleArr[i][0]+"</td><td>"+sampleArr[i][1]+"</td><td>"+sampleArr[i][2]+"</td><td>"+sampleArr[i][3]+"</td></tr>"; 
	   } 
	
	json+="'}"; 
	System.out.println(json); 

%> 
<%=json%> 

