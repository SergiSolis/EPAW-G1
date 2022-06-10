<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="parsley/parsley.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/estil.css">

<div class="box">

	
	<div class="imagen"> </div>
	
	<div class="formulario">
		
		<h2 class="titulo login">Login</h2>

		<form data-parsley-validate action="LoginController" method="POST">
		
			  <div class="input-box login">
				  <label for="user"> Username or Email </label>
				  <br>
				  <input type="text" id="user" name="user" value="${login.user}" required minlength="4">
				  
				  <ul class="server-errors-list">
				  <c:if test = "${login.error[0]}">
					<li> Required length for user minimum 4 characters</li>
				  </c:if>
				  <c:if test = "${login.error[1]}">
					<li> User or email not registred in the database</li>
				  </c:if>
				  </ul>
			 </div>
			 
			 <div class="input-box login">
			 
				  <label for="pwd1"> Password </label>
				  <br>
				  <input type="password" id="password" name="password" value="${login.password}" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$">
				  
				  <ul class="server-errors-list">
				  <c:if test = "${login.error[2]}">
					<li> No valid format of password</li>
				  </c:if>
				  <c:if test = "${login.error[3]}">
					<li> User and password don't match</li>
				  </c:if>
				  </ul>
				  
			 </div>
				  	      
		     <button class="login"> Submit </button>
		</form>
		
	</div>
		
</div>