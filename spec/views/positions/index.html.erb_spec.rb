# require 'spec_helper'

# describe "positions/index" do
#   before(:each) do
#     assign(:positions, [
#       stub_model(Position,
#         :professor_comments => "MyText",
#         :professor_verdict => false,
#         :professor_taught => false,
#         :application_status => 1,
#         :asc_comments => "MyText"
#       ),
#       stub_model(Position,
#         :professor_comments => "MyText",
#         :professor_verdict => false,
#         :professor_taught => false,
#         :application_status => 1,
#         :asc_comments => "MyText"
#       )
#     ])
#   end

#   it "renders a list of positions" do
#     render
#     # Run the generator again with the --webrat flag if you want to use webrat matchers
#     assert_select "tr>td", :text => "MyText".to_s, :count => 2
#     assert_select "tr>td", :text => false.to_s, :count => 2
#     assert_select "tr>td", :text => false.to_s, :count => 2
#     assert_select "tr>td", :text => 1.to_s, :count => 2
#     assert_select "tr>td", :text => "MyText".to_s, :count => 2
#   end
# end

