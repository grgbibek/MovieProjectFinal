/**
 * Created by grgbibek22 on 12/21/2017.
 */
'use strict';

angular.module('myApp').controller('movieController', ['$scope', 'movieService', function($scope, movieService) {
    var self = this;
    self.movie={id:null,directors:'',movieName:'',movieTimeDuration:'',
        movieType:'',showTime:'', stars:'', ticketPrice:'', writer:''/*  ,hallId: null  */};
    self.movieList=[];
    self.hallId = document.getElementsByName("hallId")[0].value;
    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;


    fetchAllMovies();

    function fetchAllMovies(){
        movieService.fetchAllMovies(self.hallId)
            .then(
                function(d) {
                    self.movieList = d;
                },
                function(errResponse){
                    console.error('Error while fetching Users');
                }
            );
    }

    function createMovie(movie, h){
        movieService.createMovie(movie, h)
            .then(
                fetchAllMovies,
                function(errResponse){
                    console.error('Error while creating Movie');
                }
            );
    }

    function updateMovie(movie, h, id){
        movieService.updateMovie(movie, h, id)
            .then(
                fetchAllMovies,
                function(errResponse){
                    console.error('Error while updating Movie');
                }
            );
    }

    function deleteMovie(id){
        movieService.deleteMovie(id)
            .then(
                fetchAllMovies,
                function(errResponse){
                    console.error('Error while deleting Movie');
                }
            );
    }

    function submit() {
        if(self.movie.id===null){
            console.log('Saving New Movie', self.movie);
            createMovie(self.movie, self.hallId);
        }else{
            updateMovie(self.movie, self.hallId, self.movie.id);
            console.log('Movie updated with Id ', self.movie.id);
        }
        reset();
    }

    function edit(id){
        console.log('Id to be edited', id);
        for(var i = 0; i < self.movieList.length; i++){
            if(self.movieList[i].id === id) {
                self.movie = angular.copy(self.movieList[i]);
                break;
            }
        }
    }

    function remove(id){
        console.log('Id to be deleted', id);
        if(self.movie.id === id) {//clean form if the hall to be deleted is shown there.
            reset();
        }
        deleteMovie(id);
    }


    function reset(){
        self.movie={id:null,directors:'',movieName:'',movieTimeDuration:'',movieType:'',showTime:'', stars:'', ticketPrice:'', writer:''};
        $scope.myForm.$setPristine(); //reset Form
    }

}]);/**
 * Created by grgbibek22 on 12/21/2017.
 */
