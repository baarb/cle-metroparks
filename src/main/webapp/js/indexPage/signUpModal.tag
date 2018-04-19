<signup-modal>




<div id="id01" class="w3-modal">
	<div class="w3-modal-content w3-card-4 w3-animate-zoom"
		style="max-width: 900px">

		<div class="w3-center">
			<br> <span
				onclick="document.getElementById('id01').style.display='none'"
				class="w3-button w3-xlarge w3-hover-red w3-display-topright"
				title="Close Modal">&times;</span>
		</div>
		<div class="content">
			<div >
				<sign-up-modal-badge></sign-up-modal-badge>
			</div>
			<div>
				<signup-modal-pop-up></signup-modal-pop-up>
			</div>
		</div>
		
		</div>

	</div>
</div>

<style>
.content {
	display: grid;
	grid-template-columns: 2fr 3fr;
	
}
</style>



</signup-modal>