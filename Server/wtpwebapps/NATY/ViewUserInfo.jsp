<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="css/estilo-general.css">

<div class="container box userprofile-s">
  <h4>My Profile</h4>
  <p><img src=${user.image} class="image-s" style="height:132px;width:132px" alt="Avatar"></p>
  <hr>
  <p class="infobox-s"> <i class="fas fa-user"></i> ${user.name} </p>
  <p class="infobox-s"> <i class="far fa-envelope"></i> ${user.mail} </p>
  <button type="button" class="editUser button edit-button-s"><i class="fas fa-user-edit"></i> &nbsp;Edit</button> 
 </div>
<br>