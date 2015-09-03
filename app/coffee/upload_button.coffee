document.addEventListener 'DOMContentLoaded', ->
    upload_button = document.getElementById('uploadButton')
    upload_file = document.getElementById('uploadFile')
    wr = document.getElementById 'upload-wr'
    add_btn = document.getElementById 'add_picture'

    iterator = 0

    create_upload_el = ()->
        iterator++
        upload_wr = document.createElement 'div'
        upload_wr.classList.add 'sb-ud-100'
        upload_wr.innerHTML = "
                      <div id='uploadFile#{iterator}' class='upload-text'>Выберите файл</div>
                      <div class='upload-btn-wr btn btn-blue outline'><span>Upload</span>
                        <input type='file' id='uploadButton#{iterator}' class='upload-input'>
                      </div>"
        upload_wr_file = upload_wr.querySelector "#uploadFile#{iterator}"
        upload_wr_btn = upload_wr.querySelector "#uploadButton#{iterator}"

        make_upload_button upload_wr_btn, upload_wr_file

        return upload_wr

    make_upload_button = (btn, input)->
        if btn
            btn.onchange = ->
                input.innerHTML = @value

            input.onclick = ->
                btn.click()

    make_upload_button upload_button, upload_file

    if add_btn
        add_btn.on 'click', ()->
            new_el = create_upload_el()
            wr.appendChild new_el

    # class Upload
    #     constructor: (@btn_id, @file_id, @add_upload_btn)->
    #         @iterator = 0
    #
    #     make_upload_button: (btn, file)->
    #         if btn
    #             btn.onchange = ->
    #                 file.innerHTML = @value
    #
    #             file.onclick = ->
    #                 btn.click()
    #
    #     create_upload_el: ()->
    #         @iterator++
    #         upload_wr = document.createElement 'div'
    #         upload_wr.classList.add 'sb-ud-100'
    #         upload_wr.innerHTML = "
    #                       <div id='uploadFile#{iterator}' class='upload-text'>Выберите файл</div>
    #                       <div class='upload-btn-wr btn btn-blue outline'><span>Upload</span>
    #                         <input type='file' id='uploadButton#{iterator}' class='upload-input'>
    #                       </div>"
    #         upload_wr_file = upload_wr.querySelector "#uploadFile#{iterator}"
    #         upload_wr_btn = upload_wr.querySelector "#uploadButton#{iterator}"
    #
    #         @make_upload_button upload_wr_btn, upload_wr_file
    #
    #         return upload_wr
    #
    # upload_b = new Upload

    # if upload_button
    #     upload_button.onchange = ->
    #         document.getElementById('uploadFile').innerHTML = @value
    #
    #     upload_file.onclick = ->
    #         document.getElementById('uploadButton').click()
, false
