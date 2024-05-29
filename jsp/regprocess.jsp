<%@ page language="java" contentType="text/html" import="java.sql.*"%>
<% 
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String userid=request.getParameter("userid");
String password=request.getParameter("password");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2508");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from user1");
int c=0,i=0;
while(rs.next())
{if(rs.getString(4).equals(userid))
 c++;}
if(c==0) 
i=st.executeUpdate("insert into user1(fname,lname,email,userid,password) values('"+fname+"','"+lname+"','"+email+"','"+userid+"','"+password+"')");

if(i>0)
{
response.sendRedirect("http://localhost:8080/jdbc/html/index.html");
}
else
{
response.sendRedirect("http://localhost:8080/jdbc/html/register.html");
}
%>
