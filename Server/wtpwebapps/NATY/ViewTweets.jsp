<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- <link rel="stylesheet" type="text/css" href="css/estilo-general.css">*/ --%>

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

<c:forEach var="t" items="${tweets}">

	<c:set var="contains" value="false" />
	<c:forEach var="item" items="${t.likes}">
	  <c:if test="${item eq user.id}">
	    <c:set var="contains" value="true" />
	  </c:if>
	</c:forEach>
	       
 <div id="${t.id}" class="tweet container box tweet-style"><br>
   
   <div class="divimage">
   		<img src=${t.uimage} alt="Avatar" class="image-s timage-s" style="width:60px">
   </div>
   
   <div class="divcontent">
	   <span class="date-s"> ${t.postDateTime} </span>
	   <h4 id="${t.uid}" class="tweetUserProfile tweet-username-s"> ${t.uname} </h4>
	   <hr>
	   
	   <div class="NormalTweet">
	   <p id=tcontent class="tcontent-s"> ${t.content} </p>
	   
	   <c:choose>
		  <c:when test="${contains}">
		    <button type="button" class="dislikeTweet button"><i class="fas fa-heart"></i> &nbsp;Like</button>
		  </c:when>
		  <c:otherwise>
			<button type="button" class="likeTweet button"><i class="far fa-heart"></i> &nbsp;Like</button>
	      </c:otherwise>
	   </c:choose>

	   <c:if test = "${t.uid eq user.id || user.admin}">
	   	  <button type="button" class="editButton button"><i class="fas fa-edit"></i> &nbsp;Edit</button> 
	   	  <button type="button" class="delTweet button"><i class="fas fa-trash-alt"></i> &nbsp;Delete</button>
	   </c:if>
	   <span class="likes-s"> Likes ${t.likes.size()} </span> 
	   </div>
	   
	   <div class="EditTweet">
	   	<p id="NewTweetContent" class = "tcontent-s p-editable" contenteditable="true"> ${t.content}</p>
	   	<button type="button" class="editTweet button"><i class="far fa-save"></i> &nbsp;Save</button>
	   	<button type="button" class="cancelButton button"><i class="fas fa-trash-alt"></i> &nbsp;Cancel</button> 
	   </div>
	   
	</div>
	
 </div>
</c:forEach>
