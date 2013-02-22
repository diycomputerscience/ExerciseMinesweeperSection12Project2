<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "com.diycomputerscience.minesweeper.Board" %>
<%@ page import = "com.diycomputerscience.minesweeper.Square" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/styles.css" type="text/css">
<script type="text/javascript" language="javascript"  src="js/jquery-1.4.2.min.js"></script>
<title>Minesweeper</title>
</head>
<body>

<%
Boolean isGameOver = (Boolean)request.getAttribute("gameOver"); 
if(isGameOver != null && isGameOver) {
	out.print("<h3 class='gameOver'>Game Over !</h3>");
	out.print("<a href=\"./MinesweeperServe\">New game</a>");
}
%>

<div id="contents">
	<h2>Minesweeper</h2>
	<div id="board" oncontextmenu="return false;" ondrag="return false;" ondragstart="return false;">
		<table class="ms-grid">
		<%			
			Board board = (Board)session.getAttribute("board");
			if(board != null) {
				Square squares[][] = board.getSquares(); 
				for(int row=0;row<6;row++) {
					out.print("<tr>");
					for(int col=0; col<6; col++) {
						Square square = squares[row][col];
						String style= "";
						String sCount = "&nbsp;";
						if(square.getState().equals(Square.SquareState.MARKED)) {
							style = "marked";
						}
						if(!square.isMine() && square.getState().equals(Square.SquareState.UNCOVERED)) {
							sCount = square.getCount()==0 ? "" : String.valueOf(square.getCount());	
						}
						if(square.isMine() && square.getState().equals(Square.SquareState.UNCOVERED)) {
							sCount = "<img src=\"images/mine.jpg\" alt=\"GO\"/>";	
						}
						String template = "<td id='%s' class='square %s'>%s</td>";
						out.print(String.format(template, row+"-"+col, style, sCount));
					}
					out.print("</tr>");
				}	
			} else {
				out.print("board is null !");
			}
			
		%>
		</table>
	</div>
</div>
<script type="text/javascript">
var gameOver = false;
<%	
	if(isGameOver != null && isGameOver) { 
%>
	gameOver = true;
<%
	}
%>
$('.square').bind('click', function(e) {
	if(!gameOver) {
		var point = e.target.id.split("-");
		post_to_url("leftClick", point[0], point[1]);	
	} else {
		return false;
	}	
});

$('.square').bind('contextmenu', function(e){
    if(!gameOver) {
    	var point = e.target.id.split("-");
    	post_to_url("rightClick", point[0], point[1]);	
    } else {
    	return false;
    }    
});

function post_to_url(action, row, col) {
	path = "${pageContext.request.contextPath}/MinesweeperServe";
    method = "post";

    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);
	
    var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "action");
	hiddenField.setAttribute("value", action);
	form.appendChild(hiddenField);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "row");
	hiddenField.setAttribute("value", row);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "col");
	hiddenField.setAttribute("value", col);
	form.appendChild(hiddenField);
    
    document.body.appendChild(form);
    form.submit();
}

</script>
</body>
</html>