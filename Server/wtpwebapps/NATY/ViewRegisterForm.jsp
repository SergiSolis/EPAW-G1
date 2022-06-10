<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="parsley/parsley.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/estil.css">

<div class="box">
	
	<div class="imagen"> </div>
	
	<div class="formulario">
		
		<h2 class="titulo">Registration Form</h2>

		<form data-parsley-validate action="RegisterController" method="POST">
		
		  <div class="input-box">
		  
			  <label for="user"> Username</label>
			  <br>
			  <input type="text" id="user" name="user" value="${user.user}" required minlength="4">
			  
			  <ul class="server-errors-list">
			  <c:if test = "${user.error[0]}">
				<li> Required length for user minimum 4 characters</li>
			  </c:if>
			  <c:if test = "${user.error[5]}">
				<li> User already registered</li>
			  </c:if>
			  </ul>
			 
		  </div>
		  
		  <div class="input-box">
		  
			  <label for="name"> Name</label>
			  <br>
			  <input type="text" id="name" name="name" value="${user.name}" required>
			  
			  <ul class="server-errors-list">
			  <c:if test = "${user.error[7]}">
				<li> Name required</li>
			  </c:if>
			  </ul>
			  
		  </div>
		  
		  <div class="input-box">
		  
			  <label for="mail"> Mail </label>
			  <br>
			  <input type="email" id="mail" name="mail" value="${user.mail}" required>
			  
			  <ul class="server-errors-list">
			  <c:if test = "${user.error[1]}">
				<li> No valid email address</li>
			  </c:if>
			  <c:if test = "${user.error[6]}">
				<li> Email already registered</li>
			  </c:if>
			  </ul>
			  
		  </div>
		  
		  <div class="input-box">
		  
			  <label for="pwd1"> Password </label>
			  <br>
			  <input type="password" id="pwd" name="pwd" value="${user.pwd}" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$">
			  
			  <ul class="server-errors-list">
			  <c:if test = "${user.error[2]}">
				<li> No valid format of password</li>
			  </c:if>
			  </ul>
			  
		  </div>
		  
		  <div class="input-box">
		  
			  <label for="pwd1"> Confirm password </label>
			  <br>
			  <input type="password" id="pwd2" name="pwd2" value="${user.pwd2}" required data-parsley-equalto="#pwd">
			  
			  <ul class="server-errors-list">
			  <c:if test = "${user.error[3]}">
				<li> Passwords doesn't match</li>
			  </c:if>
			  </ul>
			  
		  </div>
		  
		  <div class="input-box">
		  
			  <label for="birthday"> Birthday</label>
			  <br>
			  <input type="date" id="birthday" name="birthday" value="${user.birthday}" required>
			  
			  <ul class="server-errors-list">
			  <c:if test = "${user.error[4]}">
				<li> You are too young for us</li>
			  </c:if>
			  </ul>
			  
		  </div>
		  
		  <div class="input-box">
			  <label for="gender"> Gender:</label>
			  <select id="gender" name="gender" onChange="${user.gender}">
			    <option value="-"> - </option>
			    <option value="Male"> Male </option>
			    <option value="Female"> Female </option>
			    <option value="Other"> Other </option>
			  </select>
		  </div>
		  
		  <div class="input-box">
			  <label for="bio"> Biography </label>
			  <br>
			  <textarea id="bio" name="bio" placeholder="Add some information about you here :) (Max 150)." rows=5 cols=40 maxlength="150">${user.bio}</textarea>
		  </div>
		  
		  <button> Submit </button>
		</form>
	</div>
</div>
