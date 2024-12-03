<!-- select.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL: Select</title>
</head>
<body>
<%@ include file="connect.jsp" %>
   <table width=300>
     <tr>
       <th>아이디</th>
       <th>비밀번호</th>
       <th>이름</th>
     </tr>
     <%
       ResultSet rs =null;
       PreparedStatement pstmt =null;
       try{
    	   String sql="SELECT * FROM Member";
    	   pstmt = conn.prepareStatement(sql);
    	   rs= pstmt.executeQuery();
    	   
    	   while(rs.next()){
    		   String id= rs.getString("id");
    		   String pw = rs.getString("passwd");
    		   String name = rs.getString("name");
           %>
           <tr>
             <td><%= id %></td>
             <td><%= pw %></td>
             <td><%= name %></td>
           </tr>
           <% 
    	   }
       } catch(SQLException e) {
           out.println("Member 테이블 호출이 실패했습니다.");
           out.println("SQLException:" + e.getMessage());
       } finally{
    	   if(rs != null) rs.close();
    	   if(pstmt != null) pstmt.close();
    	   if(conn != null) conn.close();
       }
     %>
   </table>
</body>
</html>