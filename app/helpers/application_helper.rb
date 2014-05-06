module ApplicationHelper

	def get_action_link(task) 
		if task.done? 
			link_to "✔", task_mark_undone_path(task)
		else 
			link_to "✔", task_mark_done_path(task)
		end
	end
end
