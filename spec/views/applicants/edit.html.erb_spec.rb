# require 'spec_helper'

# describe "applicants/edit" do
#   before(:each) do
#     @applicant = assign(:applicant, stub_model(Applicant,
#       :name => "MyString",
#       :email => "MyString",
#       :wuid => "MyString",
#       :phone_number => "MyString",
#       :class_standing => "MyString",
#       :gpa => 1.5,
#       :comment => "MyText",
#       :major => "MyString",
#       :minor => "MyString",
#       :work_study => false
#     ))
#   end

#   it "renders the edit applicant form" do
#     render

#     # Run the generator again with the --webrat flag if you want to use webrat matchers
#     assert_select "form[action=?][method=?]", applicant_path(@applicant), "post" do
#       assert_select "input#applicant_name[name=?]", "applicant[name]"
#       assert_select "input#applicant_email[name=?]", "applicant[email]"
#       assert_select "input#applicant_wuid[name=?]", "applicant[wuid]"
#       assert_select "input#applicant_phone_number[name=?]", "applicant[phone_number]"
#       assert_select "input#applicant_class_standing[name=?]", "applicant[class_standing]"
#       assert_select "input#applicant_gpa[name=?]", "applicant[gpa]"
#       assert_select "textarea#applicant_comment[name=?]", "applicant[comment]"
#       assert_select "input#applicant_major[name=?]", "applicant[major]"
#       assert_select "input#applicant_minor[name=?]", "applicant[minor]"
#       assert_select "input#applicant_work_study[name=?]", "applicant[work_study]"
#     end
#   end
# end

