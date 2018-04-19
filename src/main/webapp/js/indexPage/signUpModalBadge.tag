<sign-up-modal-badge>
<div class="madal-wrapper">
<div class="signup">
<div class="signup-form modal-signup-form">
<div class="modalBadge">
	<div class="congrats">
		<h4>Congratulations</h4>
		<p>You just earned your first badge!</p>
	</div>

	<img src={opts.firstBadgeImg} id="badge1">
	<div class="congrats">
		<h5>{opts.firstBadgeTitle}</h5>
		<p>{opts.firstBadgeDescription}</p>
	</div>
</div>
</div>
</div>
</div>

<style>
.modalBadge {
	display: grid;
	justify-content: center;
}

.modalBadge>img {
	display: flex;
	width: 100%;
	position: relative;
	justify-content: inherit;
}
.congrats{
	
	
}
.congrats>h4{
	text-align: center;
}
.congrats>h5{
	text-align: center;
}
.congrats>p{
	text-align: center;
}


</style>


</sign-up-modal-badge>