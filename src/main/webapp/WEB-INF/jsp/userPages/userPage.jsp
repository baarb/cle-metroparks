<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div>
	<photo-slider></photo-slider>
</div>

<script src="https://rawgit.com/riot/riot/master/riot%2Bcompiler.min.js"></script>
<c:url value="/js/userPagesTags/photoSlider.tag" var="photoSlider"/>
<script src="${photoSlider}" type="riot/tag"></script>

<script>
		/* This is where we include our components */
		//Searchbox (OMDB API)
		let pubSub = {};
		riot.observable(pubSub);//makes it observable
		riot.mount('photo-slider', {
			'bus' : pubSub,
			'formUrl' : '<c:url value="/users" />',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});

		//
</script>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />