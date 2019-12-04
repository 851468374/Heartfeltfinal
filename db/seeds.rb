# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 @user=User.find(1)
 @user.tasks.create(theme:"theme3",stuid:"201928015329011",content:"there are another cont ent",hotpot:1234,applicant:45,user_id:1)
 @user.tasks.create(theme:"theme4",stuid:"201928015329011",content:"here comes new challenger",hotpot:35325,applicant:45,user_id:1)
 @user.tasks.create(theme:"theme5",stuid:"201928015329011",content:"nano boost administered",hotpot:4535,applicant:34,user_id:1)
 @user.tasks.create(theme:"theme6",stuid:"201928015329011",content:"I've got you in my sight",hotpot:34543,applicant:634,user_id:1)
 @user.tasks.create(theme:"theme7",stuid:"201928015329011",content:"Justice rain from above",hotpot:5464,applicant:54,user_id:1)
 @user.tasks.create(theme:"theme8",stuid:"201928015329011",content:"heroes never die",hotpot:4534,applicant:454,user_id:1)
 @user.tasks.create(theme:"theme9",stuid:"201928015329011",content:"freeze! don't move",hotpot:345,applicant:45,user_id:1)
 @user.tasks.create(theme:"theme10",stuid:"201928015329011",content:"transpoter online",hotpot:454,applicant:45,user_id:1)