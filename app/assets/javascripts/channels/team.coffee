App.team = App.cable.subscriptions.create "TeamChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
   $('#rooms').append data['message']

  speak: (message,team_id) ->
    @perform 'speak', message: message,  team_id: team_id


$(document).on 'keypress', (event) ->
  team_id = $("#data").attr('data-team')
  message = $("#data").val()
  if event.keyCode is 13
    App.team.speak message , team_id
    event.target.value = ''
    event.preventDefault()
