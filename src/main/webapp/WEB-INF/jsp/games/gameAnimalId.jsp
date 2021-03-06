<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


	<c:if test="${not empty listOfBadges}">
		
		<div id="badge-notification" class="w3-modal">
			<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 480px">

		 <span
				onclick="document.getElementById('badge-notification').style.display='none'"
				class="w3-button w3-xlarge w3-hover-red w3-display-topright"
				title="Close Modal">&times;</span> 
		
		<div class="modal-badge-wrapper">
		<c:forEach var="badge" items="${listOfBadges}">
			<div>
			<h4>You Earned the ${badge.badgeTitle} Badge!</h4>
			<img src="${badge.badgeUrl}"<br />
			<p><c:out value="${badge.badgeDescription}"></c:out></p>
			</div>
		</c:forEach>
		</div>
	</div>
</div>
	</c:if>

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
						<input class="quantity" type="number" name="quantity" value="1" min="1" step="1" max="10">
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



<script>
/*Execute the magnify function:*/
magnify("gameImg", 3);
/*Specify the id of the image, and the strength of the magnifier glass:*/ 
</script>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />