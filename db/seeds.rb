# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
email_count = 3
reply_to = 'mahona@winthrop.edu'
professor_email = <<END
[NAME],

There are recommendations for ASC tutoring positions awaiting your review.
Please fill out the recommendations here: [URL]

Thank you,
ASC Staff
END
identifier = 'ProfessorMailer:pending_recommendation'
Email.create(body: professor_email,
             subject: 'Pending ASC tutoring recommendations',
             reply_to: reply_to,
             identifier: identifier,
             description: 'Email sent to professors for pending recommendations',
             id: 1) unless Email.find_by_identifier(identifier)

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
identifier = 'ApplicantMailer:account_email'
Email.create(body: applicant_email,
             subject: 'Your ASC tutoring application',
             reply_to: reply_to,
             identifier: identifier,
             description: 'Email sent for new applicants',
             id: 2) unless Email.find_by_identifier(identifier)

applicant_acceptance_email = <<END
[NAME],

Congratulations! After careful consideration, the Academic Success Center has
decided to hire you as a Peer Tutor! As part of your tutoring responsibilities,
you will have to enroll in LEAD 120D Section 001. This is a training that we
will use to build a community between tutors, as well as teach you the latest
tutoring methods as certified by the College Reading and Learning Center
International Tutor Training Program Certification.

There will be a mandatory meeting for all new tutors on 01/01/2014 to discuss
details of employment, scheduling, and payroll. Here is the link to the website
that will be used to schedule your availability and keep track of tutoring
sessions: [insert link]. We will discuss this website in further detail at the
meeting.

In the meantime, please schedule a meeting with me to complete your tutor
paperwork. You must bring your driver’s license to this meeting.

Welcome to the ASC family, and we look forward to working with you for the rest
of the semester! Please let me know if you have any questions.

Thank you,
ASC Staff
END
identifier = 'ApplicantMailer:acceptance_email'
Email.create(body: applicant_acceptance_email,
             subject: 'Your ASC tutoring application',
             reply_to: reply_to,
             identifier: identifier,
             description: 'Email sent to accepted applicants',
             id: 3) unless Email.find_by_identifier(identifier)

raise Exception, 'Database seed failed' unless Email.count == email_count
