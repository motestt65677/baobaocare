$(document).on('turbolinks:load',function(){
  var message_content = document.getElementById("message_content");
  message_content.addEventListener("keyup", function(event) {


    if (event.keyCode === 13) {
      var objDiv = document.getElementById("messages-table");
      objDiv.scrollTop = objDiv.scrollHeight; 
      message_content.value = ""
    }
  }); 

})