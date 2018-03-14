App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    console.log($("#messages-table").data("user-name"))
    if (data.username == $("#messages-table").data("user-name")){
      return $('#messages-table').append('<div class="comments_box" style="text-align:right">' + '<span>' + '</span>' + ' ' + '<span class= "comments badge badge-pill badge-info">' + data.content + '</span>' + '</div>');
    }else{
      if ($("#messages-table").data("user-type") == "Mother"){
        return $('#messages-table').append('<div class="comments_box">' + '<span>' + "Dr." + data.username + ":" + '</span>' + ' ' + '<span class= "comments badge badge-pill badge-info">' + data.content + '</span>' + '</div>');

      }else{
        return $('#messages-table').append('<div class="comments_box">' + '<span>' + "Ms." + data.username + ":" + '</span>' + ' ' + '<span class= "comments badge badge-pill badge-info">' + data.content + '</span>' + '</div>');
      }


    }

  }
});