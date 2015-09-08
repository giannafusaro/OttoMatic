class Trip < ActiveRecord::Base
  belongs_to :job
  belongs_to :technician
  has_and_belongs_to_many :complaints

  validates :technician, :job, :complaints, :time_taken, :summary, presence: true
  validates :time_taken, numericality: true
  after_save :sum_totals

  scope :angelo, -> { where(technician_id: 0) }
  scope :otto, -> { where(technician_id: 1) }
  scope :dave, -> { where(technician_id: 2) }

  

  # def sum_totals
  #   time = -10
  #   parts = 0
  #
  #   Trip.all.where(:job_id = this.job_id) do |trip|
  #     time += trip.time_taken
  #   end
  #
  #   Job.parts.each do |part|
  #     parts += part.price
  #   end
  #
  #   labor = (time * 1.25)
  #   total = labor + Job.trip_charge + total_parts
  #   tax = 0.09 * (total)
  #   total += tax
  # end

end
