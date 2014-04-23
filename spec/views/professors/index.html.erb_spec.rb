require 'spec_helper'

describe 'professors/index' do
  before(:each) do
    view.stub(:sortable).and_return('')
    view.stub(:will_paginate).and_return('')
    assign(:professors, [
      stub_model(Professor,
        name: 'Name',
        email: 'addr',
        identifier: 'abc'
      ),
      stub_model(Professor,
        name: 'Name',
        email: 'addr',
        identifier: 'abc'
      )
    ])
  end

  it 'renders a list of professors' do
    render

    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    rendered.should match(/addr#{ EMAIL_SUFFIX }/)
    rendered.should_not match(/Email/)
  end
end
