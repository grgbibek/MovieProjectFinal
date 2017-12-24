<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Movie Page</title>
    <style>
        .username.ng-valid {
            background-color: lightgreen;
        }
        .username.ng-dirty.ng-invalid-required {
            background-color: red;
        }
        .username.ng-dirty.ng-invalid-minlength {
            background-color: yellow;
        }

        .email.ng-valid {
            background-color: lightgreen;
        }
        .email.ng-dirty.ng-invalid-required {
            background-color: red;
        }
        .email.ng-dirty.ng-invalid-email {
            background-color: yellow;
        }

    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <link href="<c:url value='/resources/css/app.css' />" rel="stylesheet" />
</head>
<body ng-app="myApp" class="ng-cloak">
<%@include file="template/navbar.jsp"%>
<div class="generic-container" ng-controller="movieController as ctrl">
    <div class="panel panel-default">
        <div class="panel-heading"><span class="lead">PLEASE ADD/UPDATE MOVIE </span></div>
        <div class="formcontainer">
            <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                <input type="hidden" ng-model="ctrl.movie.id" />
                <input type="hidden" name="hallId" value="${hallId}" />
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="movieName">Movie Name</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.movie.movieName" name="movieName" class=" form-control input-sm" placeholder="Enter Hall Name" required ng-minlength="3"/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.movieName.$error.required">This is a required field</span>
                                <span ng-show="myForm.movieName.$error.minlength">Minimum length required is 3</span>
                                <span ng-show="myForm.movieName.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="directors">Directors</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.movie.directors" name="directors" class=" form-control input-sm" placeholder="Enter Hall Name" required ng-minlength="3"/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.directors.$error.required">This is a required field</span>
                                <span ng-show="myForm.directors.$error.minlength">Minimum length required is 3</span>
                                <span ng-show="myForm.directors.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="movieTimeDuration">Time Duration</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.movie.movieTimeDuration" name="movieTimeDuration" class=" form-control input-sm" placeholder="Enter Hall Name" required ng-minlength="3"/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.movieTimeDuration.$error.required">This is a required field</span>
                                <span ng-show="myForm.movieTimeDuration.$error.minlength">Minimum length required is 3</span>
                                <span ng-show="myForm.movieTimeDuration.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="movieType">Type</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.movie.movieType" name="movieType" class=" form-control input-sm" placeholder="Enter Hall Name" required ng-minlength="3"/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.movieType.$error.required">This is a required field</span>
                                <span ng-show="myForm.movieType.$error.minlength">Minimum length required is 3</span>
                                <span ng-show="myForm.movieType.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="showTime">Shwo Time</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.movie.showTime" name="showTime" class=" form-control input-sm" placeholder="Enter Hall Name" required ng-minlength="3"/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.showTime.$error.required">This is a required field</span>
                                <span ng-show="myForm.showTime.$error.minlength">Minimum length required is 3</span>
                                <span ng-show="myForm.showTime.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="ticketPrice">Ticket Price</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.movie.ticketPrice" name="ticketPrice" class=" form-control input-sm" placeholder="Enter Hall Name" required ng-minlength="3"/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.ticketPrice.$error.required">This is a required field</span>
                                <span ng-show="myForm.ticketPrice.$error.minlength">Minimum length required is 3</span>
                                <span ng-show="myForm.ticketPrice.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="writer">Writer</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.movie.writer" name="writer" class=" form-control input-sm" placeholder="Enter Hall Location" required/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.writer.$error.required">This is a required field</span>
                                <span ng-show="myForm.writer.$invalid">This field is invalid </span>
                                <span ng-show="myForm.ticketPrice.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-actions floatRight">
                        <input type="submit"  value="{{!ctrl.movie.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                        <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">List of Halls </span></div>
        <div class="tablecontainer">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Movie Name</th>
                    <th>Directors</th>
                    <th>Time Duration</th>
                    <th>Type</th>
                    <th>Show Time</th>
                    <th>Ticket Price</th>
                    <th>Writer</th>
                    <th width="20%"></th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="movie in ctrl.movieList">
                    <td><span ng-bind="movie.id"></span></td>
                    <td><span ng-bind="movie.directors"></span></td>
                    <td><span ng-bind="movie.movieName"></span></td>
                    <td><span ng-bind="movie.movieTimeDuration"></span></td>
                    <td><span ng-bind="movie.movieType"></span></td>
                    <td><span ng-bind="movie.showTime"></span></td>
                    <td><span ng-bind="movie.ticketPrice"></span></td>
                    <td><span ng-bind="movie.writer"></span></td>
                    <td>
                        <button type="button" class="btn btn-warning custom-width"><a ng-href="/hall/movie/actor/{{movie.id}}">View</a></button> <button type="button" ng-click="ctrl.edit(movie.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(movie.id)" class="btn btn-danger custom-width">Remove</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="<c:url value='/resources/js/test.js' />"></script>
<script src="<c:url value='/resources/js/service/movieService.js' />"></script>
<script src="<c:url value='/resources/js/controller/movieController.js' />"></script>
</body>
</html>