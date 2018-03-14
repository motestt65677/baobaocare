App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages-table').append '<div class="message">' +
        '<span class="message-user">' + data.username + ":" + '</span>' + ' '+
        '<span class="message-content">' + data.content + '</span>' + '</div>'



    $(document).on 'turbolinks:load', ->
      submit_message()
