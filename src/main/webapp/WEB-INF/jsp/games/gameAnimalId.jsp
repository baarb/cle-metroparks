<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div class="row">

	<img src="${photoURL}">

</div>

<form action="/capstone/games/gameAnimalId">
	<c:forEach var="animal" items="${probableAnimals}">
		<div>

			<div>
				<label class="quizChoiceButton"> <input type="radio"
					name="answerValue" value="${animal}"> ${animal}
				</label>
			</div>
			<div>
				<c:out value="How many?" />
				<select name="quantity" class="">
					<option selected="selected" value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
				</select>
			</div>
		</div>
	</c:forEach>
	<input type="hidden" name="userId" value="${user.getUserId()}"> <input
		type="hidden" name="photoId" value="${photoId}">
<div class="">
	<input class="submit" type="submit" value="Submit"/>
</div>
</form>


<%-- <form method="POST" action="${formAction}">
	<div class="formInputGroup">
		<label for="inputName"> What animal do you see here?</label>
		<div class="topMarginMedium quizButtonRow">
			<input type="hidden" name="userId" value=""> <input
				type="hidden" name="photoId" value=""> <label
				class="quizChoiceButton"> <input type="radio"
				name="answerValue" value="Deer"> Deer
			</label> <label class="quizChoiceButton"> <input type="radio"
				name="answerValue" value="Bird"> Bird
			</label> <label class="quizChoiceButton"> <input type="radio"
				name="answerValue" value="Raccoon"> Raccoon
			</label> <label class="quizChoiceButton"> <input type="radio"
				name="answerValue" value="Squirrell"> Squirrell
			</label> <label class="quizChoiceButton"> <input type="radio"
				name="answerValue" value="Bigfoot"> Bigfoot
			</label>
		</div>
	</div>
</form> --%>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />