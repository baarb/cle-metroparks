<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
w3-sidebar{
} 
w3-bar-block{
} 
w3-light-grey{
} 
w3-card{
}
w3-bar-item{
width:100%;
display:block;
padding:8px 16px;
text-align:left;
border:none;
white-space:normal;
float:none;
outline:0
}
.w3-bar-item .w3-button .tablink{
}
.w3-container .city{
}
.w3-sidebar .w3-bar-block .w3-light-grey .w3-card{
}


</style>

<user-rank-bar></user-rank-bar>


<div class="w3-sidebar w3-bar-block w3-light-grey w3-card" style="width:130px">
  <h5 class="w3-bar-item">Menu</h5>
  <button class="w3-bar-item w3-button tablink" onclick="openTab(event, 'Games')">Games</button>
  <button class="w3-bar-item w3-button tablink" onclick="openTab(event, 'Pictures')">Pictures</button>
  <button class="w3-bar-item w3-button tablink" onclick="openTab(event, 'Badges')">Badges</button>
  <button class="w3-bar-item w3-button tablink" onclick="openTab(event, 'Preferences')">Preferences</button>
</div>

<div style="margin-left:130px">
  
  <div id="Games" class="w3-container city" style="display:none">
    <user-game-tab></user-game-tab>
  </div>

  <div id="Pictures" class="w3-container city" style="display:none">
    <user-pics-tab></user-pics-tab>
  </div>

  <div id="Badges" class="w3-container city" style="display:none">
    <user-badges-tab></user-badges-tab>
  </div>
  
  <div id="Preferences" class="w3-container city" style="display:none">
    <user-preferences></user-preferences>
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
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
		
		riot.mount('user-game-tab', {
			'bus' : pubSub,
			'gameAnimalId':'<c:url value="/games/gameAnimalId" />',
			'gameAnimalSpotting':'<c:url value="/games/gameAnimalSpotting" />',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
		
		riot.mount('user-pics-tab', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
		
		riot.mount('user-badges-tab', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
		
		riot.mount('user-preferences', {
			'bus' : pubSub,
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		});
		
		riot.mount('photo-slider', {
			'bus' : pubSub,
			'formUrl' : '<c:url value="/users" />',
			'CSRF_TOKEN' : '${CSRF_TOKEN}'
		}); 

		</script>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />