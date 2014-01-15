require 'spec_helper'

describe 'courses/index' do
  before(:each) do
    assign(:courses, [
      stub_model(Course,
        :designator => 'CSCI',
        :number => 208,
        :hidden => false,
        :disabled => false
      ),
      stub_model(Course,
        :designator => 'MATH',
        :number => 202,
        :hidden => true,
        :disabled => true
      )
    ])
  end

  it 'renders a list of courses' do
    render

    assert_select 'tr>td', :text => 'CSCI'.to_s, :count => 1
    assert_select 'tr>td', :text => 208.to_s, :count => 1
    assert_select 'tr>td', :text => 'MATH'.to_s, :count => 1
    assert_select 'tr>td', :text => 202.to_s, :count => 1

    assert_select 'input[type=checkbox]', count: 4
    assert_select 'input[type=submit]', count: 1
  end
end

