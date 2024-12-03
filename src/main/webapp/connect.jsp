<!-- connect.jsp -->
<%@ page import="java.sql.*" %>
<%
  Connection conn = null;

	  String url="jdbc:mysql://localhost:3306/dju_web";
	  String user="root";
	  String pass="1234";
	  
	  Class.forName("com.mysql.jdbc.Driver");
	  conn = DriverManager.getConnection(url, user, pass);
%>
