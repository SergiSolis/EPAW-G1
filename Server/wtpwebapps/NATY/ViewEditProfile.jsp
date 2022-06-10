<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="css/estilo-general.css">

 <script type="text/javascript">
 $(document).ready(function(){
	$('#lcolumn').html("<p></p>");
	$('#rcolumn').html("<p></p>");
	
	$("#ChangeUsername").hide();
	$("#ChangeName").hide();
	$("#ChangeMail").hide();
	$("#ChangeBio").hide();
	$("#ChangePwd").hide();
	$("#ChangeImage").hide();
	  
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
	
 });
 
</script>

<script src="parsley/parsley.min.js"></script>

<div class="container box userprofile-s">
  <h4>My Profile</h4>
  
  <p><img src=${user.image} class="image-s" style="height:140px;width:140px" alt="Avatar"></p>
  <hr>

  <div id = "Image">
  	<button id="ButtonImage"  type="button" class="button"><i class="fa fa-pencil"></i> &nbsp;Change Profile Image</button>
  </div>

  <div class="editForm" id = ChangeImage>
  	<form data-parsley-validate action="EditProfileController" method="GET">
		<div class="input-box">
			<label for="image">Profile image:</label>
			<br>
			<input class="input-tag" type="file" id="image" name="image" placeholder="Profile Image" value="${user.image}" data-parsley-fileextension='png'><br>
		</div>
		<button id="CancelImage"  type="button" class="button"><i class="fas fa-trash-alt"></i> &nbsp;Cancel</button>
		<button id="SaveImage"  type="submit" class="button" ><i class="far fa-save"></i> &nbsp;Save Image</button>
	</form> 
  </div>
  
  <div class="infobox-s" id = "Username">

  	<p class="info-p"> <i class="fas fa-user"></i> Username: ${user.user} </p>
  	<button id="ButtonUsername"  type="button" class="button profile-button"><i class="fa fa-pencil"></i> &nbsp;Edit</button>
  	
    <ul class="server-errors-list">
	<c:if test = "${user.error[0]}">
		<li> Required length for user minimum 4 characters</li>
	</c:if>
	<c:if test = "${user.error[5]}">
		<li> User already registered</li>
	</c:if>
	</ul>

 </div>
  
  
  <div class="editForm" id = ChangeUsername>
  	<form data-parsley-validate action="EditProfileController" method="POST">
		<div class="input-box">
			<label for="user"> Username </label>
			<br>
			<input class="input-tag" type="text" id="user" name="user" value="${user.user}" required minlength="4">
		</div>
		<button id="CancelUsername"  type="button" class="button"><i class="fas fa-trash-alt"></i> &nbsp;Cancel</button>
		<button id="SaveUsername"  type="submit" class="button"><i class="far fa-save"></i> &nbsp;Save</button>
	</form> 
  </div>
  

  <div class="infobox-s" id = "Name">
  	<p class="info-p"> <i class="fas fa-user"></i> Name: ${user.name} </p>
  	<button id="ButtonName"  type="button" class="button profile-button"><i class="fa fa-pencil"></i> &nbsp;Edit</button>
  	
  	<ul class="server-errors-list">
	<c:if test = "${user.error[7]}">
		<li> Name required</li>
	</c:if>
	</ul>
  
  </div>
  
  
  <div class="editForm" id = ChangeName>
  	<form data-parsley-validate action="EditProfileController" method="POST">
		<div class="input-box">
			<label for="name"> Name </label>
			<br>
			<input class="input-tag" type="text" id="name" name="name" value="${user.name}" required>
		</div>
		<button id="CancelName"  type="button" class="button"><i class="fas fa-trash-alt"></i> &nbsp;Cancel</button>
		<button id="SaveName"  type="submit" class="button"><i class="far fa-save"></i> &nbsp;Save</button>
	</form> 
  </div>
  
  <div class="infobox-s" id = "Mail">
  	<p class="info-p"> <i class="far fa-envelope"></i> Mail: ${user.mail} </p>
  	<button id="ButtonMail" type="button" class="button profile-button"><i class="fa fa-pencil"></i> &nbsp;Edit</button>
  	
  	<ul class="server-errors-list">
	<c:if test = "${user.error[1]}">
		<li> No valid email address</li>
	</c:if>
	<c:if test = "${user.error[6]}">
		<li> Email already registered</li>
	</c:if>
	</ul>
  	
  </div>
  
  
  <div class="editForm" id = ChangeMail>
  	<form data-parsley-validate action="EditProfileController" method="POST">
		<div class="input-box">
			<label for="Mail"> Mail </label>
			<br>
			<input class="input-tag" type="email" id="mail" name="mail" value="${user.mail}" required>
		</div>
		<button id="CancelMail"  type="button" class="button"><i class="fas fa-trash-alt"></i> &nbsp;Cancel</button>
		<button id="SaveMail"  type="submit" class="button"><i class="far fa-save"></i> &nbsp;Save</button>
	</form> 
  </div>
  
  <div class="infobox-s" id = "Bio">
  	<p class="info-p"> <i class="fas fa-sticky-note"></i> Bio: ${user.bio} </p>
  	<button id="ButtonBio" type="button" class="button profile-button"><i class="fa fa-pencil"></i> &nbsp;Edit</button>
  </div>
  
  
  <div class="editForm" id = ChangeBio>
  	<form action="EditProfileController" method="POST">
		<div class="input-box">
			<label for="bio"> Bio </label>
			<br>
			<textarea class="input-tag" id="bio" name="bio" placeholder="Add some information about you here :) (Max 150)." rows=5 cols=40 maxlength="150">${user.bio}</textarea>
		</div>
		<button id="CancelBio"  type="button" class="button"><i class="fas fa-trash-alt"></i> &nbsp;Cancel</button>
		<button id="SaveBio"  type="submit" class="button"><i class="far fa-save"></i> &nbsp;Save</button>
	</form> 
  </div>
  
  <div class="infobox-s" id = "Pwd">
  	<p class="info-p"> <i class="fas fa-key"></i> Password </p>
  	<button id="ButtonPwd" type="button" class="button profile-button"><i class="fas fa-key"></i> &nbsp;Change</button>
  	
  	<ul class="server-errors-list">
  	<c:if test = "${changepassword.error[0]}">
		<li> No valid format of Actual password</li>
	</c:if>
	<c:if test = "${changepassword.error[1]}">
		<li> No valid format of New password</li>
	</c:if>
	<c:if test = "${changepassword.error[2]}">
		<li> New Passwords doesn't match</li>
	</c:if>	 
	<c:if test = "${changepassword.error[3]}">
		<li> Actual password is wrong</li>
	</c:if>	  
	</ul>
  </div>
  
  
  <div class="editForm" id = ChangePwd>
  	<form data-parsley-validate action="EditProfileController" method="POST">
		<div class="input-box">
			<label for="pwd"> Actual Password </label>
			<br>
			<input class="input-tag input-box" type="password" id="pwd" name="pwd" value="${changepassword.pwd}" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$">
			<br>
			
			<label for="newpwd"> New Password </label>
			<br>
			<input class="input-tag input-box" type="password" id="newpwd" name="newpwd" value="${changepassword.newpwd}" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$">
			<br>
			
			<label for="confnewpwd"> Confirm new Password </label>
			<br>
			<input class="input-tag input-box" type="password" id="confnewpwd" name="confnewpwd" value="${changepassword.confnewpwd}" required data-parsley-equalto="#newpwd">
			
			
		</div>
	<button id="CancelPwd"  type="button" class="button"><i class="fas fa-trash-alt"></i> &nbsp;Cancel</button>
	<button id="SavePwd"  type="submit" class="button"><i class="far fa-save"></i> &nbsp;Save</button>
	
	</form> 
  </div>
  
 </div>




