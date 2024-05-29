<%@ page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<body style="background-image:url(bg2.jpg)">
<%
String userid=request.getParameter("user");
String password=request.getParameter("password");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2508");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from user1");
String s=(String)session.getAttribute("uname");
while(rs.next())
{
if(rs.getString(4).equals(s))
{out.println("Name: "+rs.getString(1)+" "+rs.getString(2));
out.println("Email :"+rs.getString(3));
out.println("Username :"+rs.getString(4));
}
}
con.close();
%>