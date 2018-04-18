<user-pic-alt-link>


<div class="content">
				
				<div class="grid">
					<figure class="effect-moses">
						<img src="https://tympanus.net/Development/HoverEffectIdeas/img/24.jpg" alt="img24"/>
						<figcaption>
							<h2>No favorite <span>Photos?</span></h2>
							<p>Let's change that. Think you can identify these furry friends?</p>
							<a href="#">View more</a>
						</figcaption>			
					</figure>
					<figure class="effect-moses">
						<img src="https://tympanus.net/Development/HoverEffectIdeas/img/20.jpg" alt="img20"/>
						<figcaption>
							<h2>You never <span>Know...</span></h2>
							<p>what you might find. </p>
							<a href="#">View more</a>
						</figcaption>			
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


/*-----------------*/
/***** Moses *****/
/*-----------------*/

figure.effect-moses {
	background: -webkit-linear-gradient(-45deg, #EC65B7 0%,#05E0D8 100%);
	background: linear-gradient(-45deg, #EC65B7 0%,#05E0D8 100%);
}

figure.effect-moses img {
	opacity: 0.85;
	-webkit-transition: opacity 0.35s;
	transition: opacity 0.35s;
}

figure.effect-moses h2,
figure.effect-moses p {
	padding: 20px;
	width: 50%;
	height: 50%;
	border: 2px solid #fff;
}

figure.effect-moses h2 {
	padding: 20px;
	width: 50%;
	height: 50%;
	text-align: left;
	-webkit-transition: -webkit-transform 0.35s;
	transition: transform 0.35s;
	-webkit-transform: translate3d(10px,10px,0);
	transform: translate3d(10px,10px,0);
}

figure.effect-moses p {
	float: right;
	padding: 20px;
	text-align: right;
	opacity: 0;
	-webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
	transition: opacity 0.35s, transform 0.35s;
	-webkit-transform: translate3d(-50%,-50%,0);
	transform: translate3d(-50%,-50%,0);
}

figure.effect-moses:hover h2 {
	-webkit-transform: translate3d(0,0,0);
	transform: translate3d(0,0,0);
}

figure.effect-moses:hover p {
	opacity: 1;
	-webkit-transform: translate3d(0,0,0);
	transform: translate3d(0,0,0);
}

figure.effect-moses:hover img {
	opacity: 0.6;
}


/* Media queries */
@media screen and (max-width: 50em) {
	.content {
		padding: 0 10px;
		text-align: center;
	}
	.grid figure {
		display: inline-block;
		float: none;
		margin: 10px auto;
		width: 100%;
	}
}



</style>


</user-pic-alt-link>