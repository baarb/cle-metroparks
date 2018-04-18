<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="game-wrapper">
	
	<div class="animalPic">
		
		<img src="${photoURL}" class="game-main-image" id="gameImg" name="gameImg">
	
	</div>
	<div class="user-input">
		<div class="form-wrapper">
		<h5>Can you identify any animals in this image?</h5>
		<c:url var="formAction" value="/games/gameAnimalId" />
		<form method="POST" action="${formAction}">
		
			<c:forEach var="animal" items="${animalTypes}" varStatus="loop">	
	 		<div>
				<span>
					<label class="checkbox container-checkbox quizChoiceButton"><c:out value="${animal}" />
	  					<input type="checkbox" onchange='handleChange(this, <c:out value="${loop.index}" />);' name="animalSeen" value="${animal}">
	  					<span class="checkmark"></span>
					</label>
				</span>
				<span> 
					<label for="quantity" class="quantity-wrapper">How Many?
						<input class="quantity" type="number" name="quantity" value="1">
					</label>
				</span>
			</div>
			</c:forEach>
			<div>
				<span>
					<label class="checkbox container-checkbox quizChoiceButton no-animal"><c:out value="No animals" />
	  					<input type="checkbox" name="animalSeen" value="Empty" onchange='handleOtherChange(this);'>
	  					<span class="checkmark"></span>
					</label>
				</span>
			</div>
			<div>
				<span>	
				
				<h5 class="star-label">Rate this photo</h5>
			    		<div class="stars">
						<input type="radio" id="ratingChoice5" name="rating" value="5">
    						<label for="ratingChoice5"></label>
						<input type="radio" id="ratingChoice4" name="rating" value="4">
    						<label for="ratingChoice4"></label>
						<input type="radio" id="ratingChoice3" name="rating" value="3">
    						<label for="ratingChoice3"></label>
						<input type="radio" id="ratingChoice2" name="rating" value="2">
    						<label for="ratingChoice2"></label>
						<input type="radio" id="ratingChoice1" name="rating" value="1">
    						<label for="ratingChoice1"></label>
    						<input type="radio" id="ratingChoice0" name="rating" value="0" checked="checked" style="display:none;">
    						
					</div>
				
					
    					
    					
				</span>
			</div>
			<div class="clearfix"></div>
			<div>
				<span>
					<label class="checkbox container-checkbox quizChoiceButton favorite"> Save as Favorite
	  					<input type="checkbox" name="saveAsFav" value="true">
	  					<span class="checkmark"></span>
					</label>
				</span>
				
			</div>
			
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> 
			<input type="hidden" name="userId" value="${userId}"> 
			<input type="hidden" name="photoId" value="${photoId}">
			<div class="submit-wrapper">
				<input class="submit" type="submit" value="Submit" disabled />
			</div>
		</form>

		<script>
			function handleChange(checkbox, index) {
			    if(checkbox.checked == true){
			    		document.getElementsByClassName("quantity-wrapper")[index].style.display='block';
			        document.getElementsByClassName("quantity")[index].removeAttribute("disabled");
			        document.getElementsByClassName("submit")[0].removeAttribute("disabled");
			    }else{
			    		document.getElementsByClassName("quantity-wrapper")[index].style.display='none';
			        document.getElementsByClassName("quantity")[index].setAttribute("disabled", "disabled");
			   }
			}
			
			function handleOtherChange(checkbox) {
			    if(checkbox.checked == true){
			        document.getElementsByClassName("submit")[0].removeAttribute("disabled");
			    }else{
			    		
			   }
			}
		</script>
		</div>
	</div>

</div>

<style>

.img-magnifier-container {
	position: relative;
}

.img-magnifier-glass {
	position: absolute;
	border-radius: 50%;
	cursor: none;
	/*Set the size of the magnifier glass:*/
	width: 200px;
	height: 200px;
}
</style>

		<!-- JS functions -->
<script>
		function magnify(imgID, zoom) {
			  var img, glass, w, h, bw;
			  img = document.getElementById(imgID);
			  /*create magnifier glass:*/
			  glass = document.createElement("DIV");
			  glass.setAttribute("class", "img-magnifier-glass");
			  /*insert magnifier glass:*/
			  img.parentElement.insertBefore(glass, img);
			  /*set background properties for the magnifier glass:*/
			  glass.style.backgroundImage = "url('" + img.src + "')";
			  glass.style.backgroundRepeat = "no-repeat";
			  glass.style.backgroundSize = (img.width * zoom) + "px " + (img.height * zoom) + "px";
			  bw = 3;
			  w = glass.offsetWidth / 2;
			  h = glass.offsetHeight / 2;
			  /*execute a function when someone moves the magnifier glass over the image:*/
			  glass.addEventListener("mousemove", moveMagnifier);
			  img.addEventListener("mousemove", moveMagnifier);
			  /*and also for touch screens:*/
			  glass.addEventListener("touchmove", moveMagnifier);
			  img.addEventListener("touchmove", moveMagnifier);
			  
		  
		  	function moveMagnifier(e) {
			    var pos, x, y;
			    /*prevent any other actions that may occur when moving over the image*/
			    e.preventDefault();
			    /*get the cursor's x and y positions:*/
			    pos = getCursorPos(e);
			    x = pos.x;
			    y = pos.y;
			    /*prevent the magnifier glass from being positioned outside the image:*/
			    if (x > img.width - (w / zoom)) {x = img.width - (w / zoom);}
			    if (x < w / zoom) {x = w / zoom;}
			    if (y > img.height - (h / zoom)) {y = img.height - (h / zoom);}
			    if (y < h / zoom) {y = h / zoom;}
			    /*set the position of the magnifier glass:*/
			    glass.style.left = (x - w) + "px";
			    glass.style.top = (y - h) + "px";
			    /*display what the magnifier glass "sees":*/
			    glass.style.backgroundPosition = "-" + ((x * zoom) - w + bw) + "px -" + ((y * zoom) - h + bw) + "px";
			  }
			  
		  	function getCursorPos(e) {
			    var a, x = 0, y = 0;
			    e = e || window.event;
			    /*get the x and y positions of the image:*/
			    a = img.getBoundingClientRect();
			    /*calculate the cursor's x and y coordinates, relative to the image:*/
			    x = e.pageX - a.left;
			    y = e.pageY - a.top;
			    /*consider any page scrolling:*/
			    x = x - window.pageXOffset;
			    y = y - window.pageYOffset;
			    return {x : x, y : y};
			  }
		}

</script>

<script>
/*Execute the magnify function:*/
magnify("gameImg", 3);
/*Specify the id of the image, and the strength of the magnifier glass:*/ 
</script>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />