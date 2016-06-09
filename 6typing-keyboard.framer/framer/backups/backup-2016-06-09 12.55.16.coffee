inputHeight = 130
bottomBarHeight = 110
msgCount = 0
msgList = []

bg = new Layer
	backgroundColor: "white"
	width: Screen.width
	height: Screen.height
	
bottomBar = new Layer
	backgroundColor: "#f5f5f5"
	height: bottomBarHeight
	y: Screen.height - bottomBarHeight
	width: Screen.width

sendButton = new Layer
	html: "Send"
	backgroundColor: "none"
	height: bottomBarHeight
	width: 160
	superLayer: bottomBar
	x: Align.right
	style: 
		"color": "#2153Ef"
		"font-weight": 600
		"font-size": 37 + "px"
		"letter-spacing": 0.5 + "px"
		"text-align": "center"
		"padding-top": 45 + "px"

sendButton.states.add
	pressed:
		opacity: 0.5
		scale: 0.98
sendButton.states.animationOptions = curve: "spring(100, 10, 0)"

sendButton.onTouchStart ->
	sendButton.states.switch("pressed")
sendButton.onTouchEnd ->
	sendButton.states.switch("default")

  	
textInputLayer = new Layer
	x: 0
	y: Screen.height - inputHeight - bottomBarHeight
	height: inputHeight
	width: Screen.width
	style: 
		"border-top": "1px solid lightgray"
	

inputBox = document.createElement("input")

## For some reason styling it below doesn't work
# inputBox.style:
# 	"width": 1000
# 	"height": textInputLayer.height
# 	"font-family": "Montserrat"
# 	"font-size": 300

# You'd need to style each attribute individually
inputBox.style["width"]  = textInputLayer.width + "px"
inputBox.style["height"]  = inputHeight + "px"
inputBox.style["font-size"] = 38 + "px"
inputBox.style["padding-left"] = 30 + "px"

inputBox.focus()
inputBox.value = ""
inputBox.placeholder = "Type a message..."

textInputLayer._element.appendChild(inputBox)

sendButton.onClick ->
	text = inputBox.value
	inputBox.value = ""
	
	if text.length != 0
		msgCount += 1
		message = new Layer
			index: 1
			height: 90
			width: 18 * text.length  + 100
			backgroundColor: "#216fEf"
			html: text
			y: textInputLayer.y
			style: 
				"font-size": 35 + "px"
				"letter-spacing": 0.2 + "px"
				"text-align": "center"
				"padding-top": 30 + "px"
		message.borderRadius = message.height / 2.1
		message.x = Screen.width - message.width - 40
		
		msgList.push(message)
		
		for i in [0...msgCount]
			msgList[i].y -= 105
