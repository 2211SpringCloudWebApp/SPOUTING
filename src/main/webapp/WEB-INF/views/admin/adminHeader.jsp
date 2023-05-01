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
            <li class="main-nav"><a href="">지점</a>
            	<ul class="drop-nav">
                    <li><a href="/center/registerView">지점등록</a></li>
                    <li><a href="/center/listView">지점관리</a></li>
                </ul>
            </li>
            
            <li class="main-nav"><a href="/admin/user">회원</a></li>

            <li class="main-nav"><a href="/admin/bookingList">예약</a>
            	<ul class="drop-nav">
					<li><a href="/admin/bookingList">예약관리</a></li>
				</ul>	
			</li>	
            <li class="main-nav"><a href="/shop/adminProductList">쇼핑몰</a>
                <ul class="drop-nav">
                    <li><a href="/shop/adminProductList">상품관리</a></li>
                    <li><a href="/order/listAdmin">주문관리</a></li>
                    <li><a href="">리뷰관리</a></li>
                </ul>
            </li>
            <li class="main-nav"><a href="">게시판</a>
                <ul class="drop-nav">
                    <li><a href="/notice/write">공지글작성</a></li>
                    <li><a href="">문의게시판</a></li>
                </ul>
            </li>
        </ul>
    </div>
