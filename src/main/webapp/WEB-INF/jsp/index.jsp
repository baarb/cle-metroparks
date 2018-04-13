<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Landing Page</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script	src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
<script	src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
<script	src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<style>
.header {
	grid-column: 2/3;
	display: flex;
	align-content: space-between;
}

body {
	
}

section {
	
}

.main {
	display: grid;
	grid-template-columns: auto auto;
	background-image:url("img/background-background-image-creek-707915.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	background-color: threeddarkshadow;
	color: white;
}

.login {
	grid-column: 3/3;
	background-color: white;
}

.userBenefits {
	display: grid;
	grid-template-columns: auto auto auto auto;
	background-color: silver;
}

.userBenefits>h1 {
	grid-column: 2/span 2;
	text-align: center
}

.bestPics {
	grid-column: 2/3;
}

.metroBenefits {
	grid-column: 2/3;
}
</style>
</head>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<ul class="nav navbar-nav">
			<c:url var="homePageHref" value="/" />
			<li><a href="${homePageHref}">Logo</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<c:choose>
				<c:when test="${empty currentUser}">
					<c:url var="newUserHref" value="/users/new" />
					<li><a href="${newUserHref}">Sign Up</a></li>
					<c:url var="loginHref" value="/userRegistration/login" />
					<li><a href="${loginHref}">Log In</a></li>
				</c:when>
	
			</c:choose>
		</ul>
	</div>
</nav>


<body>
	<div>
		<c:url var="firstPhoto" value="img/metropark_imgs/coyote_pics/Coyote_010.jpg" />
		<signup-funnel></signup-funnel>
		
<h1>Sign Up funnel</h1>




<div class="img-magnifier-container">

	<img id="myimage" src="${firstPhoto}" width="600" height="400">
</div>
<style>
* {
	box-sizing: border-box;
}

.img-magnifier-container {
	position: relative;
}

.img-magnifier-glass {
	position: absolute;
	border: 3px solid #000;
	border-radius: 50%;
	cursor: none;
	/*Set the size of the magnifier glass:*/
	width: 100px;
	height: 100px;
}
</style>
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
	}
	
	
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
	



</script>


	


	</div>

	<div class="main">
		<user-benefits></user-benefits>
		<sign-up></sign-up>
	</div>
	<div>
		<metro-benefits></metro-benefits>
	</div>

	<div>
		<best-pics></best-pics>
	</div>





	<script
		src="https://rawgit.com/riot/riot/master/riot%2Bcompiler.min.js"></script>
	<c:url value="/js/indexPage/signUpFunnel.tag" var="signUpFunnel" />
	<script src="${signUpFunnel}" type="riot/tag"></script>
	
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
			'firstPhoto' : '${firstPhoto}',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
		riot.mount('sign-up', {
			'bus' : pubSub,
			'formUrl' : '<c:url value="/users" />',
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
	<script>
/*Execute the magnify function:*/
magnify("myimage", 3);
/*Specify the id of the image, and the strength of the magnifier glass:*/ 
</script>
	
	
	
</body>

</html>