require('spec_helper')

describe(Division) do
  it("ensures the length of a divisions name is at most 50 characters and is not an empty string") do
    task = Division.new({:name => "a".*(51)})
    expect(task.save()).to(eq(false))
  end
  describe('#employees') do
    it('lists the employees that belong to a division') do
      test_division = Division.create({:name => 'HR'})
      test_employee = Employee.create({:name => 'Mike Smith', :division_id => test_division.id})
      test_employee2 = Employee.create({:name => 'Joey Roo', :division_id => test_division.id})
      expect(test_division.employees()).to(eq([test_employee, test_employee2]))
    end
  end
end
