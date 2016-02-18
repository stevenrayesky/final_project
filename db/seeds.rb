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

Tree.create(name: "Rayesky Family", user_id: 1)

Familymember.create(first_name: "Joseph", last_name: "Rayesky", birthday: "26/10/1954", birth_loc: "Philadelphia", tree_id: 1)
Familymember.create(first_name: "Marie", last_name: "Rayesky", birthday: "06/04/1955", birth_loc: "Philadelphia", tree_id: 1) 
Familymember.create(first_name: "Joey", last_name: "Rayesky", birthday: "11/06/1980", birth_loc: "Philadelphia", tree_id: 1) 
Familymember.create(first_name: "Julie", last_name: "Filius", birthday: "15/01/1984", birth_loc: "Philadelphia", tree_id: 1) 
Familymember.create(first_name: "Steven", last_name: "Rayesky", birthday: "16/11/1987", birth_loc: "Philadelphia", tree_id: 1)
Familymember.create(first_name: "Denae", last_name: "Mardon", birthday: "25/02/1990", birth_loc: "Philadelphia", tree_id: 1) 
Familymember.create(first_name: "Hannah", last_name: "Rayesky", birthday: "16/03/1996", birth_loc: "Philadelphia", tree_id: 1)
Familymember.create(first_name: "Jonmarc", last_name: "Rayesky", birthday: "04/05/2000", birth_loc: "Philadelphia", tree_id: 1) 
Familymember.create(first_name: "Winifred", last_name: "Rayesky", birthday: "21/05/2013", birth_loc: "Philadelphia", tree_id: 1) 
Familymember.create(first_name: "Theodore", last_name: "Rayesky", birthday: "25/08/2015", birth_loc: "Philadelphia", tree_id: 1) 
Familymember.create(first_name: "Jenna", last_name: "Rayesky", birthday: "20/06/1986", birth_loc: "Philadelphia", tree_id: 1) 
Familymember.create(first_name: "Holly", last_name: "Rayesky", birthday: "23/03/1981", birth_loc: "Philadelphia", tree_id: 1) 
Familymember.create(first_name: "Bruce", last_name: "Mardon", birthday: "05/02/1982", birth_loc: "Philadelphia", tree_id: 1) 
Familymember.create(first_name: "Scott", last_name: "Filius", birthday: "22/01/1985", birth_loc: "Philadelphia", tree_id: 1)

PartnerRelationship.create(first_partner_id: 1, second_partner_id: 2, start_date: "02/10/1980", kind: "marriage")
PartnerRelationship.create(first_partner_id: 3, second_partner_id: 12, start_date: "26/09/2005)", kind: "marriage")
PartnerRelationship.create(first_partner_id: 4, second_partner_id: 14, start_date: "22/10/2009", kind: "marriage")
PartnerRelationship.create(first_partner_id: 5, second_partner_id: 11, start_date: "03/09/2011)", kind: "marriage")
PartnerRelationship.create(first_partner_id: 6, second_partner_id: 13, start_date: "12/10/2013", kind: "marriage")

ChildRelationship.create(parent_id: 1, child_id: 3) 
ChildRelationship.create(parent_id: 1, child_id: 4) 
ChildRelationship.create(parent_id: 1, child_id: 5) 
ChildRelationship.create(parent_id: 1, child_id: 6) 
ChildRelationship.create(parent_id: 1, child_id: 7) 
ChildRelationship.create(parent_id: 1, child_id: 8) 
ChildRelationship.create(parent_id: 2, child_id: 3) 
ChildRelationship.create(parent_id: 2, child_id: 4) 
ChildRelationship.create(parent_id: 2, child_id: 5) 
ChildRelationship.create(parent_id: 2, child_id: 6) 
ChildRelationship.create(parent_id: 2, child_id: 7) 
ChildRelationship.create(parent_id: 2, child_id: 8) 
ChildRelationship.create(parent_id: 5, child_id: 9) 
ChildRelationship.create(parent_id: 5, child_id: 10) 
ChildRelationship.create(parent_id: 11, child_id: 9) 
ChildRelationship.create(parent_id: 11, child_id: 10)

SiblingRelationship.create(first_sibling_id: 5, second_sibling_id: 3, kind: "blood")
SiblingRelationship.create(first_sibling_id: 5, second_sibling_id: 4, kind: "blood")
SiblingRelationship.create(first_sibling_id: 5, second_sibling_id: 6, kind: "blood")
SiblingRelationship.create(first_sibling_id: 5, second_sibling_id: 7, kind: "blood")
SiblingRelationship.create(first_sibling_id: 5, second_sibling_id: 8, kind: "blood")











