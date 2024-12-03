<!-- update.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL:Update</title>
</head>
<body>
<%@ include file="connect.jsp" %>
<%
request.setCharacterEncoding("utf-8");

//http://localhost:8080/?id=1234
String id=null;
String pw=null;
String name =null;

ResultSet rs =null;
PreparedStatement pstmt =null;

try{
	String sql= "SELECT id,passwd FROM Member WHERE id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,request.getParameter("id"));
	rs=pstmt.executeQuery();
	if(rs.next()){
		out.println(rs);
		id = rs.getString("id");
		pw = rs.getString("passwd");
		name= rs.getString("name");
	}
} catch(SQLException e){
	out.println("Member 테이블에서 id찾을수 없습니다");
	out.println("SQLException:"+e.getMessage());
} finally{
	if(rs!=null) rs.close();
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
}
%>
  <form method="POST" action="update_process.jsp">
    <p>아이디:<input type="text" name="id" value=<%= id %>/> </p>
    <p>비밀번호:<input type="password" name=" passwd"value=<%= pw %> /></p>
    <p>이름:<input type="text" name="name" value=<%= name %>/> </p>
    <p><input type="submit" value="수정"/></p>
  </form>
</body>
</html>