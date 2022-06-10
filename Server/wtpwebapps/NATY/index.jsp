<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>


<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="imgs/icon.png">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title> Tweetako </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/fff54109b4.js"></script>
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript">
$(document).ready(function(){
	
	$.ajaxSetup({ cache: false }); //Avoids Internet Explorer caching!	
	
	$(document).on("click",".menu",function(event) {
		$('#content').load($(this).attr('id'));
		event.preventDefault();
	});
	$(document).on("submit","form", function(event) {
		
		var form = this;
		var data = new FormData(form);
		
		$.ajax( {
		  type: 'POST',
		  enctype: 'multipart/form-data',
	      url: $(form).attr('action'),
	      data: data,
	      processData: false,
	      contentType: false
		}).done(function(html){
			$("#content").html(html);
		});
		
		event.preventDefault();
	});
	
	// Edit Profile
	$(document).on("click",".editUser",function(event) {
			$("#content").load("EditProfileController",$(this).serialize());
			event.preventDefault();
	});
	
	/* Search users */
	$(document).on("click","#searchUsers",function(event){
		$("#content").load("SearchUsers", { Searchcontent: $("#UsersContentSearch").text()});
		event.preventDefault();
	});
	
	/* Add tweet */
	$(document).on("click","#addTweet",function(event){
		$.post( "AddTweet", { content: $("#tweetContent").text()}, function(event) {
			$("#content").load("GetOwnTimeline");		
		});
		event.preventDefault();
	});
	
	/* Comment tweet */
	$(document).on("click","#CommentTweet",function(event){
		var x = $(this).parent().attr("id");
		$.post( "CommentTweet", { content: $("#tweetComment").text(), pid: x }, function(event) {
			$("#content").load("TweetCompleteController", { id: x });	
		});
		event.preventDefault();
	});
	
	/* Edit tweet */
	$(document).on("click",".editTweet",function(event){
		$.post( "EditTweet", { id: $(this).parent().parent().parent().attr("id"), content: $(this).parent().children("#NewTweetContent").text()}, function(event) {
			$("#content").load("GetOwnTimeline");		
		});
		event.preventDefault();
	});
	
	/* Edit tweet Profile*/
	$(document).on("click",".editTweetProfile",function(event){
		var x = $(this).attr("id");
		$.post( "EditTweet", { id: $(this).parent().parent().parent().attr("id"), content: $(this).parent().children("#NewTweetContent").text()}, function(event) {
			$("#content").load("GetUserProfileController", { id: x });	
		});
		event.preventDefault();
	});
	/* Edit tweet Commet*/
	$(document).on("click",".editTweetComment",function(event){
		var x = $(this).attr("id");
		$.post( "EditTweet", { id: $(this).parent().parent().parent().attr("id"), content: $(this).parent().children("#NewTweetContent").text()}, function(event) {
			$("#content").load("TweetCompleteController", { id: x });	
		});
		event.preventDefault();
	});
	/* Delete tweet */
	$(document).on("click",".delTweet",function(event){
		var tweet = $(this).parent();
		$.post( "DelTweet", { id: $(this).parent().parent().parent().attr("id") } , function(event) {
			$("#content").load("GetOwnTimeline");				
		});
		event.preventDefault();
	});
	/* Delete tweet Profile*/
	$(document).on("click",".delTweetProfile",function(event){
		var tweet = $(this).parent();
		var x = $(this).attr("id");
		$.post( "DelTweet", { id: $(this).parent().parent().parent().attr("id") } , function(event) {
			$("#content").load("GetUserProfileController", { id: x });			
		});
		event.preventDefault();
	});
	/* Delete tweet Comment*/
	$(document).on("click",".delTweetComment",function(event){
		var tweet = $(this).parent();
		var x = $(this).attr("id");
		$.post( "DelTweet", { id: $(this).parent().parent().parent().attr("id") } , function(event) {
			$("#content").load("TweetCompleteController", { id: x });			
		});
		event.preventDefault();
	});
	/* Like tweet */
	$(document).on("click",".likeTweet",function(event){
		var tweet = $(this).parent();
		$.post( "LikeTweet", { id: $(this).parent().parent().parent().attr("id") } , function(event) {
			$("#content").load("GetOwnTimeline");				
		});
		event.preventDefault();
	});
	
	/* DisLike tweet */
	$(document).on("click",".dislikeTweet",function(event){
		var tweet = $(this).parent();
		$.post( "DislikeTweet", { id: $(this).parent().parent().parent().attr("id") } , function(event) {
			$("#content").load("GetOwnTimeline");				
		});
		event.preventDefault();
	});
	
	/* Like tweet Profile */
	$(document).on("click",".likeTweetProfile",function(event){
		var tweet = $(this).parent();
		var x = $(this).attr("id");

		$.post( "LikeTweet", { id: $(this).parent().parent().parent().attr("id") } , function(event) {
			$("#content").load("GetUserProfileController", { id: x });
		});
		event.preventDefault();
	});
	
	/* DisLike tweet Profile*/
	$(document).on("click",".dislikeTweetProfile",function(event){
		var tweet = $(this).parent();
		var x = $(this).attr("id");

		$.post( "DislikeTweet", { id: $(this).parent().parent().parent().attr("id") } , function(event) {
			$("#content").load("GetUserProfileController", { id: x });
		});
		event.preventDefault();
	});
	
	/* Like tweet Comment */
	$(document).on("click",".likeTweetComment",function(event){
		var tweet = $(this).parent();
		var x = $(this).attr("id");

		$.post( "LikeTweet", { id: $(this).parent().parent().parent().attr("id") } , function(event) {
			$("#content").load("TweetCompleteController", { id: x });
		});
		event.preventDefault();
	});
	
	/* DisLike tweet Comment*/
	$(document).on("click",".dislikeTweetComment",function(event){
		var tweet = $(this).parent();
		var x = $(this).attr("id");

		$.post( "DislikeTweet", { id: $(this).parent().parent().parent().attr("id") } , function(event) {
			$("#content").load("TweetCompleteController", { id: x });
		});
		event.preventDefault();
	});
	
	/* Follow user */
	$(document).on("click",".followUser",function(event){
		var user = $(this).parent();
		$.post( "FollowUser", { id: $(this).parent().attr("id") }, function(event) { 
			$("#content").load("GetFollowedUsers");
			$("#lcolumn").load("GetNotFollowedUsers");
		});
		event.preventDefault();
	});
	/* UnFollow user */
	$(document).on("click",".unfollowUser",function(event) {
		var user = $(this).parent();
		$.post( "UnFollowUser", { id: $(this).parent().attr("id") }, function(event) {
			$("#content").load("GetFollowedUsers");
			$("#lcolumn").load("GetNotFollowedUsers");
		});
		event.preventDefault();
	});
	
	/* Go to fuser profile */
	$(document).on("click",".fuserInfo",function(event) {
		var user = $(this).parent();
		$("#content").load("GetUserProfileController", { id: $(this).parent().attr("id") });
		event.preventDefault();
	});
	/* Go to user tweet profile*/
	$(document).on("click",".tweetUserProfile",function(event) {
		var user = $(this).parent();
		$("#content").load("GetUserProfileController", { id: $(this).attr("id") });
		event.preventDefault();
	});
	
	/* Delete account */
	$(document).on("click",".DeleteAccount",function(event) {
		$.post( "DelUser", { id: $(this).attr("id")}, function(event) {
			$("#content").load("GetOwnTimeline");	
		});
		event.preventDefault();
		
	});
	
	/* Complete tweet*/
	$(document).on("click","div.tweet",function(event) {
		//alert("hola");
		$("#content").load("TweetCompleteController", { id: $(this).attr("id") });
		event.preventDefault();
	});
	
	$(document).on("click","div.tweet button.likeTweet",function(event) {
		event.stopPropagation();
	});
	
	$(document).on("click","div.tweet button.dislikeTweet",function(event) {
		event.stopPropagation();
	});
	
	$(document).on("click","div.tweet button.editButton",function(event) {
		event.stopPropagation();
	});
	
	$(document).on("click","div.tweet button.delTweet",function(event) {
		event.stopPropagation();
	});
	
	$(document).on("click","div.tweet button.editTweet",function(event) {
		event.stopPropagation();
	});
	
	$(document).on("click","div.tweet button.cancelButton",function(event) {
		event.stopPropagation();
	});
	
	$(document).on("click","div.tweet p.p-editable",function(event) {
		event.stopPropagation();
	});
		
});
</script>
</head>
<body>

 	<!-- Begin Navigation -->
 	<div id="navigation">
    <jsp:include page="${menu}" />
 	</div>
 	<!-- End Navigation -->
 
 	<!-- Begin Content -->
	<div class="generalContent">
 	<!-- Left Column -->
	<div class="container col-lateral content-pading col-hide-small">
		<div id="rcolumn">
			<p></p>
		</div>
	</div>
	<!-- Middle Column -->	
	<div class="col-central content-pading">
		<div id="content">
		<jsp:include page="${content}" />
		</div>
	</div>
	<!-- Right Column -->
	<div class="container col-lateral content-pading col-hide-small">
		<div id="lcolumn">
			<p></p>
		</div>
	</div>
	</div>
	<!-- End Content -->
	<!-- Footer -->
	
	<script>
		function stack() {
  			var x = document.getElementById("stack");
  			if (x.className.indexOf("show") == -1) {
    			x.className += " show";
  			} else { 
    		x.className = x.className.replace(" show", "");
  			}
		}
	</script>

  </body>
</html>