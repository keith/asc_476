require 'spec_helper'

describe 'positions/index' do
  before(:each) do
    assign(:positions, [
      stub_model(Position,
        professor_comments: 'MyText',
        professor_verdict: false,
        professor_taught: false,
        application_status: 1,
        asc_comments: 'ASCText',
        identifier: 'abc'
      ),
      stub_model(Position,
        professor_comments: 'MyText',
        professor_verdict: false,
        professor_taught: false,
        application_status: 1,
        asc_comments: 'ASCText',
        identifier: 'abc'
      )
    ])
  end

  it 'renders a list of positions' do
    render
    assert_select 'tr>td', text: 'MyText', count: 2
    assert_select 'tr>td', text: 'No', count: 4
    assert_select 'tr>td', text: Status.for_number(1).to_s, count: 2
    assert_select 'tr>td', text: 'ASCText', count: 2
  end
end
