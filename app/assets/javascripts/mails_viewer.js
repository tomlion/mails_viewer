//= require jquery
//= require_tree .

$(function() {
  $("table").tablesorter({
    widthFixed: true,
    sortList: [[3, 1]]
  }).tablesorterPager({
    container: $("#pager")
  });

  $('.mail a.html').colorbox({width:"80%", height:"80%", iframe:true});
  $('.mail a.raw').click(function(){
    $.get($(this).attr('href'), function(data){
      $('#raw').text(data);
    });
    return false;
  });

});
