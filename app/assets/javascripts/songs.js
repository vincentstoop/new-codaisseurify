$(document).on('turbolinks:load', function() {
  $('.destroy').bind('click', deleteSong);
  $("form").bind('submit', submitSong);
  $('#delete_all_songs').bind('click', deleteAllSongs);
});

function deleteAllSongs() {
    var artistId = $('h1').data('artist');
    $.ajax({
      url: '/artist/' + artistId + '/delete_all_songs.json',
      type: 'DELETE',
      contentType: "application/json",
      dataType: "json"
    })
    .done(function(data) {
      $('tr[data-song]').remove();
      data.message;
    });
}

function deleteSong() {
    // this.preventDefault();
    var songId = $(this).parent().data('song');
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

function submitSong(event) {
  event.preventDefault();
  createSong($("#input_title").val(), $("#input_year").val());
  $("#input_title").val(null);
  $("#input_year").val(null);
}

function createSong(title, year) {
  var newSong = { title: title, year: year };

  $.ajax({
    type: "POST",
    url: "/artists/" + $('h1').data('artist') + "/songs.json",
    data: JSON.stringify({
        song: newSong
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function() {
    var titleCol = $('<td></td>')
      .html(title);

    var yearCol = $('<td></td>')
      .html(year);

    var deleteText = $('<td></td>')
      .attr('class', 'destroy')
      .html('"Delete song"');

    var tableRow = $('<tr data-song></tr>')
      .append(titleCol)
      .append(yearCol)
      .append(deleteText);

    $("#songList").append( tableRow );
  })
  .fail(function(error) {
    console.log(error);
  });;

}
