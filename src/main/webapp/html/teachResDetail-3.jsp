<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>教学资源-习题库</title>
    <meta charset="utf-8">
    <link rel="icon" href="/images/dgut.jpg">
    <link rel="stylesheet" type="text/css" href="../style/normal.css">
    <link rel="stylesheet" type="text/css" href="../style/teachRes/normal.css">
    <link rel="stylesheet" type="text/css" href="../style/teachRes/teachResDetail.css">
    <%--<script type="text/javascript" src="../js/normal.js"></script>--%>
    <script type="text/javascript" src="../js/teachRes/teachResDetail-3.js"></script>
</head>
<body>

<div id="top">
    <jsp:include page="/html/top.jsp"/>
</div>

<article class="content">

    <section id="banner">
        <img src="../images/index/abouttop_03.jpg">
    </section>
    <section class="mainWrap relative">
        <div class="detailContent">
            <div class="column_1">
                <section class="leftNav">
                    <jsp:include page="/html/left.jsp"/>
                </section>
            </div>
            <div class="column_2 ">
                <article class="mainContent">
                    <header class="contentNav">
                        <nav class="nav">
                            <a href="index.jsp">首页</a>·
                            <a href="teachResDetail-1.html">教学资源</a>·
                            <a href="teachResDetail-3.jsp">习题库</a>
                        </nav>
                        <h1>习题库</h1>
                    </header>

                    <div id="resource">
                        <form class="search" action="" method="post">
                            <input class="searchInput" type="search" name="search">
                            <input class="searchSubmit" type="submit" value="文件搜索">
                        </form>
                        <table class="table" border="0" width="800px" cellpadding="2" cellspacing="1">
                            <tr class="firstRow">
                                <td>序号</td>
                                <td>文件名称</td>
                                <td>文件大小</td>
                                <td>上传时间</td>
                                <td>操作</td>
                            </tr>

                            <%--循环遍历资源--%>
                            <c:set var="trType" scope="session" value="${0}"/>
                            <c:forEach items="${sessionScope.resourceList}" var="resource" varStatus="status">
                                <c:choose>
                                    <c:when test="${status.index%2==0}">
                                        <tr class="trOdd">
                                        <c:set var="trType" scope="session" value="${1}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <tr class="tr">
                                        <c:set var="trType" scope="session" value="${0}"/>
                                    </c:otherwise>
                                </c:choose>
                                <td>${resource.id}</td>
                                <td class="tll"><img src="/images/teachResource/PPT.png"><c:out
                                        value="${resource.resName}"/></td>
                                <td><c:out value="${10000}"/></td>
                                <td><c:out value="${resource.resTime}"/></td>
                                <td>
                                    <a onclick="Preview(event)"><img src="/images/teachResource/preview.png"></a>
                                    <a href="${resource.resPath}" download="${resource.resName}">
                                        <img src="/images/teachResource/download.png">
                                    </a>
                                </td>
                                </tr>
                            </c:forEach>

                        </table>
                    </div>

                </article>
            </div>
        </div>
    </section>
</article>


<div id="bottom">
    <jsp:include page="/html/bottom.jsp"/>
</div>

<div id="copyrights">
    <jsp:include page="/html/copyright.jsp"/>
</div>
</body>
<script>
    var liList=document.getElementById("leftUl").children;
    for(var i=0;i<liList.length;i++){
        if(i==2)
            liList[i].setAttribute("class","current");
    }
</script>
</html>