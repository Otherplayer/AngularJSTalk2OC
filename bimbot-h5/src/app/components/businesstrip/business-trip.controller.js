/**
 * Created by Otherplayer on 2016/10/13.
 */


angular.module('businesstrip', []).controller('businessTripController', function($scope,$http,$location) {

    console.log($location.absUrl());

    $scope.gwTitle = '';
    $scope.gwAddress = '';
    $scope.gwStartDate = new Date();
    $scope.gwEndDate = new Date();
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

    // $http({
    //     url:'data.json',
    //     method:'GET'
    // }).success(function(data,header,config,status){
    //      //响应成功
    // }).error(function(data,header,config,status){
    //      //处理响应失败
    // });

    // $http({
    //     method : 'POST',
    //     params :{ userId : 'abcd'},
    //     headers : { 'Content-Type': 'application/x-www-form-urlencoded' }
    // }).success(function(res){
    //         // 回调函数
    // })
    // $scope.availableColors = ['Red','Green','Blue','Yellow','Magenta','Maroon','Umbra','Turquoise'];

});