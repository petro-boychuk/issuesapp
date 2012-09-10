# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Status.create(:kind => :waiting_staff, :title => "Waiting for Staff Response")
Status.create(:kind => :waiting_customer, :title => "Waiting for Customer")
Status.create(:kind => :on_hold, :title => "On Hold")
Status.create(:kind => :cancelled, :title => "Cancelled")
Status.create(:kind => :completed, :title => "Completed")

