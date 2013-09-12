# Admin
User.where(email: 'admin@eardrums.in').first.try(:delete)
User.create! do |r|
  r.name        = "Admin User"
  r.email       = 'admin@eardrums.in'
  r.password    = 'password'
  r.type        = 'Administrator'
  r.username    = 'admin'
  r.confirmed_at = Time.now
end

# Teachers
User.where(email: 'subhash.bhushan@eardrums.in').first.try(:delete)
teacher_subhash = User.create! do |r|
  r.name        = "Subhash Bhushan"
  r.email       = 'subhash.bhushan@eardrums.in'
  r.password    = 'password'
  r.type        = 'Teacher'
  r.username    = 'subhashb'
  r.profile     = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
  r.confirmed_at = Time.now
end
User.where(email: 'nikhil.sivakumar@strata.co.in').first.try(:delete)
teacher_nikhil = User.create! do |r|
  r.name        = "Nikhil Sivakumar"
  r.email       = 'nikhil.sivakumar@strata.co.in'
  r.password    = 'password'
  r.type        = 'Teacher'
  r.username    = 'nikhils'
  r.profile     = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
end
User.where(email: 'deepak.nair@strata.co.in').first.try(:delete)
teacher_deepak = User.create! do |r|
  r.name        = "Deepak Nair"
  r.email       = 'deepak.nair@strata.co.in'
  r.password    = 'password'
  r.type        = 'Teacher'
  r.username    = 'deepakn'
  r.profile     = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
end

Discipline.delete_all
dis_guitar = Discipline.create({ name: "Guitar", description: "Guitar" })
dis_drums = Discipline.create({ name: "Drums", description: "Drums" })
dis_keyboard = Discipline.create({ name: "Keyboard", description: "Keyboard" })
dis_carnatic = Discipline.create({ name: "Carnatic", description: "Carnatic" })

Level.delete_all
level1 = Level.create({name: 'Early Elementary', description: 'Early Elementary', index: 1})
level2 = Level.create({name: 'Elementary', description: 'Elementary', index: 2})
level3 = Level.create({name: 'Beginner', description: 'Beginner', index: 3})
level4 = Level.create({name: 'Early Intermediate', description: 'Early Intermediate', index: 4})
level5 = Level.create({name: 'Intermediate', description: 'Intermediate', index: 5})
level6 = Level.create({name: 'Amateur', description: 'Amateur', index: 6})
level7 = Level.create({name: 'Early Advanced', description: 'Early Advanced', index: 7})
level8 = Level.create({name: 'Advanced', description: 'Advanced', index: 8})
level9 = Level.create({name: 'Advanced +', description: 'Advanced +', index: 9})
level10 = Level.create({name: 'Professional', description: 'Professional', index: 10})

Course.delete_all
g_course1 = Course.create(
              { name: "Intro to Guitar", description: "Introduction to Guitar", duration: 8,  
              price: "2400", status: "Active", code: "GT0001", index: 1, level: level1,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 1 })
g_course2 = Course.create(
              { name: "Strings 1-3", description: "Strings 1-3", duration: 8,  
              price: "2400", status: "Active", code: "GT0002", index: 2, level: level2,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 2 })
g_course3 = Course.create(
              { name: "Strings 4-6", description: "Strings 4-6", duration: 8,  
              price: "2400", status: "Active", code: "GT0003", index: 3, level: level2,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 1 })
g_course4 = Course.create(
              { name: "Basic Chords", description: "Basic Chords", duration: 8,  
              price: "2400", status: "Active", code: "GT0004", index: 4, level: level3,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 1 })
g_course5 = Course.create(
              { name: "Intermediate Chords", description: "Intermediate Chords", duration: 8,  
              price: "2400", status: "Active", code: "GT0005", index: 5, level: level4,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 1 })
g_course6 = Course.create(
              { name: "Basic Strumming Techniques", description: "Basic Strumming Techniques", duration: 8,  
              price: "2400", status: "Active", code: "GT0006", index: 6, level: level3,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 1 })
g_course7 = Course.create(
              { name: "Barre Chords", description: "Barre Chords", duration: 8,  
              price: "2400", status: "Active", code: "GT0007", index: 7, level: level4,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 1 })
g_course8 = Course.create(
              { name: "Advanced Strumming Techniques", description: "Advanced Strumming Techniques", duration: 8,  
              price: "2400", status: "Active", code: "GT0008", index: 8, level: level5,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 1 })
g_course9 = Course.create(
              { name: "Advanced Chords", description: "Advanced Chords", duration: 8,  
              price: "2400", status: "Active", code: "GT0009", index: 9, level: level6,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 1 })
g_course10 = Course.create(
              { name: "Basic FingerStyles", description: "Basic FingerStyles", duration: 8,  
              price: "2400", status: "Active", code: "GT0010", index: 10, level: level7,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 1 })
g_course11 = Course.create(
              { name: "Advanced FingerStyles", description: "Advanced FingerStyles", duration: 8,  
              price: "2400", status: "Active", code: "GT0011", index: 11, level: level8,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 1 })
g_course12 = Course.create(
              { name: "Basic Scales", description: "Basic Scales", duration: 8,  
              price: "2400", status: "Active", code: "GT0012", index: 12, level: level8,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 1 })
g_course13 = Course.create(
              { name: "Advanced Scales", description: "Advanced Scales", duration: 9,  
              price: "2400", status: "Active", code: "GT0013", index: 13, level: level9,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 1 })
g_course14 = Course.create(
              { name: "Blues", description: "Blues", duration: 8,  
              price: "2400", status: "Active", code: "GT0014", index: 14, level: level10,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 1 })
g_course15 = Course.create(
              { name: "Jazz", description: "Jazz", duration: 8,  
              price: "2400", status: "Active", code: "GT0015", index: 15, level: level10,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 1 })
g_course16 = Course.create(
              { name: "Soloing", description: "Soloing", duration: 8,  
              price: "2400", status: "Active", code: "GT0016", index: 16, level: level10,
              discipline: dis_guitar, teacher: teacher_subhash, created_by: 1, modified_by: 1 })
d_course1 = Course.create(
              { name: "Intro to Drums", description: "Intro to Drums", duration: 8,  
              price: "2400", status: "Active", code: "DR0001", index: 1, level: level1,
              discipline: dis_drums, teacher: teacher_nikhil, created_by: 1, modified_by: 1 })
c_course1 = Course.create(
              { name: "Intro to Carnatic", description: "Intro to Carnatic", duration: 8,  
              price: "2400", status: "Active", code: "CV0001", index: 1, level: level1,
              discipline: dis_carnatic, teacher: teacher_nikhil, created_by: 1, modified_by: 1 })
k_course1 = Course.create(
              { name: "Intro to Keyboard", description: "Intro to Keyboard", duration: 8,  
              price: "2400", status: "Active", code: "KB0001", index: 1, level: level1,
              discipline: dis_keyboard, teacher: teacher_deepak, created_by: 1, modified_by: 1 })

franchise_wf = Franchise.create(
                { name: "New World Music", franchisees: "John Doe", emails: "john.doe@example.com",
                  phones: "9999999999", address: "Address of New World Music", city: "Bangalore",
                  state: "Karnataka", country: "India", created_by: 1, modified_by: 1})
branch_wf = Branch.create(
              { name: "Whitefield", subdomain: "wf", status: "Active", opened_on: "2013-07-31", email: "fo@wf.eardrums.in",
                address: "Varthur Main Road", city: "Bangalore", state: "Karnataka", country: "India", 
                phones: "+91-80-23442234", franchise: franchise_wf, closed_on: nil, created_by: 1, modified_by: 1})

Batch.delete_all
guitar_batch1 = Batch.create(
                  { status: "Active", discipline: dis_guitar, teacher: teacher_subhash, day: "Sunday", start_time: "16:30",
                    duration: 60, created_by: 1, modified_by: 1, capacity: 8})
guitar_batch2 = Batch.create(
                  { status: "Active", discipline: dis_guitar, teacher: teacher_subhash, day: "Saturday", start_time: "16:30",
                    duration: 60, created_by: 1, modified_by: 1, capacity: 8})
drums_batch1 = Batch.create(
                  { status: "Active", discipline: dis_drums, teacher: teacher_nikhil, day: "Sunday", start_time: "14:00",
                    duration: 60, created_by: 1, modified_by: 1, capacity: 8})
keyboard_batch1 = Batch.create(
                  { status: "Active", discipline: dis_keyboard, teacher: teacher_deepak, day: "Sunday", start_time: "18:00",
                    duration: 60, created_by: 1, modified_by: 1, capacity: 8})
keyboard_batch2 = Batch.create(
                  { status: "Active", discipline: dis_keyboard, teacher: teacher_deepak, day: "Saturday", start_time: "18:00",
                    duration: 60, created_by: 1, modified_by: 1, capacity: 8})

guitar_lesson1 = Lesson.create(name: 'Lesson 1', description: 'Lesson 1', course_id: 1, index: 1)
guitar_lesson2 = Lesson.create(name: 'Lesson 2', description: 'Lesson 2', course_id: 1, index: 2)
guitar_lesson3 = Lesson.create(name: 'Lesson 3', description: 'Lesson 3', course_id: 1, index: 3)
guitar_lesson4 = Lesson.create(name: 'Lesson 4', description: 'Lesson 4', course_id: 1, index: 4)
guitar_lesson5 = Lesson.create(name: 'Lesson 5', description: 'Lesson 5', course_id: 1, index: 5)
guitar_lesson6 = Lesson.create(name: 'Lesson 6', description: 'Lesson 6', course_id: 1, index: 6)
guitar_lesson7 = Lesson.create(name: 'Lesson 7', description: 'Lesson 7', course_id: 1, index: 7)
guitar_lesson8 = Lesson.create(name: 'Lesson 8', description: 'Lesson 8', course_id: 1, index: 8)
