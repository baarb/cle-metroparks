<best-pics>

<div id="wrapper">

	<span id="controlL" class="left-controls" role="button"
		aria-label="See Previous Modules"> <b
		class="fa fa-chevron-left fa-chevron-left-extra" aria-hidden="true"></b>
	</span>

	<div class="title text-center h1">Module Selection Area</div>

	<div class="module-section clearfix">
		<!-- <button class="btn arrow-guides fa-chevron-left"></button> -->
		<ul id="content">

			<li class="card effect1">
				<div class="inside-top">
					<img src="http://placehold.it/350x150">
				</div>
			</li>

			<c:forEach begin="10" end="20" step="1" var="photoNum">
				<li class="card">
					<div class="inside-top">
						<c:url var="currentPic"
							value="img/metropark_imgs/coyote_pics/Coyote_0${photoNum}.jpg" />
						<img src="{opts.currentPic}">
					</div>
				</li>



			</c:forEach>
		</ul>



	</div>
	<!--end of module-section-->

	<span id="controlR" class="right-controls" role="button"
		aria-label="See Previous Modules"> <b
		class="fa fa-chevron-right fa-chevron-right-extra" aria-hidden="true"></b>
	</span>
	<!-- <button class="btn arrow-guides-right fa-chevron-right"></button> -->

</div>



<style>
body {
	background: #fff;
}

html {
	overflow: scroll;
	overflow-x: hidden;
}

::-webkit-scrollbar {
	width: 0px; /* remove scrollbar space */
	background: transparent; /* optional: just make scrollbar invisible */
}
/* optional: show position indicator in red */
/*::-webkit-scrollbar-thumb {
    background: #FF0000;
}*/
#wrapper {
	max-width: 100%;
	padding: 50px 75px 50px 45px;
	position: relative;
}

button:focus {
	outline: 0 !important;
}

.left-controls {
	position: absolute;
	top: 0;
	left: 0;
	width: 4%;
	height: 1000px;
	z-index: 40;
	background: #fff;
	opacity: 1;
	cursor: pointer;
	text-align: center; webkit justify content : center;
	justify-content: center;
	display: webkit box;
	display: webkit flex;
	display: moz box;
	display: ms flexbox;
	display: flex;
	color: #fff;
}

.fa-chevron-left-extra {
	align-self: center;
	position: relative;
	height: auto;
	top: -250px;
	transform-origin: 55% 50%;
	font-style: normal;
	font-weight: 400;
	line-height: 1;
	font-variant: normal;
	text-transform: none;
	font-size: 2.5vw;
	transition: transform .1s ease-out 0s;
	transition-property: transform;
	transition-duration: 0.1s;
	transition-timing-function: ease-out;
	transition-delay: 0s;
	color: blue;
	opacity: .1;
}

.right-controls {
	position: absolute;
	top: 0;
	right: 0;
	width: 4%;
	height: 1000px;
	z-index: 40;
	background: #fff;
	opacity: 1;
	cursor: pointer;
	text-align: center; webkit justify content : center;
	justify-content: center;
	display: webkit box;
	display: webkit flex;
	display: moz box;
	display: ms flexbox;
	display: flex;
	color: #fff;
}

.fa-chevron-right-extra {
	align-self: center;
	position: relative;
	height: auto;
	top: -250px;
	transform-origin: 55% 50%;
	font-style: normal;
	font-weight: 400;
	line-height: 1;
	font-variant: normal;
	text-transform: none;
	font-size: 2.5vw;
	transition: transform .1s ease-out 0s;
	transition-property: transform;
	transition-duration: 0.1s;
	transition-timing-function: ease-out;
	transition-delay: 0s;
	color: blue;
	opacity: .1;
}

.title {
	color: #eee;
}

.module-section {
	max-width: 100%;
	overflow: hidden;
	overflow-x: scroll;
	border-left: 1px solid #fff;
	border-right: 1px solid #fff;
}

ul {
	width: 600em;
	list-style-type: none;
	padding: 50px 0 50px 0;
}

#content {
	position: relative;
}

/*
.arrow-guides, .arrow-guides:hover{

font-size:29px;
font-family: FontAwesome;
font-style: normal;
font-weight: normal;
float:left;
position:relative;
top:80px;
left:-10px;
padding: 10px 5px 5px 2px;
background:#999;
color:#fff;
}
*/

/*
.arrow-guides-right, .arrow-guides-right:hover{

font-size:29px;
font-family: FontAwesome;
font-style: normal;
font-weight: normal;
float:right;
position:relative;
bottom:185px;
right:-40px;
padding: 10px 2px 5px 5px;
background:#999;
color:#fff;
}

*/
.card {
	width: 25em;
	height: 350px;
	background: #fff;
	float: left;
	margin-right: 10px;
	margin-bottom: 50px;
	cursor: pointer;
	transform: scale(1);
	visibility: visible;
	-moz-box-shadow: 0px 1px 5px 0px #676767;
	-webkit-box-shadow: 0px 1px 5px 0px #676767;
	box-shadow: 0px 1px 5px 0px #676767;
}

.card:hover {
	cursor: pointer;
	transform: scale(1);
	visibility: visible;
	transition: all .2s ease-in-out;
	transform: scale(1.1);
	z-index: 100;
	position: relative;
	transition-timing-function: cubic-bezier(0.5, 0, 0.1, 1);
	transition-duration: 400ms;
}

.inside-top {
	width: 100%;
	height: 150px;
	background: #000;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 100;
}

.clearfix {
	overflow: auto;
	zoom: 1;
}
</style>
<script>
	$('#controlR').click(function() {
		event.preventDefault();
		$('#content').animate({
			marginLeft : "-=400px"
		}, "fast");
	});

	$('#controlL').click(function() {
		event.preventDefault();
		$('#content').animate({
			marginLeft : "+=400px"
		}, "fast");
	});

	/*jQuery(document).ready(function ($) {



	 var slideCount = $('.module-section ul li').length;
	 var slideWidth = $('.module-section ul li').width();
	 var slideHeight = $('.module-section ul li').height();
	 var sliderUlWidth = slideCount * slideWidth;
	
	 $('.module-section').css({ width: slideWidth, height: slideHeight });
	
	 $('.module-section ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });
	
	 $('.module-section ul li:last-child').prependTo('.module-section ul');

	 function moveLeft() {
	 $('.module-section ul').animate({
	 left: + slideWidth
	 }, 200, function () {
	 $('.module-section ul li:last-child').prependTo('.module-section ul');
	 $('.module-section ul').css('left', '');
	 });
	 };

	 function moveRight() {
	 $('.module-section ul').animate({
	 left: - slideWidth
	 }, 200, function () {
	 $('.module-section ul li:first-child').appendTo('.module-section ul');
	 $('.module-section ul').css('left', '');
	 });
	 };

	 $('.left-controls').click(function () {
	 moveLeft();
	 });

	 $('.right-controls').click(function () {
	 moveRight();
	 });

	 });    



	 */
</script> </best-pics>