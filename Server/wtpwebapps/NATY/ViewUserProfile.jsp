<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="css/estilo-general.css">

 <script type="text/javascript">
 $(document).ready(function(){
	 
	$("div.EditTweet").hide();

	$(".editButton").click(function(){
	   
	   $(this).parent().hide();
	   $(this).parent().parent().children("div.EditTweet").show();
	});
	
	$(".cancelButton").click(function(){
		$(this).parent().hide();
		$(this).parent().parent().children("div.NormalTweet").show();
	});

 });
</script>

<div class="container box userprofile-s">
  <h4 class="profileTitle"> ${fuser.user} profile </h4>
  
  <p><img src=${fuser.image} class="image-s" style="height:106px;width:106px" alt="Avatar"></p>
  <hr>
  
  <div id = "Username" class="infobox-s">
  	<p> <i class="fas fa-user"></i> Username: ${fuser.user} </p>
  </div>

  <div id = "Name" class="infobox-s">
  	<p> <i class="fas fa-user"></i> Name: ${fuser.name} </p>
  </div>
  
  <div id = "Mail" class="infobox-s">
  	<p> <i class="far fa-envelope"></i> Mail: ${fuser.mail} </p>
  </div>
  
  <div id = "Gender" class="infobox-s">
  	<p> <i class="fas fa-venus-mars"></i> Gender: ${fuser.gender} </p>
  </div>  
  
  <div id = "Birthday" class="infobox-s">
  	<p> <i class="fas fa-birthday-cake"></i> Birthday: ${fuser.birthday} </p>
  </div>
  
  <div id = "Bio" class="infobox-s">
  	<p> <i class="fas fa-sticky-note"></i> Bio: ${fuser.bio} </p>
  </div>
 </div>
 
 <h4> Tweets </h4>
 
<div>
	<c:forEach var="t" items="${tweets}">
	
	 <div id="${t.id}" class="container box tweet-style"><br>
	   <div class="divimage">
	   		<img src=${t.uimage} alt="Avatar" class="image-s timage-s" style="width:60px">
	   </div>
	   
	   <div class="divcontent">
		   <span class="date-s"> ${t.postDateTime} </span>
		   <h4 id="${t.uid}" class="tweetUserProfile tweet-username-s"> ${t.uname} </h4>
		   <hr class="w3-clear">
		   
		   <div class="NormalTweet">
		   <p id=tcontent class="tcontent-s"> ${t.content} </p>
		      
		   	<c:if test="${user ne null}">
		   	
			<c:set var="contains" value="false" />
			<c:forEach var="item" items="${t.likes}">
				<c:if test="${item eq user.id}">
				   <c:set var="contains" value="true" />
				 </c:if>
			</c:forEach>
	   
		   	 <c:choose>
			 <c:when test="${contains}">
			   <button type="button" id="${fuser.id}" class="dislikeTweetProfile button"><i class="fas fa-heart"></i> &nbsp;Like</button>
			 </c:when>
			 <c:otherwise>
				<button type="button" id="${fuser.id}" class="likeTweetProfile button"><i class="far fa-heart"></i> &nbsp;Like</button>
		     </c:otherwise>
		   	 </c:choose>
		   	
		    </c:if>
		
	   
		   <c:if test = "${t.uid eq user.id}">
		   	  <button type="button" class="editButton button"><i class="fas fa-edit"></i> &nbsp;Edit</button> 
		   	  <button type="button" id="${fuser.id}" class="delTweetProfile button"><i class="fas fa-trash-alt"></i> &nbsp;Delete</button>
		   </c:if>
		   <span class="likes-s"> Likes ${t.likes.size()} </span> 
		   </div>
	   
		   <div class="EditTweet">
		   <p id=NewTweetContent class = "tcontent-s" contenteditable="true"> ${t.content} </p>
		   <button type="button" id="${fuser.id}" class="editTweetProfile button"><i class="far fa-save"></i> &nbsp;Save</button>
		   <button type="button" class="cancelButton button"><i class="fas fa-trash-alt"></i> &nbsp;Cancel</button> 
		   </div>
	   
		</div>
	 </div>
	</c:forEach>
</div>

