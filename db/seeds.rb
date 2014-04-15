# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
reply_to = 'mahona@winthrop.edu'
professor_email = <<END
[NAME],

There are recommendations for ASC tutoring positions awaiting your review.
Please fill out the recommendations here: [URL]

Thank you,
ASC Staff
END
Email.create(body: professor_email,
             subject: 'Pending ASC tutoring recommendations',
             reply_to: reply_to,
             identifier: 'ProfessorMailer:pending_recommendation',
             description: 'Email sent to professors for pending recommendations',
             id: 1) unless Email.count == 2

applicant_email = <<END
[NAME],

You can view or edit your application by going here: [URL]

Thank you for submitting your application to be a Peer Tutor at the Academic
Success Center. The professors listed in your application has been notified
of your request for their recommendation. Your application is currently pending
and will be ready for review by the ASC once your faculty
recommendation has been submitted.

Thank you, ASC Staff
END
Email.create(body: applicant_email,
             subject: 'Your ASC tutoring application',
             reply_to: reply_to,
             identifier: 'ApplicantMailer:account_email',
             description: 'Email sent for new applicants',
             id: 2) unless Email.count == 2
