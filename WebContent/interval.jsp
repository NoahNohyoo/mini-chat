<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>JSON</title> 
<style> 

td { 

   border: 1px solid gray; 

} 

</style> 
<script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script> 
<script type="text/javascript"> 

/* 
	$.getJSON()함수 대신에 $.ajax()함수를 이용해서 JSON 형식의 데이터를 얻을 수 있다. 
*/ 

function ajaxCall(){ 

   console.log('인터벌 테스트'); 

     $.ajax({ 
             url : "data.jsp", 
             dataType : "text", 
             success : function(data) { 
                    var jsonObj = eval('('+data+')'); 
                    $('#treeData').empty().append(jsonObj.json); 
             } 
     }); 
} 

function setIn(){ 
   setInterval( ajaxCall, 3000 );  // 3000 = 3초
} 

</script> 
</head> 

<body onload="setIn();"> 

<table id="treeData"></table> 

</body> 
</html>