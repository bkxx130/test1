﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市订单管理系统</title>
    <link type="text/css" rel="stylesheet" href="/static/css/style.css" />
    <link type="text/css" rel="stylesheet" href="/static/css/public.css" />
</head>
<body>
<!--头部-->
    <jsp:include page="frame.jsp"></jsp:include>
 <!--主体内容-->
 <section class="publicMian ">
     <!--左侧栏-->
	 <jsp:include page="left.jsp"></jsp:include>
<div class="right">
       <div class="location">
           <strong>你现在所在的位置是:</strong>
           <span>订单管理页面</span>
       </div>
       <div class="search">
       <form method="post" action="/bill/billList.html">
			<input name="method" value="query" class="input-text" type="hidden">
			<span>商品名称：</span>
			<input name="queryProductName" type="text" value="">
			 
			<span>供应商：</span>
			<select name="queryProviderId">
				
				   <option value="0">--请选择--</option>

						<c:forEach items="${requestScope.providers}" var="providers" varStatus="i">
							<option value="${(i.index)+1}">${providers.proName}</option>
						</c:forEach>

				
       		</select>
			 
			<span>是否付款：</span>
			<select name="queryIsPayment">
				<option value="0">--请选择--</option>
				<option value="1" >未付款</option>
				<option value="2" >已付款</option>
       		</select>
			
			 <input	value="查 询" type="submit" id="searchbutton">
			 <a href="/bill/billadd.html">添加订单</a>
		</form>
       </div>
       <!--账单表格 样式和供应商公用-->
      <table class="providerTable" cellpadding="0" cellspacing="0">
          <tr class="firstTr">
              <th width="10%">订单编码</th>
              <th width="20%">商品名称</th>
              <th width="10%">供应商</th>
              <th width="10%">订单金额</th>
              <th width="10%">是否付款</th>
              <th width="10%">创建时间</th>
              <th width="30%">操作</th>

		  </tr>
		  <c:if test="${requestScope.bills !=null}">

			  <c:forEach  items="${requestScope.bills}" var="bill"   >
				  <tr>
					  <td>
						  <span>${bill.billCode}</span>
					  </td>
					  <td>
						  <span>${bill.productName}</span>
					  </td>
					  <td>
						  <span>${bill.providers.proName}</span>
					  </td>
					  <td>
						  <span>${bill.totalPrice}</span>
					  </td>
					  <td>
						<span>
							<c:if test="${bill.isPayment==1}">
								未付款
							</c:if>
							<c:if test="${bill.isPayment==2}">
								已付款
							</c:if>
						</span>
					  </td>
					  <td>
						<span>
								${bill.creationDate}
						</span>
					  </td>
					  <td>
						  <span><a class="viewBill" href="/bill/billdetail.html/${bill.id}" billid=1 billcc=BILL2016_001><img src="/static/images/read.png" alt="查看" title="查看"/></a></span>
						  <span><a class="modifyBill" href="/bill/updbillmodify.html/${bill.id}" billid=1 billcc=BILL2016_001><img src="/static/images/xiugai.png" alt="修改" title="修改"/></a></span>
						  <span><a class="deleteBill" href="/bill/delBill.do/${bill.id}" billid=1 billcc=BILL2016_001><img src="/static/images/schu.png" alt="删除" title="删除"/></a></span>
					  </td>
				  </tr>
			  </c:forEach>
		  </c:if>



			
      </table>
  </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该订单吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>



<footer class="footer">
    版权归北大青鸟
</footer>
<script type="text/javascript" src="/static/js/time.js"></script>
<script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="/static/calendar/WdatePicker.js"></script>
</body>
</html>
<script type="text/javascript" src="/static/js/billlist.js"></script>