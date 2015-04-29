# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Link.all.destroy_all
links = Link.create([{link: 'http://www.solobasket.com', shortlink: 238, visits:10, last_visit: 1.week.ago},
					{link: 'http://www.acb.com', shortlink: 459, visits:5, last_visit: 5.days.ago},
					{link: 'http://homominimus.com', shortlink: 204, visits:49, last_visit: Date.today}])