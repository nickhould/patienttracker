# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Micropost.destroy_all

users = [{name:  "Joe Di Magio",
				 email: "admin@example.com",
				 password: "example123",
				 password_confirmation: "example123"},

				{name:  "Betty Yudev",
				 email: "example-2@railstutorial.org",
				 password: "example123",
				 password_confirmation: "example123" },

				{name:  "Roth Michaels",
				 email: "example-3@railstutorial.org",
				 password: "example123",
				 password_confirmation: "example123" },

				{name:  "Chris Smith",
				 email: "example-4@railstutorial.org",
				 password: "example123",
				 password_confirmation: "example123" },

				 {name:  "Julia Smith",
				 email: "example-5@railstutorial.org",
				 password: "example123",
				 password_confirmation: "example123" }]

microposts = [{user_id: 2,
							 content: "Just visited Amily today. She was pale and weak, but the nurses are taking good care of her."},
							{user_id: 2,
							 content: "Is anyone available tomorrow morning? She needs our support! Oh yeah, can anyone bring a thermos?"},
							{user_id: 3,
							 content: "I will be there at 3pm. Will bring thermos and some fruits over, anything else?"},
							{user_id: 4,
							 content: "She can't eat solid food after the surgery, maybe get some juice instead?"},
							{user_id: 3,
							 content: "I will also bring juice!"},
							{user_id: 5,
							 content: "Visiting hours?"},
							{user_id: 3,
							 content: "Julia come visit Amily with tomorrow!"},
							{user_id: 5,
							 content: "I am out of town right now but keep us posted with the details."},
							{user_id: 5,
							 content: "I am out of town right now but keep us posted with the details."}]

User.create users
Micropost.create microposts

puts "#{User.all.count} users created."
puts "#{Micropost.all.count} microposts created."
		