<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="game-wrapper">
	
	<div class="animalPic">
		<img src="${photoURL}" class="game-main-image">
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
					<label class="checkbox container-checkbox quizChoiceButton"><c:out value="No animals" />
	  					<input type="checkbox" name="animalSeen" value="Empty">
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
				<input class="submit" type="submit" value="Submit" />
			</div>
		</form>

		<script>
			function handleChange(checkbox, number) {
			    if(checkbox.checked == true){
			    		document.getElementsByClassName('quantity-wrapper')[number].style.display='block';
			    		
			        document.getElementsByClassName("quantity")[number].removeAttribute("disabled");
			    }else{
			    		document.getElementsByClassName('quantity-wrapper')[number].style.display='none';
			        document.getElementsByClassName("quantity")[number].setAttribute("disabled", "disabled");
			   }
			}
		</script>
		</div>
	</div>

</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />