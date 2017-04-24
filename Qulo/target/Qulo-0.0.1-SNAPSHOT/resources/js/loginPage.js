$(document).ready(function() {
	$("#register-form").fadeOut(0);
    $('#login-form-link').click(function(e) {
		$("#login-form").delay(100).fadeIn(100);
 		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#login-form").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#signup-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#login-form").fadeOut(100);
 		$("#register-form-link").addClass("active");
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	
	$('#login-submit').click(function(e) {
		if ($('#username').val() == '' || $('#password').val() == ''){
			$( "#loginErrorDiv" ).append( "<p>User name or password is not filled.</p>" );
			$( '#loginDatabaseError').hide();
			event.preventDefault();
		}
		if ($('#username').val() == ''){
			$('#username').css('border-color', 'red');
		}else{
			$('#username').css('border-color', '');
		}
		if ($('#password').val() == ''){
			$('#password').css('border-color', 'red');
		}else{
			$('#password').css('border-color', '');
		}
		
	});
	
	$('#register-submit').click(function(e) {
		$( '#errorPassword').hide();
		for (i = 1; i <= 12; i++) {
			if ($('#register'+i).val() == ''){
				$('#register'+i).css('border-color', 'red');
				event.preventDefault();
			}else{
				$('#register'+i).css('border-color', '');
			}
			if(i == 11){
				
				
				var age = 18;
				var limitAge = new Date();
				limitAge.setFullYear( limitAge.getFullYear() - age );
				var currdate = new Date($('#register'+i).val());
				if(currdate > limitAge){
					
					$( "#register11" ).after("<p id=errorPassword style=color:red>Must be over 18 years of age to register</p>");
				}
			}
		}
		if ($('#register4').val() != $('#register5').val()){
			$( "#register5" ).after("<p id=errorPassword style=color:red>Password and confirm password does not match</p>");
		}
	});

});
window.setInterval(function() {
	var originalQuin = document.getElementById("Quin").src;
	var indexQuin = originalQuin.lastIndexOf("/");
	var newFileQuin = originalQuin.substr(0,indexQuin);
	document.getElementById("Quin").src = newFileQuin + "/MaleQuloM.gif";
	
	var originalLori = document.getElementById("Lori").src;
	var indexLori = originalLori.lastIndexOf("/");
	var newFileLori = originalLori.substr(0,indexLori);
	document.getElementById("Lori").src = newFileLori + "/FemaleQuloM.gif";
	setTimeout(function(){
		document.getElementById("Quin").src = originalQuin;
		document.getElementById("Lori").src = originalLori;
	},1000); 
}, 1000);

