<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div id="hero-video-wrapper"> 
	<div id="videoBlock">  
	<img src="https://s3.amazonaws.com/metroparks-hackathon/Theme/placeholder.png" id="videosubstitute" alt="">
	<video preload="preload" id="video" autoplay="autoplay" loop="loop">
		<source src="https://s3.amazonaws.com/metroparks-hackathon/Theme/hero-video.mp4" type="video/mp4">
	</video> 
		<div id="videoMessageBox">
    			<div id="videoMessage">
        			<h1 class="spacer">We need your help!</h1>
        			<h2 class="spacer">We're looking for Citizen Scientists to help identify local wildlife.</h2>
        			<p class="videoClick">
            			<a href="#coyote">Try it out!</a>
        			</p> 
    			</div>
		</div>
	</div>
</div>







		<div class="box1SignUpFunnel">
			<!--  <signup-funnel></signup-funnel> -->
			<div>
				<div class="img-magnifier-container">
					<h3 id="coyote">Can you find the third Coyote?</h3>
					<button onclick="document.getElementById('id01').style.display='block'" class="mag-button">
						<img id="myimage" src="https://s3.amazonaws.com/metroparks-hackathon/Theme/coyote.jpg" width="600" height="400">
					</button>
					<signup-modal></signup-modal>
				</div>
			</div>

		</div>


		<div class="box2UserBenSignUp">
			<user-benefits></user-benefits>
			<sign-up></sign-up>
		</div>

		<div class="box3MetroBen">
			<div class="underlayBox3">
				<metro-benefits></metro-benefits>
			</div>
		</div>

		<div class="box4BestPics">
			<best-pics></best-pics>
		</div>

		




		<!-- Riot Tags -->
		<script
			src="https://rawgit.com/riot/riot/master/riot%2Bcompiler.min.js"></script>
		<c:url value="/js/indexPage/signUpFunnel.tag" var="signUpFunnel" />
		<script src="${signUpFunnel}" type="riot/tag"></script>

		<c:url value="/js/indexPage/signUpModal.tag" var="signUpModal" />
		<script src="${signUpModal}" type="riot/tag"></script>
		<c:url value="/js/indexPage/signUpModalPopUp.tag" var="signUpModalPopUp" />
		<script src="${signUpModalPopUp}" type="riot/tag"></script>

		<c:url value="/js/indexPage/signUp.tag" var="signUp" />
		<script src="${signUp}" type="riot/tag"></script>
		<c:url value="/js/indexPage/userBenefits.tag" var="userBenefits" />
		<script src="${userBenefits}" type="riot/tag"></script>
		<c:url value="/js/indexPage/bestPics.tag" var="bestPics" />
		<script src="${bestPics}" type="riot/tag"></script>
		<c:url value="/js/indexPage/metroBenefits.tag" var="metroBenefits" />
		<script src="${metroBenefits}" type="riot/tag"></script>

		<script>
		let pubSub = {};
		riot.observable(pubSub);//makes it observable
		riot.mount('signup-funnel', {
			'bus' : pubSub,
			'imgUrl' : '<c:url var="firstPhoto" value="img/background-background-image-creek-707915.jpg" />',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
		
		riot.mount('signup-modal', {
			'bus' : pubSub,
			'firstPhoto' : '${firstPhoto}',
			'formUrl' : '<c:url value="/" />',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
		
		riot.mount('sign-up', {
			'bus' : pubSub,
			'firstPhoto' : '${firstPhoto}',
			'formUrl' : '<c:url value="/" />',
			'errorMessage' : '<c:if test="${not empty message}"> <c:out value="Error: ${message}"/> </c:if>',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
		
		riot.mount('signup-modal-pop-up', {
			'bus' : pubSub,
			'firstPhoto' : '${firstPhoto}',
			'formUrl' : '<c:url value="/popUp" />',
			'popUpMessage' : '<c:if test="${not empty popUpMessage}"> <c:out value="Error: ${popUpMessage}"/> </c:if>',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
		
		riot.mount('sign-up-modal-badge', {
			'bus' : pubSub,
			'badgePhoto' : '${badgePhoto}',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});

		riot.mount('user-benefits', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});

		riot.mount('best-pics', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}',
			'bestPicsUrl' : '<c:url value="/bestPics" />'
		});

		riot.mount('metro-benefits', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
	</script>

		<!-- JS functions -->

		<script>
/*Execute the magnify function:*/
magnify("myimage", 1.75);
/*Specify the id of the image, and the strength of the magnifier glass:*/ 
</script>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />