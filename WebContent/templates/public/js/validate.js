$(document).ready(function() {
	$("#signupForm1").validate({
		ignore: [], 
		debug: false,
		rules: {
			"username": {
				required: true,
				minlength: 5,
			},
			"password": {
				required: true,
				minlength: 6,
			},
			"repassword": {
				equalTo: "#password",
			},
			"fullname": {
				required: true,
			},
			"email": {
				required: true,
				email: true,
			},
			"reemail": {
				required: true,
				equalTo: "#email",
			},
			"phone": {
				required: true,
				maxlength: 11,
				minlength: 8,
				number: true,
			},
			"address": {
				required: true,
				maxlength: 90,
			},
		},
		messages: {
			"username": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				minlength: "Vui lĂ²ng nháº­p Ă­t nháº¥t 5 kĂ½ tá»±",
			},
			"password": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				minlength: "Vui lĂ²ng nháº­p Ă­t nháº¥t 6 kĂ½ tá»±",
			},
			"repassword": {
				equalTo: "Vui lĂ²ng nháº­p khá»›p vá»›i máº­t kháº©u á»Ÿ trĂªn",
			},
			"fullname": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
			},
			"email": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				email: "Vui lĂ²ng nháº­p Ä‘Ăºng Ä‘á»‹nh dáº¡ng email",
			},
			"reemail": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				equalTo: "Vui lĂ²ng nháº­p khá»›p vá»›i máº­t kháº©u á»Ÿ trĂªn",
			},
			"phone": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				maxlength: "Vui lĂ²ng nháº­p tá»‘i Ä‘a 11 kĂ½ tá»±",
				minlength: "Vui lĂ²ng nháº­p tá»‘i thiá»ƒu 8 kĂ½ tá»±",
				number: "Chá»‰ nháº­p chá»¯ sá»‘",
			},
			"address": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				maxlength: "Vui lĂ²ng nháº­p tá»‘i Ä‘a 90 kĂ½ tá»±",
			},
		}
	});

	$("#dangnhapph").validate({
		ignore: [], 
		debug: false,
		rules: {
			"username": {
				required: true,
				minlength: 5,
			},
			"password": {
				required: true,
				minlength: 6,
			},
		},
		messages: {
			"username": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				minlength: "Vui lĂ²ng nháº­p Ă­t nháº¥t 5 kĂ½ tá»±",
			},
			"password": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				minlength: "Vui lĂ²ng nháº­p Ă­t nháº¥t 6 kĂ½ tá»±",
			},
		}
	});

	$("#dangnhapgs").validate({
		ignore: [], 
		debug: false,
		rules: {
			"username": {
				required: true,
				minlength: 5,
			},
			"password": {
				required: true,
				minlength: 6,
			},
		},
		messages: {
			"username": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				minlength: "Vui lĂ²ng nháº­p Ă­t nháº¥t 5 kĂ½ tá»±",
			},
			"password": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				minlength: "Vui lĂ²ng nháº­p Ă­t nháº¥t 6 kĂ½ tá»±",
			},
		}
	});

	$("#formlienhe").validate({
		ignore: [], 
		debug: false,
		rules: {
			"username": {
				required: true,
				minlength: 5,
			},
			"email": {
				required: true,
				email: true,
			},
			"phone": {
				required: true,
				maxlength: 11,
				minlength: 8,
				number: true,
			},
			"noidung": {
				required: true,
				maxlength: 90,
			},
		},
		messages: {
			"username": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				minlength: "Vui lĂ²ng nháº­p Ă­t nháº¥t 5 kĂ½ tá»±",
			},
			"email": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				email: "Vui lĂ²ng nháº­p Ä‘Ăºng Ä‘á»‹nh dáº¡ng email",
			},
			"phone": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				maxlength: "Vui lĂ²ng nháº­p tá»‘i Ä‘a 11 kĂ½ tá»±",
				minlength: "Vui lĂ²ng nháº­p tá»‘i thiá»ƒu 8 kĂ½ tá»±",
				number: "Chá»‰ nháº­p chá»¯ sá»‘",
			},
			"noidung": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				maxlength: "Vui lĂ²ng nháº­p tá»‘i Ä‘a 90 kĂ½ tá»±",
			},
		}
	});

	$("#comment").validate({
		ignore: [], 
		debug: false,
		rules: {
			"fullname": {
				required: true,
				minlength: 5,
			},
			"emailcmt": {
				required: true,
				email: true,
			},
			"binhluanbv": {
				required: true,
				minlength: 6,
			},
		},
		messages: {
			"fullname": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				minlength: "Vui lĂ²ng nháº­p Ă­t nháº¥t 5 kĂ½ tá»±",
			},
			"emailcmt": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				email: "Vui lĂ²ng nháº­p Ä‘Ăºng Ä‘á»‹nh dáº¡ng email",
			},
			"binhluanbv": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				minlength: "Vui lĂ²ng nháº­p Ă­t nháº¥t 6 kĂ½ tá»±",
			},
		}
	});

	$("#commentgs").validate({
		ignore: [], 
		debug: false,
		rules: {
			"binhluan_gs": {
				required: true,
			},
		},
		messages: {
			"binhluan_gs": {
				required: "",
			},
		}
	});

	$("#sendMessage").validate({
		ignore: [], 
		debug: false,
		rules: {
			"noidung_chat": {
				required: true,
			},
		},
		messages: {
			"noidung_chat": {
				required: "",
			},
		}
	});

	$("#editinfo").validate({
		ignore: [], 
		debug: false,
		rules: {
			"fullname_ph": {
				required: true,
				minlength: 5,
			},
			"password_ph": {
				minlength: 6,
			},
			"repassword_ph": {
				equalTo: "#password_ph",
			},
			"mail_ph": {
				required: true,
				email: true,
			},
			"phone_ph": {
				required: true,
				maxlength: 11,
				minlength: 8,
				number: true,
			},
			"diachi_ph": {
				required: true,
				maxlength: 90,
			},
		},
		messages: {
			"fullname_ph": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				minlength: "Vui lĂ²ng nháº­p Ă­t nháº¥t 5 kĂ½ tá»±",
			},
			"password_ph": {
				minlength: "Vui lĂ²ng nháº­p Ă­t nháº¥t 6 kĂ½ tá»±",
			},
			"repassword_ph": {
				equalTo: "Vui lĂ²ng nháº­p khá»›p vá»›i máº­t kháº©u á»Ÿ trĂªn",
			},
			"fullname": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
			},
			"mail_ph": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				email: "Vui lĂ²ng nháº­p Ä‘Ăºng Ä‘á»‹nh dáº¡ng email",
			},
			"phone_ph": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				maxlength: "Vui lĂ²ng nháº­p tá»‘i Ä‘a 11 kĂ½ tá»±",
				minlength: "Vui lĂ²ng nháº­p tá»‘i thiá»ƒu 8 kĂ½ tá»±",
				number: "Chá»‰ nháº­p chá»¯ sá»‘",
			},
			"diachi_ph": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				maxlength: "Vui lĂ²ng nháº­p tá»‘i Ä‘a 90 kĂ½ tá»±",
			},
		}
	});

	$("#editprofile").validate({
		ignore: [], 
		debug: false,
		rules: {
			"fullname_gs": {
				required: true,
				minlength: 5,
			},
			"password_gs": {
				minlength: 6,
			},
			"repassword_gs": {
				equalTo: "#password_gs",
			},
			"mail_gs": {
				required: true,
				email: true,
			},
			"phone_gs": {
				required: true,
				maxlength: 11,
				minlength: 8,
				number: true,
			},
			"diachi_gs": {
				required: true,
				maxlength: 90,
			},
		},
		messages: {
			"fullname_gs": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				minlength: "Vui lĂ²ng nháº­p Ă­t nháº¥t 5 kĂ½ tá»±",
			},
			"password_gs": {
				minlength: "Vui lĂ²ng nháº­p Ă­t nháº¥t 6 kĂ½ tá»±",
			},
			"repassword_gs": {
				equalTo: "Vui lĂ²ng nháº­p khá»›p vá»›i máº­t kháº©u á»Ÿ trĂªn",
			},
			"fullname": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
			},
			"mail_gs": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				email: "Vui lĂ²ng nháº­p Ä‘Ăºng Ä‘á»‹nh dáº¡ng email",
			},
			"phone_gs": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				maxlength: "Vui lĂ²ng nháº­p tá»‘i Ä‘a 11 kĂ½ tá»±",
				minlength: "Vui lĂ²ng nháº­p tá»‘i thiá»ƒu 8 kĂ½ tá»±",
				number: "Chá»‰ nháº­p chá»¯ sá»‘",
			},
			"diachi_gs": {
				required: "Vui lĂ²ng nháº­p vĂ o Ä‘Ă¢y",
				maxlength: "Vui lĂ²ng nháº­p tá»‘i Ä‘a 90 kĂ½ tá»±",
			},
		}
	});
});	

