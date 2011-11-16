//= require jquery
//= require_tree .

$(function() {
  $.livequery.registerPlugin("tablesorter", "tablesorterPager");

  $('.mail a.html').livequery(function() {
    console.log(this);
    $(this).colorbox({width:"80%", height:"80%", iframe:true});
  });

  $('.mail a.raw').live('click', function(){
    $.get($(this).attr('href'), function(data){
      $('#raw').text(data);
    });
    return false;
  });

  $("table").tablesorter({
    widthFixed: true,
    sortList: [[3, 1]]
  }).tablesorterPager({
    container: $("#pager")
  });

  var fix_top = parseInt($('#pager').css('top'), 10) + 60 + 'px';
  $('#raw').css('position', 'absolute');
  $('#raw').css('top', fix_top);
});
