<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="game-wrapper">
	
	<div class="animalPic">
		<img src="${photoURL}" class="game-main-image">
	</div>
<c:url var="formAction" value="/games/gameAnimalId" />
<form method="POST" action="${formAction}">
	<c:forEach var="animal" items="${animalTypes}" varStatus="loop">	
 <div>

			<span>
			<label class="checkbox- container quizChoiceButton"><c:out value="${animal}" />
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
        document.getElementById("quantity").removeAttribute("hidden");
    }else{
        document.getElementById("quantity").setAttribute("disabled", "disabled");
        document.getElementById("quantity").setAttribute("disabled", "disabled");
   }
}
</script>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />