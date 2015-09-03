btn = document.querySelector '#add-product'
close_btn = document.querySelector '#close-modal'
modal_wr = document.querySelector '.modal-window-wr'

if close_btn
	close_btn.off('click').on 'click', ()->
		modal_wr.classList.add 'deactivated'

	btn.off('click').on 'click', (e)->
		modal_wr.classList.remove 'deactivated'

	modal_wr.off('click').on 'click', (e)->
		if e.target == modal_wr
			@classList.add 'deactivated'

	document.onkeydown = (e)->
		evt = e || window.event
		if evt.keyCode == 27
			modal_wr.classList.add 'deactivated'
