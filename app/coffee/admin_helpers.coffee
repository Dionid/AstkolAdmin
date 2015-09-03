@findAncestor = (el, condition)->
    while el = el.parentElement
        if el.classList.contains(condition) or el.tagName == condition
            return el

Element.prototype.on = ( name, callback )->
    @addEventListener( name, callback, false )

    return @

Element.prototype.off = ( event, handler ) ->
    if @removeEventListener
        @removeEventListener event, handler
    else if @detachEvent
        @detachEvent "on #{event}", handler

    return @

@extend = (object, properties) ->
    object[key] = val for key, val of properties
    object

@cuopling_objs = (arr_first, arr_sec, condition) ->
    result = []
    arr_first = Array.prototype.slice.call arr_first
    arr_sec = Array.prototype.slice.call arr_sec
    for obj_first in arr_first
        if typeof obj_first == 'object'
            for obj_sec, index_sec in arr_sec
                if typeof obj_sec == 'object' && condition obj_first, obj_sec
                    couple =
                        first: obj_first
                        second: obj_sec
                    result.push couple
                    arr_sec.splice index_sec, 1
                    break
    return result


@getScrollbarWidth = ->
    outer = document.createElement 'div'
    outer.style.visibility = 'hidden'
    outer.style.width = '100px'
    outer.style.msOverflowStyle = 'scrollbar'
    # needed for WinJS apps
    document.body.appendChild outer
    widthNoScroll = outer.offsetWidth
    # force scrollbars
    outer.style.overflow = 'scroll'
    # add innerdiv
    inner = document.createElement 'div'
    inner.style.width = '100%'
    outer.appendChild inner
    widthWithScroll = inner.offsetWidth
    # remove divs
    outer.parentNode.removeChild outer
    widthNoScroll - widthWithScroll

@hasScrollBar = ->
    window.innerWidth > document.documentElement.clientWidth
