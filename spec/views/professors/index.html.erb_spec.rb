require 'spec_helper'

describe 'professors/index' do
  before(:each) do
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
    assert_select 'tr>td', text: "addr#{ EMAIL_SUFFIX }".to_s, count: 2
    rendered.should match(/Email/)
  end
end
