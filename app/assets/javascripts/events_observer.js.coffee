#= require 'task'

jQuery(document).ready ->
  eventsObserver = new EventsObserver()

class EventsObserver
  constructor: ->
    @triggers = {
      taskFinish: '.task-finish'
    }
    @taskFinish()

  taskFinish: ->
    jQuery(@triggers.taskFinish).click ->
      taskId = jQuery(this).attr('data-task-id')
      task = new Task(taskId)
      task.finish()
