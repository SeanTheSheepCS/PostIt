// This function is called when you want to display a new thread 
function fillThread( threadTitle, threadContent,threadImage){
    var title = document.getElementById("thread_title");
    title.innerHTML=threadTitle;

    var content = document.getElementById("thread_content");
    content.innerHTML=threadContent;

    var image = document.getElementById("thread_image");
    image.setAttribute("src",threadImage);
}
// This function is called when you want to generate a user
function fillUser(usersName,usersIcon){
    var name = document.getElementById("username");
    name.innerHTML= usersName;

    var icon = document.getElementById("icon");
    icon.innerHTML= usersIcon;
}


 // These are function calls for testing purposes
fillThread("Best Curry Recipe"," This is a Western style curry, and it's the easiest chicken"+
" curry I know how to make with the least ingredients possible without sacrificing tastiness!" +
"Very mild, not spicy at all (assuming curry powder is mild).","img/curry.jpg");

fillUser("CoolestUsernameBestCurry","face");