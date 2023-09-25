<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Dashboard</title>
  <link rel="stylesheet" href="/../resources/feb/css/feb2.css" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="js/echarts.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5.4.2/dist/echarts.min.js"></script> 
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
  <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script type="text/javascript">
  	// 각 공정별 가동률 평균 차트
    function FebOpratioChart(vals) {
      var dom = document.getElementById('FebOpratio_Chart');
      var myChart = echarts.init(dom, null, {
        renderer: 'canvas',
        useDirtyRect: false
      });
        var option = {
                xAxis: {
                  type: 'category',
                  data: ['1공정','2공정','3공정','4공정','5공정','6공정','7공정','8공정']
                },
        yAxis: {type: 'value'},
        series: [{
            data: vals,
            type: 'bar',
            showBackground: true,
            backgroundStyle: {color: 'rgba(180, 180, 180, 0.2)'}
        }]
      };
      if (option && typeof option === 'object') {
        myChart.setOption(option);
      }
      window.addEventListener('resize', myChart.resize);
    }
   </script>
   <script type="text/javascript">
	// 각 공정별 총생산량 합계 차트
	   function FebTrChart(vals) {
	     var dom = document.getElementById('FebTr_Chart');
	     var myChart = echarts.init(dom, null, {
	       renderer: 'canvas',
	       useDirtyRect: false
	     });
	       var option = {
	               xAxis: {
	                 type: 'category',
	                 data: ['1공정','2공정','3공정','4공정','5공정','6공정','7공정','8공정']
	               },
	       yAxis: {type: 'value'},
	       series: [{
	           data: vals,
	           type: 'bar',
	           showBackground: true,
	           backgroundStyle: {color: 'rgba(180, 180, 180, 0.2)'}
	       }]
	     };
	     if (option && typeof option === 'object') {
	       myChart.setOption(option);
	     }
	     window.addEventListener('resize', myChart.resize);
	   }   
   </script>
   <script type="text/javascript">
	// 각 공정별 총 전기사용 비용 합계 차트
	   function FebCostChart(vals) {
	     var dom = document.getElementById('FebCost_Chart');
	     var myChart = echarts.init(dom, null, {
	       renderer: 'canvas',
	       useDirtyRect: false
	     });
	       var option = {
	               xAxis: {
	                 type: 'category',
	                 data: ['1공정','2공정','3공정','4공정','5공정','6공정','7공정','8공정']
	               },
	       yAxis: {type: 'value'},
	       series: [{
	           data: vals,
	           type: 'bar',
	           showBackground: true,
	           backgroundStyle: {color: 'rgba(180, 180, 180, 0.2)'}
	       }]
	     };
	     if (option && typeof option === 'object') {
	       myChart.setOption(option);
	     }
	     window.addEventListener('resize', myChart.resize);
	   }   
   </script>
   <script type="text/javascript">
	// 각 공정별 총 전기사용량 합계 차트
	   function FebUsingratioChart(vals) {
	     var dom = document.getElementById('FebUsingratio_Chart');
	     var myChart = echarts.init(dom, null, {
	       renderer: 'canvas',
	       useDirtyRect: false
	     });
	  	       var option = {
	               xAxis: {
	                 type: 'category',
	                 data: ['1공정','2공정','3공정','4공정','5공정','6공정','7공정','8공정']
	               },
	       yAxis: {type: 'value'},
	       series: [{
	           data: vals,
	           type: 'bar',
	           showBackground: true,
	           backgroundStyle: {color: 'rgba(180, 180, 180, 0.2)'}
	       }]
	     };
	     if (option && typeof option === 'object') {
	       myChart.setOption(option);
	     }
	     window.addEventListener('resize', myChart.resize);
	   }   
   </script>
   <script type="text/javascript">
   function CostsTrChart(febcosts, febtr) {
	   console.log("CostsTrChart([" + febcosts + "], [" + febtr + "])");
	   var myChart = echarts.init(document.getElementById('Costs_Tr_Chart'));
	   var option = {
	       title: {
	           text: '총 비용 대비 총 생산량',
	           subtext: '총비용 단위 (천원)'
	       },
	       tooltip: {
	           trigger: 'axis'
	       },
	       legend: {
	           data: ['비용', '생산량']
	       },
	       toolbox: {
	           show: true,
	           feature: {
	               dataView: {show: true,readOnly: false},
	               magicType: {show: true, type: ['line', 'bar']},
	               restore: {show: true},
	               saveAsImage: {show: true}
	           }
	       },
	       calculable: true,
	       xAxis: [{
	           type: 'category',
	           data: ['1공정', '2공정', '3공정', '4공정', '5공정', '6공정', '7공정', '8공정']
	       }],
	       yAxis: [{
	           type: 'value'
	       }],
	       series: [{
	               name: '비용',
	               type: 'bar',
	               data: [],
	               markPoint: {
	                   data: [{ type: 'max',name: '최대값'},
	                       {type: 'min',name: '최소값'}]},
	               markLine: {
	                   data: [{type: 'average',name: '평균값'}]
	               }
	           },
	           {
	               name: '생산량',
	               type: 'bar',
	               data: [],
	               markPoint: {
	                   data: [{type: 'max',name: '최대값'},
	                       {type: 'min',name: '최소값'}]},
	               markLine: {
	                   data: [{type: 'average',name: '평균값'}]
	               }
	           }
	       ]
	   }; // option
	   myChart.setOption(option);
	   window.addEventListener('resize', myChart.resize);
	   var xAxisData = ['1공정', '2공정', '3공정', '4공정', '5공정', '6공정', '7공정', '8공정'];
	   myChart.setOption({
	         xAxis: {
	             data: xAxisData
	         },
	         series: [{
	                 name: '비용',
	                 data: febcosts,
	             },
	             {
	                 name: '생산량',
	                 data: febtr,
	             }
	         ],
	     });
	}  // function CostsTrChart
   </script> 
   <script type="text/javascript">
   function CostsUsingratioChart(febcosts, febcvusingratio) {
	   console.log("CostsUsingratioChart([" + febcosts + "], [" + febcvusingratio + "])");
	   var myChart = echarts.init(document.getElementById('Costs_Usingratio_Chart'));
	
	   var option = {
	       title: {
	           text: '총 비용 대비 총 에너지사용량',
	           subtext: '에너지사용량 단위 (kWh)\n총 비용 단위(천원)'
	       },
	       tooltip: {
	           trigger: 'axis'
	       },
	       legend: {
	           data: ['비용', '에너지 사용량']
	       },
	       toolbox: {
	           show: true,
	           feature: {
	               dataView: {show: true,readOnly: false},
	               magicType: {show: true, type: ['line', 'bar']},
	               restore: {show: true},
	               saveAsImage: {show: true}
	           }
	       },
	       calculable: true,
	       xAxis: [{
	           type: 'category',
	           data: ['1공정', '2공정', '3공정', '4공정', '5공정', '6공정', '7공정', '8공정']
	       }],
	       yAxis: [{
	           type: 'value'
	       }],
	       series: [{
	               name: '비용',
	               type: 'bar',
	               data: [],
	               markPoint: {
	                   data: [{ type: 'max',name: '최대값'},
	                       {type: 'min',name: '최소값'}]},
	               markLine: {
	                   data: [{type: 'average',name: '평균값'}]
	               }
	           },
	           {
	               name: '에너지 사용량',
	               type: 'bar',
	               data: [],
	               markPoint: {
	                   data: [{type: 'max',name: '최대값'},
	                       {type: 'min',name: '최소값'}]},
	               markLine: {
	                   data: [{type: 'average',name: '평균값'}]
	               }
	           }
	       ]
	   }; // option
	   myChart.setOption(option);
	   window.addEventListener('resize', myChart.resize);
	   var xAxisData = ['1공정', '2공정', '3공정', '4공정', '5공정', '6공정', '7공정', '8공정'];
	   myChart.setOption({
	         xAxis: {
	             data: xAxisData
	         },
	         series: [{
	                 name: '비용',
	                 data: febcosts,
	             },
	             {
	                 name: '에너지 사용량',
	                 data: febcvusingratio,
	             }
	         ],
	     });
	}  // function CostsUsingratioChart
   </script>
</head>
<body>
<div id="headerContainer"></div>
<div class="flex-1 h-full">
  <!-- Main content -->
  <main>
    <!-- Content header -->
    <div class="flex items-center justify-between px-4 py-4 border-b lg:py-6">
    </div>
    <!-- Content -->
    <div class="mt-2">
      <!-- State cards -->
      <div class="grid grid-cols-1 gap-8 p-4 lg:grid-cols-2 xl:grid-cols-4">
        <!-- Value card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6 class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              총 에너지 사용 비용
            </h6>
            <span id="value1" class="text-xl font-semibold">0</span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : 천원)
            </span>
          </div>
          <div>
            <!-- 달력 아이콘 추가 -->
            <i id="energyCostIcon1" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
            <input type="text" id="energyCostStartDate1" class="datepicker" name="energyCostStartDate"  style="display: none;" />
            <input type="text" id="energyCostEndDate1" class="datepicker" name="energyCostEndDate"   style="display: none;" />
            <button id="applyEnergyCost1" style="display: none;">제출</button>
          </div>
        </div>
        <!-- Users card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6 class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              총 에너지 사용량
            </h6>
            <span id="value2" class="text-xl font-semibold"></span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : Kwh)
            </span>
          </div>
          <div>
            <!-- 달력 아이콘 추가 -->
            <i id="energyCostIcon2" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
            <input type="text" id="energyCostStartDate2" class="datepicker" name="energyCostStartDate" style="display: none;" />
            <input type="text" id="energyCostEndDate2" class="datepicker" name="energyCostEndDate" style="display: none;" />
            <button id="applyEnergyCost2" style="display: none;">제출</button>
          </div>
        </div>
        <!-- Orders card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6 class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              총 공정 가동률 평균(%)
            </h6>
            <span id="value3" class="text-xl font-semibold"></span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : %)
            </span>
          </div>
          <div>
            <!-- 달력 아이콘 추가 -->
            <i id="energyCostIcon3" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
            <input type="text" id="energyCostStartDate3" class="datepicker" name="energyCostStartDate" style="display: none;" />
            <input type="text" id="energyCostEndDate3" class="datepicker" name="energyCostEndDate" style="display: none;" />
            <button id="applyEnergyCost3" style="display: none;">제출</button>
          </div>
        </div>
      </div>
      <!-- Charts -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 가동률 평균</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon4" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate4" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate4" class="datepicker" name="energyCostEndDate" style="display: none;" />
              <button id="applyEnergyCost4" style="display: none;">제출</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <div id=FebOpratio_Chart style="height: 350px"></div>
          </div>
        </div>
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
           <h4 class="text-lg font-semibold text-gray-500">공정별 총 생산량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon5" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate5" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate5" class="datepicker" name="energyCostEndDate" style="display: none;" />
               <button id="applyEnergyCost5" style="display: none;">제출</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
      		<div id="FebTr_Chart" style="height: 350px"></div>
          </div>
        </div>
      </div>
        <!-- Charts -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총 비용</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon6" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate6" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate6" class="datepicker" name="energyCostEndDate" style="display: none;" />
               <button id="applyEnergyCost6" style="display: none;">제출</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <div id="FebCost_Chart" style="height: 350px"></div>
          </div>
        </div>
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총 에너지 사용량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon7" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
             <input type="text" id="energyCostStartDate7" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate7" class="datepicker" name="energyCostEndDate" style="display: none;" />
               <button id="applyEnergyCost7" style="display: none;">제출</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
             <div id="FebUsingratio_Chart" style="height: 350px"></div>
          </div>
        </div>
      </div>
        <!-- Charts -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총비용 대비 총 생산량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon8" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate8" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate8" class="datepicker" name="energyCostEndDate" style="display: none;" />
               <button id="applyEnergyCost8" style="display: none;">제출</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
             <div id="Costs_Tr_Chart" style="height: 500px"></div>
          </div>
        </div>
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총 비용대비 총 에너지 사용량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon9" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
             <input type="text" id="energyCostStartDate9" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate9" class="datepicker" name="energyCostEndDate" style="display: none;" />
               <button id="applyEnergyCost9" style="display: none;">제출</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
           <div id="Costs_Usingratio_Chart" style="height: 500px"></div>
          </div>
        </div>
      </div>
      <script>
      let today = new Date(); // 시작일자
      let year = today.getFullYear(); // 년도
      let month = today.getMonth() + 1;  // 월
      let date = today.getDate();  // 날짜
      
      var startDate = new Array(9);
      var endDate = new Array(9);
      for(var cnt=0; cnt < 9; cnt++) {
      	startDate[cnt] = year + '-' + month + '-' + date;
      	endDate[cnt] = year + '-' + month + '-' + date;
      }
        $(document).ready(function () {
          // 달력 아이콘 클릭 시 데이터 피커를 토글합니다.
          $("#energyCostIcon1").click(function () {
            $("#energyCostStartDate1").toggle();
            $("#energyCostEndDate1").toggle();
            $("#applyEnergyCost1").toggle();
          });

          $("#energyCostIcon2").click(function () {
            $("#energyCostStartDate2").toggle();
            $("#energyCostEndDate2").toggle();
            $("#applyEnergyCost2").toggle();
          });

          $("#energyCostIcon3").click(function () {
            $("#energyCostStartDate3").toggle();
            $("#energyCostEndDate3").toggle();
            $("#applyEnergyCost3").toggle();
          });

          $("#energyCostIcon4").click(function () {
            $("#energyCostStartDate4").toggle();
            $("#energyCostEndDate4").toggle();
            $("#applyEnergyCost4").toggle();
          });
          $("#energyCostIcon5").click(function () {
            $("#energyCostStartDate5").toggle();
            $("#energyCostEndDate5").toggle();
            $("#applyEnergyCost5").toggle();
          });
          $("#energyCostIcon6").click(function () {
            $("#energyCostStartDate6").toggle();
            $("#energyCostEndDate6").toggle();
            $("#applyEnergyCost6").toggle();
          });
          $("#energyCostIcon7").click(function () {
            $("#energyCostStartDate7").toggle();
            $("#energyCostEndDate7").toggle();
            $("#applyEnergyCost7").toggle();
          });
          $("#energyCostIcon8").click(function () {
            $("#energyCostStartDate8").toggle();
            $("#energyCostEndDate8").toggle();
            $("#applyEnergyCost8").toggle();
          });
          $("#energyCostIcon9").click(function () {
            $("#energyCostStartDate9").toggle();
            $("#energyCostEndDate9").toggle();
            $("#applyEnergyCost9").toggle();
          });
          // 데이터 피커의 기본 설정을 정의합니다.
          $(".datepicker").datepicker({ dateFormat: "yy-mm-dd" });
          
          // 총 에너지 사용 비용 
          window.applyDateRange1 = function (event, url, targetValueId, valueKey) {
    	   		if(event !== null) {
	     			let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					  startDate[0] = parent.find("input[name='energyCostStartDate']").val();
					  endDate[0] = parent.find("input[name='energyCostEndDate']").val();
       			}
       			  $.ajax({
			    url: "/energy/chart1",
			    method: "POST",
			    data: {
			      startDate: startDate[0],
			      endDate: endDate[0]
			    },
			    success: function (response) {
			      let data = JSON.parse(response);
			      if (data["SUM_COSTS"] !== undefined) {
			        const value = data["SUM_COSTS"];
			        $("#value1").text((value).toLocaleString());
			      } else {
			        console.error("'SUM_COSTS' not found in received data.", response);
			      }
			    }
			  });
			}  
    		// 총 에너지 사용량
			window.applyDateRange2 = function (event, url, targetValueId, valueKey) {
    	   		if(event !== null) {
				  let parent = $(event.target).parent();
				  parent.find(".datepicker").hide();
				  $(event.target).hide();
				  startDate[1] = parent.find("input[name='energyCostStartDate']").val();
				  endDate[1] = parent.find("input[name='energyCostEndDate']").val();
    	   		}
			  $.ajax({
			    url: "/energy/chart2",
			    method: "POST",
			    data: {
			      startDate: startDate[1],
			      endDate: endDate[1]
			    },
			    success: function (response) {
			      let data = JSON.parse(response);
			      if (data["SUM_USINGRATIO"] !== undefined) {
			        const value = data["SUM_USINGRATIO"];
			        $("#value2").text((value).toLocaleString());
			      } else {
			        console.error("'SUM_USINGRATIO' not found in received data.", response);
			      }
			    }
			  });
			};
			  // 총 공정 가동률 평균
			 window.applyDateRange3 = function (event, url, targetValueId, valueKey) {
				  if(event !== null) {
					  let parent = $(event.target).parent();
					  parent.find(".datepicker").hide();
					  $(event.target).hide();
					  startDate[2] = parent.find("input[name='energyCostStartDate']").val();
					  endDate[2] = parent.find("input[name='energyCostEndDate']").val();
				  }
				  $.ajax({
				    url: "/energy/chart3",
				    method: "POST",
				    data: {
				      startDate: startDate[2],
				      endDate: endDate[2]
				    },
				    success: function (response) {
				      let data = JSON.parse(response);
				      if (data["AVERAGE_OPRATIO"] !== undefined) {
				        const value = data["AVERAGE_OPRATIO"];
				        $("#value3").text((value).toLocaleString());
				      } else {
				        console.error("'AVERAGE_OPRATIO' not found in received data.", response);
				      }
				    }
				  });
	          }
			  // 각 공정별 가동률 평균
	          window.applyDateRange4 = function (event, url, targetValueId) {
	        	  if(event !== null) {
	     			let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					  startDate[3] = parent.find("input[name='energyCostStartDate']").val();
					  endDate[3] = parent.find("input[name='energyCostEndDate']").val();
	        	  }
					  $.ajax({
				          url: "/energy/chart4",
				          type: "POST",
				          data: { 
			        	  startDate: startDate[3], 
			        	  endDate: endDate[3]
					  },
				          success: function(data) {
				            console.log('Raw Data:', data);
				            var chartData = JSON.parse(data);
				            FebOpratioChart(chartData);
				            console.log('chartData:', chartData);
				          },
				          error: function(err) {
				            console.log(err);
				          }
				        });
				      }
			// 각 공정별 총 생산량 합계
	          window.applyDateRange5 = function (event, url, targetValueId) {
	        	  if(event !== null) {
	     			let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					  startDate[4] = parent.find("input[name='energyCostStartDate']").val();
					  endDate[4] = parent.find("input[name='energyCostEndDate']").val();
	        	  }
					  $.ajax({
				          url: "/energy/chart5",
				          type: "POST",
				          data: { 
			        	  startDate: startDate[4], 
			        	  endDate: endDate[4]
					  },
				          success: function(data) {
				            console.log('Raw Data:', data);
				            var chartData = JSON.parse(data);
				            FebTrChart(chartData);
				            console.log('chartData:', chartData);
				          },
				          error: function(err) {
				            console.log(err);
				          }
				        });
				      }
			
	       // 각 공정별 총 비용 합계
	          window.applyDateRange6 = function (event, url, targetValueId) {
	        	  if(event !== null) {
	     			let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					  startDate[5] = parent.find("input[name='energyCostStartDate']").val();
					  endDate[5] = parent.find("input[name='energyCostEndDate']").val();
	        	  }
					  $.ajax({
				          url: "/energy/chart6",
				          type: "POST",
				          data: { 
			        	  startDate: startDate[5], 
			        	  endDate: endDate[5]
					  },
				          success: function(data) {
				            console.log('Raw Data:', data);
				            var chartData = JSON.parse(data);
				            FebCostChart(chartData);
				            console.log('chartData:', chartData);
				          },
				          error: function(err) {
				            console.log(err);
				          }
				        });
				      }
	       
	          // 각 공정별 총 에너지사용량 합계
	          window.applyDateRange7 = function (event, url, targetValueId) {
	        	  if(event !== null) {
	     			let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					  startDate[6] = parent.find("input[name='energyCostStartDate']").val();
					  endDate[6] = parent.find("input[name='energyCostEndDate']").val();
	        	  }
					  $.ajax({
				          url: "/energy/chart7",
				          type: "POST",
				          data: { 
			        	  startDate: startDate[6], 
			        	  endDate: endDate[6]
					  },
				          success: function(data) {
				            console.log('Raw Data:', data);
				            var chartData = JSON.parse(data);
				            FebUsingratioChart(chartData);
				            console.log('chartData:', chartData);
				          },
				          error: function(err) {
				            console.log(err);
				          }
				        });
				      }

	          // 총 비용 대비 총 생산량
	          window.applyDateRange8 = function (event, url, targetValueId) {
	        	  if(event !== null) {
	     			let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					  startDate[7] = parent.find("input[name='energyCostStartDate']").val();
					  endDate[7] = parent.find("input[name='energyCostEndDate']").val();
	        	  }
					  $.ajax({
				          url: "/energy/chart8",
				          type: "POST",
				          data: { 
			        	  startDate: startDate[7], 
			        	  endDate: endDate[7]
					  },
				           success: function(data) {
				               console.log("Raw Data:", data);
				               var chartData = JSON.parse(data);
				               var febcosts = chartData.febcosts;
				               var febtr = chartData.febtr;
				               CostsTrChart(febcosts, febtr);
				          },
				          error: function(err) {
				            console.log(err);
				          }
				        });
				      }
	          // 총 비용 대비 에너지 사용량
	          window.applyDateRange9 = function (event, url, targetValueId) {
	        	  if(event !== null) {
	     			let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					  startDate[8] = parent.find("input[name='energyCostStartDate']").val();
					  endDate[8] = parent.find("input[name='energyCostEndDate']").val();
	        	  }
					  $.ajax({
				          url: "/energy/chart9",
				          type: "POST",
				          data: { 
			        	  startDate: startDate[8], 
			        	  endDate: endDate[8]
					  },
				           success: function(data) {
				               console.log("Raw Data:", data);
				               var chartData = JSON.parse(data);
				               var febcosts = chartData.febcosts;
				               var febcvusingratio = chartData.febcvusingratio;
				               CostsUsingratioChart(febcosts, febcvusingratio);
				          },
				          error: function(err) {
				            console.log(err);
				          }
				        });
				      }
			// 각 "제출" 버튼에 클릭 이벤트를 설정합니다.
			$("#applyEnergyCost1").click(function (event) {
			  applyDateRange1(event, "/energy/chart1", "#value1", "SUM_COSTS");
			});	
			$("#applyEnergyCost2").click(function (event) {
			  applyDateRange2(event, "/energy/chart2", "#value2", "SUM_USINGRATIO");
			});
			$("#applyEnergyCost3").click(function (event) {
			  applyDateRange3(event, "/energy/chart3", "#value3", "AVERAGE_OPRATIO");
			});
			$("#applyEnergyCost4").click(function (event) {
			  applyDateRange4(event, "/energy/chart4", "FebOpratio_Chart");
			});
			$("#applyEnergyCost5").click(function (event) {
			  applyDateRange5(event, "/energy/char5", "FebTr_Chart");
			});
			$("#applyEnergyCost6").click(function (event) {
			  applyDateRange6(event, "/energy/char6", "FebCost_Chart");
			});
			$("#applyEnergyCost7").click(function (event) {
			  applyDateRange7(event, "/energy/char7", "FebUsingratio_Chart");
			});
			$("#applyEnergyCost8").click(function (event) {
			  applyDateRange8(event, "/energy/char8", "Costs_Tr_Chart");
			});
			$("#applyEnergyCost9").click(function (event) {
			  applyDateRange9(event, "/energy/char9", "Costs_Usingratio_Chart");
			});
        });  
          // 새로운 interval 실행
        setInterval(() => {
            applyDateRange1(null,"/energy/chart1", "#value1", "SUM_COSTS");
            applyDateRange2(null,"/energy/chart2", "#value2", "SUM_USINGRATIO");
            applyDateRange3(null,"/energy/chart3", "#value3", "AVERAGE_OPRATIO");
            applyDateRange4(null,"/energy/chart4", "#value4", "FebOpratio_Chart");
            applyDateRange5(null,"/energy/chart5", "#value5", "FebTr_Chart");
            applyDateRange6(null,"/energy/chart6", "#value6", "FebCost_Chart");
            applyDateRange7(null,"/energy/chart7", "#value7", "FebUsingratio_Chart");
            applyDateRange8(null,"/energy/chart8", "#value8", "Costs_Tr_Chart");
            applyDateRange9(null,"/energy/chart9", "#value9", "Costs_Usingratio_Chart");
        }, 3000);

      </script>
    </div>
  </main>
</div>
</body>
</html>