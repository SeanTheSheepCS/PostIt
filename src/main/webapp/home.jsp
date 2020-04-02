<!-- Page that displays all the threads -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Compiled and minified CSS -->
<link rel="stylesheet" href="css/materialize.css">
<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<title>PostIt</title>
</head>
<style>
nav .badge {
	position: relative;
	top: 20px;
	right: 20px;
}
</style>
<body>
	<nav class="nav-wrapper indigo">
		<div class="container">
			<a href="#" class="brand-logo"> Post-It</a> <a href="#"
				class="sidenav-trigger" data-target="mobile-links"> <i
				class="material-icons">menu</i>
			</a>
			<ul class="right hide-on-med-and-down">
				<li><a href="GetTopics"> Home </a></li>
				
				<%
	String ses=(String) session.getAttribute("username");
	if (ses==null)// if not logged
	{
%>
				<li class ="" id = "logAbout"><a href="#" > About </a></li>
				<li class ="hide" id = "logProfile"><a href="userpage.jsp"> Profile </a></li>
			 	<li  id = "logLogin"><a href="#login-modal" class="modal-trigger"> Login </a></li> 
				<li><a href="#Topic-modal" id = "logTopic"class="hide"> New Topic </a></li>
			
			<%}else// if logged 
				{%>
				<li class ="" id = "logAbout"><a href="#" > About </a></li>
				<li class ="" id = "logProfile"><a href="userpage.jsp"> Profile </a></li>
			 	<li id = "logLogin"><a href="Logout" class=""> Logout </a></li> 
				<li><a href="#Topic-modal" id = "logTopic"class="modal-trigger"> New Topic </a></li>
				<%} %>
				
				<li><a href="#" class="btn-floating indigo darken-4 z-depth-0">
						<i class="material-icons">notifications</i>
				</a></li>
			</ul>
		</div>
	</nav>
	
<form action = "SearchPostController" method="GET">
<div class="topnav">
  <input type="text" placeholder="Please enter a Post name to search for....." name = "postName">
<input type="submit" class="btn" value="Search"></div>
</form>	

<!-- 	 <form action="Logout" method="post">
		 <div> 
		 <% if (ses==null){ %>
			 <input type="submit" id="logLogout" class ="hide" name="logout-submit" value ="Logout"><br><br>
			 <%}else{ %>
			  <input type="submit" id="logLogout" class ="" name="logout-submit" value ="Logout"><br><br>
			 <%} %>
		 </div>
	</form> 
	 -->
		<div class="modal" id="login-modal">
		<div class="modal-content" id="login-modal-content">
			<div class="row">
			
	<!--  new LOGIN MODULE -->	
				<%
			String userError = (String) request.getAttribute("userfail");
			String pwdError = (String) request.getAttribute("pwdfail");
			String emptyError = (String) request.getAttribute ("emptyfail");
			String success = (String) request.getAttribute ("succ");
			if(userError != null){
			%>
			<p class = "signuperror" >Username taken </p>
			<%
			}
			else if(pwdError != null){
			%>
				<p class = "signuperror" >Passwords do not match </p>
			<%
			}
			else if(emptyError != null){
			%>
			<p class = "signuperror" >One or more fields are empty </p>
			<%
			}
			else if(success != null){
			%>
			<p class = "signupsuccess" >Signup Success </p>
			<% 
			}
			%>
			<%
			String username1 = request.getParameter("uname1");
			if(username1 != null){
			%>
			<p class = "signuperror1" >Sorry, incorrect username or password </p>
			<%	
			}
			%>
			
				<div class="col s12 m12 l6">
					<form action="ValidateUser" method="post">
						<div class="input-field">
							<input id="login-username-field" name = "uname1" type="text" class="validate">
							<label for="login-username-field">Username</label>
						</div>
						<div class="input-field">
							<input id="login-password-field" name ="upass" type="password" class="validate">
							<label for="login-password-field">Password</label>
						</div>
						<input type="submit" name="login-submit" value="Login">
					</form>

				</div>


				<div class="col s12 m12 l6">
					<div class="card">
						<div class="card-content">
							<form action="SignupUser" method = "get">
								<h4>New User?</h4>

								<div class="input-field">
									<input id="register-email-field" name = "mail" type="email" class="validate">
									<label for="register-email-field">Email</label>
								</div>

								<div class="input-field">
									<input id="register-username-field" name = "uname" type="text"
										class="validate"> <label for="register-username-field">Username</label>
								</div>
								<div class="input-field">
									<input id="register-password-field" name = "pwd" type="password"
										class="validate"> <label for="register-password-field">Password</label>
								</div>
								<div class="input-field">
									<input id="register-password-confirm-field" name = "pwd-confirm" type="password"
										class="validate"> <label
										for="register-password-confirm-field">Confirm Password</label>
								</div>
								<input type="submit" name="signup-submit" value="Sign Up">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  END OF THE NEW LOGIN MODULE -->
	

	<div class="modal" id="Post-modal">
		<div class="modal-content" id="login-modal-content">
			<div class="row">


				<div class="col s12 m12 l6">
					<div class="card">
						<div class="card-content">
							<form action="NewPostController" method=post>
								<h4>New Post?</h4>

								<div class="input-field">
									<input id="register-email-field" type="text" class="validate"
										name="title"> <label for="register-email-field">Title</label>
								</div>

								<div class="input-field">
									<input id="register-username-field" type="text"
										class="validate" name="content"> <label
										for="register-username-field">Text</label>
								</div>

								<input type="submit" class="btn orange" value="Share">
							</form>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>




	<ul class="sidenav" id="mobile-links">
		<li><a href="GetPosts"> Home </a></li>
		<li><a href="#"> About </a></li>
		<li><a href="#"> Contact </a></li>
		<li><a href="#login-modal" class="modal-trigger"> Login </a></li>
		<li><a href="#login-modal" class="modal-trigger"> New Post </a></li>

	</ul>

	<style>
.halfway-fab-one-step-to-the-left {
	position: absolute;
	right: 72px;
	bottom: -20px;
}

.halfway-fab-two-steps-to-the-left {
	position: absolute;
	right: 120px;
	bottom: -20px;
}

.halfway-fab-three-steps-to-the-left {
	position: absolute;
	right: 168px;
	bottom: -20px;
}
</style>

<%			String text = (String) request.getAttribute("allPosts");
			System.out.println("ALL POSTS IN HOME.JSP " + text);
			if (!text.isEmpty()) {

%>

	<div class="row">
		<%
			String postInfo = "";
			String[] split = text.split("\\*");
			for (int i = 0; i < split.length; i++) {
				postInfo = split[i];
				String[] eachData = split[i].split(",");
				String postId = eachData[0];
				String votes = eachData[1];
				String topic = eachData[2];
				String desc = eachData[3];
				String userID = eachData[4];
				String title = eachData[5];
				String uuid = eachData[6];
				String image = (String) request.getAttribute("image");
				String[] images = image.split("\\*");
				int random = i%3;
				image = images[random];
		%>


		<div class="col s12 m6 l3">
			<div class="card">
				<div class="card-image">
					<img src='<%=image%>' alt="image" id="picture">
					<div
						class="halfway-fab-three-steps-to-the-left btn-floating center-align">
						<%
							out.println(votes);
						%>
					</div>

					<script>
						function submitform(formIDToSubmit) {
							document.getElementById(formIDToSubmit).submit();
						}
					</script>

					<form action="Upvote" method="post"
						id=<%="upvoteform,".concat("ID=").concat(postId)%>>
						<input type="hidden" name="postid" value=<%=postId%> /> <input
							type="hidden" name="votes" value=<%=votes%> /> <input
							type="hidden" name="desc" value=<%=desc%> /> <input
							type="hidden" name="topic" value=<%=topic%> /> <input
							type="hidden" name="title" value=<%=title%> /> <input
							type="hidden" name="uuid" value=<%=uuid%> />

						<div
							onclick="submitform('<%="upvoteform,".concat("ID=").concat(postId)%>')"
							class="halfway-fab-two-steps-to-the-left btn-floating orange waves-effect waves-light">
							<i class="material-icons">arrow_upward</i>
						</div>
					</form>

					<form action="Downvote" method="post"
						id=<%="downvoteform,".concat("ID=").concat(postId)%>>
						<input type="hidden" name="postid" value=<%=postId%> /> <input
							type="hidden" name="votes" value=<%=votes%> /> <input
							type="hidden" name="desc" value=<%=desc%> /> <input
							type="hidden" name="topic" value=<%=topic%> /> <input
							type="hidden" name="title" value=<%=title%> /> <input
							type="hidden" name="uuid" value=<%=uuid%> />

						<div
							onclick="submitform('<%="downvoteform,".concat("ID=").concat(postId)%>')"
							class="halfway-fab-one-step-to-the-left btn-floating blue waves-effect waves-light">
							<i class="material-icons">arrow_downward</i>
						</div>
					</form>

					<a href="#"
						class="halfway-fab waves-effect waves-light btn-floating blue">
						<i class="material-icons">favorite</i>
					</a>

				</div>
				<div class="card-content">
					<span class="card-title"> <%
 	out.println(topic);
 		out.println(title);
 %>
					</span>
					<span style="display:block;text-overflow: ellipsis;width: 300px;overflow: hidden; white-space: nowrap;">
							<%
								out.println(desc);
							%>
					</span>
				</div>

				<div class="card-action">

					<form action="PostController" method="GET">
						<div>
							<input type="hidden" name="postid" value=<%=postId%> /> <input
								type="hidden" name="votes" value=<%=votes%> /> <input
								type="hidden" name="desc" value=<%=desc%> /> <input
								type="hidden" name="topic" value=<%=topic%> /> <input
								type="hidden" name="title" value=<%=title%> /> <input
								type="hidden" name="postUUID" value=<%=uuid%> /> <input
								type="submit" name="viewPost" value="View full post">


						</div>
					</form>

					<a href="#"> Share post </a> <a href="#"> Give award </a>
				</div>
			</div>
		</div>
		<%
			}
		%>

	</div>

<%	}
			else{		
%>
 
<p>	No Posts! </p>

<% } %>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

	<script>
		$(document).ready(function() {
			$('.sidenav').sidenav();
			$('.modal').modal();
		})
	</script>



	

</body>
</html>
</html>



