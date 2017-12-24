/**
 * Created by grgbibek22 on 12/21/2017.
 */
'use strict';

angular.module('myApp').controller('hallController', ['$scope', 'hallService', function($scope, hallService) {
    var self = this;
    self.hall={id:null,hallName:'',numberOfScreen:'',location:''};
    self.hallList=[];

    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;


    fetchAllHall();

    function fetchAllHall(){
        hallService.fetchAllHall()
            .then(
                function(d) {
                    self.hallList = d;
                },
                function(errResponse){
                    console.error('Error while fetching Halls');
                }
            );
    }

    function createHall(hall){
        hallService.createHall(hall)
            .then(
                fetchAllHall,
                function(errResponse){
                    console.error('Error while creating Hall');
                }
            );
    }

    function updateHall(hall, hallId){
        hallService.updateHall(hall, hallId)
            .then(
                fetchAllHall,
                function(errResponse){
                    console.error('Error while updating Hall');
                }
            );
    }

    function deleteHall(hallId){
        hallService.deleteHall(hallId)
            .then(
                fetchAllHall,
                function(errResponse){
                    console.error('Error while deleting Hall');
                }
            );
    }

    function submit() {
        if(self.hall.hallId===null){
            console.log('Saving New Hall', self.hall);
            createHall(self.hall);
        }else{
            updateHall(self.hall, self.hall.id);
            console.log('Hall updated with Id ', self.hall.id);
        }
        reset();
    }

    function edit(hallId){
        console.log('Id to be edited', hallId);
        for(var i = 0; i < self.hallList.length; i++){
            if(self.hallList[i].id === hallId) {
                self.hall = angular.copy(self.hallList[i]);
                break;
            }
        }
    }

    function remove(hallId){
        console.log('Id to be deleted', hallId);
        if(self.hall.id === hallId) {//clean form if the hall to be deleted is shown there.
            reset();
        }
        deleteHall(hallId);
    }


    function reset(){
        self.hall={id:null,hallName:'',numberOfScreen:'',location:''};
        $scope.myForm.$setPristine(); //reset Form
    }

}]);