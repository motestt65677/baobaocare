$(document).on('turbolinks:load',function(){
  var message_content = document.getElementById("message_content");
  message_content.addEventListener("keyup", function(event) {
    var isScrolledToBottom = message_content.scrollHeight - message_content.clientHeight <= message_content.scrollTop + 1;
    if (event.keyCode === 13) {
      var objDiv = document.getElementById("messages-table");
      objDiv.scrollTop = objDiv.scrollHeight; 
    }
  }); 

})