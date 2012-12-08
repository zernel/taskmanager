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
    #[:active, :inactive, :archived].each do |status|
      #4.times do
        #project_name = Faker::Name.name
        #Project.create(name: project_name, overview: Faker::Lorem.paragraphs(1), identifier: project_name.urlize, project_status: status)
      #end
    #end
    Project.create(name: "Rick Balbi Architects", identifier: "rickbalbi", project_status: :active, overview: "Web site for Rick Balbi Architects")
    Project.create(name: "Rentcharlie", identifier: "rcc", project_status: :active, overview: "New version of RentCharlie.com web site")
    Project.create(name: "Good Time Party Rentals", identifier: "gtprental", project_status: :active)
    Project.create(name: "Suncoast", identifier: "suncoast", project_status: :inactive, overview: "Suncoast Enclosures Web Project")
    Project.create(name: "Sunridge RV", identifier: "sunridgerv", project_status: :inactive, overview: "Sunridge RV Web Project")
    Project.create(name: "Reggin", identifier: "reggin", project_status: :archived)
    Project.create(name: "Enercore", identifier: "enercore", project_status: :archived)
  end
end

create_production_data
create_development_data unless Rails.env.production?
