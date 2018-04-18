<user-game-tab>
<h2>Games</h2>



<div class="game-section">
	
	<figure class="snip1321">
		<img src="http://metroparks-hackathon.s3.amazonaws.com/Theme/game-find-the-animal.jpg" />
		<figcaption>
			<!-- <i class="ion-stats-bars"></i> -->
			<h4>Can you Identify</h4>
			<h2>the Animal?</h2>
		</figcaption>
		<a href="{opts.gameAnimalId}"></a>
	</figure>
	
	<figure class="snip1321">
		<img src="http://metroparks-hackathon.s3.amazonaws.com/Theme/game-spot-the-animal.jpg" />
		<figcaption>
			<!-- <i class="ion-stats-bars"></i> -->
			<h4>Can you Spot</h4>
			<h2>the Animal?</h2>
		</figcaption>
		<!--  <a href="{opts.gameAnimalSpotting}"></a>-->
		<a href="http://textfiles.com/underconstruction/" target="_blank"></a>
	</figure>
	
</div>



<style>
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);

@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800);

.game-section{
display: flex;
justify-content: center;

}


figure.snip1321 {
	font-family: 'Raleway', Arial, sans-serif;
	position: relative;
	float: left;
	overflow: hidden;
	margin: 10px 1%;
	min-width: 230px;
	max-width: 315px;
	width: 100%;
	color: #000000;
	text-align: center;
	-webkit-perspective: 50em;
	perspective: 50em;
}

figure.snip1321 * {
	-webkit-box-sizing: padding-box;
	box-sizing: padding-box;
	-webkit-transition: all 0.2s ease-out;
	transition: all 0.2s ease-out;
}

figure.snip1321 img {
	max-width: 100%;
	vertical-align: top;
}

figure.snip1321 figcaption {
	top: 50%;
	left: 20px;
	right: 20px;
	position: absolute;
	opacity: 0;
	z-index: 1;
}

figure.snip1321 h2, figure.snip1321 h4 {
	margin: 0;
}

figure.snip1321 h2 {
	font-weight: 600;
}

figure.snip1321 h4 {
	font-weight: 400;
	text-transform: uppercase;
}

figure.snip1321 i {
	font-size: 32px;
}

figure.snip1321:after {
	background-color: #ffffff;
	position: absolute;
	content: "";
	display: block;
	top: 20px;
	left: 20px;
	right: 20px;
	bottom: 20px;
	-webkit-transition: all 0.4s ease-in-out;
	transition: all 0.4s ease-in-out;
	-webkit-transform: rotateX(-90deg);
	transform: rotateX(-90deg);
	-webkit-transform-origin: 50% 50%;
	-ms-transform-origin: 50% 50%;
	transform-origin: 50% 50%;
	opacity: 0;
}

figure.snip1321 a {
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	position: absolute;
	z-index: 1;
}

figure.snip1321:hover figcaption, figure.snip1321.hover figcaption {
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	opacity: 1;
	-webkit-transition-delay: 0.2s;
	transition-delay: 0.2s;
}

figure.snip1321:hover:after, figure.snip1321.hover:after {
	-webkit-transform: rotateX(0);
	transform: rotateX(0);
	opacity: 0.9;
}
</style>
<script>
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
</script> 


</user-game-tab>