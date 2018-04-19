<best-pics>


<div id="wrapper">


	<div class="title text-center h1">Collect photos of your favorite
		animals</div>

	<div class="module-section clearfix">
		<!-- <button class="btn arrow-guides fa-chevron-left"></button> -->
		<ul id="content">

			<li each={ pic in pictures } class="card" style="background-image: url('{ pic }'); background-repeat: no-repeat;
	background-position: center;
	background-size: cover;">
				
				
			</li>

		</ul>
	</div>
	<!--end of module-section-->

	
	
</div>


<style>

html {
  overflow:   scroll;
}
::-webkit-scrollbar {
    width: 0px;
    background: transparent; /* make scrollbar transparent */
}
#wrapper {
	max-width: 100%;
	padding: 50px 75px 50px 45px;
	position: relative;
	overflow: hidden;
}


button:focus {
	outline: 0 !important;
}



.title {
	color: #fff;
}

.module-section {
	max-width: 100%;
	overflow: hidden;
	overflow-x: scroll;
}

ul {
	width: 300em;
	list-style-type: none;
	padding: 50px 0 50px 0;
}

#content {
	position: relative;
}

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
this.pictures = [];

this.on('mount', () => {
		fetch(opts.bestPicsUrl, {method: 'GET', credentials: 'include'})
			.then((response) => response.json())
		    .then((json) => {
		    		this.pictures = json;
		    		this.update();
		    	});
});


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

</script> 
</best-pics>