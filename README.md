# OpinionPoll
A web application where for a list of questions visitors select their best preferred option. Questions are used to get opinions from the visitors. This application uses maven as build and dependency management tool. Technologies used are Java, Servlets, MySQL, HTML, CSS.

# Application Flow
Entry page displays a form containing list of all the questions. Users answer all of the questions. At the end users enter their names and email address to map an answer to a user. After clicking submit a new page is displayed which contains results in the form of text and bar graph.
To directly view the results type /getResults at the end of host URL.
Take a view at the screenshots of the application here: https://docs.google.com/document/d/1GVdew5hTuBQhXGAaFv3EQxmT2hk-6TNQoQdt_NBYUmc/edit?usp=sharing.

# Requiredments
An IDE that supports maven.(probably eclipse/IntelliJ)
A web browser.
MySQL(change the mysql connector dependeny according to the mysql version in pom.xml)

# User Guide
1. Download the project.
2. Run opinion_poll.sql. It creates the database opinion_poll and questions,answers,user tables.
3. Run Questions.sql. It inserts some questions in the questions database.
4. If you are using eclipse open the project file.
  a. Right click on the project directory and select run as maven build.
  b. In the popup enter tomcat7:run as the value for goals field.
  c. It will display the port and url on which the project will run.
5. If you are using IntelliJ import the project.
  a. Create a new run configuration and in command line enter tomcat7:run.
  

