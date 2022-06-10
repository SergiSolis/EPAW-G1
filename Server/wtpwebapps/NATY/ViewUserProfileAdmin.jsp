<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="css/estilo-general.css">

 <script type="text/javascript">
 $(document).ready(function(){
	 
	$("#ChangeUsername").hide();
	$("#ChangeName").hide();
	$("#ChangeMail").hide();
	$("#ChangeBio").hide();
	$("#ChangePwd").hide();
	$("#ChangeImage").hide();
	$("div.EditTweet").hide();
	  
	$("#ButtonUsername").click(function(){
	   $("#Username").hide();
	   $("#ChangeUsername").show();
	});
	
	$("#CancelUsername").click(function(){
		$("#Username").show();
		$("#ChangeUsername").hide();
	});
	
	$("#ButtonName").click(function(){
	   $("#Name").hide();
	   $("#ChangeName").show();
	});
		
	$("#CancelName").click(function(){
		$("#Name").show();
		$("#ChangeName").hide();
	});
	
	
	$("#ButtonMail").click(function(){
	   $("#Mail").hide();
	   $("#ChangeMail").show();
	});
		
	$("#CancelMail").click(function(){
		$("#Mail").show();
		$("#ChangeMail").hide();
	});
	
	
	$("#ButtonBio").click(function(){
	   $("#Bio").hide();
	   $("#ChangeBio").show();
	});
		
	$("#CancelBio").click(function(){
		$("#Bio").show();
		$("#ChangeBio").hide();
	});
	
	$("#ButtonPwd").click(function(){
		   $("#Pwd").hide();
		   $("#ChangePwd").show();
		});
			
	$("#CancelPwd").click(function(){
		$("#Pwd").show();
		$("#ChangePwd").hide();
	});
	
	$("#ButtonImage").click(function(){
		   $("#Image").hide();
		   $("#ChangeImage").show();
		});
			
	$("#CancelImage").click(function(){
		$("#Image").show();
		$("#ChangeImage").hide();
	});
	
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

<script src="parsley/parsley.min.js"></script>

<div class="container box userprofile-s">
  <h4> ${fuser.user} profile </h4>
  
    
  <p><img src=${fuser.image} class="image-s" style="height:140px;width:140px" alt="Avatar"></p>
  <hr>
  
    <div id = "Image">
  	<button id="ButtonImage"  type="button" class="button"><i class="fa fa-pencil"></i> &nbsp;Change Profile Image</button>
  </div>

  <div class="editForm" id = ChangeImage>
  	<form data-parsley-validate action="GetUserProfileAdminController" method="GET">
		<div class="input-box">
			<label for="image">Profile image:</label>
			<br>
			 <input class="input-tag" type="file" id="image" name="image" placeholder="Profile Image" value="${fuser.image}" data-parsley-fileextension='png'><br>
			 <input type="hidden" id="id" name="id" value="${fuser.id}">
		</div>
		<button id="CancelImage"  type="button" class="button"><i class="fas fa-trash-alt"></i> &nbsp;Cancel</button>
		<button id="SaveImage"  type="submit" class="button" ><i class="far fa-save"></i> &nbsp;Save Image</button>
	</form> 
  </div>
  
  <div class="infobox-s" id = "Username">
  
  	<p class="info-p"> <i class="fas fa-user"></i> Username: ${fuser.user}</p>
  	<button id="ButtonUsername"  type="button" class="button profile-button"><i class="fa fa-pencil"></i> &nbsp;Edit</button>
  	
  	<ul class="server-errors-list">
	<c:if test = "${fuser.error[0]}">
		<li> Required length for user minimum 4 characters</li>
	</c:if>
	<c:if test = "${fuser.error[5]}">
		<li> User already registered</li>
	</c:if>
	</ul>
  	
  </div>
  
  
  <div class="editForm" id = ChangeUsername>
  	<form data-parsley-validate action="GetUserProfileAdminController" class = "adminform" method="POST">
		<div class="input-box">
			<label for="user"> Username </label>
			<br>
			<input class="input-tag" type="text" id="user" name="user" value="${fuser.user}" required minlength="4">
			<input type="hidden" id="id" name="id" value="${fuser.id}">
		</div>
		<button id="CancelUsername"  type="button" class="button"><i class="fas fa-trash-alt"></i> &nbsp;Cancel</button>
		<button id="SaveUsername"  type="submit" class="button"><i class="far fa-save"></i> &nbsp;Save</button>
	</form> 
  </div>
  

 <div class="infobox-s" id = "Name">
 
  	<p class="info-p"> <i class="fas fa-user"></i> Name: ${fuser.name} </p>
  	<button id="ButtonName"  type="button" class="button profile-button"><i class="fa fa-pencil"></i> &nbsp;Edit</button>
  
  </div>
  
  
  <div class="editForm" id = ChangeName>
  	<form data-parsley-validate action="GetUserProfileAdminController" method="POST">
		<div class="input-box">
			<label for="name"> Name </label>
			<br>
			<input class="input-tag" type="text" id="name" name="name" value="${fuser.name}" required>
			<input type="hidden" id="id" name="id" value="${fuser.id}">
		</div>
		<button id="CancelName"  type="button" class="button"><i class="fas fa-trash-alt"></i> &nbsp;Cancel</button>
		<button id="SaveName"  type="submit" class="button"><i class="far fa-save"></i> &nbsp;Save</button>
	</form> 
  </div>
  
  <div class="infobox-s" id = "Mail">
  	<p class="info-p"> <i class="far fa-envelope"></i> Mail: ${fuser.mail} </p>
  	<button id="ButtonMail" type="button" class="button profile-button"><i class="fa fa-pencil"></i> &nbsp;Edit</button>
  	
  	 <ul class="server-errors-list">
	<c:if test = "${fuser.error[1]}">
		<li> No valid email address</li>
	</c:if>
	<c:if test = "${fuser.error[6]}">
		<li> Email already registered</li>
	</c:if>
	</ul>
  	
  </div>
  
  <div class="editForm" id = ChangeMail>
  	<form data-parsley-validate action="GetUserProfileAdminController" method="POST">
		<div class="input-box">
			<label for="Mail"> Mail </label>
			<br>
			<input class="input-tag" type="email" id="mail" name="mail" value="${fuser.mail}" required>
			<input type="hidden" id="id" name="id" value="${fuser.id}">
		</div>
		<button id="CancelMail"  type="button" class="button"><i class="fas fa-trash-alt"></i> &nbsp;Cancel</button>
		<button id="SaveMail"  type="submit" class="button"><i class="far fa-save"></i> &nbsp;Save</button>
	</form> 
  </div>
  
 <div class="infobox-s" id = "Bio">
  	<p class="info-p"> <i class="fas fa-sticky-note"></i> Bio: ${fuser.bio} </p>
  	<button id="ButtonBio" type="button" class="button profile-button"><i class="fa fa-pencil"></i> &nbsp;Edit</button>
  </div>
  
  
  <div class="editForm" id = ChangeBio>
  	<form action="GetUserProfileAdminController" method="POST">
		<div class="input-box">
			<label for="bio"> Bio </label>
			<input type="hidden" id="id" name="id" value="${fuser.id}">
			<br>
			<textarea class="input-tag" name="bio" placeholder="Add some information about you here :) (Max 150)." rows=5 cols=40 maxlength="150">${fuser.bio}</textarea>
		</div>
		<button id="CancelBio"  type="button" class="button"><i class="fas fa-trash-alt"></i> &nbsp;Cancel</button>
		<button id="SaveBio"  type="submit" class="button"><i class="far fa-save"></i> &nbsp;Save</button>
	</form> 
  </div>
  
  <div class="infobox-s" id = "Pwd">
  	<p class="info-p"> <i class="fas fa-key"></i> Password </p>
  	<button id="ButtonPwd" type="button" class="button profile-button"><i class="fas fa-key"></i> &nbsp;Change</button>
  </div>
  
  
  <div class="editForm" id = ChangePwd>
  	<form data-parsley-validate action="GetUserProfileAdminController" method="POST">
		<div class="input-box">
			<label for="newpwd"> New Password </label>
			<br>
			<input class="input-tag type="password" id="pwd" name="pwd" value="${fuser.pwd}"  required data-parsley-equalto="#pwd">
			<input type="hidden" id="id" name="id" value="${fuser.id}">
			<br>
		</div>
	<button id="CancelPwd"  type="button" class="button"><i class="fas fa-trash-alt"></i> &nbsp;Cancel</button>
	<button id="SavePwd"  type="submit" class="button"><i class="far fa-save"></i> &nbsp;Save</button>
	
	</form> 
  </div>
 
  <div class="infobox-ss" id = "Birthday">
  	<p class="info-p"> <i class="fas fa-birthday-cake"></i> Birthday: ${fuser.birthday} </p>
  </div>
  
  <div class="infobox-ss" id = "Gender">
  	<p class="info-p"> <i class="fas fa-venus-mars"></i> Gender: ${fuser.gender} </p>
  </div>  
 
  <button id="${fuser.id}" type="button" class="DeleteAccount button delete-account-button"><i class="fas fa-skull"></i> &nbsp;Delete Account</button> 
 
</div>
<div>
	<c:forEach var="t" items="${tweets}">
	
		<c:set var="contains" value="false" />
		<c:forEach var="item" items="${t.likes}">
		  <c:if test="${item eq user.id}">
		    <c:set var="contains" value="true" />
		  </c:if>
		</c:forEach>
		       
	 <div id="${t.id}" class="container box tweet-style"><br>
	    
	    <div class="divimage">
   			<img src=${t.uimage} alt="Avatar" class="image-s timage-s" style="width:60px">
   		</div>
   		
	   <div class="divcontent">   
	   
	   <span class="date-s"> ${t.postDateTime} </span>
	   <h4 id="${t.uid}" class="tweetUserProfile tweet-username-s"> ${t.uname} </h4><br>
	   <hr>
	   
	   <div class="NormalTweet">
		   <p id=tcontent class="tcontent-s"> ${t.content} </p>
		   
		   <c:choose>
			  <c:when test="${contains}">
			    <button type="button" id="${fuser.id}" class="dislikeTweetProfile button"><i class="fas fa-heart"></i> &nbsp;Like</button>
			  </c:when>
			  <c:otherwise>
				<button type="button" id="${fuser.id}" class="likeTweetProfile button"><i class="far fa-heart"></i> &nbsp;Like</button>
		      </c:otherwise>
		   </c:choose>
		
		   <button type="button" class="editButton button"><i class="fas fa-edit"></i> &nbsp;Edit</button> 
		   <button type="button" id="${fuser.id}" class="delTweetProfile button"><i class="fas fa-trash-alt"></i> &nbsp;Delete</button>
		   
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

