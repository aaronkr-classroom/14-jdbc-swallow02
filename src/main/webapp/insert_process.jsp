<!-- insert_process.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
<%@ include file="connect.jsp" %>
<%
  request.setCharacterEncoding("utf-8");
  
  String id =request.getParameter("id");
  String passwd= request.getParameter("passwd");
  String name= request.getParameter("name");
  
  PreparedStatement pstmt = null;
  
  try {
	  String sql = "INSERT INTO Member(id,passwd,name) VALUE(?,?,?)" ;
	  pstmt= conn.prepareStatement(sql);
	  pstmt.setString(1,id);
	  pstmt.setString(2,passwd);
	  pstmt.setString(3,name);
	  pstmt.executeUpdate();
	  out.println("Member 테이블 삽입이 성공했습니다!");
  } catch (SQLException e){
	  out.println("Member 테이블 삽입이 실패헀습니다~ ㅠㅠ");
	  out.println("SQLException:"+e.getMessage());
  } finally{
	  if(pstmt != null) pstmt.close();
	  if(conn != null) conn.close();
  }
%>
</body>
</html>