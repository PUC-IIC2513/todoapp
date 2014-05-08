module ApplicationHelper

	def get_action_link(task)
		char = "✓"
		if task.done? 
			link_to char, task_mark_undone_path(task), remote: true
		else 
			link_to char, task_mark_done_path(task), remote: true
		end
	end
end
