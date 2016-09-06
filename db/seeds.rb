# Users
[
  {
    first_name: 'Alice',
    last_name: 'Edge',
    email: 'admin@superpencil.com',
    password: 'password',
    password_confirmation: 'password',
    time_zone: 'Singapore'
  },
  {
    first_name: 'Taku',
    last_name: 'Otaku',
    email: 'regular@superpencil.com',
    password: 'password',
    password_confirmation: 'password',
    time_zone: 'Buenos Aires'
  }
].each do |u|
  user = User.find_by_email(u[:email])
  unless user
    User.create(u)
  end
end

# Teams
[
  {
    description: "Amazingly fishy folks!",
    team_name: "Salmon, Inc.",
    street_address_1: "Fishlane 88",
    street_address_2: "Aquarium 1",
    postal: "121212",
    city: "Tunaberg",
    country: "Sardinia",
    color: "FC7F6F"
  },
  {
    description: "Amazingly fishy folks!",
    team_name: "Dance Monkey",
    street_address_1: "1A Monkeyroad",
    street_address_2: "",
    postal: "2323-BA",
    city: "Partytown",
    country: "Mexapan",
    color: "FCE400"
  }
].each do |t|
  team = Team.find_by_team_name(t[:team_name])
  unless team
    Team.create(t)
  end
end

# Team User
[
  {
    email: 'admin@superpencil.com',
    team_name: 'Dance Monkey',
    admin: true
  },
  {
    email: 'regular@superpencil.com',
    team_name: 'Dance Monkey',
    admin: false
  },
  {
    email: 'regular@superpencil.com',
    team_name: 'Salmon, Inc.',
    admin: true
  }
].each do |tu|
  user = User.find_by_email(tu[:email])
  team = Team.find_by_team_name(tu[:team_name])
  if user && team
    team.team_users.create({user: user, admin: tu[:admin]})
  end
end
