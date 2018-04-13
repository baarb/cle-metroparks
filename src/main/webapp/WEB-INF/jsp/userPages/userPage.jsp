<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />



<div>
	<photo-slider></photo-slider>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
<script src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script>
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

</script>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />