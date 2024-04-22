<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
String driver="org.gjt.mm.mysql.Driver";
Connection con=null;
ResultSet rs=null;
PreparedStatement ps = null;
try
{
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/empdata","root","Pyari$$");
if(request.getParameter("teno")!=null)
{
int eno=Integer.parseInt(request.getParameter("teno"));
ps=con.prepareStatement("delete from myemp where eno=?");
ps.setInt(1,eno);
ps.executeUpdate();
response.sendRedirect("/mypro/index.html");
con.close();
}
}catch(Exception ex)
{
out.print(ex);
}
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
      background-image: url('/mypro/company.jpeg'); 
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
  </nav><form  name="fm1" method="POST" action="/mypro/del.jsp">
    <br/>
    <br/>
    <br/>
Emloyee Number:  <input type="text" name="teno"><br><br>
<input type="submit" value="submit">
<input type="Reset" value="reset">
</form>
</body>
</html>

