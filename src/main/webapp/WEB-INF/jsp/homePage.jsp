<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div class="row">
<h1>Home Page</h1>
	

	<div>
	<h1>Game Carousel</h1>
		<div>
			<c:url var="gameAnimalId" value="/games/gameAnimalId" />
			<a href="${gameAnimalId}">Can You Identify the Animal?</a>
		</div>
		<div>
			<c:url var="gameAnimalSpotting" value="/games/gameAnimalSpotting" />
			<a href="${gameAnimalSpotting}">Play Animal Spotting</a>
		</div>
	</div>
	<div class=""><h1>Leader board</h1>
		
	
	</div>

</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />