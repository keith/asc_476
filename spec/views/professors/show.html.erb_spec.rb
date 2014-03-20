require 'spec_helper'

describe 'professors/show' do
  before(:each) do
    view.stub(:logged_in_admin?).and_return(true)
    @professor = assign(:professor, stub_model(Professor,
      name: 'bob',
      email: 'foo',
      identifier: 'abc'
    ))
  end

  it 'renders attributes in <p>' do
    render
    rendered.should match(/bob/)
    rendered.should match(/foo#{ EMAIL_SUFFIX }/)
  end
end
