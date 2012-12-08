require 'spec_helper'

describe "projects/edit" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "MyString",
      :overview => "MyText",
      :identifier => "MyString",
      :status_cd => 1
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path(@project), :method => "post" do
      assert_select "input#project_name", :name => "project[name]"
      assert_select "textarea#project_overview", :name => "project[overview]"
      assert_select "input#project_identifier", :name => "project[identifier]"
      assert_select "input#project_status_cd", :name => "project[status_cd]"
    end
  end
end
