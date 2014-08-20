

$(document).ready ->
    if $(window).width() > 768
        $.stellar({
            horizontalScrolling: false
            verticalScrolling: true
            hideDistantElements: false
        })

    WebFont.load
        google:
            families: ['Roboto:300,400,700,900']
        active: ->
            $('.slabbed').slabText()

    $('#show-gifs').click (e) ->
        e.preventDefault()
        $('#gif').removeClass 'hidden'
        $('#webm').addClass 'hidden'

    $('#show-webms').click (e) ->
        e.preventDefault()
        $('#webm').removeClass 'hidden'
        $('#gif').addClass 'hidden'
