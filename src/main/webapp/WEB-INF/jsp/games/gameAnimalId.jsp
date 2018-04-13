<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div class="animalPic">
	<img src="${photoURL}" class="game-main-image">
</div>
<c:url var="formAction" value="/games/gameAnimalId" />
<form method="POST" action="${formAction}">
	<c:forEach var="animal" items="${animalTypes}" varStatus="loop">
	<span class="pirate" style="color:red;"><c:out value="${loop.index}" /></span>
		<div>

			<div>
				<label class="quizChoiceButton"> <c:out value="${animal}" />
				<input type="checkbox" name="animalSeen" value="${animal}"> 
				</label>
			</div>
			<span> 
			<label for="quantity">How Many?</label>
			<input type="number" name="quantity" value="1">
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

document.addEventListener("DOMContentLoaded", function (event) {
    var _selector = document.querySelector('input[name=animalSeen]');
    _selector.addEventListener('change', function (event) {
        if (_selector.checked) {
            // do something if checked
        } else {
            // do something else otherwise
        }
    });
});

</script>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />