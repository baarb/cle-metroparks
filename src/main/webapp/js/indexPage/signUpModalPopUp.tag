<signup-modal-pop-up>
<div class="signup">
	<h4>Sign Up to</h4>
	<h4>become a Citizen Scientist</h4>
	<form method="POST" action="{opts.formUrl}">
		<input type="hidden" name="CSRF_TOKEN" value="{opts.CSRF_TOKEN}" />
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<div class="form-group">
					<label for="userName">User Name: </label> <input type="text"
						id="userNamePopUp" name="userName" placeHolder="User Name"
						class="form-control" />
				</div>
				<div style="color: red; font-weight: bold"> 
					{ opts.popUpMessage }
				</div>
				<div class="form-group">
					<label for="password">Password: </label> <input type="password"
						id="passwordPopUp" name="password" placeHolder="Password"
						class="form-control" />
				</div>
				<div class="form-group">
					<label for="confirmPassword">Confirm Password: </label> <input
						type="password" id="confirmPasswordPopUp" name="confirmPassword"
						placeHolder="Re-Type Password" class="form-control" />
				</div>
				<div class="form-group">
					<label for="email">Email: </label> <input type="email" id="emailPopUp"
						name="email" placeHolder="Email" class="form-control" />
				</div>
				<button type="submit" class="btn btn-default">Create User</button>
			</div>
			<div class="col-sm-4"></div>
		</div>
	</form>
</div>

<style>
.signup {
	grid-column: 2/3;
	margin: 3%;
}

.signup>h4 {
	text-align: center;
}
</style>


<script type="text/javascript">
	this.on('mount', () =>{
	let root = this.root;
						$.validator.addMethod('capitals', function(thing) {
							return thing.match(/[A-Z]/);
						});
						$(root).find('form').validate(
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
													equalTo : "#passwordPopUp"
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
</signup-modal-pop-up>