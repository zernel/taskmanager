def create_production_data
  #create_administrator
end

def create_development_data
  #create_developer
  create_projects
  create_tasks
end

#def create_administrator
  #User.create(email: 'admin@production.ca', password: '123456', password_confirmation: '123456') unless User.find_by_email('admin@rickbalbi.ca')
  #User.create(email: 'admin@andertec.ca', password: '123456', password_confirmation: '123456') unless User.find_by_email('admin@andertec.ca')
#end

def create_projects
  unless Project.count > 0
    #[:active, :inactive, :archived].each do |status|
      #4.times do
        #project_name = Faker::Name.name
        #Project.create(name: project_name, overview: Faker::Lorem.paragraphs(1), identifier: project_name.urlize, status: status)
      #end
    #end
    Project.create(name: "Rick Balbi Architects", identifier: "rickbalbi", status: :active, overview: "Web site for Rick Balbi Architects")
    Project.create(name: "Rentcharlie", identifier: "rcc", status: :active, overview: "New version of RentCharlie.com web site")
    Project.create(name: "Good Time Party Rentals", identifier: "gtprental", status: :active)
    Project.create(name: "Suncoast", identifier: "suncoast", status: :inactive, overview: "Suncoast Enclosures Web Project")
    Project.create(name: "Sunridge RV", identifier: "sunridgerv", status: :inactive, overview: "Sunridge RV Web Project")
    Project.create(name: "Reggin", identifier: "reggin", status: :archived)
    Project.create(name: "Enercore", identifier: "enercore", status: :archived)
  end
end

def create_tasks
  unless Task.count > 0
    Project.active.each do |project|
      Task.create(subject: "Location.choose_default_location doesn't return location", status: :todo, priority: :high, type: :feature, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Due to styling issue, change project image gallery to use galleriffic plugin", status: :todo, priority: :regular, type: :feature, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Investigate RCC optimization suggestions given by webmaster tool", status: :toreview, priority: :regular, type: :feature, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Disallow login for inactive user", status: :done, priority: :regular, type: :feature, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Make 'selected' class changeable for projects page", status: :toreview, priority: :regular, type: :bug, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Supersized slider - remove styles from image tags", status: :todo, priority: :regular, type: :bug, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Change pop-up plugin for team member pop-up", status: :done, priority: :regular, type: :bug, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Test Testimonial submit page", status: :todo, priority: :regular, type: :research, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Limit testimonial display size on home page", status: :todo, priority: :regular, type: :research, project: project, description: Faker::Lorem.paragraphs(1))
    end
    Project.inactive.each do |project|
      Task.create(subject: "Location.choose_default_location doesn't return location", status: :done, priority: :high, type: :feature, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Due to styling issue, change project image gallery to use galleriffic plugin", status: :done, priority: :regular, type: :feature, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Investigate RCC optimization suggestions given by webmaster tool", status: :done, priority: :regular, type: :feature, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Disallow login for inactive user", status: :done, priority: :regular, type: :feature, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Make 'selected' class changeable for projects page", status: :done, priority: :regular, type: :bug, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Supersized slider - remove styles from image tags", status: :done, priority: :regular, type: :bug, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Change pop-up plugin for team member pop-up", status: :done, priority: :regular, type: :bug, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Test Testimonial submit page", status: :done, priority: :regular, type: :research, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Limit testimonial display size on home page", status: :done, priority: :regular, type: :research, project: project, description: Faker::Lorem.paragraphs(1))
    end
    Project.archived.each do |project|
      Task.create(subject: "Location.choose_default_location doesn't return location", status: :done, priority: :high, type: :feature, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Due to styling issue, change project image gallery to use galleriffic plugin", status: :done, priority: :regular, type: :feature, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Investigate RCC optimization suggestions given by webmaster tool", status: :done, priority: :regular, type: :feature, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Disallow login for inactive user", status: :done, priority: :regular, type: :feature, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Make 'selected' class changeable for projects page", status: :done, priority: :regular, type: :bug, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Supersized slider - remove styles from image tags", status: :done, priority: :regular, type: :bug, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Change pop-up plugin for team member pop-up", status: :done, priority: :regular, type: :bug, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Test Testimonial submit page", status: :done, priority: :regular, type: :research, project: project, description: Faker::Lorem.paragraphs(1))
      Task.create(subject: "Limit testimonial display size on home page", status: :done, priority: :regular, type: :research, project: project, description: Faker::Lorem.paragraphs(1))
    end
  end
end

create_production_data
create_development_data unless Rails.env.production?
