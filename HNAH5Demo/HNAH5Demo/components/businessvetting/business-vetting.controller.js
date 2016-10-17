/**
 * Created by Otherplayer on 2016/10/17.
 */

angular.module('businessvetting', ['smart-table']).controller('businessVettingController', function($scope,$http,$filter) {
    $scope.businessTrip = [
        {name: '郭乐乐', title: '中国要人人人仍术有专攻圧s术有专攻奇才', date: '1987-05-21', to: '西安'},
        {name: '郭乐乐', title: '中国要人人人仍术有专攻圧s术有专攻奇才', date: '1987-05-21', to: '西安'},
        {name: '郭乐乐', title: '中国要人人人仍术有专攻圧s术有专攻奇才', date: '1987-05-21', to: '西安'},
        {name: '郭乐乐', title: '中国要人人人仍术有专攻圧s术有专攻奇才', date: '1987-05-21', to: '西安'}
    ];

    
    $scope.businessTripItemsIsChanged = function (index) {
        $scope.businessTrip[index].isGreen = !$scope.businessTrip[index].isGreen;
    }
    
    
    //$scope.businessTripWipeItems = ['申请人','报销事项','项目','总金额','时间','是否同意'];

    $scope.businessTripWipe = [
        {name: '郭乐乐', title: '中国要人人人仍术有专攻圧的出差报销', date: '1987-05-21', to: '10000.00'},
        {name: '郭乐乐', title: '中国要人人人仍术有专攻圧s术有专攻奇才', date: '1987-05-21', to: '300'},
        {name: '郭乐乐', title: '中国要人人人仍术有专攻圧s术有专攻奇才', date: '1987-05-21', to: '4598.45'},
        {name: '郭乐乐', title: '中国要人人人仍术有专攻圧s术有专攻奇才', date: '1987-05-21', to: '200.22'}
    ];

    $scope.businessTripWipeItemsIsChanged = function (index) {
        $scope.businessTripWipe[index].isGreen = !$scope.businessTripWipe[index].isGreen;
    }

    // $scope.availableColors = ['Red','Green','Blue','Yellow','Magenta','Maroon','Umbra','Turquoise'];

});
