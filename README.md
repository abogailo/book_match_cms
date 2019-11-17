
Book Match

User Experience -

Book Match allows a user to pick favorited books from a list and view other users favorited books. If the other user has an allotted amount of the same favorited books, a message will appear announcing that the user is a match in the 'All Users' list. Users have the ability to delete their own account in the 'edit user' link. Users are able to sign in or out with either their GitHub account sign in -or- an email and created password.

Admin User Experience -

Along with the same features as all other users, the Admin will have the ability to create, edit, and remove books. 
They will also be able to remove users including their own account. For the sake of simplicity for this app, all users can change their admin rights in the edit user section.

Getting Started:

Clone this Repo
Run 'bundle install' from the root directory
Add the Sqlite gem
Run 'rails db:migrate'
Run rails s -or- rails server in your console
In your browser, navigate to https://localhost:3000/ 

Sign up using GitHub or by with an e-mail and password
Change the admin rights to true. Create books, create users, match other user's favorited-books.
