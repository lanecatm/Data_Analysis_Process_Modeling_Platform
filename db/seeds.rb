# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

WorkflowCategory.create(:name => "Prediction")
WorkflowCategory.create(:name => "Clustering")
WorkflowCategory.create(:name => "Classification")
WorkflowCategory.create(:name => "Regression")

PersonInformation.create(:person_name => "Admin", :user_name => "Admin")

DepartmentInformation.create(:name => "All")
DepartmentInformation.create(:name => "Department 1")
DepartmentInformation.create(:name => "Department 2")



