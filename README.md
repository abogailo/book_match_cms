Overview
Objectives
Project Deliverables
Technical and Complexity Requirements
What to Expect in Your Project Review
Example Projects
Overview
Welcome to your JavaScript Project!

You are going build a Single Page Application (SPA). Your frontend will be built with HTML, CSS, and JavaScript. Your frontend will communicate with a backend API that you'll build with Ruby and Rails. This is a really exciting moment - the whole course up until this point is coming together!

Objectives
Your goals with this project:

Design and architect features across frontend and backend
Integrate JavaScript and Rails
Debug issues in small- to medium-sized projects
Build and iterate on a project MVP
Communicate in a technical environment
Project Deliverables
In order to schedule your Project Review, you must submit:

A link to your project repo, with code for your Rails backend and HTML / CSS / JavaScript frontend.
A README.md file describing your application
A Blog Post about your application
A 2-4 minute Video Demo introducing your application
Read below for more details about the technical requirements for your project. See the section "Communicating About Your Project" in the Project Planning and Tips document for more guidance on communicating about your project.

As always, your project must be your own work. For more details about the rules of the road, see Project Rules of the Road.

Technical and Complexity Requirements
In order to demonstrate your proficiency with what you've learned about web development with JavaScript, here are the requirements for your project. You should view these guidelines as a minimum bar for the features you include in your application. It's your project, and you are encouraged to go above and beyond these requirements.

The application must be an HTML, CSS, and JavaScript frontend with a Rails API backend. All interactions between the client and the server must be handled asynchronously (AJAX) and use JSON as the communication format.

The JavaScript application must use Object Oriented JavaScript (classes) to encapsulate related data and behavior.

The domain model served by the Rails backend must include a resource with at least one has-many relationship. For example, if you were building an Instagram clone, you might display a list of photos with associated comments.

The backend and frontend must collaborate to demonstrate Client-Server Communication. Your application should have at least 3 AJAX calls, covering at least 2 of Create, Read, Update, and Delete (CRUD). Your client-side JavaScript code must use fetch with the appropriate HTTP verb, and your Rails API should use RESTful conventions.

Within these constraints, there is a huge variety of applications that you might build. Take some time to brainstorm the application you'd like to build. Take a look at the example projects at the bottom of this page for inspiration. You should build something that you are excited to talk about. That means being excited about the features you build and the technology that you use.

If you aren't sure about whether the domain or features you are planning to build will meet the technical requirements, you should reach out to an instructor for guidance. Read more about instructor guidance below.

Best Practices
You are encouraged to follow development best practices while you are building your application.

JavaScript
[ ] Use classes and functions to organize your code into reusable pieces.
[ ] Translate JSON responses into JavaScript model objects using ES6 class or constructor function syntax.
[ ] Use ES6 features when appropriate (e.g. arrow functions, let & const, rest and spread syntax).
Rails
[ ] Follow Rails MVC and RESTful conventions. That means, for example, that a request GET /puppies ought to be handled by the PuppiesController, fetch puppies from the database using a Puppy Active Record model, and return a list of puppies as JSON.
[ ] Well-named variables and methods
[ ] Short, single-purpose methods
Git
[ ] Aim for a large number of small commits - commit frequently!
[ ] Add meaningful messages to your commits. When you look back at your commits with git log, the messages should describe each change.
[ ] Don't include changes in a commit that aren't related to the commit message
Suggested Project Structure
You must submit a link to the repo with the code for your project. There is no requirement for how you decide to structure the code within that repo, but in the past, students have had success using a structure like:

javascript-project/
  backend/
    app/
    (...other rails files and folders)
  frontend/
    index.html
    style.css
    index.js
  README.md
