/**
 * Created by Otherplayer on 2016/10/13.
 */


angular.module('businesstrip', []).controller('businessTripController', function($scope,$http) {
        $scope.firstName = "John";
        $scope.lastName = "Doe";
        $scope.fullName = function() {
            return $scope.firstName + " " + $scope.lastName;
        }


        // $http.get("/bimbot-h5/src/assets/api/data.json")
        //     .success(function (response) {
        //         console.log(response);
        //         $scope.names = response.sites;
        //     })

    $scope.p2333 = {"sd":"sdaf"};


    console.log(JSON.stringify($scope.p2333));

    $scope.submitAction = function() {
        console.log('submitAction');
        return 'abcdefg';
    }
    $scope.msg = '你好，Angular！';
    $scope.getData = function () {
        return 'qubernet';
    }
    $scope.submitAction2 = function() {
        console.log('submitAction');
        alert('ssss');
        // javascript:testobject.TestNOParameter();
    }

   //  $scope.testobject = function(firstname,lastname) {
   //      this.firstname=firstname;
   //      this.lastname=lastname;
   // console.log('sssss');
   //      $scope.TestNOParameter = function () {
   //          console.log('ssssssssss');
   //      }
   //      // function TestNOParameter(){
   //      //     console.log('ssssssssss');
   //      // }
   //      alert('ssss');
   //      function TestOneParameter(name){
   //      }
   //
   //
   //
   //
   //      function TestTowParameterSecondParameter(name,name2){
   //          this.lastname = name;
   //          this.lastname = name2;
   //      }
   //  }
});