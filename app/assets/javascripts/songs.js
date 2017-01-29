$(document).ready(function() {
  $('.destroy').bind('click', deleteSong)
});

function deleteSong() {
    // this.preventDefault();
    songId = $(this).parent().data('song');
    $.ajax({
      url: '/artists/' + $('h1').data('artist') + '/songs/' + songId + ".json",
      type: 'DELETE',
      contentType: "application/json",
      dataType: "json"
    })
      // .done(function()
      .done(function(data) {
        $('tr[data-song="' + songId + '"]').remove();
        data.message;
    });
}
