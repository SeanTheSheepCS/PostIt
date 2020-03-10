<!-- This html document is confusing as hell, so I put comments on the most important stuff ignore the rest-->
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!-- font awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <!--Import Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
  <style>
    .halfway-fab-one-step-to-the-left
    {
      position: absolute;
      right: 72px;
      bottom: -20px;
    }
    .halfway-fab-two-steps-to-the-left
    {
      position: absolute;
      right: 120px;
      bottom: -20px;
    }
    .halfway-fab-three-steps-to-the-left
    {
      position: absolute;
      right: 168px;
      bottom: -20px;
    }
  </style>
  <title>Thread Show</title>

  <div class="row valign-wrapper">
    <div class="col s12 m8 offset-m2 valign">
        <div class="Heading">
            <div class="card blue-grey darken-1">
    <!--THIS DIV SECTION IS WHERE THE THREAD STARTS-->
            <div class="card-image">
              <!--THREAD IMAGE-->
                <img id="thread_image">
                <!--THREAD TITLE-->
                <span class="card-title " id = "thread_title"></span>        
                <!--THREAD BUTTONS LIKE/DISLIKE-->    
                <a class = " btn-floating halfway-fab-one-step-to-the-left waves-effect btn-small waves-light red" href="#"><i class="material-icons">thumb_up</i></a>
                <a class = " btn-floating halfway-fab-two-steps-to-the-left waves-effect btn-small waves-light red" href="#"><i class="material-icons">thumb_down</i></a>
            </div>

            <div class="card-content white-text">
              <!--THREAD TEXT-->
                <p id = "thread_content"></p>
                </div>
                <div class="card-action">
                    <ul class="collection">
                      <!--BELOW IS AUTHOR INFORMATION-->
                        <li class="collection-item avatar">
                            <i class="material-icons circle" id = "author-icon"></i>
                          <span class="title" id = "author-name"></span>
                          <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
                        </li>
                      </ul>
                </div>
            </div>
          </div>
          <!-- THIS IS WHERE THE COMMENTS ARE STORED-->
          <div class="Comment">
            <ul class="collection">
              <div class="card  blue-grey lighten-5">
                <div class="card-content">
                  <li id="comment-0">
                    <i class="material-icons circle" id = "comment-0-icon"></i>
                    <span class="title" id = "comment-0-name" ></span>
                    <p id = "comment-0-comment"></p>
                    <a onclick="showMessage(0)" class="secondary-content waves-effect waves-light btn-small"><i class="material-icons left">add</i>Reply</a>
                  </li>

                  <li id = "comment-0-show" class ="hide">
                    <div class="row">
                      <div class="input-field col s10">
                        <i class="material-icons prefix">mode_edit</i>
                        <textarea id="icon_prefix0" class="materialize-textarea"></textarea>
                        <label for="icon_prefix0">Message</label>
                      </div>
                  </li>
              </div>
            </div>

              <div class="card  blue-grey lighten-5">
                <div class="card-content">
                  <li id=comment-1>
                      <i class="material-icons circle" id = "comment-1-icon"></i>
                      <span class="title" id = "comment-1-name" ></span>
                      <p id = "comment-1-comment"></p>
                      <a onclick="showMessage(1)" class="secondary-content waves-effect waves-light btn-small"><i class="material-icons left">add</i>Reply</a>
                    </li>

                    <li id="comment-1-show" class ="hide">
                      <div class="row">
                        <div class="input-field col s10">
                          <i class="material-icons prefix">mode_edit</i>
                          <textarea id="icon_prefix1" class="materialize-textarea"></textarea>
                          <label for="icon_prefix1">Message</label>
                        </div>
                    </li>
                  </div>
                </div>
                
              <div class="card  blue-grey lighten-5">
                <div class="card-content">     
                  <li id=comment-2>
                    <i class="material-icons circle" id = "comment-2-icon"></i>
                    <span class="title" id = "comment-2-name" ></span>
                    <p id = "comment-2-comment"></p>
                    <a onclick="showMessage(2)" class="secondary-content waves-effect waves-light btn-small"><i class="material-icons left">add</i>Reply</a>
                  </li>


                  <li id="comment-2-show" class ="hide">
                    <div class="row">
                      <div class="input-field col s10">
                        <i class="material-icons prefix">mode_edit</i>
                        <textarea id="icon_prefix2" class="materialize-textarea"></textarea>
                        <label for="icon_prefix2">Message</label>
                        <button class="btn waves-effect waves-light" type="submit" name="action">Submit
                          <i class="material-icons right">send</i>
                      </div>
                      
                  </li>
                </div>
              </div>
                  
              </ul>
            </div>

            <!--THIS IS WHERE COMMENT ON THREAD IS-->
            <div class="card blue-grey lighten-5">
              <div class="card-content">
                <ul class="collection">
                  <li class="collection-item avatar black-text">
                    <i class="material-icons circle red" id = "icon"></i>
                          <span class="title" id = "username">OK</span>
                          <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
                  </li>
                  <li class="collection-item avatar black-text">
                    <div class="row">
                      <div class="input-field col s10">
                        <i class="material-icons prefix">mode_edit</i>
                        <textarea id="icon_prefix3" class="materialize-textarea"></textarea>
                        <label for="icon_prefix3">Message</label>
                        
                      </div>
                  </li>
                </ul>
              </div>
              <div class="card-action">
                <button class="btn waves-effect waves-light" type="submit" name="action">Submit
                 <i class="material-icons right">send</i>
                </button>
              </div>
            </div>



            <!--ALL THE PAGES, MAX IS 5-->
            <ul class="pagination">
              <li id = "c0"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
              <li id = "p0"><a href="#!">1</a></li>
              <li id = "p1"><a href="#!">2</a></li>
              <li id = "p2"><a href="#!">3</a></li>
              <li id = "p3"><a href="#!">4</a></li>
              <li id = "p4"><a href="#!">5</a></li>
              <li id = "c1"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
            </ul>
              
    </div>
  
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
  <script>
    $(document).ready(function(){

    });
  </script>
  <script src="js/control.js"></script>
</body>
</html>