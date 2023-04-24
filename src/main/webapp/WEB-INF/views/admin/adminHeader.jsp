<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>       
<link rel="stylesheet" href="/resources/css/adminCss/adminHeader.css">

    <div id="for-logo">
        <img src="/resources/images/homeImg/logo_black.png" alt="error">
        <div>
            ADMIN👩‍🚒 <a href="/user/logout">  LOGOUT</a>
        </div>
    </div>
    <div id="admin-menu">
        <ul id="admin-nav">
            <li class="main-nav"><a href="">지점</a></li>
            
            <li class="main-nav"><a href="/admin/user">회원</a>
                <ul class="drop-nav">
                    <li><a href="/admin/user">회원정보</a></li>
                    <li><a href="/admin/point">포인트</a></li>
                </ul>
            </li>
            <li class="main-nav"><a href="">예약</a></li>

            <li class="main-nav"><a href="/shop/adminProductList">쇼핑몰</a>
                <ul class="drop-nav">
                    <li><a href="">상품관리</a></li>
                    <li><a href="">주문관리</a></li>
                    <li><a href="">리뷰관리</a></li>
                </ul>
            </li>
            <li class="main-nav"><a href="">게시판</a>
                <ul class="drop-nav">
                    <li><a href="">공지사항</a></li>
                    <li><a href="">문의게시판</a></li>
                </ul>
            </li>
        </ul>
    </div>
