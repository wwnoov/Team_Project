<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>수강생 전용 게시판</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <style>

    </style>
</head>
<body class="d-flex flex-column">
<main class="flex-shrink-0">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-5">
            <a class="navbar-brand" href="index.html">Start Bootstrap</a>
            <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.html">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.html">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="pricing.html">Pricing</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="faq.html">FAQ</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a
                                class="nav-link dropdown-toggle"
                                id="navbarDropdownBlog"
                                href="#"
                                role="button"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                        >Blog</a
                        >
                        <ul
                                class="dropdown-menu dropdown-menu-end"
                                aria-labelledby="navbarDropdownBlog"
                        >
                            <li>
                                <a class="dropdown-item" href="blog-home.html">Blog Home</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="blog-post.html">Blog Post</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a
                                class="nav-link dropdown-toggle"
                                id="navbarDropdownPortfolio"
                                href="#"
                                role="button"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                        >Portfolio</a
                        >
                        <ul
                                class="dropdown-menu dropdown-menu-end"
                                aria-labelledby="navbarDropdownPortfolio"
                        >
                            <li>
                                <a class="dropdown-item" href="portfolio-overview.html"
                                >Portfolio Overview</a
                                >
                            </li>
                            <li>
                                <a class="dropdown-item" href="portfolio-item.html"
                                >Portfolio Item</a
                                >
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="bg-light py-5">
        <div class="container px-5 my-5">
            <div class="text-center mb-5">
                <h1 class="fw-bolder">수강생 전용 게시판</h1>
                <p class="lead fw-normal text-muted mb-0">${map.className}</p>
            </div>
            <br class="row gx-5 justify-content-center">
            <form method="get">
                <input type="hidden" name="classIdx" value=${map.classIdx}>
                <select name="searchField" id="select-option">
<%--                    map.searchField 가 null과 공백문자가 아니고, map.searchField가 title이랑 동일하면 selected를 출력해라--%>
                    <option value="title" ${(not empty map.searchField and map.searchField eq 'title') ? 'selected' : ''}>제목</option>
                    <option value="studentName" ${(not empty map.searchField and map.searchField eq 'studentName') ? 'selected' : ''}>작성자</option>
                </select>
                <input type="text" id="searchWord"  name="searchWord" placeholder="검색어를 입력하세요" value="${not empty map.searchWord ? map.searchWord : ''}" />
                <input type="submit" value="검색하기"/>
            </form>
            <br />
            <br />
            <table style="border-collapse: collapse; width: 100%; border: 1px solid #ddd;">
                <thead>
                    <tr>
                        <th style="text-align: center;">번호</th>
                        <th style="text-align: center;">제목</th>
                        <th style="text-align: center;">작성자</th>
                        <th style="text-align: center;">조회수</th>
                        <th style="text-align: center;">작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty boardLists}">
                            <tr>
                                <td colspan="5" align="center">
                                    등록된 질문이 없습니다.
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <!--반복 -->
                            <c:forEach items="${boardLists}" var="row" varStatus="loop">
                            <tr align="center">
                                <td>${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}                             </td>
                                <td align="center"><a href="../board/view.do?idx=${ row.boardIdx }">${ row.title }</a></td>
                                <td>${row.studentName}</td>
                                <td>${row.visitcount}</td>
                                <td>${row.registerDate}</td>
                            </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
            </br>
            <c:if test="${not empty boardLists}">
                ${ map.pagingImg }
            </c:if>




            <div class="container" style="display: flex; justify-content: flex-end;">
                <button type="button" class="btn btn-primary"
                        onclick="location.href='../board/write.do';">질문하기</button>
            </div>
        </div>
    </section>

    <script>
        $(".page-link").on('click', function (event) {
            event.preventDefault(); // a 태그의 기본 동작을 하지 마라.
            //console.log($(this).attr('href'));
            let destination = $(this).attr('href');
            destination += ('&searchField=' + $('#select-option option:selected').val() + "&searchWord=" + $("#searchWord").val());
            console.log(destination);
            location.href = destination;
        })
    </script>
</main>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>