class Post
{
    constructor(title, text, upvotenumber, image, imageAltText)
    {
        if(typeof upvotenumber == 'undefined')
        {
            this.upvotenumber = "?";
        }
        else if(upvotenumber >= 1000 || upvotenumber <= -1000)
        {
            this.upvotenumber = (upvotenumber/1000) + "K";
        }
        else if(upvotenumber >= 1000000 || upvotenumber <= -1000000)
        {
            this.upvotenumber = (upvotenumber/1000000) + "M";
        }
        else
        {
            this.upvotenumber = upvotenumber;
        }

        if(typeof image == 'undefined')
        {
            this.image = null;
        }
        if(typeof imageAltText == 'undefined')
        {
            this.imageAltText = null;
        }
        this.title = title;
        this.text = text;
        this.image = image;
        this.imageAltText = imageAltText;
    }
}

function populateCardsWithPosts(cardElementNames, postsToUse)
{
   for(var i = 0; i < cardElementNames.length; i++)
   {
       if(postsToUse[i] != null)
       {
           populateCardWithPost(cardElementNames[i], postsToUse[i]);
       }
       else
       {
           break;
       }
   }
}

function populateCardWithPost(nameOfCardToPopulate, postToDisplay)
{
    populateCardWithPostImage(nameOfCardToPopulate, postToDisplay);
    populateCardWithPostContent(nameOfCardToPopulate, postToDisplay);
    populateCardWithPostActions(nameOfCardToPopulate, postToDisplay);
}

function populateCardWithPostImage(nameOfCardToPopulate, postToDisplay)
{
    var nameOfImageField = nameOfCardToPopulate + "-image-frame-image";
    var imageField = document.getElementById(nameOfImageField);
    imageField.setAttribute("src", postToDisplay.image);
    imageField.setAttribute("alt", postToDisplay.imageAltText);
}

function populateCardWithPostContent(nameOfCardToPopulate, postToDisplay)
{
    var nameOfCardTitleField = nameOfCardToPopulate + "-title";
    var nameOfCardShortenedTextField = nameOfCardToPopulate + "-shortened-text";
    var nameOfUpvoteCounter = nameOfCardToPopulate + "-upvote-count";
    var nameOfModalFullPost = nameOfCardToPopulate + "-modal-full-post";

    var cardTitleField = document.getElementById(nameOfCardTitleField);
    cardTitleField.innerHTML += postToDisplay.title;

    var cardShortenedTextField = document.getElementById(nameOfCardShortenedTextField);
    cardShortenedTextField.innerHTML += postToDisplay.text;

    var upvoteCounterField = document.getElementById(nameOfUpvoteCounter);
    upvoteCounterField.setAttribute("class", "halfway-fab-three-steps-to-the-left btn-floating center-align")
    upvoteCounterField.innerHTML += postToDisplay.upvotenumber;

    var modalFullPost = document.getElementById(nameOfModalFullPost);
    modalFullPost.innerHTML += ('<div class = "container">');
    modalFullPost.innerHTML += ('<img src = ' + postToDisplay.image + ' alt = "' + postToDisplay.imageAltText + '" width = 100% height = 100%> </img>');
    modalFullPost.innerHTML += ("<h4>" + postToDisplay.title + "</h4>");
    modalFullPost.innerHTML += ("<p>" + postToDisplay.text + "</p>");
    modalFullPost.innerHTML += ('</div>');
}

function populateCardWithPostActions(nameOfCardToPopulate, postToDisplay)
{ 
    var nameOfCardUpvoteButton = nameOfCardToPopulate + "-upvote-button";
    var nameOfCardUpvoteButtonIcon = nameOfCardToPopulate + "-upvote-button-icon";
    var nameOfCardDownvoteButton = nameOfCardToPopulate + "-downvote-button";
    var nameOfCardDownvoteButtonIcon = nameOfCardToPopulate + "-downvote-button-icon";
    var nameOfCardFavoriteButton = nameOfCardToPopulate + "-favorite-button";
    var nameOfCardFavoriteButtonIcon = nameOfCardToPopulate + "-favorite-button-icon";

    var nameOfCardViewPostButton = nameOfCardToPopulate + "-action-view-full-post";
    var nameOfCardSharePostButton = nameOfCardToPopulate + "-action-share-post";
    var nameOfCardGiveAwardButton = nameOfCardToPopulate + "-action-give-award";

    var cardUpvoteButton = document.getElementById(nameOfCardUpvoteButton);
    cardUpvoteButton.setAttribute("class", "halfway-fab-one-step-to-the-left btn-floating blue waves-effect waves-light");

    var cardUpvoteButtonIcon = document.getElementById(nameOfCardUpvoteButtonIcon);
    cardUpvoteButtonIcon.innerHTML += "arrow_upward";

    var cardDownvoteButton = document.getElementById(nameOfCardDownvoteButton);
    cardDownvoteButton.setAttribute("class", "halfway-fab-two-steps-to-the-left btn-floating orange waves-effect waves-light");

    var cardDownvoteButtonIcon = document.getElementById(nameOfCardDownvoteButtonIcon);
    cardDownvoteButtonIcon.innerHTML += "arrow_downward";

    var cardFavoriteButton = document.getElementById(nameOfCardFavoriteButton);
    cardFavoriteButton.setAttribute("class", "halfway-fab waves-effect waves-light btn-floating blue");

    var cardFavoriteButtonIcon = document.getElementById(nameOfCardFavoriteButtonIcon);
    cardFavoriteButtonIcon.innerHTML += "favorite";

    var cardViewPostButton = document.getElementById(nameOfCardViewPostButton);
    cardViewPostButton.innerHTML += "View full post";

    var cardSharePostButton = document.getElementById(nameOfCardSharePostButton);
    cardSharePostButton.innerHTML += "Share post";

    var cardGiveAwardButton = document.getElementById(nameOfCardGiveAwardButton);
    cardGiveAwardButton.innerHTML += "Give award";
}

var cardElementNames = ["card-one",
                        "card-two",
                        "card-three",
                        "card-four",
                        "card-five",
                        "card-six",
                        "card-seven",
                        "card-eight",
                        "card-nine",
                        "card-ten"];

var samplePostArray = [new Post("Hi", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", -100000, "img/school-of-fish-2289409.jpg", ""),
                       new Post("Title", "aaaaaaa", 10, "img/four-orange-jellyfish-wallpaper-1784578.jpg", ""),
                       new Post("Another title!", "bbbbbbbbbbbb", 234, "img/person-holding-octopus-1321125.jpg", "")];

populateCardsWithPosts(cardElementNames, samplePostArray);