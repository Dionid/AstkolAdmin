button = document.getElementById('search_extended')
search_panel = document.getElementsByClassName('search-form')
close_btn = document.getElementById('search_close')

collapse = ()->
	search_panel[0].classList.add 'small'
	search_panel[0].classList.remove 'large'

extende = ()->
	button.off('click').on 'click', ()->
		search_panel[0].classList.remove 'small'
		search_panel[0].classList.add 'large'
		button.off('click').on 'click', ()->
			do collapse
			do extende

if button

	do extende

	close_btn.on 'click', ()->
		do collapse
		do extende
