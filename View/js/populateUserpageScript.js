class UserDisplayInfo
{
    constructor(username, icon, email)
    {
        this.username = username;
        this.icon = icon;
        this.email = email;
    }
}

function populateUserPage(user)
{
    var usernameField = document.getElementById("username-field");
    var userIconField = document.getElementById("user-icon");
    var userEmailField = document.getElementById("user-email");
    usernameField.innerHTML = user.username;
    userIconField.innerHTML = user.icon;
    userEmailField.innerHTML = user.email;
}

populateUserPage(new UserDisplayInfo("Tom", "train", "dasjkdasl@gmail.com"))