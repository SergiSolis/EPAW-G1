<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="css/estilo-general.css">

<c:forEach var="u" items="${users}">       
 <div id="${u.id}" class="container box"><br>
   <img src=${u.image} class="image-s timage-s" alt="Avatar" style="width:72px">
   <h4> ${u.name} </h4><br>
   <hr class="w3-clear">
   <button type="button" class="fuserInfo button unfollowUser-button"><i class="fa fa-info-circle"></i> &nbsp;Info</button>
   <button type="button" class="unfollowUser button unfollowUser-button"><i class="fas fa-users-slash"></i> &nbsp;Unfollow</button> 
 </div>
</c:forEach>