require('spec_helper')

describe(Project) do
  describe('#employees') do
    it('lists out the employees that belong to a project') do
      test_project = Project.create({:name => 'Create company website'})
      test_employee = Employee.create({:name => 'Bob Jones', :project_id => test_project.id()})
      test_employee2 = Employee.create({:name => 'Bucky Smith', :project_id => test_project.id()})
      expect(test_project.employees()).to(eq([test_employee, test_employee2]))
    end
  end
end
