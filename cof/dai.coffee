dai =
  videoId: 'WD627y_AvFs'
  width: 900
  height: 550
  player: false

  i: ->
    console.log 'initiated'
    dai.ytApi()

  on:
    ready: (event) ->
      console.log 'onReady'

    statechange: (event) ->
      console.log 'onStateChange'

  ytApi: ->
    tag = document.createElement 'script'
    tag.src = 'https://www.youtube.com/iframe_api'
    tag.type = 'text/javascript'
    tag.async = true
    
    first = document.getElementsByTagName('script')[0]
    first.parentNode.insertBefore tag, first

  ready: (event) ->

    dai.player = new YT.Player 'player',

      width: dai.width
      height: dai.height
      videoId: dai.videoId
      events:
        onReady: dai.on.ready
        onStateChange: dai.on.statechange
      playerVars:
        allowfullscreen: 0
        modestbranding: 1
        enablejsapi: 1
        origin: false
        version: 3
        rel: 0
        disablekb: 1
        theme: 'dark'
        wmode: 'opaque'

onYouTubeIframeAPIReady = (event) ->
  setTimeout ->
    dai.ready(event)
  , 500

