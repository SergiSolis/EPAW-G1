<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>

<link rel="stylesheet" type="text/css" href="css/menu-estil.css">

<div class="bar color">
	<div class="bar">
		<a class="bar-item menu-button" href="MainController"> <i class="fa fa-home" aria-hidden="true"></i> </a> 
		<a class="menu bar-item menu-button hide-small" id="GetOwnTimeline" href=#> MyPosts </a>
		<a class="menu bar-item menu-button hide-small" id="GetFollowedUsers" href=#> Buddies </a>
		<a class="menu bar-item menu-button hide-small right" id="LogoutController" href=#> <i class="fa fa-sign-out"></i> </a>
		<a href="javascript:void(0)" class="bar-item button right hide-large hide-medium" onclick="stack()">&#9776;</a>
	</div>

	<div id="stack" class="bar-block hide hide-large hide-medium">
		<a class="menu bar-item menu-button" id="GetOwnTimeline" href=#> MyPosts </a>
		<a class="menu bar-item menu-button" id="GetFollowedUsers" href=#> Buddies </a>
		<a class="menu bar-item menu-button" id="LogoutController" href=#> Logout </a>
	</div>
</div>
