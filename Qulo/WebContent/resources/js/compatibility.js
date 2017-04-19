$(document).ready(function() {
	var curr_div = 0;
	var platform;

	$('#next').on('click', function() {

		$(".errorMsg").hide();
		$(".opening").hide();
		temp = curr_div + 1;

		 if (temp > 1) {
		 if ($('#options' + temp).val() == '') {
		 $(".errorMsg").show();
		 return false;
		 }
		 }
		if (curr_div == 14) {

			$('#next').hide();
			$('#submit').show();
		}

		if (curr_div == 0 || curr_div < 15 || platform != null) {

			$('#previous').show();
			$('#filler').hide();

			$('#question' + curr_div).hide();
			$('#answer' + curr_div).hide();

			curr_div = curr_div + 1;
			console.log(curr_div);
			$('#question' + curr_div).show();
			$('#answer'+ curr_div).show();
		}

		else {
			$(".errorMsg").show();
		}
		if (curr_div == 1) {

			$('#previous').hide();

		}

		platform = null;
	});

	$('#previous').on('click', function() {

		$(".errorMsg").hide();
		if (curr_div == 1) {

			$('#previous').hide();

		}
		if (curr_div == 2) {

			$('#previous').hide();

		}
		if (curr_div != 16) {

			$('#next').show();
			$('#submit').hide();
		}

		if (curr_div > 0 || platform != null) {

			$('#question' + curr_div).hide();
			curr_div = curr_div - 1;

			$('#question' + curr_div).show();

		}

		else {

			$(".errorMsg").show();

		}

	});
	// $('#submit').on('click', function(e) {
	// $(".errorMsg").hide();
	// if ($('#options15').val() == '') {
	// $(".errorMsg").show();
	// event.preventDefault();
	//		}
	//	});

});