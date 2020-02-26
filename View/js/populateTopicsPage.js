class TopicInfo
{
    constructor(topicName, topicIcon, iconColour, topicDescription, topicMemberCount)
    {
        this.topicName = topicName;
        this.topicIcon = topicIcon;
        this.iconColour = iconColour;
        this.topicDescription = topicDescription;
        if(topicMemberCount >= 1000 || topicMemberCount <= -1000)
        {
            this.topicMemberCount = (topicMemberCount/1000) + "K" + " members";
        }
        else if(topicMemberCount >= 1000000 || topicMemberCount <= -1000000)
        {
            this.topicMemberCount = (topicMemberCount/1000000) + "M" + " members";
        }
        else
        {
            this.topicMemberCount = topicMemberCount;
        }
    }
}

function populateTopicCards(cardNameArray, topicInfoArray)
{
    for(var i = 0; i < cardNameArray.length; i++)
    {
        if(topicInfoArray[i] != null)
        {
            populateTopicCard(cardNameArray[i], topicInfoArray[i]);
        }
        else
        {
            hideCard(cardNameArray[i]);
        }
    }
}

function hideCard(cardElementName)
{
    var card = document.getElementById(cardElementName);
    card.setAttribute("class", "collection-item avatar hide");
}

function populateTopicCard(cardName, topicInfoToUse)
{
    var card = document.getElementById(cardName); //Unhiding potentially hidden cards...
    card.setAttribute("class", "collection-item avatar"); //Unhiding potentially hidden cards...
    populateTopicCardAppearance(cardName, topicInfoToUse);
    populateTopicCardActions(cardName, topicInfoToUse);
}

function populateTopicCardAppearance(cardName, topicInfoToUse)
{
    var nameOfCardIcon = cardName + "-icon";
    var nameOfCardTitle = cardName + "-title";
    var nameOfCardDescription = cardName + "-description";
    var nameOfCardMemberCount = cardName + "-member-count";

    cardIcon = document.getElementById(nameOfCardIcon);
    cardIcon.setAttribute("class", cardIcon.getAttribute("class") + " " + topicInfoToUse.iconColour);
    cardIcon.innerHTML = topicInfoToUse.topicIcon;
    cardTitle = document.getElementById(nameOfCardTitle);
    cardTitle.innerHTML = topicInfoToUse.topicName;
    cardDescription = document.getElementById(nameOfCardDescription);
    cardDescription.innerHTML = topicInfoToUse.topicDescription;
    cardMemberCount = document.getElementById(nameOfCardMemberCount);
    cardMemberCount.innerHTML = topicInfoToUse.topicMemberCount;
}

function populateTopicCardActions(cardName, topicInfoToUse)
{
    var nameOfCardJoinButton = cardName + "-join-button";
    var nameOfCardVisitButton = cardName + "-visit-button";

    cardJoinButton = document.getElementById(nameOfCardJoinButton);
    cardJoinButton.setAttribute("href", "index.html#topic=" + topicInfoToUse.topicName);

    cardVisitButton = document.getElementById(nameOfCardVisitButton);
    cardVisitButton.setAttribute("href", "index.html#topic=" + topicInfoToUse.topicName);
}

cardNameArray = ["topic-one-card",
                 "topic-two-card",
                 "topic-three-card",
                 "topic-four-card",
                 "topic-five-card",];
//                 "topic-six-card",
//                 "topic-seven-card",
//                 "topic-eight-card",
//                 "topic-nine-card",
//                 "topic-ten-card"];

sampleTopicArray = [new TopicInfo("Food", "free_breakfast", "red", "A place for posting pictures of food.", 100000),
                    new TopicInfo("Fish", "bubble_chart", "blue lighten-2", "A place for posting fish", -1000)];

populateTopicCards(cardNameArray, sampleTopicArray);