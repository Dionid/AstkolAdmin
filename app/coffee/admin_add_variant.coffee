# btn = document.querySelector '#add-variant-btn'
wr =  document.querySelector '#add-variant'

# console.log wr

if wr
    wr.onclick = (e)->
        target = e.target

        if target.tagName != 'BUTTON'
            return

        table = @.querySelector 'table'
        rowCount = table.rows.length

        if target.id == "add-variant-btn"
            row = table.insertRow(rowCount-1)
            cell1 = row.insertCell(0)
            cell1.innerHTML = "<input placeholder='Вариант' name='options[]'>"
            cell2 = row.insertCell(1)
            cell2.innerHTML = "<button title='Удалить' class='btn btn-red bold small delete-variant-btn'> У </button>"

        if target.classList.contains('delete-variant-btn')
            row = findAncestor target, 'TR'
            row.remove()
