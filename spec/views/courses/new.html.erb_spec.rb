require 'spec_helper'

describe '/courses/new', type: :feature do
  before { @course = Course.new }

  it 'renders the form for a new course' do
    render

    assert_select 'input[type=checkbox]', count: 2
    assert_select 'input[type=text]', count: 2
    assert_select 'input[type=submit]', count: 1
  end
end

