<user-badges-tab>

<h2>Badges Earned ({numberOfBadges})</h2>

<div class="badge-wrapper">
  

    <!-- <button class="btn arrow-guides fa-chevron-left"></button> -->
   <ul id="content">
   	<li each={ badge in badges } class="card">
   		<a href="{badge.badgeUrl}" target="_blank"><img src={ badge.badgeUrl } class="badge-image"> </a>
   		<h5>{ badge.badgeTitle }</h5>
   		<p>{ badge.badgeDescription }</p>	
   		<div class="submit-wrapper">
				<input class="submit" type="submit" value="Make Avatar" />
		</div>
   	</li>
   	<li each={ badge in unearnedBadges } class="card">
   		<img src={ badge.inactiveBadgeUrl } class="badge-image">
   		<h5>{ badge.badgeTitle }</h5>
   		<p>{ badge.badgeDescription }</p>
   	</li>
   </ul>
    
   
    
  <!--end of module-section-->
	
<!-- <button class="btn arrow-guides-right fa-chevron-right"></button> -->
  
</div>





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
});

this.on('mount', () => {
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

</user-badges-tab>