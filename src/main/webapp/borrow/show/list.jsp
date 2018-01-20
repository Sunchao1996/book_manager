<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">

<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/table.css" rel="stylesheet" type="text/css" />
<link href="/dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="/dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen" />

<link type="text/css" href="/jQuery/ui/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<link rel="stylesheet" href="/jQuery/pagination/pagination.css" />
<script type="text/javascript" src="jQuery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="jQuery/echarts/echarts.min.js"></script>
<script type="text/javascript" src="jQuery/ui/js/jquery-ui-1.8.18.custom.min.js"></script>
<script type="text/javascript" src="jQuery/ui/js/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript" src="jQuery/ui/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="jQuery/pagination/jquery.pagination.js"></script>
<script type="text/javascript" src="js/jsUtil.js"></script>



<script type="text/javascript">
	 //页面加载完成之后
	 $(function(){	
		//给时间的查询文本框加日历插件
			$(".time").datepicker({
				changeMonth: true,
				changeYear: true,
				showButtonPanel: true	
				
			});
	});
	
	
	 //查询调用的方法
	function displayData(pageNo){
		
		$.ajax({
			url:"${pageContext.request.contextPath}/show/query.do",
			type:"get",
			cache:false,
			data:{				
				"startBorrowTime":$("#startBorrowTime").val(),
				"endBorrowTime":$("#endBorrowTime").val()				
			},
			beforeSend:function(){
				$("#message").text("正在生成报表...");
				return true;
			},
			success:function(jsonObject){
				if(jsonObject.success){
					var myChart = echarts.init(document.getElementById('main'));
					var dataArrX = [];
					var dataArr = [];
					$.each(jsonObject.dataList,function(i,n){
						dataArrX.push(n.bookCategory);
						dataArr.push(n.borrowCount);
					});
					var option = {
				            title: {
				                text: '借阅记录情况'
				            },
				            tooltip: {},
				            legend: {
				                data:['被借阅次数']
				            },
				            xAxis: [
				            	{
				                	data: dataArrX,
				                	axisLabel:{  
				                         interval:0,//横轴信息全部显示  
				                         rotate:-30//-30度角倾斜显示  
				                    }  
				            	}
				            ],
				            grid: { // 控制图的大小，调整下面这些值就可以，
				                
				                y2: 140// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
				            },
				            yAxis: [{}],
				            series: [{
				                name: '被借阅次数',
				                type: 'bar',
				                data: dataArr
				            }]
				        };
	
				        // 使用刚指定的配置项和数据显示图表。
				        myChart.setOption(option);
				        $("#message").text("已经生成对应报表");
				}else{
				        $("#message").text("生成报表失败");
				}
				
			}
		});
	}

	
	
	
</script>
<table width="100%" border="0" cellspacing="0" class="table_padding">
	<tr>
		<td align="center">
			<table border="0" cellpadding="0" cellspacing="0" class="table_border">
				<tr>
					<td align="center">
					
	
							<table border="0" cellpadding="0" cellspacing="0" class="box_table" id="box_table">
									<tr>
										<td>
											借书时间：
												<input type="text" size="20" class="time" id="startBorrowTime"/>
												至 
												<input type="text" size="20" class="time" id="endBorrowTime"/> 
												<span id="message"></span>
										</td>
										<td>
											<a class="button" href="javascript:void(0);" onclick="displayData(0);"><span>查询</span></a>
										</td>
									</tr>
							</table>
					</td>
				</tr>
			</table>
			<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    		<div id="main" style="width: 600px;height:400px;"></div>
		</td>
	</tr>
</table>
