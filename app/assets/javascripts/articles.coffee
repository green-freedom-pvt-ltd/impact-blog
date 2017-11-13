# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('.text_box').froalaEditor();
  $('.shareBtn').click ->
    $('#modal').css('borderWidth',"0") if /AppName\/[0-9\.]+$/.test(navigator.userAgent)
    title = $(this).attr("title")
    link_address = $('.modal-body').attr("domain")+$(this).attr("url")
    $('.share_list li').each ->
      $(this).children('a').attr('href', $(this).attr('url')+link_address+'&linkname='+title)
      return
    $('#shareModal').modal('show')
    return

  $(window).resize ->
    resize_box()
    return

  resize_box = () ->
    width = if $(".bannerImageContainer").width() < 700 then $(".bannerImageContainer").width() - 20 else 700
    height = (width*9)/14
    $('.bannerImage').css("height",height)
    $('.bannerImage').css("width",width)
    return
  for_android_web_view = () ->
    if navigator.userAgent.includes('Dalvik')
      $('#full_footer').hide();
      $('#m_full_footer').hide();
  resize_box()
  for_android_web_view()
  return