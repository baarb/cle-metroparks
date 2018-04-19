<%@ taglib uri="https://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Home Page</title>
<link rel="icon" type="image/png" href="http://metroparks-hackathon.s3.amazonaws.com/Theme/favicon.png" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
<script
	src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.10/js/all.js" integrity="sha384-slN8GvtUJGnv6ca26v8EzVaR9DC58QEwsIk9q1QXdCU8Yu8ck/tL/5szYlBbqmS+" crossorigin="anonymous"></script>

<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
<c:url var="cssHref" value="/css/style.css" />
<link rel="stylesheet" type="text/css" href="${cssHref}">
<!-- JS magnifyer functions -->
<c:url var="jsMagnifyHref" value="/js/magnify.js" />
<script src="${jsMagnifyHref}"></script>

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

</head>
<body>
	<div class="wrapper">
	<nav class="navbar navbar-default">
	
		<div class="container-fluid">
			<ul class="nav navbar-nav">
			<c:url var="homePageHref" value="/" />
				<a href="${homePageHref}"><img src="http://metroparks-hackathon.s3.amazonaws.com/Theme/app-logo-01.svg" style="width:400px;"/></a>
			
				
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${empty currentUser}">

						<c:url var="newUserHref" value="/users/new" />
						<li><a href="${newUserHref}">Sign Up</a></li>
						<c:url var="loginHref" value="/userRegistration/login" />
						<li><a href="${loginHref}">Log In</a></li>
					</c:when>
					<c:otherwise>
						<c:url var="userProfile"
							value="/users/${currentUser.userName}" />
						<li><a href="${userProfile}">${currentUser.userName}</a></li>
						<c:url var="logoutAction" value="/logout" />
						
						<li><a id="logoutLink" href="#">Log Out</a></li>
						<form id="logoutForm" action="${logoutAction}" method="POST">
							<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
						</form>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
	
