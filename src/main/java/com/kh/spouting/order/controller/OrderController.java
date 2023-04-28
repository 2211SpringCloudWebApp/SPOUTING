package com.kh.spouting.order.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spouting.cart.service.CartService;
import com.kh.spouting.common.PageInfo;
import com.kh.spouting.order.domain.Order;
import com.kh.spouting.order.domain.OrderList;
import com.kh.spouting.order.service.OrderService;
import com.kh.spouting.product.service.ProductService;
import com.kh.spouting.user.domain.User;
import com.kh.spouting.user.service.UserService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class OrderController {
	
	@Autowired
	private CartService cService;
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private UserService uService;
	PageInfo pi = null;
	
	@Autowired
	private OrderService oService;
	
	private IamportClient api;
	
	public OrderController() {
		// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient("3047616117613234","R7UC7eWqi4WczJQ3SPMUZPP4dcjJNvpX4uOzUNXkGX83E1of10CA2CGsp1TjHzI1Bm8uaWb2QNdo75cM");
	}
	
	// ********** 이용자 **********
	// 결제 검증
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{
		return api.paymentByImpUid(imp_uid);
	}
	
	// 결제완료 후 결제내역 DB 등록
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String payment(Order order, Model model, HttpServletRequest request
			,@RequestParam("phone1") String phone1
			,@RequestParam("phone2") String phone2
			,@RequestParam("phone3") String phone3
			,@RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		String orderPhone = phone1+phone2+phone3;
		order.setOrderPhone(orderPhone);
		int orderNo = oService.insertOrder(order);
//		int orderNo = order.getOrderNo(); -> 매퍼 수정
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
//		// 해당 회원의 주문 목록 조회
//		int totalCount = oService.getOrderListCount(userId);
//		pi = this.getPageInfo(page, totalCount);
//		List<OrderList> oList = oService.selectOrderBoard(pi, userId);
//		if(!oList.isEmpty()) {
//			model.addAttribute("pi", pi);
//			model.addAttribute("oList", oList);
//			model.addAttribute("userId", userId);
//		}
		Order orderOne = oService.selectOneByOrderNo(orderNo);
		model.addAttribute("order", orderOne);
		getUserName(model, request);
		return "shop/pay/orderDetail";
	}

	// 결제 내역 목록 조회
	@RequestMapping(value = "/order/list", method = RequestMethod.GET)
	public String orderList(
			HttpServletRequest request,  Model model
		 , @RequestParam(value="page", required=false, defaultValue="1") Integer page
			) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		
		int totalCount = oService.getOrderListCount(userId);
		pi = this.getPageInfo(page, totalCount);
		List<OrderList> oList = oService.selectOrderBoard(pi, userId);
		if(!oList.isEmpty()) {
			model.addAttribute("pi", pi);
			model.addAttribute("oList", oList);
			model.addAttribute("userId", userId);
		}
		getUserName(model, request);
		return "shop/pay/orderList";
			
		}
	
	// 결제내역 상세 조회
	@RequestMapping(value="/order/detail")
	public String orderDetail(HttpServletRequest request, Model model
						, @RequestParam(value="orderNo", defaultValue="0") int orderNo) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		if(userId == null) {
			// 미로그인 시 로그인 페이지 이동
			return "redirect:/user/login";
		} else if(orderNo == 0) {
			// url 을 통해 직접 접근할 경우 리스트로 되돌림
			// 회원의 모든 주문 내역 조회
			List<Order> oList = oService.selectOrderList(userId);
			model.addAttribute("oList", oList);
			getUserName(model, request);
			return "shop/pay/orderList";
		} else {
			// 주문 내역 상세 조회
			Order order = oService.selectOneByOrderNo(orderNo);
			model.addAttribute("order", order);
			getUserName(model, request);
			return "shop/pay/orderDetail";
		}
	}
	
	
	// ********** 메소드 **********
	// 페이징 처리 (게시판형)
		private PageInfo getPageInfo(int currentPage, int totalCount) {
			PageInfo pi = null;
			int boardLimit = 10;
			int naviLimit = 5;
			int maxPage;
			int startNavi;
			int endNavi;
			
			maxPage = (int) Math.ceil((double)totalCount / boardLimit);
			startNavi = (((int)((double)currentPage / naviLimit + 0.9)) - 1) * naviLimit + 1 ;
			endNavi = startNavi + naviLimit - 1;
			if(endNavi > maxPage) {
				endNavi = maxPage;
			}
			pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
			return pi;
		}
		
	// 헤더 name 값 연결
	private void getUserName(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("user");
		if(userId != null) {
			User user = uService.selectOneById(userId);
			model.addAttribute("name", user.getUserName());
		}
		
	}
		
		
		
		
		
		
}
