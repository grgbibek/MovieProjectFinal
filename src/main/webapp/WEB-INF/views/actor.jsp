<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Actor Page</title>
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
<div class="generic-container" ng-controller="actorController as ctrl">
    <div class="panel panel-default">
        <div class="panel-heading"><span class="lead">PLEASE ADD/UPDATE ACTOR </span></div>
        <div class="formcontainer">
            <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                <input type="hidden" ng-model="ctrl.actor.id" />
                <input type="hidden" name="movieId" value="${movieId}" />
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="name">Actor Name</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.actor.name" name="name" class=" form-control input-sm" placeholder="Enter Actor Name" required ng-minlength="3"/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.name.$error.required">This is a required field</span>
                                <span ng-show="myForm.name.$error.minlength">Minimum length required is 3</span>
                                <span ng-show="myForm.name.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="role">Actor Role</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.actor.role" name="role" class=" form-control input-sm" placeholder="Enter Actor Role " required ng-minlength="3"/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.role.$error.required">This is a required field</span>
                                <span ng-show="myForm.role.$error.minlength">Minimum length required is 3</span>
                                <span ng-show="myForm.role.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="age">Age</label>
                        <div class="col-md-7">
                            <input type="number" ng-model="ctrl.actor.age" name="age" class=" form-control input-sm"  required />
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.age.$error.required">This is a required field</span>
                                <span ng-show="myForm.age.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="sex">Sex</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.actor.sex" name="sex" class=" form-control input-sm"  required ng-minlength="3"/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.sex.$error.required">This is a required field</span>
                                <span ng-show="myForm.sex.$error.minlength">Minimum length required is 3</span>
                                <span ng-show="myForm.sex.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-actions floatRight">
                        <input type="submit"  value="{{!ctrl.actor.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                        <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">List of Actors </span></div>
        <div class="tablecontainer">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Actor Name</th>
                    <th>Role</th>
                    <th>Age</th>
                    <th>Sex</th>
                    <th width="20%"></th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="actor in ctrl.actorList">
                    <td><span ng-bind="actor.id"></span></td>
                    <td><span ng-bind="actor.name"></span></td>
                    <td><span ng-bind="actor.role"></span></td>
                    <td><span ng-bind="actor.age"></span></td>
                    <td><span ng-bind="actor.sex"></span></td>

                    <td>
                        <button type="button" ng-click="ctrl.edit(actor.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(actor.id)" class="btn btn-danger custom-width">Remove</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="<c:url value='/resources/js/hall.js' />"></script>
<script src="<c:url value='/resources/js/service/actorService.js' />"></script>
<script src="<c:url value='/resources/js/controller/actorController.js' />"></script>
</body>
</html>