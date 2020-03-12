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
</style>

	<nav class="nav-wrapper indigo">
		<div class="container">
			<a href="#" class="brand-logo"> Post-It</a> <a href="#"
				class="sidenav-trigger" data-target="mobile-links"> <i
				class="material-icons">menu</i>
			</a>
			<ul class="right hide-on-med-and-down">
			<li><a href="GetPosts"> Home </a></li>
				<li><a href="#"> About </a></li>
				<li><a href="#"> Contact </a></li>
				<li><a href="#"> Login </a></li>
				<li><a href="#" class="btn-floating indigo darken-4 z-depth-0">
						<i class="material-icons">notifications</i>
				</a></li>
			</ul>
		</div>
	</nav>
<title>Thread Show</title>
<body>

<%
//Getting post info
String postInfo = (String) request.getAttribute("postinfo");
String [] splitPostInfo = postInfo.split("\\|");
String postTitle = splitPostInfo[0];
String postDesc = splitPostInfo[1];
String postUsername = splitPostInfo[2];
	
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
						<p><%out.println(postDesc); %></p>
					</div>
					<div class="card-action">
						<ul class="collection">
							<!--BELOW IS AUTHOR INFORMATION-->
							<li class="collection-item avatar"><i
								class="material-icons circle" id="author-icon"></i> <span
								class="title"><%out.println(postUsername + ":     " + postTitle); %></span> <a href="#!"
								class="secondary-content"><i class="material-icons">grade</i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>


			<!-- THIS IS WHERE THE COMMENTS ARE STORED-->
			
		<%
		String comments = (String) request.getAttribute("comments");
		if(!comments.isEmpty()){
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
							String commentDescription = eachCommentData[0];
							String commentUUID = eachCommentData[1];
							String commentParentUUID = eachCommentData[2];
						String commentUsername = eachCommentData[3];
					%>
					<div class="card  blue-grey lighten-5">
						<div class="card-content">
							<li id="comment-0"><i class="material-icons circle"
								id="comment-0-icon"></i> <span class="title"
								><%out.println(commentUsername);%></span>
								<p>
									<%
										out.println(commentDescription);
									%>
								</p> <a onclick="showMessage(0)"
								class="secondary-content waves-effect waves-light btn-small"><i
									class="material-icons left">add</i>Reply</a></li>

							<li id="comment-0-show" class="hide">
								<div class="row">
									<div class="input-field col s10">
										<i class="material-icons prefix">mode_edit</i>
										<textarea id="icon_prefix0" class="materialize-textarea"></textarea>
										<label for="icon_prefix0"></label>
									</div>
							</li>
						</div>
					</div>

					<%
						}
					%>

				</ul>
			</div>
<%	} %>

			<!--THIS IS WHERE COMMENT ON THREAD IS-->
			<%
				HttpSession sess = request.getSession();
				String postUUID = (String) sess.getAttribute("postUUID");
				if (sess.getAttribute("username") != null) {
			%>
	<form action="PostControllerCommand" method="post">
			<div class="card blue-grey lighten-5">
				<div class="card-content">
					<ul class="collection">
						<li class="collection-item avatar black-text"><i
							class="material-icons circle red" id="icon"></i> <span
							class="title" id="username"> <%
 								out.print(sess.getAttribute("username"));%></span> 
 							<a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
						</li>
						<li class="collection-item avatar black-text">
							<div class="row">
								<div class="input-field col s10">
									<i class="material-icons prefix">mode_edit</i>
									<textarea id="icon_prefix3" class="materialize-textarea" name = "comment"></textarea>
									<label for="icon_prefix3"></label>
								<input type="hidden" name="postUUID" value=<%=postUUID%> /> 
								</div>
						</li>
					</ul>
				</div>
				<div class="card-action">
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
</body>
</html>