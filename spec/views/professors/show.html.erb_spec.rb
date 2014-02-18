require 'spec_helper'

describe 'professors/show' do
  before(:each) do
    @professor = assign(:professor, stub_model(Professor,
      name: 'bob',
      email: 'foo@example.com',
      identifier: 'abc'
    ))
  end

  it 'renders attributes in <p>' do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/bob/)
    rendered.should match(/foo@example\.com/)
  end
end
