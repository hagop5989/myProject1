<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="navbar navbar-expand-lg bg-body-tertiary mb-4">
    <div class="container">
        <a class="navbar-brand" href="/">PROJECT1</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="/board/boards" class="nav-link">
                            글쓰기
                        </a>
                    </li>


                    <li class="nav-item">
                        <a href="/order/orders" class="nav-link">
                            Order</a>
                    </li>

                    <li class="nav-item">
                        <a href="/member/members" class="nav-link">
                            member
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="/item/items" class="nav-link">
                            item
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="/login/logout" class="nav-link" onclick="return confirm('로그아웃 하시겠습니까?')">로그아웃</a>
                    </li>
            </ul>
        </div>
    </div>
</nav>

