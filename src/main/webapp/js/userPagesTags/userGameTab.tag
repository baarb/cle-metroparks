<user-game-tab>
<h2>Games</h2>

<div class="content game-holder">
				
				
				<div class="grid">
					<figure class="effect-ming">
						<a href="{opts.gameAnimalId}"><img src="http://metroparks-hackathon.s3.amazonaws.com/Theme/game-find-the-animal.jpg" alt="img09"/>
						<figcaption>
							<h2>Animal <span>Identification</span></h2>
							<p>Think you have what it takes?</p> <p>Verify our AI results.</p> <p>Help us identify local wildlife, and rise through the ranks.</p>
						</figcaption>		
						</a>	
					</figure>
					<figure class="effect-ming">
						<a href="{opts.gameAnimalSpotting}"><img src="http://metroparks-hackathon.s3.amazonaws.com/Theme/game-spot-the-animal.jpg" alt="img16"/>
						<figcaption>
							<!-- <h2>Animal <span>Spotting</span></h2>
							<p>We could't tell if there was an animal in these photos using our AI.</p><p> Lame.</p><p> Let's try human verification instead.</p>
							 -->
							 <h2>Animal <span>Spotting</span></h2>
							<p>Soo... our AI only saw sticks in these pics.</p><p> Lame.</p><p> I bet you can do better.</p>
							
						</figcaption>	
						</a>		
					</figure>
				</div> 
				
			</div>

<style>
*, *:after, *:before { -webkit-box-sizing: border-box; box-sizing: border-box; }
.clearfix:before, .clearfix:after { display: table; content: ''; }
.clearfix:after { clear: both; }

body {
	background: #2f3238;
	color: #fff;
	font-weight: 400;
	font-size: 1em;
	font-family: 'Raleway', Arial, sans-serif;
}

a {
	outline: none;
	color: #3498db;
	text-decoration: none;
}

a:hover, a:focus {
	color: #528cb3;
}

section {
	padding: 1em;
	text-align: center;
}

.content {
	margin: 0 auto;
	max-width: 1000px;
}

.content > h2 {
	clear: both;
	margin: 0;
	padding: 4em 1% 0;
	color: #484B54;
	font-weight: 800;
	font-size: 1.5em;
}

.content > h2:first-child {
	padding-top: 0em;
}

/* Header */
.codrops-header {
	margin: 0 auto;
	padding: 4em 1em;
	text-align: center;
}

.codrops-header h1 {
	margin: 0;
	font-weight: 800;
	font-size: 4em;
	line-height: 1.3;
}

.codrops-header h1 span {
	display: block;
	padding: 0 0 0.6em 0.1em;
	color: #74777b;
	font-weight: 300;
	font-size: 45%;
}

/* Demo links */
.codrops-demos {
	clear: both;
	padding: 1em 0 0;
	text-align: center;
}

.content + .codrops-demos {
	padding-top: 5em;
}

.codrops-demos a {
	display: inline-block;
	margin: 0 5px;
	padding: 1em 1.5em;
	text-transform: uppercase;
	font-weight: bold;
}

.codrops-demos a:hover,
.codrops-demos a:focus,
.codrops-demos a.current-demo {
	background: #3c414a;
	color: #fff;
}

/* To Navigation Style */
.codrops-top {
	width: 100%;
	text-transform: uppercase;
	font-weight: 800;
	font-size: 0.69em;
	line-height: 2.2;
}

.codrops-top a {
	display: inline-block;
	padding: 1em 2em;
	text-decoration: none;
	letter-spacing: 1px;
}

.codrops-top span.right {
	float: right;
}

.codrops-top span.right a {
	display: block;
	float: left;
}

.codrops-icon:before {
	margin: 0 4px;
	text-transform: none;
	font-weight: normal;
	font-style: normal;
	font-variant: normal;
	font-family: 'codropsicons';
	line-height: 1;
	speak: none;
	-webkit-font-smoothing: antialiased;
}

.codrops-icon-drop:before {
	content: "\e001";
}

.codrops-icon-prev:before {
	content: "\e004";
}

/* Related demos */
.related {
	clear: both;
	padding: 6em 1em;
	font-size: 120%;
}

.related > a {
	display: inline-block;
	margin: 20px 10px;
	padding: 25px;
	border: 1px solid #4f7f90;
	text-align: center;
}

.related a:hover {
	border-color: #39545e;
}

.related a img {
	max-width: 100%;
	opacity: 0.8;
}

.related a:hover img,
.related a:active img {
	opacity: 1;
}

.related a h3 {
	margin: 0;
	padding: 0.5em 0 0.3em;
	max-width: 300px;
	text-align: left;
}

/* Demo ad design */
body #cdawrap {
	background: none;
	top: 50px;
	border: none;
}

body #cdawrap a {
	color: #fff !important;
}

body #cda-remove {
	color: #fff;
}

@media screen and (max-width: 25em) {
	.codrops-header {
		font-size: 75%;
	}
	.codrops-icon span {
		display: none;
	}
}
.grid {
	position: relative;
	clear: both;
	margin: 0 auto;
	padding: 1em 0 4em;
	max-width: 1000px;
	list-style: none;
	text-align: center;
}

/* Common style */
.grid figure {
	position: relative;
	float: left;
	overflow: hidden;
	margin: 10px 1%;
	min-width: 320px;
	max-width: 480px;
	max-height: 360px;
	width: 48%;
	height: auto;
	background: #3085a3;
	text-align: center;
	cursor: pointer;
}

.grid figure img {
	position: relative;
	display: block;
	min-height: 100%;
	max-width: 100%;
	opacity: 0.8;
}

.grid figure figcaption {
	padding: 2em;
	color: #fff;
	text-transform: uppercase;
	font-size: 1.25em;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
}

.grid figure figcaption::before,
.grid figure figcaption::after {
	pointer-events: none;
}

.grid figure figcaption,
.grid figure figcaption > a {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

/* Anchor will cover the whole item by default */
/* For some effects it will show as a button */
.grid figure figcaption > a {
	z-index: 1000;
	text-indent: 200%;
	white-space: nowrap;
	font-size: 0;
	opacity: 0;
}

.grid figure h2 {
	word-spacing: -0.15em;
	font-weight: 300;
}

.grid figure h2 span {
	font-weight: 800;
}

.grid figure h2,
.grid figure p {
	margin: 0;
}

.grid figure p {
	letter-spacing: 1px;
	font-size: 68.5%;
}

/* Individual effects */


/*---------------*/
/***** Ming *****/
/*---------------*/

figure.effect-ming {
	background: #030c17;
}

figure.effect-ming img {
	opacity: 0.9;
	-webkit-transition: opacity 0.35s;
	transition: opacity 0.35s;
}

figure.effect-ming figcaption::before {
	position: absolute;
	top: 30px;
	right: 30px;
	bottom: 30px;
	left: 30px;
	border: 2px solid #fff;
	box-shadow: 0 0 0 30px rgba(255,255,255,0.2);
	content: '';
	opacity: 0;
	-webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
	transition: opacity 0.35s, transform 0.35s;
	-webkit-transform: scale3d(1.4,1.4,1);
	transform: scale3d(1.4,1.4,1);
}

figure.effect-ming h2 {
	margin: 20% 0 10px 0;
	-webkit-transition: -webkit-transform 0.35s;
	transition: transform 0.35s;
}

figure.effect-ming p {
	padding: 1em;
	opacity: 0;
	-webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
	transition: opacity 0.35s, transform 0.35s;
	-webkit-transform: scale(1.5);
	transform: scale(1.5);
}

figure.effect-ming:hover h2 {
	-webkit-transform: scale(0.9);
	transform: scale(0.9);
}

figure.effect-ming:hover figcaption::before,
figure.effect-ming:hover p {
	opacity: 1;
	-webkit-transform: scale3d(1,1,1);
	transform: scale3d(1,1,1);
}

figure.effect-ming:hover figcaption {
	background-color: rgba(58,52,42,0);
}

figure.effect-ming:hover img {
	opacity: 0.4;
}

</style>



</user-game-tab>