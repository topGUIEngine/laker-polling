<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CreatQuiz</title>
    <asset:stylesheet href="bootstrap.min.css"/>
    <!-- jQuery (necessary for Bootstrap"s JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>
<nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll">
            <button type="button" onclick="logout()" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> LOGOUT <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand page-scroll" href="/dashboard">

<asset:image src="logo2.png"
             style="height: 80px !important; width: 120px !important; position: absolute; top: 0%"/>

%{--<img src="logo.png" style="height: 60px !important; width: 120px !important; position: absolute; top: 0%">--}%
</a>
<a id="coursePageTitle" class="navbar-brand" style="position: absolute; left: 45%; font-size: x-large"></a>


<!--<a class="navbar-brand page-scroll" href="#page-top">LOGO HERE</a>-->
</div>

<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right">
        <li>
            %{--<button onclick="logout()" class="btn btn-default navbar-right navbar-btn">Logout</button>--}%
            <a class="logout" onclick="logout()" >LogOut</a>
        </li>
    </ul>
</div>
<!-- /.navbar-collapse -->
</div>
<!-- /.container-fluid -->
</nav>

<section>
    <div class="container">
        <a href="/course?courseId=${session.courseId}" style="margin-left: 60px; href="/course?courseId=${session.courseId}" class="btn btn-default btn-md">
        <span class="glyphicon glyphicon-arrow-left"></span> Back to Course Page
    </a>

        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <div id="quizes" class="table-responsive">
                    <table id="quizTable" class="table">
                        <thead>
                        <tr>
                            <th class="col-md-1" data-field="number">#</th>
                            <th class="col-md-1" data-field="test">Test</th>
                            <th class="col-md-1" data-field="number">Answers</th>
                            <th class="col-md-1" data-field="button" data-formatter="studentDeleteButtonFormatter" id="deleteQuizButton">Delete</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
            <div class="col-sm-4"></div>
        </div>
</section>
<!-- add student by email -->
<div class="row">
    <div class="col-sm-4"></div>
    <div class="col-sm-4">
        <form id="quiz-form" method="post" style="margin-top: 30px;">
            <label>Add Quiz</label>
            <div class="form-cotrol">
                <textarea class="form-control" placeholder="Your question *" id="message" required data-validation-required-message="Please enter a message."></textarea>
                %{--<input id="quiz" type="text" placeholder="what is your question?" required>--}%
                %{--<input type="submit" value="Add Quiz" class="btn btn-success" id="email-button">--}%

                <br>
                <br>
                <label>A</label>
                <input id="A" type="text" placeholder="Answer option A?" required>  <input type="checkbox" name="A" value="">
                <br>
                <br>
                <label>B</label>
                <input id="B" type="text" placeholder="Answer option B?" required>  <input type="checkbox" name="B" value="">

                <br>
                <br>
                <label>C</label>
                <input id="C" type="text" placeholder="Answer option C?" required> <input type="checkbox" name="C" value="">
                <br>
                <br>
                <label>D</label>
                <input id="D" type="text" placeholder="Answer option D?" required> <input type="checkbox" name="D" value="">
                <br>
                <br>
                <label>E</label>
                <input id="E" type="text" placeholder="Answer option E?" required> <input type="checkbox" name="E" value="">
            </div>
        </form>
    </div>
</div>

<div class="row">
    %{--<div class="col-md-2 text-center"></div>--}%
    <div class="col-md-4 col-lg-offset-3 text-center">
        <input type="submit" value="Add Quiz" class="btn btn-success" id="quiz-button">
    </div>
    <div class="col-md-1 text-center">
        <input type="submit" value="Submit Quiz" class="btn btn-success" id="email-button">
    </div>
    %{--<div class="col-sm-4">--}%
        %{--<form id="csv-form" enctype="multipart/form-data" method="post">--}%
            %{--<label>Add a CSV file</label>--}%
            %{--<div class="form-group">--}%
                %{--<input id="csv-file" type="file" accept=".csv">--}%
                %{--<input style="margin-top: 5px;" type="submit" value="Send CSV" class="btn btn-success" id="file-button">--}%
            %{--</div>--}%
        %{--</form>--}%
    %{--</div>--}%
</div>

</div>
<!-- Modal -->
%{--<div id="deleteStudentModal" class="modal fade" role="dialog">--}%
    %{--<div class="modal-dialog">--}%
        %{--<!-- Modal content-->--}%
        %{--<div class="modal-content clean-container">--}%
            %{--<div class="modal-header">--}%
                %{--<button type="button" class="close" data-dismiss="modal">&times;</button>--}%
                %{--<h4 class="modal-title heading">Delete Student?</h4>--}%
            %{--</div>--}%
            %{--<div class="modal-body">--}%
                %{--<p>Are you sure you want to remove <span id="studentName"></span>?</p>--}%
            %{--</div>--}%
            %{--<div class="modal-footer">--}%
                %{--<button id="confirmDeleteStudent" type="button" class="btn btn-danger btn-ok js-deleteStudent" data-dismiss="modal" data-student-id="">Yes</button>--}%
                %{--<button type="button" class="btn btn-default" data-dismiss="modal">No</button>--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</div>--}%
%{--</div>--}%
%{--</div>--}%


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">

<asset:javascript src="jquery-3.2.0.min.js"/>
<script src="https://apis.google.com/js/platform.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>

<asset:javascript src="auth/config.js"/>
<asset:javascript src="auth/logout.js"/>
<asset:javascript src="instructor.js"/>
<asset:stylesheet href="bootstrap.css"/>
<asset:stylesheet href="agency.min.css"/>
<asset:stylesheet href="agency.css"/>
<asset:stylesheet href="style.css"/>

<script>
    window.onload=prepareClassTitle(${session.courseId});
</script>

</body>
</html>