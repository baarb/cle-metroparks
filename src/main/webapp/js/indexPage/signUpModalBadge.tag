<sign-up-modal-badge>
<div class="modalBadge">
	<div class="congrats">
		<h2>Congratulations</h1>
		<h4>You just earned your first badge!</h2>
	</div>

	<img src={opts.firstBadgeImg} id="badge1">
	<div class="badgeInfo">
		<h4>{opts.firstBadgeTitle}</h4>
		<p>{opts.firstBadgeDescription}</p>
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
	padding: 0% 12% 0% 12%;
	
}
.congrats>h2{
	text-align: center;
}

.badgeInfo {
	display: grid;
	justify-content: center;
}
</style>


</sign-up-modal-badge>