<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
.tabcontent {
    animation: fadeEffect 1s; /* Fading effect takes 1 second */
}

/* Go from zero to full opacity */
@keyframes fadeEffect {
    from {opacity: 0;}
    to {opacity: 1;}
}

</style>



<div class="profile-wrapper">

<div class="w3-bar-block w3-light-grey w3-card profile-sidebar">
  <button class="w3-bar-item w3-button tablink" id="defaultOpen" onclick="openTab(event, 'Games')">Games</button>
  <button class="w3-bar-item w3-button tablink" onclick="openTab(event, 'Pictures')">Pictures</button>
  <button class="w3-bar-item w3-button tablink" onclick="openTab(event, 'Badges')">Badges</button>
  <button class="w3-bar-item w3-button tablink" onclick="openTab(event, 'Preferences')">Preferences</button>
</div>

<div class="profile-container">
  
  <div id="Games" class="w3-container city" style="display:none">
  	<user-rank-bar></user-rank-bar>
    <user-game-tab></user-game-tab>
  </div>

  <div id="Pictures" class="w3-container city" style="display:none">
 	<user-rank-bar></user-rank-bar>
    <user-pics-tab></user-pics-tab>
  </div>

  <div id="Badges" class="w3-container city" style="display:none">
  	<user-rank-bar></user-rank-bar>
    <user-badges-tab></user-badges-tab>
  </div>
  
  <div id="Preferences" class="w3-container city" style="display:none">
  	<user-rank-bar></user-rank-bar>
    <user-preferences></user-preferences>
  </div>
</div>

</div>

<script>
function openTab(evt, tabName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" w3-red", ""); 
  }
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " w3-red";
}

document.getElementById("defaultOpen").click();
</script>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
<script src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script>

<script src="https://rawgit.com/riot/riot/master/riot%2Bcompiler.min.js"></script>

<c:url value="/js/userPagesTags/userRankBar.tag" var="userRankBar" />
<script src="${userRankBar}" type="riot/tag"></script>

<c:url value="/js/userPagesTags/userGameTab.tag" var="userGameTab" />
<script src="${userGameTab}" type="riot/tag"></script>

<c:url value="/js/userPagesTags/userPicsTab.tag" var="userPicsTab" />
<script src="${userPicsTab}" type="riot/tag"></script>

<c:url value="/js/userPagesTags/userPicAltLink.tag" var="userPicAltLink" />
<script src="${userPicAltLink}" type="riot/tag"></script>

<c:url value="/js/userPagesTags/userBadgesTab.tag" var="userBadgesTab" />
<script src="${userBadgesTab}" type="riot/tag"></script>

<c:url value="/js/userPagesTags/userPreferences.tag" var="userPreferences" />
<script src="${userPreferences}" type="riot/tag"></script>

<c:url value="/js/userPagesTags/photoSlider.tag" var="photoSlider" />
<script src="${photoSlider}" type="riot/tag"></script>

<script>
		/* This is where we include our components */
		//Searchbox (OMDB API)
		let pubSub = {};
		riot.observable(pubSub);//makes it observable
		riot.mount('user-rank-bar', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}',
			'username' : '<c:out value="${currentUser.userName}" />',
			'score' : '<c:out value="${userScore}" />',
			'avatarURL' : '<c:out value="${avatar}" />'
			
		});
		
		riot.mount('user-game-tab', {
			'bus' : pubSub,
			'gameAnimalId':'<c:url value="/games/gameAnimalId" />',
			'gameAnimalSpotting':'<c:url value="/games/gameAnimalSpotting" />',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
		
		riot.mount('user-pics-tab', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}',
			'savedPicsUrl' : '<c:url value="/users/${currentUser.userName}/savedPhotos" />'
		});
		
		
		riot.mount('user-pic-alt-link', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
		
		
		
		riot.mount('user-preferences', {
			'bus' : pubSub,
			'formUrl' : '<c:url value="/users/${currentUser.userName}/profile/changePassword" />', 
			'errorMessage' : '<c:if test="${not empty message}"> <c:out value="Error: ${message}"/> </c:if>',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
		
		riot.mount('user-badges-tab', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}',
			'badgesUrl' : '<c:url value="/users/${currentUser.userName}/badges" />',
			'unearnedBadgesUrl': '<c:url value="/users/${currentUser.userName}/unearnedBadges" />',
			'formAction': '<c:url value="/changeAvatar" />',
			'userId' : '${currentUser.userId}'
		});
		 
		
		riot.mount('photo-slider', {
			'bus' : pubSub,
			'formUrl' : '<c:url value="/users" />',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		}); 
</script>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />