# README

1) signup: /signup {method: POST}
    params [
        name: <YOUR_NAME>
        email: <YOUR_EMAIL>
        password: <PASSWORD>
        password_confirmation: <PASSWORD>
    ]

2) login: /auth/login {method: POST}
    params [
        email: <YOUR_EMAIL>
        password: <PASSWORD>
    ]

3) make user admin: /makeAdmin {method: POST}
    * you can just make one admin 
    params [
        email: <YOUR_EMAIL>
    ]

4) get jobs: /jobs {method: GET}
    * /jobs get all jobs 
    * you can get job by title and creating date
        /jobs?title=civil || /jobs?created_at=2021
    * you can get job by id
        /jobs/:id

5) post jobs: /jobs {method: POST}
    * posting jobs just for admin user
    params [
        title: <job_title>
        description: <job_description>
    ]

6) update jobs: /jobs/:id {method: PUT}
    * updating jobs just for admin user
    params [
        title: <job_title>
        description: <job_description>
    ]

7) delete jobs: /jobs/:id {method: DELETE}
    * deleting jobs just for admin user

8) get Job by keywords in the description: /job/desc?q=: {method: GET}
    * doesn't work on heroku ``` commented out ```

9) get job applications (all): /jobs/:job_id/applications {method: GET}

10) get one job application: /jobs/:job_id/applications/:id {method: GET}
    * if user is admin the application will update to seen
        and an email will be sent to applicant

11) post job applications: /jobs/:job_id/applications {method: POST}
    * posting applications just for non admin users


run tests: 
``` bundle exec rspec spec/auth -fd ```
``` bundle exec rspec ```

....
....

useful links:

* https://linuxize.com/post/how-to-install-ruby-on-ubuntu-18-04/

* https://itnext.io/deploying-a-rails-app-with-heroku-47e4fbb85965

* https://www.digitalocean.com/community/tutorials/build-a-restful-json-api-with-rails-5-part-one#project-setup

* https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-two

* https://www.youtube.com/watch?v=cTYu-OjUgDw&ab_channel=ArachneTutorials

* https://guides.rubyonrails.org/api_documentation_guidelines.html

* https://www.youtube.com/watch?v=OI-m0wbmf8A&t=367s&ab_channel=RailscastsReloaded

* https://github.com/simplecov-ruby/simplecov

* https://stackoverflow.com/questions/54450916/upload-file-to-s3-from-rails-server

* https://www.freecodecamp.org/news/how-to-add-a-powerful-search-engine-to-your-rails-backend-57bced889032/

* https://stackoverflow.com/questions/23207644/search-using-like-query-in-ruby-on-rails
