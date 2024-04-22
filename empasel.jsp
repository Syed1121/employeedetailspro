<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
String driver="org.gjt.mm.mysql.Driver";
Connection con=null;
ResultSet rs=null;
Statement stmt=null;
try
{
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/empdata","root","Pyari$$");
stmt=con.createStatement();
}
catch(Exception ex)
{
System.out.println(ex.getMessage());
}
rs=stmt.executeQuery("select * from myemp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bootstrap Web Page</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <style>
    body {
      background-image: url('/mypro/company.jpeg'); /* Replace 'path/to/your/image.jpg' with the actual path to your image */
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
    }
h2{
color:black;
}
  </style>
</head>
<body>

  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <a class="navbar-brand" href="#">Karim Tech</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="/mypro/index.html">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/mypro/empins.jsp">Insert</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/mypro/empasel.jsp">List</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/mypro/empssel.jsp">Record</a>
          </li>
	  <li class="nav-item">
            <a class="nav-link" href="/mypro/del.jsp">Delete</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
<div class="container mt-5">
    <div class="row">
      <div class="col-md-6">
        <h2>FutureDrive</h2>
        <p>Welcome to the future technology.</p>
      </div>
    </div>
  </div>
<h2>Employee List</h2>
<table border="3">
<tr>
<td><b>ENO</b></td>
<td><b>ENAME</b></td>
<td><b>Esal</b></td>
<td><b>Egrade</b></td>
</tr>
<%
int no=1;
while(rs.next())
{
%>
<tr>
<td><%=rs.getInt("eno")%></td>
<td><%=rs.getString("ename")%></td>
<td><%=rs.getInt("esal")%></td>
<td><%=rs.getString("egrade")%></td>
</tr>
<%
no++;
}
rs.close();
con.close();
stmt.close();
%>
</table>
</body>
</html> 