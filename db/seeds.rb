# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'open-uri'
require 'json'
require 'faker'

subjects = [
  { subject: "ruby",
    content: "Nossa sessão para estudarmos ruby",
    video_call: "https://meet.google.com/fkj-eghy-jxz",
  },
  { subject: "javascript",
    content: "Nessa sessão aprenderemos sobre javascript",
    video_call: "https://meet.google.com/iuf-frjz-bbz",
  },
  { subject: "games",
    content: "Nessa sessão discutirmos sobre desenvolvimento de jogos",
    video_call: "https://meet.google.com/agd-kviy-kcd",
  },
  { subject: "matemática",
    content: "grupo de matemática",
    video_call: "https://meet.google.com/iyu-mrse-ktk",
  },
  { subject: "ciência da computação",
    content: "grupo para aprendermos computer science",
    video_call: "https://meet.google.com/iyu-mrse-ktk",
  },
  { subject: "C++ Language",
    content: "Aprenderemos a linguagem C++ e conceitos como ponteiros.",
    video_call: "https://meet.google.com/iyu-mrse-ktk",
  },
  { subject: "Recurssão",
    content: "Aprenderemos sobre recurssão, uma técnica de programação onde uma função chama ela mesma.",
    video_call: "https://meet.google.com/iyu-mrse-ktk",
  },
  { subject: "Algoritmos",
    content: "Aprenderemos sobre algoritmos de ordenação (sort).",
    video_call: "https://meet.google.com/iyu-mrse-ktk",
  },
  { subject: "Estrutura de dados",
    content: "Aprenderemos sobre estrutura de dados e sua implementação.",
    video_call: "https://meet.google.com/iyu-mrse-ktk",
  },
]

puts "start deleting"

Session.destroy_all
UserStudyGroup.destroy_all
StudyGroup.destroy_all
User.destroy_all

puts "data deleted"

puts "starting adding data"

User.create!([
  {name: "Julia Mathias", email: "testadmin@lewagon.com", password: "testadminuser", password_confirmation: "testadminuser"},
  {name: "Daniel Azevedo", email: "testuser@lewagon.com", password: "testuseraccount", password_confirmation: "testuseraccount"},
  {name: "Luiz Souza", email: "testcustomer@lewagon.com", password: "testcustomeruser", password_confirmation: "testcustomeruser"}
])

puts "users added"

users_arr = []
users = User.all
users.each do |user|
  users_arr.push(user.id)
end

puts users_arr

index = 0
3.times do
  study_group = StudyGroup.create(
    name: Faker::Space.unique.star,
    creator_id: users_arr.sample,
    create_sessions: [true, false].sample,
    edit_session: [true, false].sample
  )

  rand(1..3).times do
    session = Session.create!(
      name: subjects[index][:subject],
      date: Faker::Date.between(from: Date.today, to: 1.month.from_now),
      content: subjects[index][:content],
      video_call: subjects[index][:video_call],
      privacy: [true, false].sample,
      study_group_id: study_group.id
    )
    puts "session: #{session.id} created"
    index += 1
  end

  puts "name: #{study_group.name},
        creator_id: #{study_group.creator_id},
        create_sessions: #{study_group.create_sessions},
        edit? #{study_group.edit_session}"

  puts "StudyGroup: #{study_group.id} is created"
end

stdgrp_arr = []
groups = StudyGroup.all
groups.each do |group|
  stdgrp_arr.push(group.id)
end

users_arr.each { |user|
    stdgrp_arr_replica = Array.new(stdgrp_arr)
  rand(1..3).times do
    join_table = UserStudyGroup.create(
      user_id: user,
      study_group_id: stdgrp_arr_replica.delete_at(rand(0...stdgrp_arr_replica.length))
    )
    puts "join_table: #{join_table.id} created"
  end
}


puts "done!"
