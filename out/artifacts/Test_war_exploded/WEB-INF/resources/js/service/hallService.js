/**
 * Created by grgbibek22 on 12/21/2017.
 */
'use strict';

angular.module('myApp').factory('hallService', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'http://localhost:8088/hall/';

    var factory = {
        fetchAllHall: fetchAllHall,
        createHall: createHall,
        updateHall: updateHall,
        deleteHall: deleteHall
    };

    return factory;

    function fetchAllHall() {
     var deferred = $q.defer();
     $http.get(REST_SERVICE_URI + "getHallList")
     .then(
     function (response) {
     deferred.resolve(response.data);
     },
     function(errResponse){
     console.error('Error while fetching Users');
     deferred.reject(errResponse);
     }
     );
     return deferred.promise;
     }

    function createHall(hall) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI + "add", hall)
            .then(
                function (response) {
                    deferred.resolve(response.data);
                },
                function(errResponse){
                    console.error('Error while creating Hall');
                    deferred.reject(errResponse);
                }
            );
        return deferred.promise;
    }


    function updateHall(hall, hallId) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI + "update/", hall)   /*  made changes in this line   */
            .then(
                function (response) {
                    deferred.resolve(response.data);
                },
                function(errResponse){
                    console.error('Error while updating Hall');
                    deferred.reject(errResponse);
                }
            );
        return deferred.promise;
    }

    function deleteHall(hallId) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI + "delete/" + hallId)
            .then(
                function (response) {
                    deferred.resolve(response.data);
                },
                function(errResponse){
                    console.error('Error while deleting Hall');
                    deferred.reject(errResponse);
                }
            );
        return deferred.promise;
    }

}]);
