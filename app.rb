require('sinatra/activerecord')
require('./lib/employee')
require('./lib/division')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pg')

get('/') do
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

post('/divisions') do
  name = params.fetch('name')
  @division = Division.create({:name => name})
  redirect to('/')
end

get('/divisions/:id') do
  @division = Division.find(params.fetch('id').to_i())
  @division_employees = @division.employees()
  erb(:division)
end

get('/divisions/:id/edit') do
  @division = Division.find(params['id'].to_i())
  erb(:edit_division_form)
end

patch('/divisions/:id') do
  name = params['name']
  @division = Division.find(params['id'].to_i)
  @division.update({name: name})
  redirect to('/')
end

delete('/divisions/:id') do
  division = Division.find(params['id'].to_i)
  division.delete()
  redirect to('/')
end

post('/employees') do
  name = params.fetch('employee_name')
  @employee = Employee.create({:name => name})
  redirect to('/')
end

get('/employees/:id') do
  @employee = Employee.find(params['id'].to_i)
  @divisions = Division.all()
  erb(:employee)
end

patch('/employees/:id') do
  employee = Employee.find(params['id'].to_i)
  division_id = params['division_id']
  employee.update({division_id: division_id})
  @employee = Employee.find(params['id'].to_i)
  @divisions = Division.all()
  redirect to ('/')
  # division = Division.find(params['division_id'].to_i)
  # employee_id = params['id'].to_i()
end
