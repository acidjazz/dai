dai =
  videoId: 'WD627y_AvFs'
  width: 900
  height: 540
  player: false
  ticker: false
  outer: false
  colors: ['black','blue','white','red','grey','turq','mist','green','straw', 'yellow', 'greenblack']
  slots:
    '0-5': 'white'
    '5-18': 'black'
    '18-23': 'red'
    '23-29': 'black'
    '29-34': 'straw'
    '34-37': 'turq'
    '37-39': 'mist'
    '39-49': 'black'
    '49-54': 'green'
    '54-64': 'black'
    '64-73': 'white'
    '73-80': 'straw'
    '80-84': 'black'
    '84-86': 'green'
    '86-91': 'black'
    '91-92': 'red'
    '93-96': 'black'
    '96-97': 'yellow'
    '97-98': 'black'
    '98-99': 'green'

    '99-104': 'black'
    '104-106': 'blue'
    '106-118.5': 'black'
    '118.5-120': 'greenblack'
    '122-130': 'black'

  i: ->
    console.log 'initiated'
    dai.ytApi()
    dai.ticker = setInterval dai.update, 250
    dai.outer = $ 'body'

      
  on:
    ready: (event) ->
      console.log 'onReady'
      dai.player.playVideo()

    statechange: (event) ->
      console.log 'onStateChange'

  update: ->
    return true if !dai.player or typeof dai.player.getCurrentTime isnt 'function'
    time = dai.player.getCurrentTime()
    console.log time

    for range, color of dai.slots
      ranges = range.split('-')
      if time > parseFloat(ranges[0]) and time < parseFloat(ranges[1])
        console.log ranges
        dai.color color
        return true

  color: (color) ->
    dai.outer.removeClass col for col in dai.colors
    dai.outer.addClass color


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

