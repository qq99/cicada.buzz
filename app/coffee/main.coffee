$ ->
  $cicadaAudio = $('#cicada-audio')
  cicadaAudioEl = $cicadaAudio[0]
  $cicadaSourceButtons = $(".js-cicada-source")

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
