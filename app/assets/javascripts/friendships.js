addAutocomplete=()=>{
	$('#friendSearch').autocomplete({
		source:"/friendships/findFriends",
		minLength:2,
		select: (event, ui)=>{
			console.log(ui.item.value + ' ' + ui.item.id)
		}
	})
}

window.addEventListener('load',addAutocomplete);