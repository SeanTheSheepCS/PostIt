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
    usernameField.innerHTML = user.username;
    var userIconField = document.getElementById("user-icon");
    userIconField.innerHTML = user.icon;
    var userEmailField = document.getElementById("user-email");
    userEmailField.innerHTML = user.email;
}

populateUserPage(new UserDisplayInfo("Tom", "train", "dasjkdasl@gmail.com"))