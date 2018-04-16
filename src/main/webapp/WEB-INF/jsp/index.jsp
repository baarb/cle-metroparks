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
			<c:url var="firstPhoto"
				value="img/metropark_imgs/coyote_pics/Coyote_010.jpg" />
			<!--  <signup-funnel></signup-funnel> -->
			<div>
				<div class="img-magnifier-container">
					<h3 id="coyote">Can you find the third Coyote?</h3>
					<button
						onclick="document.getElementById('id01').style.display='block'" class="mag-button">
						<img id="myimage" src="${firstPhoto}" width="600" height="400">
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

		<script
			src="https://rawgit.com/riot/riot/master/riot%2Bcompiler.min.js"></script>




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
			'formUrl' : '<c:url value="/" />',
			'errorMessage' : '<c:if test="${not empty message}"> <c:out value="Error: ${message}"/> </c:if>',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});

		riot.mount('user-benefits', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});

		riot.mount('best-pics', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});

		riot.mount('metro-benefits', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
	</script>

		<!-- JS functions -->
		<script>
function magnify(imgID, zoom) {
  var img, glass, w, h, bw;
  img = document.getElementById(imgID);
  /*create magnifier glass:*/
  glass = document.createElement("DIV");
  glass.setAttribute("class", "img-magnifier-glass");
  /*insert magnifier glass:*/
  img.parentElement.insertBefore(glass, img);
  /*set background properties for the magnifier glass:*/
  glass.style.backgroundImage = "url('" + img.src + "')";
  glass.style.backgroundRepeat = "no-repeat";
  glass.style.backgroundSize = (img.width * zoom) + "px " + (img.height * zoom) + "px";
  bw = 3;
  w = glass.offsetWidth / 2;
  h = glass.offsetHeight / 2;
  /*execute a function when someone moves the magnifier glass over the image:*/
  glass.addEventListener("mousemove", moveMagnifier);
  img.addEventListener("mousemove", moveMagnifier);
  /*and also for touch screens:*/
  glass.addEventListener("touchmove", moveMagnifier);
  img.addEventListener("touchmove", moveMagnifier);
  function moveMagnifier(e) {
    var pos, x, y;
    /*prevent any other actions that may occur when moving over the image*/
    e.preventDefault();
    /*get the cursor's x and y positions:*/
    pos = getCursorPos(e);
    x = pos.x;
    y = pos.y;
    /*prevent the magnifier glass from being positioned outside the image:*/
    if (x > img.width - (w / zoom)) {x = img.width - (w / zoom);}
    if (x < w / zoom) {x = w / zoom;}
    if (y > img.height - (h / zoom)) {y = img.height - (h / zoom);}
    if (y < h / zoom) {y = h / zoom;}
    /*set the position of the magnifier glass:*/
    glass.style.left = (x - w) + "px";
    glass.style.top = (y - h) + "px";
    /*display what the magnifier glass "sees":*/
    glass.style.backgroundPosition = "-" + ((x * zoom) - w + bw) + "px -" + ((y * zoom) - h + bw) + "px";
  }
  function getCursorPos(e) {
    var a, x = 0, y = 0;
    e = e || window.event;
    /*get the x and y positions of the image:*/
    a = img.getBoundingClientRect();
    /*calculate the cursor's x and y coordinates, relative to the image:*/
    x = e.pageX - a.left;
    y = e.pageY - a.top;
    /*consider any page scrolling:*/
    x = x - window.pageXOffset;
    y = y - window.pageYOffset;
    return {x : x, y : y};
  }
}
</script>

		<script>
/*Execute the magnify function:*/
magnify("myimage", 1.75);
/*Specify the id of the image, and the strength of the magnifier glass:*/ 
</script>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />