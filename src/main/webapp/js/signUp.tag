<sign-up> 
<form method="POST" action="{opts.formUrl}">
	<input type="hidden" name="CSRF_TOKEN" value="{opts.CSRF_TOKEN}" />
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
			<div class="form-group">
				<label for="email">Email: </label> <input
					type="email" id="email" name="email"
					placeHolder="Email" class="form-control" />
			</div>
			<button type="submit" class="btn btn-default">Create User</button>
		</div>
		<div class="col-sm-4"></div>
	</div>
</form>




<script type="text/javascript">


	$(document).ready(function () {
		$.validator.addMethod('capitals', function(thing){
			return thing.match(/[A-Z]/);
		});
		$("form").validate({
			
			rules : {
				userName : {
					required : true
				},
				password : {
					required : true,
					minlength: 15,
					capitals: true,
				},
				confirmPassword : {
					required : true,		
					equalTo : "#password"  
				}
			},
			messages : {			
				password: {
					minlength: "Password too short, make it at least 15 characters",
					capitals: "Field must contain a capital letter",
				},
				confirmPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error"
		});
	});
</script> 
</sign-up>