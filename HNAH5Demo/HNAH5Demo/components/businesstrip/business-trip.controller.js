/**
 * Created by Otherplayer on 2016/10/13.
 */


angular.module('businesstrip', []).controller('businessTripController', function($scope,$http) {
    $scope.gwTitle = '';
    $scope.gwAddress = '';
    $scope.gwStartDate = '';
    $scope.gwEndDate = '';
    $scope.gwNeedAirTicket = true;
    $scope.airlinesFrom = ['Beijing','Shanghai','ZhengZhou'];
    $scope.airlinesTo = ['Beijing','Shanghai','ZhengZhou'];
    $scope.airports = ['海南航空'];
    $scope.gwFrom = $scope.airlinesFrom[0];
    $scope.gwTo = $scope.airlinesTo[0];
    $scope.gwAirplane = $scope.airports[0];
        // $http.get("/bimbot-h5/src/assets/api/data.json")
        //     .success(function (response) {
        //         console.log(response);
        //         $scope.names = response.sites;
        //     })

    $scope.shouldApplyAirTicket = function (value) {
        $scope.gwNeedAirTicket = value;
    }


    // $scope.availableColors = ['Red','Green','Blue','Yellow','Magenta','Maroon','Umbra','Turquoise'];

});