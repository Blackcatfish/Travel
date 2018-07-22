<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="navNum" value="${param.navNum}"/>
<c:set var="middle" value="${param.navNum%2==0?param.navNum/2:param.navNum/2+1}"/>
<c:set var="pageNo" value="${param.pageNum}"/>
<c:set var="totalPage" value="${param.totalPage}"/>
<c:set var="startPage" value="${pageNo-middle}"/>
<c:set var="endPage" value="${pageNo+middle}"/>
<c:if test="${navNum > totalPage}">
    <c:set var="startPage" value="1"/>
    <c:set var="endPage" value="${totalPage}"/>
</c:if>
<c:if test="${navNum <=totalPage}">
    <c:if test="${startPage < 1}">
        <c:set var="startPage" value="1"/>
    </c:if>
    <c:if test="${endPage < navNum}">
        <c:set var="endPage" value="${navNum}"/>
    </c:if>
    <c:if test="${endPage > totalPage}">
        <c:set var="endPage" value="${totalPage}"/>
    </c:if>
    <c:if test="${endPage - startPage < navNum}">
        <c:set var="startPage" value="${endPage - navNum + 1}"/>
    </c:if>
    <c:if test="${startPage < 1}">
        <c:set var="startPage" value="1"/>
    </c:if>
    <c:if test="${endPage > totalPage}">
        <c:set var="endPage" value="${totalPage}"/>
    </c:if>
</c:if>
<div class="pager_wrapper">
    <ul class="pager clearfix">
        <c:if test="${pageNo>1}">
            <li class="prev"><a href="#" onclick="changePage(${pageNo-1})">上一页</a></li>
        </c:if>
        <c:forEach begin="${startPage}" end="${endPage}" var="pn">
            <li class="${pageNo==pn?'active':'li'}"><a href="#" onclick="changePage(${pn})">${pn}</a></li>
        </c:forEach>
        <c:if test="${pageNo-totalPage<0}">
            <li class="next"><a href="#" onclick="changePage(${pageNo+1})">下一页</a></li>
        </c:if>
    </ul>
</div>
<script type="text/javascript">
    function changePage(pn) {
        $("#pageNum").val(pn);
        $("#searchForm").submit();
    }
</script>
