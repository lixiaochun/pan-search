<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<title>百度网盘搜索</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="百度网盘搜索|网盘搜索|百度云搜索" />
<meta name="description" content="百度网盘搜索，搜索百度网盘资源" />
<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="static/jquery/jquery-1.12.3.min.js"></script>
<script type="text/javascript"
	src="static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="span7 text-center" style="margin-top: 20px">
		<form action="search" method="post">
			<input type="text" name="keyword" value="${keyword }" /> <span
				class="glyphicon glyphicon-search" aria-hidden="true"></span> <input
				type="hidden" name="searchType" value="BING" /> <input
				type="submit" value="百度网盘搜索" />
		</form>
		<hr />
		<c:if test="${result.totalPage <= 0 }" var="noResult">没有查询到结果,请重试.....</c:if>
		<c:if test="${!noResult }">
			<c:forEach items="${result.results }" var="data">
				<p>
					<a href="${data.url }">${data.title }</a>
				</p>
				<p>${data.desc}</p>
				<br />
			</c:forEach>
			<nav>
				<ul class="pagination">
					<c:if test="${currentPage - 1 > 0 }" var="prefix">
						<li><a
							href="search?keyword=${keyword }&searchType=BING&currentPage=${currentPage - 1}"
							aria-label="Previous">上一页</a>
						<li>
					</c:if>
					<c:forEach begin="${result.startPage }" end="${result.endPage }"
						var="num">
						<c:if test="${num == currentPage  }" var="isCurrent">
							<li class="active"><a
								href="search?keyword=${keyword }&searchType=BING&currentPage=${currentPage }">${currentPage }<span
									class="sr-only">(current)</span></a></li>
						</c:if>
						<c:if test="${!isCurrent }">
							<li><a
								href="search?keyword=${keyword }&searchType=BING&currentPage=${num }">${num }</a>
							<li>
						</c:if>
					</c:forEach>
					<c:if test="${currentPage < result.totalPage }">
						<li><a
							href="search?keyword=${keyword }&searchType=BING&currentPage=${currentPage + 1}"
							aria-label="Next">下一页</a></li>
					</c:if>
				</ul>
			</nav>
		</c:if>
	</div>
</body>
</html>
