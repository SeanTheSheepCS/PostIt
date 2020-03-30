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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel = "stylesheet" href = "afshstyle.css">	
<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<title>Topics</title>
</head>

<body>

	<nav class="nav-wrapper indigo">
		<div class="container">
			<a href="#" class="brand-logo"> Post-It</a> <a href="#"
				class="sidenav-trigger" data-target="mobile-links"> <i
				class="material-icons">menu</i>
			</a>
			<ul class="right hide-on-med-and-down">
				<li><a href="GetTopics"> Home </a></li>
				<li><a href="#"> About </a></li>
				<li><a href="userpage.jsp"> Profile </a></li>
			<!-- <li><a href="#login-modal" class="modal-trigger"> Login </a></li>  -->	
				<li><a href="#Topic-modal" class="modal-trigger"> New Topic </a></li>
			
				<li><a href="#" class="btn-floating indigo darken-4 z-depth-0">
						<i class="material-icons">notifications</i>
				</a></li>
			</ul>
		</div>
	</nav>
	
<form action = "SearchTopicController" method="GET">
<div class="topnav">
  <input type="text" placeholder="Please enter a topic name to search for....." name = "topicName">
<input type="submit" class="btn" value="Search"></div>
</form>	



	<div class="modal" id="Topic-modal">
		<div class="modal-content" id="login-modal-content">
			<div class="row">


				<div class="col s12 m12 l6">
					<div class="card">
						<div class="card-content">
							<form action="NewTopicController" method=post>
								<h4>New Topic?</h4>

								<div class="input-field">
									<input id="register-email-field" type="text" class="validate"
										name="title"> <label for="register-email-field">Title</label>
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
		<li><a href="#Topic-modal" class="modal-trigger"> New Topic </a></li>
		
	</ul>
	<%
				String topics = (String) request.getAttribute("topics");
			if(!topics.isEmpty()){									
			
	%>

	<div class="container">
		<ul class="collection">
		
			
			<% 										
				String[] topic = topics.split("\\*");

				for (int i = 0; i < topic.length; i++) {

					String[] topicData = topic[i].split("\\|");
					String topic_name = topicData[0];
					String topic_id = topicData[1];
					String num_members = topicData[2];
			%>

			<li class="collection-item avatar" id="topic-one-card"><i
				class="material-icons circle" id="topic-one-card-icon">folder</i> <span
				class="title" id="topic-one-card-title"> <%
 	out.println(topic_name);
 %>
			</span>
				<p id="topic-one-card-description">Topic Description??</p>
				<p id="topic-one-card-member-count"> <% out.println("Number of members: " + num_members); %></p>

				<div class="secondary-content">
					<form action="TopicController" method="GET">
						<input type="hidden" name="topicid" value=<%=topic_id%> /> <input
							type="submit" class="btn" value="Visit">
					</form>
					<form action="SubscribeController" method="GET">
						<input type="hidden" name="topicid" value=<%=topic_id%> /> <input
							type="submit" class="btn" value="Join">
					</form>
				</div></li>

			<%
				}
			%>
		</ul>
	</div>
<%
}
			else{			
%>
<p>No topics found!</p>
<%} %>

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