<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="game-wrapper">
	
	<div class="animalPic">
		<img src="${photoURL}" class="game-main-image">
	</div>
	<div class="user-input">
		<div class="form-wrapper">
		<c:url var="formAction" value="/games/gameAnimalId" />
		<form method="POST" action="${formAction}">
			<c:forEach var="animal" items="${animalTypes}" varStatus="loop">	
	 		<div>
				<span>
					<label class="checkbox container quizChoiceButton"><c:out value="${animal}" />
	  					<input type="checkbox" onchange='handleChange(this);' name="animalSeen" value="${animal}">
	  					<span class="checkmark"></span>
					</label>
				</span>
				<span> 
					<label for="quantity">How Many?
						<input id="quantity" type="number" name="quantity" value="1">
					</label>
				</span>
			</div>
			</c:forEach>
			
			<div>
				<span>

    					<input type="radio" id="ratingChoice1" name="rating" value="1">
    					<label for="ratingChoice1">1</label>
    					
    					<input type="radio" id="ratingChoice2" name="rating" value="2">
    					<label for="ratingChoice2">2</label>
    					
    					<input type="radio" id="ratingChoice3" name="rating" value="3">
    					<label for="ratingChoice3">3</label>
    					
    					<input type="radio" id="ratingChoice4" name="rating" value="4">
    					<label for="ratingChoice4">4</label>
    					
    					<input type="radio" id="ratingChoice5" name="rating" value="5">
    					<label for="ratingChoice5">5</label>
				</span>
			</div>
			<div>
				
				<span>
					<label class="checkbox container quizChoiceButton"> Save as Favorite
	  					<input type="checkbox" name="saveAsFav" value="true">
	  					<span class="checkmark"></span>
					</label>
				</span>
				
			</div>
			
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> 
			<input type="hidden" name="userId" value="${userId}"> 
			<input type="hidden" name="photoId" value="${photoId}">
			<div class="">
				<input class="submit" type="submit" value="Submit" />
			</div>
		</form>

		<script>
			function handleChange(checkbox) {
			    if(checkbox.checked == true){
			        document.getElementById("quantity").removeAttribute("disabled");
			       
			    }else{
			        document.getElementById("quantity").setAttribute("disabled", "disabled");
			   }
			}
		</script>
		</div>
	</div>

</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />