require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the update employee path', {:type => :feature}) do
  it('assings an employee to a division') do
    test_division = Division.create({name: 'H.R.'})
    test_employee = Employee.create({name: 'Mike Smith', division_id: nil})
    visit('/employees/' + test_employee.id().to_s())
    select (test_division.name())
    click_button('Assign Division')
    click_link(test_division.name())
    expect(page).to have_content(test_employee.name())
  end
end
