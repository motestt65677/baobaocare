App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    console.log($("#messages-table").data("user-name"))


    if (data.username == $("#messages-table").data("user-name")){
      $('#messages-table').append('<div class="comments_box" style="text-align:right">' + '<span>' + '</span>' + ' ' + '<span class= "comments badge badge-pill badge-info">' + data.content + '</span>' + '</div>');
    }else{
      if ($("#messages-table").data("user-type") == "Mother"){
        $('#messages-table').append(
          '<div class="comments_box">' + 
            '<img class="message_icon" src="/assets/doctor_icon-bd9762496e7fdd20d6979dbb0822e48692daa7ceab29cc98690038b5e0681710.png" alt="Doctor icon">'+
            '<strong>' + 
              '<span>' + 
                  "Dr." + data.username + 
              '</span>' + 
            '</strong>' + 
            ' ' + 
            '<span class= "comments badge badge-pill badge-info">' + data.content + 
            '</span>' + 
          '</div>');

      }else{
        $('#messages-table').append(
          '<div class="comments_box">' + 
            '<img class="message_icon" src="/assets/family_icon-592ac37f014edba00323b7d0fa74b0dceb94f73e0c3f861f7e69a1942ae82e23.png" alt="Family icon">'+
            '<strong>' + 
              '<span>' + 
                  "Ms." + data.username + 
              '</span>' + 
            '</strong>' + 
            ' ' + 
            '<span class= "comments badge badge-pill badge-info">' + data.content + 
            '</span>' + 
          '</div>');
      }


    }





    var objDiv = document.getElementById("messages-table");
    objDiv.scrollTop = objDiv.scrollHeight; 
    message_content.value = ""

  }
});