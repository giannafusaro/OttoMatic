appl = Appliance.all
parts = Part.all
custs = Customer.all
addresses = Address.all
complaints = Complaint.all
trips = Trip.all
err = []
99.times do |i|
  i = i+1
  j = Job.create id: i
  j.save
  t = Trip.all.where(:job_id => i)[0]
  t.job = j
  t.complaints << Complaint.all.where(appliance_kind: appl[i].kind).sample(1)
  custs[i].addresses << addresses[i]
  custs[i].jobs << j
  j.appliances << appl[i]
  appl[i].parts << parts[i]
  err << j.errors.inspect
end
