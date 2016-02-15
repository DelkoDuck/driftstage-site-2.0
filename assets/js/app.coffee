

$(document).ready ->
    if $(window).width() > 768
        $.stellar({
            horizontalScrolling: false
            verticalScrolling: true
            hideDistantElements: false
            responsive: true
        })

    WebFont.load
        google:
            families: ['Roboto Condensed:300,400,700']
        active: ->
            $('.slabbed').slabText()

    $('#show-gifs').click (e) ->
        e.preventDefault()
        $('#gif').removeClass 'hidden'
        $('#webm').addClass 'hidden'
        $('#gif img').each ->
            img = $(this).attr('data-src')
            $(this).attr('src', img)

    $('#show-webms').click (e) ->
        e.preventDefault()
        $('#webm').removeClass 'hidden'
        $('#gif').addClass 'hidden'
