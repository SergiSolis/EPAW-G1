<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>

 <script type="text/javascript">
 $(document).ready(function(){
	$('#navigation').load('MenuController');
	$('#lcolumn').load('GetNotFollowedUsers');
	$('#rcolumn').load('GetUserInfo');
	$('#iterator').load('GetUserTweets');
 });
</script>

<link rel="stylesheet" type="text/css" href="css/estilo-general.css">

<div class="container">
	<p id="UsersContentSearch" contenteditable="true" class="search-box"> </p>
	<button id="searchUsers" type="button" class="button search-button"><i class="fas fa-search"></i> &nbsp;Search</button>
</div>

<div class="container box">
	<h5> ${user.user}, what are you thinking? </h5>
	<p id="tweetContent" contenteditable="true" class="add-box"> </p>
	<button id="addTweet" type="button" class="button add-button"><i class="fa fa-pencil"></i> &nbsp;Post</button> 
</div>
 
<h4 class= "TT"> Tweets Timeline </h4>
<div id="iterator">
</div>
 


