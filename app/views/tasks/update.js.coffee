$('#task_<%= @task.id %>').remove()
$("#<%= @task.active ? 'active' : 'done' %>-task-list").prepend('<%= j render(partial: "task", locals: {task: @task}) %>')
