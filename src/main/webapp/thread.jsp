<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
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

.big-nice-allignments {
	position: absolute;
	right: 20px;
	bottom: 30px;
}

.big-nice-allignments-delete {
	position: absolute;
	right: 30px;
	bottom: -8px;
}

.big-nice-allignments-edit {
	position: absolute;
	right: 400px;
	bottom: 30px;
}
</style>

<title>Thread Show</title>
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

	<div class="modal" id="login-modal">
		<div class="modal-content" id="login-modal-content">
			<div class="row">


				<div class="col s12 m12 l6">
					<form action="ValidateUser">
						<div class="input-field">
							<input id="login-username-field" type="text" class="validate">
							<label for="login-username-field">Username</label>
						</div>
						<div class="input-field">
							<input id="login-password-field" type="password" class="validate">
							<label for="login-password-field">Password</label>
						</div>
						<a href="#" class="btn orange">Login</a>
					</form>
				</div>


				<div class="col s12 m12 l6">
					<div class="card">
						<div class="card-content">
							<form action="">
								<h4>New User?</h4>

								<div class="input-field">
									<input id="register-email-field" type="email" class="validate">
									<label for="register-email-field">Email</label>
								</div>

								<div class="input-field">
									<input id="register-username-field" type="text"
										class="validate"> <label for="register-username-field">Username</label>
								</div>
								<div class="input-field">
									<input id="register-password-field" type="password"
										class="validate"> <label for="register-password-field">Password</label>
								</div>
								<div class="input-field">
									<input id="register-password-confirm-field" type="password"
										class="validate"> <label
										for="register-password-confirm-field">Confirm Password</label>
								</div>
								<a href="#" class="btn orange">Register</a>
							</form>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>

<!--	 <form action="Logout" method="post">
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
							<input id="login-username-field" name = "uname" type="text" class="validate">
							<label for="login-username-field">Username</label>
						</div>
						<div class="input-field">
							<input id="login-password-field" name ="upass" type="password" class="validate">
							<label for="login-password-field">Password</label>
						</div>
						<input type="submit" name="login-submit" value="Login"><!-- This wasn't in the form spend an hours debugging this :( -->
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
		<li><a href="GetTopics"> Home </a></li>
		<li><a href="#"> About </a></li>
		<li><a href="#"> Contact </a></li>
		<li><a href="#login-modal" class="modal-trigger"> Login </a></li>
		<li><a href="#login-modal" class="modal-trigger"> New Post </a></li>

	</ul>

	<%
		//Getting post info
		String postInfo = (String) request.getAttribute("postinfo");
		String[] splitPostInfo = postInfo.split("\\|");
		String postTitle = splitPostInfo[0];
		String postDesc = splitPostInfo[1];
		String postUsername = splitPostInfo[2];
		System.out.println("POST INFO IN THREAD:" + postInfo);
	%>
	<div class="row valign-wrapper">
		<div class="col s12 m8 offset-m2 valign">
			<div class="Heading">
				<div class="card blue-grey darken-1">
					<!--THIS DIV SECTION IS WHERE THE THREAD STARTS-->
					<div class="card-image">
						<!--THREAD IMAGE-->
						<img id="thread_image">
						<!--THREAD TITLE-->
						<span class="card-title " id="thread_title"></span>
						<!--THREAD BUTTONS LIKE/DISLIKE-->
						<a
							class=" btn-floating halfway-fab-one-step-to-the-left waves-effect btn-small waves-light red"
							href="#"><i class="material-icons">thumb_up</i></a> <a
							class=" btn-floating halfway-fab-two-steps-to-the-left waves-effect btn-small waves-light red"
							href="#"><i class="material-icons">thumb_down</i></a>
					</div>

					<div class="card-content white-text">
						<!--THREAD TEXT-->
						<p>
							<%
								out.println(postDesc);
							%>
						</p>
					</div>
					<div class="card-action">
						<ul class="collection">
							<!--BELOW IS AUTHOR INFORMATION-->
							<li class="collection-item avatar"><i
								class="material-icons circle" id="author-icon"></i> <span
								class="title"> <%
 	out.println(postUsername + ":     " + postTitle);
 %>
							</span> <a href="#!" class="secondary-content"><i
									class="material-icons">grade</i></a></li>
						</ul>
					</div>
				</div>
			</div>


			<!-- THIS IS WHERE THE COMMENTS ARE STORED-->

			<%
				String comments = (String) request.getAttribute("comments");
				if (!comments.isEmpty()) {
			%>
			<div class="Comment">
				<ul class="collection">

					<%
						//Getting comment info
							String commentInfo = "";
							String[] split = comments.split("\\*");
							for (int i = 0; i < split.length; i++) {
								commentInfo = split[i];
								System.out.println(split[0]);
								String[] eachCommentData = split[i].split("\\|");
								String reply = eachCommentData[0];
								String commentDescription = eachCommentData[1];
								String commentUUID = eachCommentData[2];
								String commentParentUUID = eachCommentData[3];
								String votes = eachCommentData[4];
								String commentUsername = eachCommentData[5];
					%>
					<div class="card  blue-grey lighten-5">
						<div class="card-content">
							<li id="comment-0"><i class="material-icons circle"
								id="comment-0-icon"></i> <span class="title">
						<strong> <% 	out.println(commentUsername);
 %></strong>
							</span>
								<p>

									<%
									
									HttpSession sesse = request.getSession();
									String postNum = (String) sesse.getAttribute("postUUID");
									if(postNum.compareTo(commentParentUUID) != 0 ){
										for(int z = 0; z< split.length; z++){
											String[] tempCommentData = split[z].split("\\|");
											if(commentParentUUID.compareTo(tempCommentData[2]) == 0){
												out.println("Reply to: ");
												out.println("'" + tempCommentData[1] + "'");
											}
								
							%>
							<p></p>
							<% 
									}
							}
									
										out.println(commentDescription);
										//		out.println("COMMENT UUID " + commentUUID);

												//if(reply.compareTo("REPLY") == 0)
										//		out.println("REPLY TO: " + commentParentUUID);
									%>
								</p>
								
							<%
									String postNumuber = (String) sesse.getAttribute("postUUID");
									String unamee = (String) sesse.getAttribute("username");
								if(unamee != null){	
									if(postNum.compareTo(commentParentUUID) == 0 ){
									%>	
								<div class="container">
						<form action="CommentControllerCommand" method="POST">
										<div class="card-action">
											<input type="hidden" name="event_type" value="REPLY" /> <input
												type="hidden" name="uuid" value=<%=commentUUID%> /> <input
												type="hidden" name="content" value=<%=commentDescription%> /><label
												for="icon_prefix3"></label> <input type="hidden"
												name="postUUID" value=<%=commentParentUUID%> />
													<textarea id="icon_prefix3" class="materialize-textarea"
																name="comment"></textarea>
											<button
												class="big-nice-allignments-delete btn waves-effect waves-light"
												type="submit" name="action">Reply</button>
										</div>
									</form>
								</div>
					<%					}
									}%>
				
								<%
 	HttpSession sess = request.getSession();
 			String postUUID = (String) sess.getAttribute("postUUID");
 			String uname = (String) sess.getAttribute("username");
 		if(uname != null){
 			if (commentUsername.compareTo(uname) == 0) {
 %>

								<div class="container">
									<form action="CommentControllerCommand" method="POST">
										<div class="card-action">
											<input type="hidden" name="event_type" value="DELETE" /> <input
												type="hidden" name="uuid" value=<%=commentUUID%> /> <input
												type="hidden" name="content" value=<%=commentDescription%> /><label
												for="icon_prefix3"></label> <input type="hidden"
												name="postUUID" value=<%=postUUID%> />
											<button
												class="big-nice-allignments-delete btn waves-effect waves-light"
												type="submit" name="action">Delete</button>
										</div>
									</form>
									
									<form action="CommentControllerCommand" method="POST">
										<div class="card-action">
											<input type="hidden" name="event_type" value="EDIT" /> <input
												type="hidden" name="uuid" value=<%=commentUUID%> /> <input
												type="hidden" name="content" value=<%=commentDescription%> /><label
												for="icon_prefix3"></label> <input type="hidden"
												name="postUUID" value=<%=postUUID%> />
													<textarea id="icon_prefix3" class="materialize-textarea"
																name="comment"></textarea>
											<button
												class="big-nice-allignments-delete btn waves-effect waves-light"
												type="submit" name="action">EDIT</button>
										</div>
									</form>
								</div>
	<%
 								}
							}			
 %>
				
							</li>
						</div>
					</div>

					<%
						}
					%>

				</ul>
			</div>
			<%
				}
				
			%>

			<!--THIS IS WHERE COMMENT ON THREAD IS-->
			<%
				HttpSession sess = request.getSession();
				String postUUID = (String) sess.getAttribute("postUUID");
				if (sess.getAttribute("username") != null) {
			%>
			<form action="CommentControllerCommand" method="post">
				<div class="card blue-grey lighten-5">
					<div class="card-content">
						<ul class="collection">
							<li class="collection-item avatar black-text"><i
								class="material-icons circle red" id="icon"></i> <span
								class="title" id="username"> <%
 	out.print(sess.getAttribute("username"));
 %></span> <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
							</li>
							<li class="collection-item avatar black-text">
								<div class="row">
									<div class="input-field col s10">
										<i class="material-icons prefix">mode_edit</i>
										<textarea id="icon_prefix3" class="materialize-textarea"
											name="comment"></textarea>
										<label for="icon_prefix3"></label> <input type="hidden"
											name="postUUID" value=<%=postUUID%> />
									</div>
								</div>
							</li>
						</ul>
					</div>

					<div class="card-action">
						<input type="hidden" name="event_type" value="CREATE" />
						<button class="btn waves-effect waves-light" type="submit"
							name="action">
							Submit <i class="material-icons right">send</i>
						</button>
					</div>
				</div>
			</form>
			<%
				}
			%>


		</div>
	</div>

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