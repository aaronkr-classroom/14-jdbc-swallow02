<!-- update_process.jsp -->
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

String id=request.getParameter("id");
String pw=request.getParameter("passwd");
String name =request.getParameter("name");

ResultSet rs =null;
PreparedStatement pstmt =null;

try{
	String sql= "SELECT id,passwd,name FROM Member WHERE id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		out.println(rs);
		String rId = rs.getString("id");
		String rPw = rs.getString("passwd");
		String rName= rs.getString("name");
		
		if(id.equals(rId) && pw.equals(rPw)){
			sql="UPDATE Member SET name=? WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,id);
		    pstmt.executeUpdate();
		    out.println("Member 테이블을 수정했습니다!");
		} else {
			out.println("일치하는 비밀번호가 아닙니다!");
		}
	} else{
		out.println("Member 테이블에 일치하는 아이디가 없습니다.");
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
</body>
</html>