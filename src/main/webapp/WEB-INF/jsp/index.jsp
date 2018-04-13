<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Landing Page</title>

	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
	<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
	<script src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<c:url var="cssHref" value="/site.css" />
	<link rel="stylesheet" type="text/css" href="${cssHref}">


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
	grid-template-columns: auto auto;
	background-image:
		url("img/background-background-image-creek-707915.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	background-color: threeddarkshadow;
	color: white;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	background-color: threeddarkshadow;
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
			<li><a href="${homePageHref}">Logo</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<c:choose>
				<c:when test="${empty currentUser}">
					<c:url var="newUserHref" value="/users/new" />
					<li><a href="${newUserHref}">Sign Up</a></li>
					<c:url var="loginHref" value="/userRegistration/login" />
					<li><a href="${loginHref}">Log In</a></li>
				</c:when>
			</c:choose>
		</ul>
	</div>
</nav>

<body>

	<div>
		<c:url var="firstPhoto" value="img/background-background-image-creek-707915.jpg" />
		<signup-funnel></signup-funnel>
	</div>

	<div class="main">
		<user-benefits></user-benefits>
		<sign-up></sign-up>
	</div>
	<div>
		<metro-benefits></metro-benefits>
	</div>

	<div>
		<best-pics></best-pics>
	</div>

	<script src="https://rawgit.com/riot/riot/master/riot%2Bcompiler.min.js"></script>
	<c:url value="/js/indexPage/signUpFunnel.tag" var="signUpFunnel" />
	<script src="${signUpFunnel}" type="riot/tag"></script>
	
	<c:url value="/js/indexPage/signUp.tag" var="signUp" />
	<script src="${signUp}" type="riot/tag"></script>
	<c:url value="/js/indexPage/userBenefits.tag" var="userBenefits" />
	<script src="${userBenefits}" type="riot/tag"></script>
	<c:url value="/js/indexPage/bestPics.tag" var="bestPics" />
	<script src="${bestPics}" type="riot/tag"></script>
	<c:url value="/js/indexPage/metroBenefits.tag" var="metroBenefits" />
	<script src="${metroBenefits}" type="riot/tag"></script>

	<script>
		let pubSub = {};
		riot.observable(pubSub);//makes it observable
		riot.mount('signup-funnel', {
			'bus' : pubSub,
			'imgUrl' : '<c:url var="firstPhoto" value="img/background-background-image-creek-707915.jpg" />',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
		riot.mount('sign-up', {
			'bus' : pubSub,
			'firstPhoto' : '${firstPhoto}',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});

		riot.mount('user-benefits', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});

		riot.mount('best-pics', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});

		riot.mount('metro-benefits', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
	</script>
	
</body>

</html>