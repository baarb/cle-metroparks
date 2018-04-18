<user-pics-tab>

<h2>Favorite Pictures</h2>
   

<div id="wrapper">
  
  <span id="controlL" class="left-controls" role="button" aria-label="See Previous Modules">
    <b class="fa fa-chevron-left fa-chevron-left-extra" aria-hidden="true"></b>
  </span>
 
  <div class="module-section clearfix">
    <!-- <button class="btn arrow-guides fa-chevron-left"></button> -->
   <ul id="content">
    <div hide={pictures == 0}>
	    <li each={ pic in pictures } class="card">
	   		<div class="inside-top">
	   			<img src="{ pic }" width=100%>
	   		</div>
	   	</li>
   	</div>
   	 <div show={pictures == 0}>
   	 	<h1>Looks like you don't have any favorite photos...</h1>
   	 </div>
   </ul>
    
   
    
  </div><!--end of module-section-->
  
<span id="controlR" class="right-controls" role="button" aria-label="See Previous Modules">
    <b class="fa fa-chevron-right fa-chevron-right-extra" aria-hidden="true"></b>
  </span>
<!-- <button class="btn arrow-guides-right fa-chevron-right"></button> -->
  
  
  
</div>


<style>

::-webkit-scrollbar {
    width: 0px;  /* remove scrollbar space */
    background: transparent;  /* optional: just make scrollbar invisible */
}
/* optional: show position indicator in red */
/*::-webkit-scrollbar-thumb {
    background: #FF0000;
}*/

#wrapper{
  max-width:100%;
  padding:0 75px 0 45px;
  position:relative;
}

button:focus {outline:0 !important;}

.left-controls{
  
  position:absolute;
  top:0;
  left:0;
  width:4%;
  height:1000px;
  z-index:40;
  background:#fff;
  opacity:0;
  cursor:pointer;
  text-align:center;
  webkit justify content: center;
  justify-content:center;
  display: webkit box;
  display: webkit flex;
  display: moz box;
  display:ms flexbox;
  display:flex;
  color:#fff;

}

.fa-chevron-left-extra
{
  align-self:center;
  position:relative;
  height:auto;
  top:-250px;
  transform-origin: 55% 50%;
  font-style:normal;
  font-weight:400;
  line-height:1;
  font-variant:normal;
  text-transform:none;
  font-size:2.5vw;
  transition:transform .1s ease-out 0s;
  transition-property: transform;
  transition-duration: 0.1s;
  transition-timing-function: ease-out;
  transition-delay: 0s;
  color:blue;
  opacity:.1;
}


.right-controls{
  position:absolute;
  top:0;
  right:0;
  width:4%;
  height:1000px;
  z-index:40;
  background:#fff;
  opacity:0;
  cursor:pointer;
  text-align:center;
  webkit justify content: center;
  justify-content:center;
  display: webkit box;
  display: webkit flex;
  display: moz box;
  display:ms flexbox;
  display:flex;
  color:#fff;
}

.fa-chevron-right-extra
{
  align-self:center;
  position:relative;
  height:auto;
  top:-250px;
 transform-origin: 55% 50%;
  font-style:normal;
  font-weight:400;
  line-height:1;
  font-variant:normal;
  text-transform:none;
  font-size:2.5vw;
  transition:transform .1s ease-out 0s;
  transition-property: transform;
  transition-duration: 0.1s;
  transition-timing-function: ease-out;
  transition-delay: 0s;
  color:blue;
  opacity:.1;
}

.title{
  color:black;
}

.module-section{
  max-width: 100%;
 
  
  overflow: hidden;
  overflow-x:scroll;
  border-left:1px solid #fff;
  border-right:1px solid #fff;
  
}

ul{
width:300em;
list-style-type:none;
padding:50px 0 50px 0;
}

#content{
  position:relative;
}


.card{
  width: 25em;
  float:left;
  margin-right:10px;
  margin-bottom:50px;
  cursor:pointer;
  transform: scale(1);
  visibility:visible;
}

.card:hover{
  cursor:pointer;
  transform: scale(1);
  visibility:visible;
  transition: all .2s ease-in-out;
  transform: scale(1.1); 
  z-index:100;
  position:relative;
  transition-timing-function:cubic-bezier(0.5, 0, 0.1, 1);
  transition-duration:400ms;
}





.clearfix {
  overflow: auto;
  zoom: 1;
}


</style>


<script>
this.pictures = [];
this.numberOfPictures = 0;

this.on('mount', () => {
		fetch(opts.savedPicsUrl, {method: 'GET', credentials: 'include'})
			.then((response) => response.json())
		    .then((json) => {
		    		this.pictures = json;
		    		this.numberOfPictures = Object.keys(this.pictures).length;
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
</user-pics-tab>