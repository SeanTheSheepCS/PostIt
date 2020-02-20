<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Post-it</title>
</head>
<body>
<h1>Welcome to Post-It!</h1>
	<form action = "ValidateUser" method = "post">
		<table border = "3">
			<tr>
				<td>Enter User name</td>			
				<td><input type = "text" name = "uname" /></td>
			</tr>
	
				<tr>
				<td>Enter Password name</td>			
				<td><input type = "text" name = "upass" /></td>
							
			</tr>
	
				<tr>
				<td><input type = "Submit"/></td>
				<td><input type = "Reset"/></td>
			</tr>
	
	
		</table>
	
	
	</form>
</body>
</html>