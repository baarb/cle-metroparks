<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Landing Page</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
	    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
<style>
body{
display: grid;
grid-template-columns: 1fr 1fr 1fr;

}
.main{
grid-column: 2/3;



}
.signup{

}
.signup > h6{

}
.userBenefits{
grid-column: 2/3;
}

.bestPics{
grid-column: 2/3;
}

.metroBenefits{
grid-column: 2/3;
}

</style>
</head>
<body>
	<div class="main">
		<h1>Sign-In Prompt</h1>
		<div class="signup">
			<h6>Sign Up</h6>


		<sign-up></sign-up>

		</div>
		<div>or
		</div>





		<div>
			<a href="userRegistration/login"><h6>Log In</h6></a>
		</div>
		

	</div>
	<div class="userBenefits">
	<h1>User Benefits</h1>
	
	</div>
	<div class="bestPics">
	<h1>Carousel of Best Pics</h1>
	
	</div>
	<div class="metroBenefits">
	<h1>Metropark Benefits</h1>
	</div>



	<script src="https://rawgit.com/riot/riot/master/riot%2Bcompiler.min.js"></script>
	<c:url value="/js/signUp.tag" var="signUp"/>
	<script src="${signUp}" type="riot/tag"></script>
	
	<script>
		/* This is where we include our components */
		//Searchbox (OMDB API)
		let pubSub = {};
		riot.observable(pubSub);//makes it observable
		riot.mount('sign-up', {
			'bus' : pubSub,
			'formUrl': '<c:url value="/users" />',
			'CSRF_TOKEN': '${CSRF_TOKEN}'
		});

		//
	</script>

</body>

</html>