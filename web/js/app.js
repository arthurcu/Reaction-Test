var canvas;
var stage;
var width, height;
var rect;
var text;
var randomTime, beginTime, endTime;

canvas = document.getElementById("gameView");
div=document.getElementById("div")
stage = new createjs.Stage(canvas);

canvas.width=window.innerWidth;

width = canvas.width;
height = canvas.height;

rect = new Rect(width, height);
stage.addChild(rect);
stage.update();

showStartState();

stage.addEventListener("stagemousedown", handleMouseDown);

function handleMouseDown(event) {
    var state = rect.getState();
    console.log("state: " + state);
    switch (state) {
        case Rect.STATE_START:
            showWaiteState();
            break;
        case Rect.STATE_WAITE:
            showTooSoonState();
            break;
        case Rect.STATE_RESULT:
            showWaiteState();
            break;
        case Rect.STATE_CLICK:
            showResultState();
            break;
        case Rect.STATE_TOOSOON:
            showWaiteState();
            break;
    }
    //stage.update();
}

function showWaiteState() {
    //createjs.Ticker.removeAllEventListeners("tick");
    createjs.Tween.removeTweens(rect);
    setText("Wait...");
    rect.setState(Rect.STATE_WAITE);
    randomTime = (Math.floor(Math.random() * 3 + 1) + 3) * 1000;
    console.log("randomTime: ", randomTime);
    //createjs.Ticker.addEventListener("tick", handleTick);
    createjs.Tween.get(rect).wait(randomTime).call(showClickState);
    stage.update();
}

//function handleTick() {
//    if (createjs.Ticker.getTime() >= randomTime) {
//        createjs.Ticker.removeAllEventListeners("tick");
//        showClickState();
//        stage.update();
//    }
//}

function showClickState() {
    setText("Click!");
    rect.setState(Rect.STATE_CLICK);
    beginTime = new Date();
    stage.update();
}

function showResultState() {
    endTime = new Date();
    var time = endTime.getTime() - beginTime.getTime();
    setText("Your reaction time is " + time + "ms");
    rect.setState(Rect.STATE_RESULT);
    name = window.sessionStorage.getItem('name');
    let bt = setbesttime(name, time);
    stage.update();
}

function showTooSoonState() {
    createjs.Tween.removeTweens(rect);
    setText("too soon!");
    //createjs.Ticker.removeAllEventListeners();
    rect.setState(Rect.STATE_TOOSOON);
    stage.update();
}

function showStartState() {
    setText("Start");
    rect.setState(Rect.STATE_START);
    stage.update();
}

function setText(textString) {
    stage.removeChild(text);
    text = new createjs.Text(textString, "40px Artifakt Element Light", "#444444");
    text.x = width / 2;
    text.y = height / 2;
    text.textAlign = "center";
    stage.addChild(text);
    stage.update();
}
function setbesttime(name,time){
    axios({
        method: 'post',
        url: 'http://localhost:8088/Reaction_Test_Web_exploded/senddata.jsp',
        params: {
            time: time
        }
    })
}

