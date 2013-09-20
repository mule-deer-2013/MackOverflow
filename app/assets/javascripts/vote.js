var set_listeners = function(){
  $('.upvote').on('click', increaseRating);
  $('.downvote').on('click', decreaseRating);
}

var increaseRating = function(){
  var questionId = $(this).attr('id')
  $.ajax({
    url: '/votes/create',
    type: 'post',
    data: JSON.stringify({questionId : questionId, vote : false })

  })
}


var decreaseRating = function(){
  alert("clicked decreaseRating");
  var questionId = $(this).attr('id')
  $.ajax({
    url: '/votes/create',
    type: 'post',
    data: JSON.stringify({questionId : questionId, vote : true })

  })
}

$(document).ready(function(){
  set_listeners();
});