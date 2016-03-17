# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


tommy = User.create(email: "tommy@yahoo.com", name: "Tommy")
angelica = User.create(email: "angelica@yahoo.com", name: "Angelica")
chuckie = User.create(email: "chuckie@yahoo.com", name: "Chuckie")

anxious_andy = Distortion.create(name: "Anxious Andy")
macho_mike = Distortion.create(name: "Macho Mike")
hurtful_harry = Distortion.create(name: "Hurtful Harry")
belittling_betty = Distortion.create(name: "Belittling Betty")
critical_carl = Distortion.create(name: "Critical Carl")
superstitious_sally = Distortion.create(name: "Superstitious Sally")

school_tag = Tag.create(name: "school")
relationship_tag = Tag.create(name: "relationship")
work_tag = Tag.create(name: "work")

unlovable = Belief.create(name: "unlovable")
helplessness = Belief.create(name: "helplessness")
entitled = Belief.create(name: "entitled")

ladybug_one = LadyBug.create(content: "you had a really great time with your friends yesterday")
ladybug_two = LadyBug.create(content: "you finished all of your homework early")
ladybug_three = LadyBug.create(content: "you got an A on that test")

tommy.logs.build(content: "I always lose.", before_rating: 3, after_rating: 6, distortion: anxious_andy, belief: helplessness, tags: [work_tag] )
angelica.logs.build(content: "I should have done better.", before_rating: 5, after_rating: 6, distortion: superstitious_sally, belief: entitled, tags: [work_tag, school_tag])
angelica.logs.build(content: "Nobody likes me.", before_rating: 2, after_rating: 7, distortion: belittling_betty, belief: unlovable, tags: [work_tag, relationship_tag])
chuckie.logs.build(content: "If I'm not perfect I have failed.", before_rating: 1, after_rating: 9, distortion: macho_mike, belief: helplessness, tags: [work_tag, school_tag, relationship_tag])
chuckie.logs.build(content: "I feel embarassed so I must be an idiot.", before_rating: 4, after_rating: 10, distortion: anxious_andy, belief: helplessness, tags: [school_tag, work_tag])
tommy.logs.build(content: "I should have said something smart.", before_rating: 3, after_rating: 7, distortion: superstitious_sally, belief: entitled, tags: [relationship_tag, school_tag])
tommy.logs.build(content: "I'm completely useless.", before_rating: 6, after_rating: 3, distortion: belittling_betty, belief: unlovable, tags: [work_tag])
angelica.logs.build(content: "That will never happen to me.", before_rating: 6, after_rating: 6, distortion: critical_carl, belief: entitled, tags: [school_tag])
tommy.logs.build(content: "She obviously hates me.", before_rating: 5, after_rating: 6, distortion: hurtful_harry, belief: helplessness, tags: [relationship_tag])
chuckie.logs.build(content: "No one will listen to me.", before_rating: 3, after_rating: 8, distortion: macho_mike, belief: helplessness, tags: [work_tag])

tommy.save
angelica.save
chuckie.save


