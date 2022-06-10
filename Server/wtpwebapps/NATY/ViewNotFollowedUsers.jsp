<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="css/estilo-general.css">

<c:forEach var="u" items="${users}">       
<div id="${u.id}" class="container box userprofile-s">
	<p>Friend Suggestion</p>
    <img src=${u.image} alt="Avatar" class="image-s" style="height:150px;width:150px"><br>
    <h4>${u.name}</h4>
   	<button type="button" class="followUser button followUser-button"><i class="fa fa-user-plus"></i> &nbsp;Follow</button> 
</div>
</c:forEach>