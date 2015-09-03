class MultipleSelect
    constructor: () ->
        selects = document.querySelectorAll 'select[multiple]'
        @make select for select in selects
        @events()

    make: (select) ->
        container = document.createElement 'div'
        container.className = 'multiple-select-container'

        button = document.createElement 'button'
        button.className = 'multiple-select-button'
        button.setAttribute 'type', 'button'

        custom = document.createElement 'ul'
        custom.className = 'multiple-select'
        select.style.display = 'none'

        container.appendChild button
        container.appendChild custom
        select.parentNode.insertBefore container, select

        custom.appendChild @createOption(option, select.getAttribute 'name') for option in select
        loadActiveOptions container

    createOption: (option, name) ->
        new_option = document.createElement 'li'
        label = document.createElement 'label'
        checkbox = document.createElement 'input'
        checkbox.setAttribute 'type', 'checkbox'
        checkbox.setAttribute 'name', name
        checkbox.value = option.value

        if option.getAttribute('disabled') isnt null
            checkbox.setAttribute 'disabled', 'disabled'
            new_option.setAttribute 'class', 'disabled'

        if option.classList.contains 'child'
            new_option.classList.add 'child'

        checkbox.setAttribute 'checked', 'checked' if option.getAttribute('selected') isnt null

        span = document.createElement 'span'
        span.innerHTML = option.text

        label.appendChild checkbox
        label.appendChild span
        new_option.appendChild label
        new_option

    events: () ->
        buttons = document.getElementsByClassName('multiple-select-button')
        for button in buttons
            button.onclick = -> @parentNode.classList.toggle 'active'

        inputs = document.querySelectorAll('.multiple-select input[type="checkbox"]')
        for input in inputs
            input.onchange = -> loadActiveOptions(@parentNode.parentNode.parentNode.parentNode)


        containers = document.getElementsByClassName('multiple-select-container')
        all_elements = []

        recurseAndAdd = (ellements, arr)->
            for el in ellements
                arr.push(el) if el.nodeType == 1
                children = el.childNodes
                if children
                    recurseAndAdd(children, arr)

        recurseAndAdd containers, all_elements

        document.addEventListener 'click', (e)->
            not_equal = all_elements.every (el)->
                return el != e.target
            if not_equal
                for container in containers
                    container.classList.remove 'active'


    loadActiveOptions = (select_container) ->
        text = []

        for checkbox in select_container.querySelectorAll 'input[type="checkbox"]'
            if checkbox.checked
                text.push checkbox.parentNode.getElementsByTagName('span')[0].innerHTML

        for button in select_container.getElementsByClassName('multiple-select-button')
            button.innerHTML = text.join(', ')


document.addEventListener 'DOMContentLoaded', ->
    scroller = new MultipleSelect()
, false
