<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Landing Page</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
<script
	src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
<script
	src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<c:url var="cssHref" value="/site.css" />
<link rel="stylesheet" type="text/css" href="${cssHref}">

<script type="text/javascript">
	$(document).ready(function() {
		$("time.timeago").timeago();

		$("#logoutLink").click(function(event) {
			$("#logoutForm").submit();
		});

		var pathname = window.location.pathname;
		$("nav a[href='" + pathname + "']").parent().addClass("active");

	});
</script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
<script
	src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
<style>
.header {
	grid-column: 2/3;
	display: flex;
	align-content: space-between;
}

body {
	
}

section {
	
}

.main {
	display: grid;
	grid-template-columns: auto auto auto;
	background-color: lightblue;
}

.signup {
	grid-column: 2/3;
}

.signup>h4 {
	text-align: center;
}

.login {
	grid-column: 3/3;
	background-color: white;
}

.userBenefits {
	display: grid;
	grid-template-columns: auto auto auto auto;
	background-color: silver;
}

.userBenefits>h1 {
	grid-column: 2/span 2;
	text-align: center
}
.lists{
	grid-column: 2/ span 2;
}
.list1 {
	grid-column: 2/4;
}

.list2 {
	grid-column: 3/4;
}

.bestPics {
	grid-column: 2/3;
}

.metroBenefits {
	grid-column: 2/3;
}
</style>
</head>
<nav class="navbar navbar-default">
<div class="container-fluid">
	<ul class="nav navbar-nav">
		<c:url var="homePageHref" value="/" />
		<li><a href="${homePageHref}">Home</a></li>
		<c:if test="${not empty currentUser}">
			<c:url var="dashboardHref" value="/users/${currentUser}" />
			<li><a href="${dashboardHref}">Private Messages</a></li>
			<c:url var="newMessageHref"
				value="/users/${currentUser}/messages/new" />
			<li><a href="${newMessageHref}">New Message</a></li>
			<c:url var="sentMessagesHref" value="/users/${currentUser}/messages" />
			<li><a href="${sentMessagesHref}">Sent Messages</a></li>
			<c:url var="changePasswordHref"
				value="/users/${currentUser}/changePassword" />
			<li><a href="${changePasswordHref}">Change Password</a></li>
		</c:if>
	</ul>
	<ul class="nav navbar-nav navbar-right">
		<c:choose>
			<c:when test="${empty currentUser}">
				<c:url var="loginHref" value="/userRegistration/login" />
				<li><a href="${loginHref}">Log In</a></li>
			</c:when>
			<c:otherwise>
				<c:url var="logoutAction" value="/logout" />
				<form id="logoutForm" action="${logoutAction}" method="POST">
					<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
				</form>
				<li><a id="logoutLink" href="#">Log Out</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
</nav>
<body>


	<div class="main">

		<div class="signup">
			<h4>Sign Up</h4>


			<sign-up></sign-up>

		</div>



	</div>

	<div class="userBenefits">
		<h1>User Benefits</h1>
		<div class="lists">
			<ul class="list1">
				<li>Create Your Own Picture Collections</li>
				<li></li>

			</ul>
			<ul class="list2">
				<li>Earn Badges!</li>
				<li>Share with Friends</li>

			</ul>
		</div>

	</div>
	<div class="bestPics">
		<h1>Carousel of Best Pics</h1>

	</div>
	<div class="metroBenefits">
		<h1>Metropark Benefits</h1>
	</div>



	<script
		src="https://rawgit.com/riot/riot/master/riot%2Bcompiler.min.js"></script>
	<c:url value="/js/signUp.tag" var="signUp" />
	<script src="${signUp}" type="riot/tag"></script>

	<script>
		/* This is where we include our components */
		//Searchbox (OMDB API)
		let pubSub = {};
		riot.observable(pubSub);//makes it observable
		riot.mount('sign-up', {
			'bus' : pubSub,
			'formUrl' : '<c:url value="/users" />',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});

		//
	</script>

</body>

</html>