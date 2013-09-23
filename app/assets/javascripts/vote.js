var set_listeners = function(){
  $('.upvote').on('click', increaseRating);
  $('.downvote').on('click', decreaseRating);
}

var increaseRating = function(e){
  var objectID = $(this).attr('id')
  var votableType = $(this).parent().parent().attr('class')

  $.ajax({
    url: '/votes/create',
    type: 'post',
    dataType: 'json',
    data: { objectID: objectID, vote: true, votableType: votableType }

  })
  .done(function(response){
    console.log(response.value)
    $(e.target).closest('.answer_box').find('.rating').html(response.value)
  })
}


var decreaseRating = function(e){
  var objectID = $(this).attr('id')
  var votableType = $(this).parent().parent().attr('class')

  $.ajax({
    url: '/votes/create',
    type: 'post',
    dataType: 'json',
    data: { objectID: objectID, vote: true, votableType: votableType }

  })
  .done(function(response){
    $(e.target).closest('.answer_box').find('.rating').html(response.value)
  })
}

$(document).ready(function(){
  set_listeners();
});

