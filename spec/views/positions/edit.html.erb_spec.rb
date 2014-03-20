require 'spec_helper'

describe 'positions/edit' do
  before(:each) do
    @position = assign(:position, stub_model(Position,
      professor_comments: 'MyText',
      professor_verdict: false,
      professor_taught: false,
      application_status: 1,
      asc_comments: 'MyText'
    ))
  end

  it 'renders the edit position form for the professors' do
    view.stub(:logged_in_admin?).and_return(false)
    render

    assert_select 'form[action=?][method=?]', position_path(@position), 'post' do
      assert_select 'textarea#position_professor_comments[name=?]', 'position[professor_comments]'
      assert_select 'input#position_professor_verdict[name=?]', 'position[professor_verdict]'
      assert_select 'input#position_professor_taught[name=?]', 'position[professor_taught]'
    end
  end

  it 'renders the edit position form for the ASC' do
    view.stub(:logged_in_admin?).and_return(true)
    render

    assert_select 'form[action=?][method=?]', position_path(@position), 'post' do
      rendered.should match(/No/)
      rendered.should match(/#{ Status.for_number(1) }/)
      assert_select 'textarea#position_asc_comments[name=?]', 'position[asc_comments]'
    end
  end
end
