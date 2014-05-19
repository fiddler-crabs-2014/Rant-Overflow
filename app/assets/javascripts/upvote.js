$(document).on('ready page:load', function () {

  $('#upvote').on('submit', function(event) {
    event.preventDefault();
    var vote_info = $( this ).serialize();

    $.ajax({
      url: '/rants/up_vote',
      type: 'post',
      data: vote_info,
      dataType: 'json'
    }).success( function(response) {
      $('.rant_vote_count').html(response.vote_count);
    }).fail( function() {
      alert('unable to upvote (sry)');
    });
  });

  $('#downvote').on('submit', function(event) {
    event.preventDefault();
    var vote_info = $( this ).serialize();

    $.ajax({
      url: '/rants/down_vote',
      type: 'post',
      data: vote_info,
      dataType: 'json'
    }).success( function(response) {
      $('.rant_vote_count').html(response.vote_count);
    }).fail( function() {
      alert('unable to downvote (sry)');
    });
  });

});
