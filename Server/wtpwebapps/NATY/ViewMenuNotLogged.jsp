<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
 
<link rel="stylesheet" type="text/css" href="css/menu-estil.css"> 

<div class="bar color">
	
	<div class="bar">
		<a class="bar-item menu-button" id="LogoutController" href="MainController"> <i class="fa fa-home" aria-hidden="true"></i> </a>
		<a class="menu bar-item menu-button hide-small" id="RegisterController" href=#> Registration </a> 
		<a class="menu bar-item menu-button hide-small" id="LoginController" href=#> Login </a> 
		<a class="menu bar-item menu-button hide-small" id="GetGeneralTweets" href=#> Tweets timeline </a> 
		<a href="javascript:void(0)" class="bar-item button right hide-large hide-medium" onclick="stack()"> &#9776;</a>
	</div>
	
	<div id="stack" class="bar-block color hide hide-large hide-medium">
		<a class="menu bar-item menu-button" id="RegisterController" href=#> Registration </a> 
		<a class="menu bar-item menu-button" id="LoginController" href=#> Login </a>
		<a class="menu bar-item menu-button" id="GetGeneralTweets" href=#> Tweets timeline </a>  
	</div>

</div>