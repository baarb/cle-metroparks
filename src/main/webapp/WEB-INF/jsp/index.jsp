<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<div class="row">
	<div>Carousel with top 5 images</div>

	<div>
		<div>
			<c:url var="animalId" value="/animalId" />
			<a href="${animalId}">Can You Identify the Animal?</a>
		</div>
		<div>
			<c:url var="animalSpotting" value="/animalSpotting" />
			<a href="${animalSpotting}">Play Animal Spotting</a>
		</div>
	</div>
	<div class="">Leader board
		
	
	</div>

</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />