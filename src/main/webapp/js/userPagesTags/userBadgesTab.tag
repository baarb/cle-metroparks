<user-badges-tab>

<h2>Badges Earned ({numberOfBadges})</h2>

<div class="badge-wrapper">


	<!-- <button class="btn arrow-guides fa-chevron-left"></button> -->
	<ul id="content">
		<li each={ badge in badges } class="card">
		
		
		
		
		
		
			<figure class="snip1321">
				<img src={ badge.badgeUrl } class="badge-image"> 
				<figcaption>	
					
					<!-- <i class="ion-stats-bars"></i> -->
					<h5>{ badge.badgeTitle }</h5>
					<p>{ badge.badgeDescription }</p>
					
					
				</figcaption><a href={badge.badgeUrl} target="_blank"></a>
			</figure>
		
		
		
		<div class="submit-wrapper">
			<form method="POST" action={opts.formAction}>
				<input type="hidden" name="CSRF_TOKEN" value="{opts.CSRF_TOKEN}" />
				<input type="hidden" name="userId" value="{opts.userId}">
				<input type="hidden" name="chosenBadge" value="{badge.badgeId}">
				<input class="submit" type="submit" value="Make Avatar" />
			</form>
		</div>
			
			
			
		</li>
		<li each={ badge in unearnedBadges } class="card">
		<figure class="snip1321">
			<img src={ badge.inactiveBadgeUrl } class="badge-image">
			<figcaption>	
				<h5>{ badge.badgeTitle }</h5>
				<p>{ badge.badgeDescription }</p>
			</figcaption>	
		</figure>
		</li>
	</ul>
	
	<!--end of module-section-->

	<!-- <button class="btn arrow-guides-right fa-chevron-right"></button> -->

</div>
<style>
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800);
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
figure.snip1321 h2,
figure.snip1321 h4 {
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
figure.snip1321:hover figcaption,
figure.snip1321.hover figcaption {
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  opacity: 1;
  -webkit-transition-delay: 0.2s;
  transition-delay: 0.2s;
}
figure.snip1321:hover:after,
figure.snip1321.hover:after {
  -webkit-transform: rotateX(0);
  transform: rotateX(0);
  opacity: 0.9;
}
/* Demo purposes only */
body {
  background-color: #212121;
}

</style>






<script>
this.badges = [];
this.unearnedBadges = [];
this.numberOfBadges = 0;

this.on('mount', () => {
		fetch(opts.badgesUrl, {method: 'GET', credentials: 'include'})
			.then((response) => response.json())
		    .then((json) => {
		    		this.badges = json;
		    		this.numberOfBadges = Object.keys(this.badges).length;
		    		this.update();
		    	});

	fetch(opts.unearnedBadgesUrl, {method: 'GET', credentials: 'include'})
		.then((response) => response.json())
	    .then((json) => {
	    		this.unearnedBadges = json;
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
</script> 

<script>
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
</script> 
</user-badges-tab>