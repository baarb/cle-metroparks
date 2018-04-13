<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div class="animalPic">
	<img src="${photoURL}">
</div>
<c:url var="formAction" value="/games/gameAnimalId" />
<form method="POST" action="${formAction}">
	<c:forEach var="animal" items="${animalTypes}">
		<div>

			<div>
				<label class="quizChoiceButton"> 
				<input type="checkbox" name="animalSeen" value="${animal}"> ${animal}
				</label>
			</div>
			<span> 
			<label for="quantity">How Many?</label>
			<input type="number" name="quantity" value="quantity">
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



<c:import url="/WEB-INF/jsp/common/footer.jsp" />