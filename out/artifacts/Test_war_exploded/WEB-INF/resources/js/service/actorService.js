/**
 * Created by grgbibek22 on 12/21/2017.
 */
'use strict';

angular.module('myApp').factory('actorService', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'http://localhost:8088/hall/movie/actor/';

    var factory = {
        fetchAllActors: fetchAllActors,
        createActor: createActor,
        updateActor:updateActor,
        deleteActor:deleteActor
    };

    return factory;

    function fetchAllActors(actorId) {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI + 'get/' + actorId)
            .then(
                function (response) {
                    deferred.resolve(response.data);
                },
                function(errResponse){
                    console.error('Error while fetching Actors');
                    deferred.reject(errResponse);
                }
            );
        return deferred.promise;
    }

    function createActor(actor, d) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI + "add/" + d, actor)
            .then(
                function (response) {
                    deferred.resolve(response.data);
                },
                function(errResponse){
                    console.error('Error while creating Actor');
                    deferred.reject(errResponse);
                }
            );
        return deferred.promise;
    }


    function updateActor(actor, h, id) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI + "update/" + h, actor)   /*  made changes in this line   */
            .then(
                function (response) {
                    deferred.resolve(response.data);
                },
                function(errResponse){
                    console.error('Error while updating Actor');
                    deferred.reject(errResponse);
                }
            );
        return deferred.promise;
    }

    function deleteActor(actorId) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI + "delete/" + actorId)
            .then(
                function (response) {
                    deferred.resolve(response.data);
                },
                function(errResponse){
                    console.error('Error while deleting Actor');
                    deferred.reject(errResponse);
                }
            );
        return deferred.promise;
    }

}]);
