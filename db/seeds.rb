# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


tommy = User.create(email: tommy@yahoo.com)
angelica = User.create(email: angelica@yahoo.com)
chuckie = User.create(email: chuckie@yahoo.com)

all_or_nothing = Distortion.create(name: "All or nothing")
should = Distortion.create(name: "Shoulds")
mind_reading = Distortion.create(name: "Mind Reading")

school_tag = Tag.create(name: "school")
relationship_tag = Tag.create(name: "relationship")
work_tag = Tag.create(name: "work")

unlovable = Belief.create(name: "unlovable")
helplessness = Belief.create(name: "helplessness")
entitled = Belief.create(name: "entitled")

tommy.logs.build(content: "I always lose.", before_rating: 3, after_rating: 6, distortion: all_or_nothing, belief: helplessness, tags: [work_tag] )
angelica.logs.build(content: "I should have done better.", before_rating: 5, after_rating: 6, distortion: mind_reading, belief: entitled, tags: [work_tag, school_tag])
angelica.logs.build(content: "Nobody likes me.", before_rating: 2, after_rating: 7, distortion: should, belief: unlovable, tags: [work_tag, relationship_tag])
chuckie.logs.build(content: "If I'm not perfect I have failed.", before_rating: 1, after_rating: 9, distortion: all_or_nothing, belief: helplessness, tags: [work_tag, school_tag, relationship_tag])
chuckie.logs.build(content: "I feel embarassed so I must be an idiot.", before_rating: 4, after_rating: 10, distortion: all_or_nothing, belief: helplessness, tags: [school_tag, work_tag])
tommy.logs.build(content: "I should have said something smart.", before_rating: 3, after_rating: 7, distortion: should, belief: entitled, tags: [relationship_tag, school_tag])
tommy.logs.build(content: "I'm completely useless.", before_rating: 6, after_rating: 3, distortion: all_or_nothing, belief: unlovable, tags: [work_tag])
angelica.logs.build(content: "That will never happen to me.", before_rating: 6, after_rating: 6, distortion: all_or_nothing, belief: entitled, tags: [school_tag])
tommy.logs.build(content: "She obviously hates me.", before_rating: 5, after_rating: 6, distortion: mind_reading, belief: helplessness, tags: [relationship_tag])
chuckie.logs.build(content: "No one will listen to me.", before_rating: 3, after_rating: 8, distortion: mind_reading, belief: helplessness, tags: [work_tag])

tommy.save
angelica.save
chuckie.save

#hello

