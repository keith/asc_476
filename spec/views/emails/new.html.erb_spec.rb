require 'spec_helper'

describe "emails/new" do
  before(:each) do
    assign(:email, stub_model(Email,
      :body => "MyText",
      :subject => "MyString",
      :reply_to => "MyString",
      :identifier => "MyString"
    ).as_new_record)
  end

  it "renders new email form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", emails_path, "post" do
      assert_select "textarea#email_body[name=?]", "email[body]"
      assert_select "input#email_subject[name=?]", "email[subject]"
      assert_select "input#email_reply_to[name=?]", "email[reply_to]"
      assert_select "input#email_identifier[name=?]", "email[identifier]"
    end
  end
end
