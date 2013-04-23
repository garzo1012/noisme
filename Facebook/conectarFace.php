<?php

	require_once 'facebook-php-sdk/src/facebook.php';

	function conectarFace(){

		$facebook = new Facebook(array(
	  	'appId'  => '165046886991554',
	  	'secret' => 'e9b1f761e0e26a5c08918708ef544401',
		));

		$user = $facebook->getUser();

		if ($user) {
		  try {
		    // Proceed knowing you have a logged in user who's authenticated.
		    $user_profile = $facebook->api('/me');
		  } catch (FacebookApiException $e) {
		    error_log($e);
		    $user = null;
		  }
		}

		// Login or logout url will be needed depending on current user state.
		if ($user) {
		  $logoutUrl = $facebook->getLogoutUrl();
		} else {
		  $loginUrl = $facebook->getLoginUrl();
		}

		// This call will always work since we are fetching public data.
		$naitik = $facebook->api('/naitik');

		return $user
	}

?>