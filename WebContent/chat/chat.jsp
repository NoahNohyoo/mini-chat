<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int chatNo = Integer.parseInt(request.getParameter("chatNo"));
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/include/include-header.jspf" %>
<c:set var="chatNo" value="<%=chatNo%>" />
<style>
	.nav-tabs li a {
      color: #777;
	  } 
	  .navbar {
	      font-family: Montserrat, sans-serif;
	      margin-bottom: 0;
	      background-color: #2d2d30;			
	      border: 0;
	      font-size: 11px !important;
	      letter-spacing: 4px;
	      opacity: 0.9;
	  }
	  .navbar li a, .navbar .navbar-brand { 
	/*      color: #d5d5d5 !important;	*/
	      color: white !important;
	  }
	  .navbar-nav li a:hover {
	      color: #fff !important;
	  }
	  .navbar-nav li.active a {
	      color: #fff !important;
	      background-color: #29292c !important;
	  }
	  .navbar-default .navbar-toggle {
	      border-color: transparent;
	  }
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" style="width:451px">
		<form method="post" id="inviteForm" name="inviteForm">
		  <input type="hidden" name="chatNo" value="${chatNo}" />
		  <div class="container-fluid">
		  	<div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" id="iconBtn">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>                        
		      </button>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav navbar-left">
		        <li class="dropdown">
		          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
			          <span class="glyphicon"></span> 친구 초대
			          <span class="caret"></span>
		          </a>
		          <ul class="dropdown-menu">
		            <li><input type="checkbox" name="friends" value="nana"/> <font color="white" >nana</font></li>
		            <li><input type="checkbox" name="friends" value="jaja"/> <font color="white" >jaja</font></li>
		            <li><input type="checkbox" name="friends" value="dada"/> <font color="white" >dada</font></li>
		            <li><input type="checkbox" name="friends" value="haha"/> <font color="white" >haha</font></li>
		            <li id="inviteChat"><a href="#">초대하기</a></li>
		          </ul>
		        </li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		      	<li id="outChat"><a href="#"><b>채팅방 나가기</b> <span class="glyphicon glyphicon-log-out"></span></a></li>
		      </ul>
		    </div>
		  </div>
		</form>
	</nav>

	<div style="border:1px solid grey; width:450px; margin-top:50px;background-color:#819FF7;">
	  		<div id="viewArea" style="overflow:scroll; overflow:auto; width:450px; height:500px; padding:10px;">
	  			<div id="viewData"></div>
	  		</div>
	       <br/>
	       <input id="inputMsg" type="text" size="50" maxlength="4000" placeholder="보낼 메시지를 입력하세요." onkeydown="sendEnter()"/>
	       <input type="submit" value="보내기" onclick="send()" />
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

//	var webSocket = new WebSocket('ws://192.168.10.106:80/chat/broadcasting');
	var webSocket = new WebSocket('ws://192.168.0.8:80/chat/broadcasting');
	var nDate = new Date();
	var year = nDate.getFullYear();
	var month = nDate.getMonth()+1;
	var date = nDate.getDate();
	var week = new Array('일','월','화','수','목','금','토');
	var day = week[nDate.getDay()]+"요일";
	var viewDate;
	var time;
	
	if (9 >= month) {
		month = "0"+month;
	}
	if (9 >= date) {
		date = "0"+date;
	}
	var now = year+"-"+month+"-"+date;
   	$("#inputMsg").focus();
   

    webSocket.onerror = function(event) {
      onError(event)
    };
    webSocket.onopen = function(event) {
      onOpen(event)
    };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    
    function onOpen(event) {
    	$.ajax({
			url : 'getTextList.jsp',
			type : 'post',
			datatype : "json",
			data : {
				chatNo : ${chatNo}
			},
			success : function(data) {
				for (var i in data) {
					var chatText = data[i].chatText;
					var memId = data[i].memId;
					var regdate = data[i].chatRegdate;
					var regtime = data[i].chatRegtime;
					var regampm = data[i].chatRegampm;
					var regday = data[i].chatRegday;
					
					if (null == viewDate || (viewDate != regdate && viewDate < regdate)) {
						if (now > regdate) {
							$("#viewData").append("<p align='center'><span style='background-color:#D8D8D8;'>"+regdate+" "+regday+"</span></p>");
							viewDate = regdate;
						} else if (now == regdate) {
							$("#viewData").append("<p align='center'><span style='background-color:#D8D8D8;'>"+now+" "+day+"</span></p>");
							viewDate = regdate;
						}
					}
					
					if ("${sessionScope.memId}" == memId) {
						$("#viewData").append("<p align='right'><font size='1'>"+regampm+" "+regtime+"</font> <span style='background-color:#F3F781;'>"+chatText+"</span></p>");
					} else {
						$("#viewData").append("<p align='left'><img src='../img/p_default.png' height='35' width='35'> <strong>"+memId+"</strong> <br/> <span style='background-color:#FAFAFA;'>"+chatText + "</span> <font size='1'>"+regampm+" "+regtime+"</font></p>");
					}
				}			
		        $("#viewArea").html($("#viewData"));
		        refreshLine();
			},
			error : function() {
				alert("data load error!");
				return false;
			}
		});
    }
    
    function onError(event) {
      alert(event.data);
    }
    
    function onMessage(event) {
    	
    	var textDate = event.data;
    	var check = textDate.substring(0,textDate.indexOf("<"));
    	
    	if (check == "${chatNo}") {
    		
    		getTime();
    		if (null == viewDate || viewDate < now) {
    			$("#viewData").append("<p align='center'><span style='background-color:#D8D8D8;'>"+now+" "+day+"</span></p>");
    			viewDate = now;
    		}
    		
    		textDate = textDate.substring(textDate.indexOf("<"));
	    	$("#viewData").append("<p align='left'>"+textDate+"</p>");
	        $("#viewArea").html($("#viewData"));
	        refreshLine();
    		
    	}
    	
    }
    
    function send() {
    	var inputMsg = $("#inputMsg").val().trim();
    	if (null == inputMsg || "" == inputMsg) {
    		alert("메세지를 입력해주세요.");
    		$("#inputMsg").val("");
    		$("#inputMsg").focus();
    		return false;
    	}
    	
	    getTime();
	    
		if (null == viewDate || viewDate < now) {
			$("#viewData").append("<p align='center'><span style='background-color:#D8D8D8;'>"+now+" "+day+"</span></p>");
			viewDate = now;
		}
    	$("#viewData").append("<p align='right'><font size='1'>"+time+"</font> <span style='background-color:#F3F781;'>"+$("#inputMsg").val()+"</span></p>");
        $("#viewArea").html($("#viewData"));
        webSocket.send("${chatNo}<img src='../img/p_default.png' height='35' width='35'><strong>${sessionScope.memId}</strong> <br/> <span style='background-color:#FAFAFA;'>"+$("#inputMsg").val() + "</span> <font size='1'>"+time+"</font>");

        $.ajax({
			url : 'textSave.jsp',
			type : 'post',
			data : {
				chatNo : '${chatNo}',
				chatText : $("#inputMsg").val()
			},
			success : function(data) {
			},
			error : function() {
				alert("data save error!");
				return false;
			}
		});
		
        $("#inputMsg").val("");
        refreshLine();
    }
    
    function sendEnter() {
	    if(event.keyCode == 13){
			send();
		}
	    return false;
    }

    function refreshLine() {
    	$("#viewArea").scrollTop($("#viewArea")[0].scrollHeight);
    }

    function getTime() {
		var now = new Date();
		var ampm = "오전";
		var hours = now.getHours();
		var minutes = now.getMinutes();

		if (11 < hours) {
			ampm = "오후"
			if (12 != hours) {
				hours -= 12; 
			}
		}
		
		if (9 >= hours) {
			if (0 == hours) {
				hours = 12;
			} else {
				hours = "0"+hours;
			}
		}
		if (9 >= minutes) {
			minutes = "0"+minutes;
		}
		
		time = ampm+" "+hours+":"+minutes;
		
    }
    
	$(document).ready(function() {
    	
		$("#inviteChat").click(function() {

			var isChecked = $("input:checkbox[name='friends']").is(":checked");
			if (!isChecked) {
				alert("초대하실 친구를 선택해주세요.");
				return false;
			}
			
			var formData = $("#inviteForm").serialize();
			$.ajax({
				url : 'inviteChat.jsp',
				type : 'post',
				data : formData,
				success : function(data) {
					var inviteMsg = "<p align='center'><span style='background-color:#CEF6D8;'><strong>${memId}</strong>님이 <strong>"+data+"</strong>님을 초대하였습니다.</span></p>";
					$("#viewData").append(inviteMsg);
					webSocket.send("${chatNo}"+inviteMsg);
					$("#iconBtn").click();
					$("#inputMsg").focus();
					refreshLine();
				},
				error : function() {
					alert("data save error!");
					return false;
				}
			});
			
		});
		
    	$("#outChat").click(function() {
    		var answer = confirm("채팅방을 나가시면 대화내용이 모두 지워집니다.");
    		if (answer) {
    			var outMsg = "<p align='center'><span style='background-color:#CEF6D8;'><strong>${memId}</strong>님이 나갔습니다.</span></p>";
    			$("#viewData").append(outMsg);
    			webSocket.send("${chatNo}"+outMsg);
    			location.href = "outChat.jsp?chatNo=${chatNo}";
    		} else {
    			return false;
    		}
    	});
    	
    });
    
</script>
</html>