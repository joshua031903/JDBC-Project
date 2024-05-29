<%
String s=(String)session.getAttribute("uname");
session.removeAttribute("s");
session.invalidate();
response.sendRedirect("http://localhost:8080/jdbc/html/index.html");
%>