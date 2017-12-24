/**
 * Created by grgbibek22 on 12/21/2017.
 */
'use strict';

angular.module('myApp').factory('movieService', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'http://localhost:8088/hall/movie/';

    var factory = {
        fetchAllMovies: fetchAllMovies,
        createMovie: createMovie,
        updateMovie:updateMovie,
        deleteMovie:deleteMovie
    };

    return factory;

    function fetchAllMovies(hallId) {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI + 'get/' + hallId)
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

    function createMovie(movie, d) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI + "add/" + d, movie)
            .then(
                function (response) {
                    deferred.resolve(response.data);
                },
                function(errResponse){
                    console.error('Error while creating Movie');
                    deferred.reject(errResponse);
                }
            );
        return deferred.promise;
    }


    function updateMovie(movie, h, id) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI + "update/" + h, movie)   /*  made changes in this line   */
            .then(
                function (response) {
                    deferred.resolve(response.data);
                },
                function(errResponse){
                    console.error('Error while updating Movie');
                    deferred.reject(errResponse);
                }
            );
        return deferred.promise;
    }

    function deleteMovie(movieId) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI + "delete/" + movieId)
            .then(
                function (response) {
                    deferred.resolve(response.data);
                },
                function(errResponse){
                    console.error('Error while deleting Movie');
                    deferred.reject(errResponse);
                }
            );
        return deferred.promise;
    }

}]);
/**
 * Created by grgbibek22 on 12/21/2017.
 */
