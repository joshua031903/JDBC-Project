<%@ page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<body>
<%
String userid=request.getParameter("user");
String password=request.getParameter("password");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2508");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from user1");
int flag=0;
while(rs.next())
{
if(rs.getString(4).equals(userid)&&rs.getString(5).equals(password))
{
flag=1;
break;
}
}
if(flag==0)
out.println("Username or Password entered is incorrect");
else
{
session.setAttribute("uname",userid);
session.setMaxInactiveInterval(30);
response.sendRedirect("http://localhost:8080/jdbc/html/home.html");
}
%>
