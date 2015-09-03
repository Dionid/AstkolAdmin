class Input_type_switcher
    defaults =
        switcher_els: document.getElementsByClassName 'input-type-switcher'
        input_types: {
            'text': '<textarea>Пример показа</textarea>'
            'numbers': "<input type='number' placeholder='Пример показа'>"
            'list': "<table class='table stripped'>
            <tr>
                <th>Вариант</th>
                <th>Редактировать</th>
            </tr>
            <tr>
                <td><button class='btn btn-slate-blue bold small' type='button' title='Добавить'>+</button>
                <td></td>
            </tr>
            </table>
            "
        }
        switcher_targets: document.getElementsByClassName 'input-type-switcher-target'

    constructor: ( params = {} )->
        @settings = extend (extend {}, defaults), params
        @settings.couples = cuopling_objs @settings.switcher_els, @settings.switcher_targets, (first, sec)-> first.getAttribute("data-switcher") == sec.getAttribute("data-switcher")
        @init()

    init: ()->
        self = @
        if @settings.couples
            for couple in @settings.couples
                couple.first_old_value = couple.first.value
                couple.first.on 'change', ()->
                    if confirm 'Вы уверены? Это удалит существующие варианты'
                        for type, type_inner of self.settings.input_types
                            if @value == type
                                couple.second.innerHTML = type_inner
                    else
                        @value = couple.first_old_value

document.addEventListener 'DOMContentLoaded', ->
    new Input_type_switcher()
, false
