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

    $scope.p2333 = $scope.firstName + $scope.lastName;
    $scope.msg = '你好，Angular！';

});