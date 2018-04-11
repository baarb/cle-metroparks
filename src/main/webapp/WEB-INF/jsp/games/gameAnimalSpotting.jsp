<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div class="row">
	<div>
		<c:url var="currentPhoto" value="" />
		<img src="${currentPhoto}">
	</div>
	<div>
		
	</div>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />