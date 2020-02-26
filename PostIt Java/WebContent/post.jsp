<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  <title>PostIt</title>
</head>

<body>

  <style>
    nav .badge
    {
      position: relative;
      top: 20px;
      right: 20px;
    }
  </style>

  <nav class="nav-wrapper indigo">
    <div class="container">
      <a href="#" class="brand-logo"> Post-It</a>
      <a href="#" class="sidenav-trigger" data-target="mobile-links">
        <i class = "material-icons">menu</i>
      </a>
      <ul class = "right hide-on-med-and-down">
        <li><a href="#"> Home </a></li>
        <li><a href="#"> About </a></li>
        <li><a href="#"> Contact </a>  </li>
    <%  
    HttpSession sess = request.getSession();
	out.print(sess.getAttribute("username"));
	%>
          <li><a href="index.jsp"> Logout </a>  </li>
     
        <li><a href="#" class="btn-floating indigo darken-4 z-depth-0">
          <i class="material-icons">notifications</i>
        </a></li>
      </ul>
    </div>
  </nav>


  <ul class="sidenav" id="mobile-links">
    <li><a href="#"> Home </a></li>
    <li><a href="#"> About </a></li>
    <li><a href="#"> Contact </a></li>
       <%  
	out.print(sess.getAttribute("username"));
	%>
     
  </ul>

<%
String info =(String) request.getAttribute("comments");
String[] split = info.split("\\*");
for(int i=0; i<split.length; i++)
	out.print(split[i] + " <BR>");
%>
</body>
</html>