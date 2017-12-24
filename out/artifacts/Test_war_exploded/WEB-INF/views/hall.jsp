<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Hall page</title>
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
<div class="generic-container" ng-controller="hallController as ctrl">
    <div class="panel panel-default">
        <div class="panel-heading"><span class="lead">Please ADD/UPDATE Hall </span></div>
        <div class="formcontainer">
            <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                <input type="hidden" ng-model="ctrl.hall.id" />
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="hallName">Hall Name</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.hall.hallName" name="hallName" class=" form-control input-sm" placeholder="Enter Hall Name" required ng-minlength="3"/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.hallName.$error.required">This is a required field</span>
                                <span ng-show="myForm.hallName.$error.minlength">Minimum length required is 3</span>
                                <span ng-show="myForm.hallName.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="numberOfScreen">Number Of Screen</label>
                        <div class="col-md-7">
                            <input type="number" ng-model="ctrl.hall.numberOfScreen" class="form-control input-sm" />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="location">Location</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.hall.location" name="location" class=" form-control input-sm" placeholder="Enter Hall Location" required/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.location.$error.required">This is a required field</span>
                                <span ng-show="myForm.location.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-actions floatRight">
                        <input type="submit"  value="{{!ctrl.hall.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
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
                    <th>Hall Name</th>
                    <th>Number Of Screen</th>
                    <th>Location</th>
                    <th width="20%"></th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="hall in ctrl.hallList">
                    <td><span ng-bind="hall.id"></span></td>
                    <td><span ng-bind="hall.hallName"></span></td>
                    <td><span ng-bind="hall.numberOfScreen"></span></td>
                    <td><span ng-bind="hall.location"></span></td>
                    <td>
                        <button type="button" class="btn btn-warning custom-width"><a ng-href="/hall/movie/{{hall.id}}">View</a></button> <button type="button" ng-click="ctrl.edit(hall.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(hall.id)" class="btn btn-danger custom-width">Remove</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="<c:url value='/resources/js/hall.js' />"></script>
<script src="<c:url value='/resources/js/service/hallService.js' />"></script>
<script src="<c:url value='/resources/js/controller/hallController.js' />"></script>
</body>
</html>