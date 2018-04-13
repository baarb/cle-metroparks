<photo-slider> 
	
	<!-- HTML -->
	<div id="wrapper">
	
		
		<div class="title text-center h1">Favorite Photos</div>
		<div class="module-section clearfix">
			<!-- <button class="btn arrow-guides fa-chevron-left"></button> -->
		<span id="controlL" class="left-controls" role="button" aria-label="See Previous Modules"> 
			<button aria-hidden="true"><i class="fas fa-chevron-left"></i></button>
		</span>
			<ul id="content">
	
				<li class="card effect1">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
				<li class="card">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
				<li class="card">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
				<li class="card">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
				<li class="card">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
				<li class="card">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
				<li class="card">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
				<li class="card">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
	
			</ul>
	
			<span id="controlR" class="right-controls" role="button" aria-label="See Previous Modules"> 
				<button aria-hidden="true"><i class="fas fa-chevron-right"></i></button>
			</span>
		</div>
	
		<!-- <button class="btn arrow-guides-right fa-chevron-right"></button> -->

		<div class="title text-center h1">Badges Earned</div>
		<div class="module-section clearfix">
			<span id="controlL2" class="left-controls2" role="button" aria-label="See Previous Modules"> 
				<button aria-hidden="true"><i class="fas fa-chevron-left"></i></button>
			</span>
			<ul id="content2">
	
				<li class="card effect1">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
				<li class="card">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
				<li class="card">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
				<li class="card">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
				<li class="card">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
				<li class="card">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
				<li class="card">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
				<li class="card">
					<div class="inside-top">
						<img src="http://placehold.it/200x100">
					</div>
				</li>
	
			</ul>
	
	
		<span id="controlR2" class="right-controls2" role="button" aria-label="See Previous Modules"> 
			<button aria-hidden="true"><i class="fas fa-chevron-right"></i></button>
		</span>
		</div>
	
		
		<!-- <button class="btn arrow-guides-right fa-chevron-right"></button> -->
	
	</div>
	
	
	<!-- CSS -->
	
	<style>
	container {
		background-color: lightblue;
	}

	html {
		overflow: scroll;
		overflow-x: hidden;
	}
	
	::-webkit-scrollbar {
		width: 0px; /* remove scrollbar space */
		background: transparent; /* optional: just make scrollbar invisible */
	}
	#wrapper {
		max-width: 100%;
		padding: 0px 75px 0px 45px;
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
		z-index: 40;
		background: #fff;
		opacity: 1;
		cursor: pointer;
		text-align: center; 
		webkit justify content: center;
		justify-content: center;
		display: webkit box;
		display: webkit flex;
		display: moz box;
		display: ms flexbox;
		display: flex;
	
	}
	
	.left-controls2 {
		position: in-line;
		top: 0;
		left: 0;
		width: 4%;
		z-index: 40;
		background: #fff;
		opacity: 1;
		cursor: pointer;
		text-align: center; 
		webkit justify content: center;
		justify-content: center;
		display: webkit box;
		display: webkit flex;
		display: moz box;
		display: ms flexbox;
		display: flex;
		
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
		z-index: 40;
		background: #fff;
		opacity: 1;
		cursor: pointer;
		text-align: center; 
		webkit justify content: center;
		justify-content: center;
		display: webkit box;
		display: webkit flex;
		display: moz box;
		display: ms flexbox;
		display: flex;
		
	}
	
	.right-controls2 {
		position: in-line;
		top: 0;
		right: 0;
		width: 4%;
		z-index: 40;
		background: #fff;
		opacity: 1;
		cursor: pointer;
		text-align: center; 
		webkit justify content: center;
		justify-content: center;
		display: webkit box;
		display: webkit flex;
		display: moz box;
		display: ms flexbox;
		display: flex;
		
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
	
	.arrow-guides, .arrow-guides:hover  {
		font-size: 29px;
		font-family: FontAwesome;
		font-style: normal;
		font-weight: normal;
		float: left;
		position: relative;
		top: 80px;
		left: -10px;
		padding: 10px 5px 5px 2px;
		background: #999;
		color: #fff;
	}
	
	.arrow-guides-right, .arrow-guides-right:hover {
		font-size: 29px;
		font-family: FontAwesome;
		font-style: normal;
		font-weight: normal;
		float: right;
		position: relative;
		bottom: 185px;
		right: -40px;
		padding: 10px 2px 5px 5px;
		background: #999;
		color: #fff;
	}
	
	.card {
		width: 15em;
		height: 150px;
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
		height: 150px;
		background: #000;
		top: 0;
		left: 0;
		z-index: 100;
	}
	
	.clearfix {
		overflow: auto;
		zoom: 1;
	}
	</style>
	
	<script type="text/javascript">
		$('#controlR').click(function() {
		      event.preventDefault();
		      $('#content').animate({
		        marginLeft: "-=400px"
		      }, "fast");
		   });
	
		 $('#controlL').click(function() {
		      event.preventDefault();
		      $('#content').animate({
		        marginLeft: "+=400px"
		      }, "fast");
		 }); 
		 
		 $('#controlR2').click(function() {
		      event.preventDefault();
		      $('#content2').animate({
		        marginLeft: "-=400px"
		      }, "fast");
		   });
	
		 $('#controlL2').click(function() {
		      event.preventDefault();
		      $('#content2').animate({
		        marginLeft: "+=400px"
		      }, "fast");
		 }); 

	</script>

</photo-slider>