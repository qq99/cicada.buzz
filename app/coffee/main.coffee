$ ->
  $cicadaAudio = $('#cicada-audio')
  cicadaAudioEl = $cicadaAudio[0]
  $cicadaSourceButtons = $(".js-cicada-source")

  # random facts:
  showRandomFact = ->
    $facts = $(".fact:not(:visible)")
    randomFactIndex = parseInt(Math.random() * $facts.length, 0)
    $(".fact").css("display", "none")
    $($facts[randomFactIndex]).css("display", "block")

  showRandomFact()

  # specific play button
  $(".js-cicada-source").on "click", (ev) ->
    $target = $(ev.currentTarget)
    src = $target.data("track")
    $cicadaSourceButtons.removeClass('active')

    if cicadaAudioEl.src.indexOf(src) == -1
      cicadaAudioEl.src = src;

    if cicadaAudioEl.paused
      $target.addClass('active');
      cicadaAudioEl.play()
    else
      cicadaAudioEl.pause()

  # shuffle button
  $shuffleButton = $(".js-cicada-shuffle")
  $shuffleButton.on "click", (ev) ->
    $target = $(ev.currentTarget)
    $inactiveCicadaSources = $(".js-cicada-source:not(.active)")
    randomButtonIndex = parseInt(Math.random() * $inactiveCicadaSources.length, 0)
    $($inactiveCicadaSources[randomButtonIndex]).trigger("click")

  # fun fact rotation
  window.factInterval = setInterval ->
    showRandomFact()
  , 15000
