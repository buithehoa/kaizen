class Todo < ActiveRecord::Base
  has_many :todos, :foreign_key => :parent_id
  belongs_to :todo_category

  scope :completed_today, :conditions => [ "DATE(completed_at) = ?", Date.today ], :group => :todo_category_id
end

