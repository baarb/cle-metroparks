<user-preferences>
<h2>Preferences</h2>

<!-- <button onclick="document.getElementById('id01').style.display='block'"
	class="w3-button w3-green w3-large">Change Profile Pic</button>

<div id="id01" class="w3-modal">
	<div class="w3-modal-content w3-card-4 w3-animate-zoom"
		style="max-width: 600px">

		<div class="w3-center">
			<br> <span
				onclick="document.getElementById('id01').style.display='none'"
				class="w3-button w3-xlarge w3-hover-red w3-display-topright"
				title="Close Modal">&times;</span>

			<form action="upload.php" method="post" enctype="multipart/form-data">
				Select image to upload: <input type="file" name="fileToUpload"
					id="fileToUpload"> <input type="submit"
					value="Upload Image" name="submit">
			</form>

		</div>
		<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
			<button
				onclick="document.getElementById('id01').style.display='none'"
				type="button" class="w3-button w3-red">Cancel</button>
			<span class="w3-right w3-padding w3-hide-small">Forgot <a
				href="#">password?</a></span>
		</div>

	</div>
</div>
 -->




<button onclick="document.getElementById('id02').style.display='block'"
	class="w3-button w3-green w3-large">Change Password</button>

<div id="id02" class="w3-modal">
	<div class="w3-modal-content w3-card-4 w3-animate-zoom"
		style="max-width: 600px">

		<div class="w3-center">
			<br> <span
				onclick="document.getElementById('id02').style.display='none'"
				class="w3-button w3-xlarge w3-hover-red w3-display-topright"
				title="Close Modal">&times;</span>

		</div>

		<div class="changePW">
			<h4>Change Your Password</h4>
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
						<div style="color: red; font-weight: bold">
							{opts.errorMessage}</div>
						<div class="form-group">
							<label for="password">Current Password: </label> <input
								type="password" id="password" name="password"
								placeHolder="Current Password" class="form-control" />
						</div>
						<div class="form-group">
							<label for="newPassword">New Password: </label> <input
								type="password" id="newPassword" name="newPassword"
								placeHolder="New Password" class="form-control" />
						</div>
						<div class="form-group">
							<label for="confirmPassword">Confirm Password: </label> <input
								type="password" id="confirmPassword" name="confirmPassword"
								placeHolder="Re-Type New Password" class="form-control" />
						</div>

						<button type="submit" class="btn btn-default">Change
							Password</button>
					</div>
					<div class="col-sm-4"></div>
				</div>
			</form>
		</div>


		<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
			<button
				onclick="document.getElementById('id02').style.display='none'"
				type="button" class="w3-button w3-red">Cancel</button>
			<span class="w3-right w3-padding w3-hide-small">Forgot <a
				href="#">password?</a></span>
		</div>

	</div>
</div>

<style>
.changePW {
	grid-column: 2/3;
	margin: 3%;
}

.changePW>h4 {
	text-align: center;
}
</style>



</user-preferences>