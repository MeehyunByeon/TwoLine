<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="twoline.OnelineDTO" %>
<%@ page import="twoline.OnelineDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>memo</title>
<link rel="stylesheet" href="memo.css">
</head>

<%
	OnelineDAO dao = new OnelineDAO();
	ArrayList<OnelineDTO> dtos = dao.getList();
%>
<body>
	<div id=container>
	<h1>OneLine Memo</h1><hr>
	
	<form method="post" action="memo_write.jsp">
	<input id="mainText" type="text" name="memo" autofocus placeholder="메모를 입력하세요">
	<input id="mainSubmit" type="submit" value="등록"></input>
	</form>
	</div>
	
<%
	for(int i = 0; i < dtos.size() ; i++) {
		OnelineDTO dto = dtos.get(i); 
		out.println("<p id=\"memo\"> [" + dto.getWdate() + "] " + dto.getMemo() + 
				"<input type=\"button\" value=\"X\" onClick=\"location.href='memo_delete.jsp?no=" + dto.getNo() + "'\"<br>");
		out.println("</input></p>");
	}
%>
</body>
</html>
