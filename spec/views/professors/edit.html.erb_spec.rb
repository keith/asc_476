require 'spec_helper'

describe 'professors/edit' do
  before(:each) do
    @professor = assign(:professor, stub_model(Professor,
      name: 'MyString',
      email: 'MyString',
      identifier: 'abc'
    ))
  end

  describe 'logged in' do
    before do
      view.stub(:logged_in_admin?).and_return(true)
    end

    it 'renders the edit professor form' do
      render

      assert_select 'form[action=?][method=?]', professor_path(@professor), 'post' do
        assert_select 'input#professor_name[name=?]', 'professor[name]'
        assert_select 'input#professor_email[name=?]', 'professor[email]'
      end
    end
  end

  describe 'not logged in' do
    before do
      view.stub(:logged_in_admin?).and_return(false)
    end

    it 'renders the edit professor form' do
      render

      assert_select 'form[action=?][method=?]', professor_path(@professor), 'post' do
        assert_select 'input#professor_name[name=?]', 'professor[name]'
      end
    end
  end
end
