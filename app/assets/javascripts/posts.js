newPost=()=>{
	$('#New_post_button').on('click', function() {
		$('#new_p').slideToggle();
	});
}

window.addEventListener('load',newPost)
