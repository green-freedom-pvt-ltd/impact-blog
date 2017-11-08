$(document).on 'turbolinks:load', ->
  window.error_modal=(error) ->
    error_modal = $('#errorModal')
    error_modal.html('<i class="fa fa-exclamation-triangle"></i>'+error).fadeIn('fast').delay(2000).fadeOut('slow');
    return
  $("#subscribe").click (e) ->
    $.ajax
      type: 'POST'
      dataType: 'json'
      url: '/leads.json'
      data: {lead: {email: $("#subscriber_email").val()}}
      success: (data) ->
        error_modal("You have successfully subscribed for updates from REDESYN")
      error: (XMLHttpRequest, textStatus, errorThrown) ->
        text = XMLHttpRequest.responseText.replace("{","").replace("}", "").replace(/\[/g,"").replace(/\],/g,"<br>").replace(/\]/g,"").replace(/"/g," ")
        error_modal(text)
        return
    return
  return