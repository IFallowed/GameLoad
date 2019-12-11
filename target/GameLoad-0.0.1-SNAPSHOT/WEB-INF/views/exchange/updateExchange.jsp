<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>修改游戏类型</title>


<link rel="stylesheet" href="../../css/bootstrap.min.css">
<script src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>
</head>
<body>
	<div id="container">
		<div class="page-header text-center">
			<h2>修改对应省份游币兑换比例</h2>
		</div>
		<div class="row">
			<div class="col-xs-6 col-sm-4 col-md-offset-4">
				<form class="form-horizontal" action="toUpdate" method="post">
					<table class="table table-bordered table-condensed ">
						<thead></thead>
						<tbody>
							<tr class="text-center">
								<td>省份名</td>
								<td>
									<div class="col-sm-4">
										<input type="hidden" name="id" value="${exchange.id }">
										<div class="radio">
											<input type="text" disabled="disabled"
												value="${exchange.province.name }" />
										</div>
									</div>
								</td>
							</tr>
							<tr class="text-center">
								<td>兑换状态</td>
								<td>
									<div class="col-sm-4">
										<div class="radio">
											<label> <input type="radio" name="status" value="20"
												id="online"> 商用
											</label> <label> <input type="radio" name="status" value="21"
												id="offline"> 下线
											</label> <input type="hidden" id="status" value="${exchange.status }">
										</div>
									</div>
								</td>
							</tr>
							<tr class="text-center">
								<td>兑换比例</td>
								<td>
									<div class="col-sm-4">
										<div class="radio">
											<input type="text" name="charge" value="${exchange.charge }" />
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="row">
						<div class="col-xs-6 col-sm-7">
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-4">
									<input type="submit" class="btn btn-primary" value="确认修改" />
								</div>
							</div>
						</div>
						<div class="col-xs-6 col-sm-4">
							<div class="form-group">
								<div class=" col-sm-11">
									<a class="btn btn-warning" href="../../manager/exchange">返回上一页</a>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			var value = $("#status").val();
			if (value == "20") {
				$("#online").prop("checked", true);
				$("#offline").prop("checked", false);
			} else {
				$("#online").prop("checked", false);
				$("#offline").prop("checked", true);
			}
		});
	</script>
</body>
<style>
td {
	vertical-align: middle !important;
}
</style>
</html>