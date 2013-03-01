<h1>Section 12 Project 2</h1>

<h2>Overview</h2>

In the previous section, we created a web based version of the Minesweeper game. We used Servlets, JSP, Javascript, HTML, and CSS.

We got the game to work, but we broke one rule regarding best practices in JSP files. Even though the JSP syntax allows scriplets, we are strongly advised  not to use them. Scriplets make the code difficult to read and maintain. See [this](http://stackoverflow.com/questions/3177733/how-to-avoid-java-code-in-jsp-files) and [this](http://stackoverflow.com/questions/4535423/jstl-vs-jsp-scriptlets) StackOverflow answers for more details. It is preferable to use JSP tag libraries such as those provided through [JSTL](http://www.oracle.com/technetwork/java/index-jsp-135995.html) (Java Standard Template Library).

We have added jar files for JSTL (version 1.2.1) in WEB-INF/lib. You have to replace all scriplets in ```board.jsp``` with JSTL core tags.

We would like to stress that whichever technology you use, it is important to understand and follow best practices. There are several reasons for this. For the greater part, best practices have evolved as the right way to do things after several developers have burned their fingers doing something the wrong way. Another reason for following best practices is because they make it easy for others to understand your code. However, sometime you might come across a best practice which is not really useful. Such cases are rare, and a bit of asking around will help you understand the pros and cons of using the said best practice.

<h2>Steps For The Project</h2>

 1. Run the project, by right clicking on the project and selecting _Run As->Run on Server_. Ensure that you have a functioning web based Minesweeper Game similar to the one you made in the previous section.
 1. Refactor ```game.jsp``` to remove all Scriplets and replace them with JSTL tags.
 1. Go through the manual tests in the acceptance test document, and ensure that the game is working properly.
