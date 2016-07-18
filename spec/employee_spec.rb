require('spec_helper')

describe(Employee) do
  it('tells which division it belongs to') do
    division = Division.create({:name => 'I.T.'})
    employee = Employee.create({:name => 'Mike', :division_id => division.id()})
    expect(employee.division()).to(eq(division))
  end
end
