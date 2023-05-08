<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>       
<link rel="stylesheet" href="/resources/css/adminCss/adminHeader.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> -->

<div id="for-logo">
    <img src="/resources/images/homeImg/logo_black.png" alt="error">
    <div>
        ADMIN👩‍🚒 <a href="/user/logout">  LOGOUT</a>
        <input type="hidden" value="${loginUser.userType}" id="adminCheck">
    </div>
</div>
<div id="admin-menu">
    <ul id="admin-nav">
        <li class="main-nav"><a href="">지점</a>
            <ul class="drop-nav">
                <li><a href="/center/registerView">지점등록</a></li>
                <li><a href="/center/listView">지점관리</a></li>
            </ul>
        </li>
        
        <li class="main-nav"><a href="/admin/user">회원</a>
            <ul class="drop-nav">
                <li><a href="/admin/user">회원관리</a></li>
            </ul>
		</li>

        <li class="main-nav"><a href="/admin/bookingList">예약</a>
            <ul class="drop-nav">
                <li><a href="/admin/bookingList">예약관리</a></li>
            </ul>	
        </li>	
        <li class="main-nav"><a href="/product/adminProductList">쇼핑몰</a>
                <ul class="drop-nav">
                    <li><a href="/product/adminProductList">상품관리</a></li>
                    <li><a href="/order/listAdmin">주문관리</a></li>
                </ul>
            </li>
        <li class="main-nav"><a href="/notice/list">게시판</a>
            <ul class="drop-nav">
                <li><a href="/notice/write">공지글작성</a></li>
                <li><a href="/inquiry/admin">문의글목록</a></li>
            </ul>
        </li>
    </ul>
</div>

<script>
    var userType = document.querySelector("#adminCheck").value;
    console.log(userType);
    if(userType != "1") {
        alert("관리자 로그인이 필요합니다.")
        location.href = "/user/login";
    }
</script>
