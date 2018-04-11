<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Landing Page</title>
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


			<c:url var="formAction" value="/users" />
			<form method="POST" action="${formAction}">
				<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<div class="form-group">
							<label for="userName">User Name: </label> <input type="text"
								id="userName" name="userName" placeHolder="User Name"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="password">Password: </label> <input type="password"
								id="password" name="password" placeHolder="Password"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="confirmPassword">Confirm Password: </label> <input
								type="password" id="confirmPassword" name="confirmPassword"
								placeHolder="Re-Type Password" class="form-control" />
						</div>
						<button type="submit" class="btn btn-default">Create User</button>
					</div>
					<div class="col-sm-4"></div>
				</div>
			</form>

		</div>
		<div>or
		</div>





		<div>
			<a href="userRegistration/login"><h6>Log In</h6></a>
		</div>
		<div>
			<c:url var="user" value="/user" />
			<a href="user">Skip to Home Page</a>
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



	<script
		src="https://rawgit.com/riot/riot/master/riot%2Bcompiler.min.js"></script>
	<script src="signUp.tag" type="riot/tag"></script>
	<script src="movieList.tag" type="riot/tag"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$.validator.addMethod('capitals', function(thing) {
								return thing.match(/[A-Z]/);
							});
							$("form")
									.validate(
											{

												rules : {
													userName : {
														required : true
													},
													password : {
														required : true,
														minlength : 15,
														capitals : true,
													},
													confirmPassword : {
														required : true,
														equalTo : "#password"
													}
												},
												messages : {
													password : {
														minlength : "Password too short, make it at least 15 characters",
														capitals : "Field must contain a capital letter",
													},
													confirmPassword : {
														equalTo : "Passwords do not match"
													}
												},
												errorClass : "error"
											});
						});
	</script>
	<script>
		/* This is where we include our components */
		//Searchbox (OMDB API)
		let pubSub = {};
		riot.observable(pubSub);//makes it observable
		riot.mount('sign-up', {
			'bus' : pubSub
		});

		//
	</script>

</body>

</html>