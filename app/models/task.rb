class Task < ActiveRecord::Base

	validates_presence_of :title

	def done?
		self.completed != nil
	end

	def mark_done
		self.completed = Time.now
		self.save
	end

	def mark_undone
		self.completed = nil
		self.save
	end
end
