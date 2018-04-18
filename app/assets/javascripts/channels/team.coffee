
App.team = App.cable.subscriptions.create "TeamChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
   $('#messages').append data['message']

  speak: (message,team_id) ->
    @perform 'speak', message: message,  team_id: team_id

$(document).on 'keypress', '[data-behavior~=team_speaker]', (event) -> 
  team_id = $('#data').attr('data-team')
	if event.keyCode is 13 #return = send
		App.team.speak event.target.value
		event.target.value = ''
		event.preventDefault()