class window.Task
  constructor: (id)->
    @id = id

  finish: ->
    $.ajax '/tasks/'+ @id,
      type: 'PUT'
      dataType: 'json'
      data:
        task:
          status_cd: '1'
      error: (jqXHR, textStatus, errorThrown) ->
        alert "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        alert "AJAX Error: #{textStatus}"
