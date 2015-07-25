class Job < ActiveRecord::Base
  has_many :trips
  belongs_to :customer
  has_and_belongs_to_many :appliances
  state_machine :state, :initial => :requested do
      event :leave_message do
        transition [:parts_pending] => :lmor
      end
      event :schedule do
        transition [:parts_pending, :lmor] => :scheduled
      end
      event :complete_job do
        transition [:scheduled] => :completed
      end

      # state :requested do
      #
      # end
      # state :parts_pending do
      #
      # end
      # state :lmor do
      #
      # end
      # state :scheduled do
      #
      # end
      # state :completed do
      #
      # end
      state_machine :alarm_state, :initial => :active, :namespace => 'alarm' do
        event :enable do
          transition all => :active
        end

        event :disable do
          transition all => :off
        end

        state :active, :value => 1
        state :off, :value => 0
      end

      def initialize
        super()
      end
  end
end
