var dai, onYouTubeIframeAPIReady;

dai = {
  videoId: 'WD627y_AvFs',
  width: 900,
  height: 550,
  player: false,
  i: function() {
    console.log('initiated');
    return dai.ytApi();
  },
  on: {
    ready: function(event) {
      return console.log('onReady');
    },
    statechange: function(event) {
      return console.log('onStateChange');
    }
  },
  ytApi: function() {
    var first, tag;
    tag = document.createElement('script');
    tag.src = 'https://www.youtube.com/iframe_api';
    tag.type = 'text/javascript';
    tag.async = true;
    first = document.getElementsByTagName('script')[0];
    return first.parentNode.insertBefore(tag, first);
  },
  ready: function(event) {
    return dai.player = new YT.Player('player', {
      width: dai.width,
      height: dai.height,
      videoId: dai.videoId,
      events: {
        onReady: dai.on.ready,
        onStateChange: dai.on.statechange
      },
      playerVars: {
        allowfullscreen: 0,
        modestbranding: 1,
        enablejsapi: 1,
        origin: false,
        version: 3,
        rel: 0,
        disablekb: 1,
        theme: 'dark',
        wmode: 'opaque'
      }
    });
  }
};

onYouTubeIframeAPIReady = function(event) {
  return setTimeout(function() {
    return dai.ready(event);
  }, 500);
};
