# LuauCSS

Alright so I know this code is kind of bad but here is a tutorial:

``m.Execute(code_pieces<table>,target<GuiObject>) -> nil``

Basically just put a string of CSS code bt only the selector and the code inside, such as #inner{} AND NOTHING ELSE!!!
example:

```
{
	"#inner{margin:5;}",
	"#other_button{background-color:blue;}"
}
```

TO MAKE A GUI OBJECT BE SELECTED BY THE NAME THAT COMES AFTER THE #:

	go into the object's properties and add a new attribute called "id" and name it the same id that you are selecting it with, such as inner or other_button.

currently supported colors:

	black
  
	white
  
	red
  
	green
  
	blue
	
currently supported instructions:

	margin: <int>;
  
	background-color: <colors<table>>;
  
	color: <colors<table>>;
  
	border-radius: <int>;
