<h1>Acceptance Test Document</h1>

 - Run project 'ExerciseMinesweeperSection13Project1' as a web project
 - Open a web browser (preferably Firefox) and go to the url 'http://localhost:8080/ExerciseMinesweeperSection13Project1/'
 - You should see the word 'Minesweeper' on the top left of the page. The source of the page should indicate that the word is enclosed within H2 tags
 - Below 'Minesweeper' you should see a 6x6 grid of squares (not rectangles). All the squares should be empty and have a background color of white
 - Look at the console in Eclipse. It will print all square locations which are mines. Select a location which is not a mine and left click on it. You should see a number on that square now
 - Right click on any covered square. The square should have a background color of red
 - Left click on a square which is a mine. An image with a red X should be displayed on the square. The words 'Game Over !' should be displayed  in red on the first line. The next line should contain a link 'New Game'. The grid of squares should be frozen which means, any click (left or right) on any of the squares will not have any effect
 - Click on the 'New Game' link and verify that a new game has started and the squares are once again clickable
 
