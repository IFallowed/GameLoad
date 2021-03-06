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
<script type="text/javascript" src="../../myjs/myUpdateGameType.js"></script>
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
			<h2>修改游戏类型</h2>
		</div>
		<div class="row">
			<div class="col-xs-6 col-sm-4 col-md-offset-4">
				<form class="form-horizontal" action="toUpdate" method="post">
					<table class="table table-bordered table-condensed ">
						<thead></thead>
						<tbody>
							<tr class="text-center">
								<td>类型名称</td>
								<td>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="name"
											value="${gameType.name }"> <input type="hidden"
											id="id" name="id" value="${gameType.id }">
											<div class="col-xs-3 col-sm-8">
												<span id="codeMsg"></span>
											</div>
									</div>
								</td>
							</tr>
							<tr class="text-center">
								<td>状态</td>
								<td>
									<div class="col-sm-4">
										<div class="radio">
											<label> <input type="radio" name="status" value="20"
												id="online" checked="checked"> 商用
											</label> <label> <input type="radio" name="status"
												id="offline" value="21"> 下线
											</label> <input type="hidden" id="selector"
												value="${gameType.status }">
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
									<a class="btn btn-warning" href="../../manager/gametype">返回上一页</a>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
