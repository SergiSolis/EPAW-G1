<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="css/estilo-general.css">

<div class="container">
	<p id="UsersContentSearch" contenteditable="true" class="search-box"> </p>
	<button id="searchUsers" type="button" class="button search-button"><i class="fas fa-search"></i> &nbsp;Search</button> 
</div>

<c:forEach var="u" items="${users}">       
 <div id="${u.id}" class="container box"><br>
   <img src=${u.image} class="image-s timage-s" alt="Avatar" style="width:72px">
   <h4> ${u.name}</h4><br>
   <hr class="w3-clear">
   
   <button type="button" class="fuserInfo button unfollowUser-button"><i class="fa fa-info-circle"></i> &nbsp;Info</button>
   
	<c:if test="${u.id ne user.id}">
	
		<c:set var="follow" value="false" />
		<c:forEach var="f" items="${fusers}">
		  <c:if test="${u.id eq f.id}">
		    <c:set var="follow" value="true" />
		  </c:if>
		</c:forEach>       
	
	
	   <c:choose>
		  <c:when test="${follow}">
		     <button type="button" class="followUser button unfollowUser-button"><i class="fa fa-user-plus"></i> &nbsp;Follow</button> 
		  </c:when>
		  <c:otherwise>
		     <button type="button" class="unfollowUser button unfollowUser-button"><i class="fas fa-users-slash"></i> &nbsp;Unfollow</button>
	      </c:otherwise>
	   </c:choose>

	</c:if>
 
 </div>
</c:forEach>