var set_listeners = function(){
  $('.upvote').on('click', increaseRating);
  $('.downvote').on('click', decreaseRating);
}

var increaseRating = function(e){
  var questionId = $(this).attr('id')
  $.ajax({
    url: '/votes/create',
    type: 'post',
    dataType: 'json',
    data: { questionId: questionId, vote: true }

  })
  .done(function(response){
    console.log(response.value)
    $(e.target).closest('.answer_box').find('.rating').html(response.value)
  })
}


var decreaseRating = function(e){
  var questionId = $(this).attr('id')
  $.ajax({
    url: '/votes/create',
    type: 'post',
    dataType: 'json',
    data: { questionId: questionId, vote: false }

  })
  .done(function(response){
    $(e.target).closest('.answer_box').find('.rating').html(response.value)
  })
}

$(document).ready(function(){
  set_listeners();
});

