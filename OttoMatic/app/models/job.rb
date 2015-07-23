class Job < ActiveRecord::Base
  state_machine :state, :initial => :requested do
      event :leave_message do
        transition [:unvisited_pending, :visited_pending] => :lmor
      end
      event :schedule do
        transition [:parts_pending, :lmor] => :scheduled
      end
      event :receive_payment do
        transition [:complete] => :paid
      end
      event :schedule do
        transition [:unvisited_pending, :visited_pending, :lmor] => :scheduled
      end

  end
end
