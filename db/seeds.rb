# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new
user.email = 'me@gmail.com'
user.password = '12345678'
user.password_confirmation = '12345678'
user.save!

Familymember.create(first_name: "Joseph", last_name: "Rayesky", birthday: 10/26/1954, birth_loc: "Philadelphia", user_id: 1)
Familymember.create(first_name: "Marie", last_name: "Rayesky", birthday: 04/06/1955, birth_loc: "Philadelphia", user_id: 1) 
Familymember.create(first_name: "Joey", last_name: "Rayesky", birthday: 06/11/1980, birth_loc: "Philadelphia", user_id: 1) 
Familymember.create(first_name: "Julie", last_name: "Filius", birthday: 01/15/1984, birth_loc: "Philadelphia", user_id: 1) 
Familymember.create(first_name: "Steven", last_name: "Rayesky", birthday: 11/16/1987, birth_loc: "Philadelphia", user_id: 1)
Familymember.create(first_name: "Denae", last_name: "Mardon", birthday: 02/25/1990, birth_loc: "Philadelphia", user_id: 1) 
Familymember.create(first_name: "Hannah", last_name: "Rayesky", birthday: 03/16/1996, birth_loc: "Philadelphia", user_id: 1)
Familymember.create(first_name: "Jonmarc", last_name: "Rayesky", birthday: 05/04/2000, birth_loc: "Philadelphia", user_id: 1) 
Familymember.create(first_name: "Jenna", last_name: "Rayesky", birthday: 06/20/1986, birth_loc: "Philadelphia", user_id: 1) 
Familymember.create(first_name: "Holly", last_name: "Rayesky", birthday: 03/23/1981, birth_loc: "Philadelphia", user_id: 1) 
Familymember.create(first_name: "Winifred", last_name: "Rayesky", birthday: 05/21/2013, birth_loc: "Philadelphia", user_id: 1) 
Familymember.create(first_name: "Theodore", last_name: "Rayesky", birthday: 8/25/2015, birth_loc: "Philadelphia", user_id: 1) 
Familymember.create(first_name: "Bruce", last_name: "Mardon", birthday: 02/05/1982, birth_loc: "Philadelphia", user_id: 1) 
Familymember.create(first_name: "Scott", last_name: "Filius", birthday: 01/22/1985, birth_loc: "Philadelphia", user_id: 1)

Marriage.create(husband_id: 1, wife_id: 2, wedding_date: 10/02/1980)
Marriage.create(husband_id: 3, wife_id: 10, wedding_date: 9/26/2005)
Marriage.create(husband_id: 14, wife_id: 4, wedding_date: 10/22/2009)
Marriage.create(husband_id: 5, wife_id: 9, wedding_date: 9/03/2011)
Marriage.create(husband_id: 13, wife_id: 6, wedding_date: 10/12/2013)

Relative.create(parent_id: 1, child_id: 3) 
Relative.create(parent_id: 1, child_id: 4) 
Relative.create(parent_id: 1, child_id: 5) 
Relative.create(parent_id: 1, child_id: 6) 
Relative.create(parent_id: 1, child_id: 7) 
Relative.create(parent_id: 1, child_id: 8) 
Relative.create(parent_id: 2, child_id: 3) 
Relative.create(parent_id: 2, child_id: 4) 
Relative.create(parent_id: 2, child_id: 5) 
Relative.create(parent_id: 2, child_id: 6) 
Relative.create(parent_id: 2, child_id: 7) 
Relative.create(parent_id: 2, child_id: 8) 
Relative.create(parent_id: 5, child_id: 11) 
Relative.create(parent_id: 5, child_id: 12) 
Relative.create(parent_id: 9, child_id: 11) 
Relative.create(parent_id: 9, child_id: 12)


