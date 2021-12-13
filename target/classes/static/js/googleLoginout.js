function onSignIn() {
	var auth2 = gapi.auth2.getAuthInstance();

	if (auth2.isSignedIn.get()) {
		var profile = auth2.currentUser.get().getBasicProfile();
		/* console.log('Name: ' + profile.getName());
		console.log('Email: ' + profile.getEmail());
		console.log('profile: '+ profile.getImageUrl()); */

		$('input[id=googleName]').val(profile.getName());
		$('input[id=googleEmail]').val(profile.getEmail());
		$('input[id=googleProfile]').val(profile.getImageUrl());
		$('#loginGoogle').submit();
	}
}

function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function() {
		console.log('User signed out.');
	});
}