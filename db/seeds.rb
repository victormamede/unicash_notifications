# frozen_string_literal: true

def seed(description)
  print description

  yield

  puts " [Done]"
end

seed("Creading default Admin") do
  Admin.first_or_create!(
    email: "victor@dottis.com.br",
    password: "password",
    name: "Victor Mamede",
  )
end
