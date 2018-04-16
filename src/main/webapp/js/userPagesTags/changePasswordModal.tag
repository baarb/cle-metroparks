<change-pw-modal>
<div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
        <img src="img_avatar4.png" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top">
      </div>

      <form class="w3-container" action="/action_page.php">
        <div class="w3-section">
          <label><b>Username</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Username" name="usrname" required>
          <label><b>Password</b></label>
          <input class="w3-input w3-border" type="password" placeholder="Enter Password" name="psw" required>
          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Login</button>
          <input class="w3-check w3-margin-top" type="checkbox" checked="checked"> Remember me
        </div>
      </form>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
        <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span>
      </div>

    </div>
  </div>




		<!-- <div class="signup">
			<h4>Change Your Password</h4>
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
							{opts.errorMessage}</div>
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
							<label for="email">Email: </label> <input type="email"
								id="emailPopUp" name="email" placeHolder="Email"
								class="form-control" />
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
</script> --> --> </change-pw-modal>