<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="css/estilo-general.css">

<c:forEach var="t" items="${tweets}">       
 <div id="${t.id}" class="container box tweet-style"><br>
 	
 	<div class="divimage">
 	 	<img src=${t.uimage} alt="Avatar" class="image-s timage-s" style="width:60px">
 	</div>
	<div class="divcontent">
	   <span class="date-s"> ${t.postDateTime} </span>
   		<h4 id="${t.uid}" class="tweetUserProfile tweet-username-s"> ${t.uname} </h4>
   		  <hr>
   		<p class="tcontent-s"> ${t.content} </p>
   		<span class="likes-s"> Likes ${t.likes.size()} </span> 
	</div>

 </div>
</c:forEach>
