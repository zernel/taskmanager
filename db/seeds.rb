def create_production_data
  #create_administrator
end

def create_development_data
  #create_developer
  create_projects
end

#def create_administrator
  #User.create(email: 'admin@production.ca', password: '123456', password_confirmation: '123456') unless User.find_by_email('admin@rickbalbi.ca')
  #User.create(email: 'admin@andertec.ca', password: '123456', password_confirmation: '123456') unless User.find_by_email('admin@andertec.ca')
#end

#def create_team_members
  #if TeamMember.count > 0
    #12.times do
      #TeamMember.create(name: Faker::Name.name, role: Faker::Job.title, education: Faker::Education.degree_short, profile: Faker::Lorem.paragraphs(3), email: 'test@andertec.ca')
    #end
  #end
#end

def create_projects
  unless Project.count > 0
    8.times do
      project_name = Faker::Name.name
      project = Project.create(name: project_name, description: Faker::Lorem.paragraphs(5), identifier: project_name.urlize, status: :open)
    end
  end
end

create_production_data
create_development_data unless Rails.env.production?
