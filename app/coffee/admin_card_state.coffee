card_states_arr = ['new', 'pending', 'notice', 'success', 'done', 'error', 'failed', 'cancelled']
status_selectors = document.querySelectorAll '.status-select'

if status_selectors
	for status_select in status_selectors
		status_select.addEventListener 'change', ()->
			state = @.value
			card = findAncestor @, 'card-state'
			for card_state in card_states_arr
				if card.classList.contains "card-state-#{card_state}"
					card.classList.remove "card-state-#{card_state}"
					break
			card.classList.add "card-state-#{state}"
