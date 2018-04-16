<signup-modal>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<div id="id01" class="w3-modal">
	<div class="w3-modal-content w3-card-4 w3-animate-zoom"
		style="max-width: 600px">

		<div class="w3-center">
			<br> <span
				onclick="document.getElementById('id01').style.display='none'"
				class="w3-button w3-xlarge w3-hover-red w3-display-topright"
				title="Close Modal">&times;</span> 
		</div>

		<signup-modal-pop-up></signup-modal-pop-up>

		<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
			<button
				onclick="document.getElementById('id01').style.display='none'"
				type="button" class="w3-button w3-red">Cancel</button>
			<span class="w3-right w3-padding w3-hide-small">Forgot <a
				href="#">password?</a></span>
		</div>

	</div>
</div>




</signup-modal>