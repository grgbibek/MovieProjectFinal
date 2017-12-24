/**
 * Created by grgbibek22 on 12/22/2017.
 */
/**
 * Created by grgbibek22 on 12/21/2017.
 */
'use strict';

angular.module('myApp').controller('actorController', ['$scope', 'actorService', function($scope, actorService) {
    var self = this;
    self.actor={id:null,name:'',role:'', age:null, sex:''};
    self.actorList=[];
    self.movieId = document.getElementsByName("movieId")[0].value;
    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;


    fetchAllActors();

    function fetchAllActors(){
        actorService.fetchAllActors(self.movieId)
            .then(
                function(d) {
                    self.actorList = d;
                },
                function(errResponse){
                    console.error('Error while fetching Actors');
                }
            );
    }

    function createActor(actor, h){
        actorService.createActor(actor, h)
            .then(
                fetchAllActors,
                function(errResponse){
                    console.error('Error while creating Actor');
                }
            );
    }

    function updateActor(actor, h, id){
        actorService.updateActor(actor, h, id)
            .then(
                fetchAllActors,
                function(errResponse){
                    console.error('Error while updating Actor');
                }
            );
    }

    function deleteActor(id){
        actorService.deleteActor(id)
            .then(
                fetchAllActors,
                function(errResponse){
                    console.error('Error while deleting Actor');
                }
            );
    }

    function submit() {
        if(self.actor.id===null){
            console.log('Saving New Actor', self.actor);
            createActor(self.actor, self.movieId);
        }else{
            updateActor(self.actor, self.movieId, self.actor.id);
            console.log('Actor updated with Id ', self.actor.id);
        }
        reset();
    }

    function edit(id){
        console.log('Id to be edited', id);
        for(var i = 0; i < self.actorList.length; i++){
            if(self.actorList[i].id === id) {
                self.actor = angular.copy(self.actorList[i]);
                break;
            }
        }
    }

    function remove(id){
        console.log('Id to be deleted', id);
        if(self.actor.id === id) {//clean form if the actor to be deleted is shown there.
            reset();
        }
        deleteActor(id);
    }


    function reset(){
        self.actor={id:null,name:'',role:'', age:null, sex:''};
        $scope.myForm.$setPristine(); //reset Form
    }

}]);

