require 'spec_helper'

describe "emails/show" do
  before(:each) do
    @email = assign(:email, stub_model(Email,
      :body => "MyText",
      :subject => "Subject",
      :reply_to => "Reply To",
      :identifier => "Identifier"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/Subject/)
    rendered.should match(/Reply To/)
    rendered.should match(/Identifier/)
  end
end
