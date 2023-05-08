package com.kh.spouting.product.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spouting.cart.domain.Cart;
import com.kh.spouting.cart.service.CartService;
import com.kh.spouting.common.Alert;
import com.kh.spouting.common.PageInfo;
import com.kh.spouting.common.Search;
import com.kh.spouting.product.domain.Product;
import com.kh.spouting.product.service.ProductService;
import com.kh.spouting.user.domain.User;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private CartService cService;
	
	// ******************** 이용자 기능 ********************
	// 페이징 처리 (게시판형)
	private PageInfo getPageInfoBo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		
		maxPage = (int)((double)totalCount/boardLimit+0.9);
		startNavi = (((int)((double)currentPage/naviLimit+0.9))-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
	
	// 페이징 처리 (앨범형)
	private PageInfo getPageInfoAl(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 9;
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

	// 쇼핑몰 메인페이지 이동
	@RequestMapping(value="/shop/main", method=RequestMethod.GET)
	public String mainPage() {
		return "shop/main";
	}
	
	// 상품 목록 전체 조회
	@RequestMapping(value="/shop/productList", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mv, 
			@RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		int totalCount = pService.getListCount();
		PageInfo pi = this.getPageInfoBo(page, totalCount);
		List<Product> pList = pService.selectAllProduct(pi);
		mv.addObject("pi", pi).addObject("pList", pList).setViewName("/shop/product/listProduct");
	    return mv;
	}
	
	// 상품 1차 카테고리 목록 조회
	@RequestMapping(value="/shop/catelist1", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mv,
	                         @RequestParam(value="page", required=false, defaultValue="1") Integer page,
	                         @RequestParam(value="c", required=false) int[] categoryNos // 카테고리 번호 배열로 변경
							) {
		try {
			int totalCount = pService.getListCountByCate(categoryNos); // 카테고리 내 게시글 수 만큼만 전체 게시글 수 따오기
			PageInfo pi = this.getPageInfoAl(page, totalCount);
			List<Product> cateList = pService.selectCateProduct1(pi, categoryNos); // 카테고리 번호 배열 전달
			String strCategoryNo = ""; // 배열을 스트링으로 변환
			for(int i=0; i < categoryNos.length; i++) {
				if(i != categoryNos.length-1) {
					strCategoryNo += categoryNos[i] + ",";
				}else {
					strCategoryNo += categoryNos[i];
				}
			}
			mv.addObject("pi", pi).addObject("cateList", cateList).addObject("c", strCategoryNo).setViewName("/shop/product/listCategory1");
		} catch (Exception e) {
			mv.addObject("msg", "상위 카테고리 상품 조회에 실패했습니다.").setViewName("common/error");
		}
	    return mv;
	}
	
	// 상품 2차 카테고리 목록 조회
	@RequestMapping(value="/shop/catelist2", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mv,
			@RequestParam("c") int categoryNo) {
		try {
			List<Product> cateList = pService.selectCateProduct2(categoryNo);
			mv.addObject("cateList", cateList).setViewName("/shop/product/listCategory2");
		} catch (Exception e) {
			mv.addObject("msg", "하위 카테고리 상품 조회에 실패했습니다.").setViewName("common/error");
		}
		return mv;
	}
	
	// 조건부 검색
	@RequestMapping(value="/product/search", method=RequestMethod.GET)
	public String productSearchView(
			@ModelAttribute Search search
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, Model model) {
		try {
			int totalCount = pService.getSearchProductCount(search);
			PageInfo pi = this.getPageInfoBo(currentPage, totalCount);
			List<Product> pList = pService.searchProduct(search, pi);
			if(!pList.isEmpty()) {
				model.addAttribute("search", search);
				model.addAttribute("pi", pi);
				model.addAttribute("pList", pList);
				return "shop/product/search";
			} else {
				model.addAttribute("msg", "데이터 조회에 실패했습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	

	// 상품 상세페이지 조회
	@RequestMapping(value="/product/detail", method=RequestMethod.GET)
	public String detailProduct(@RequestParam("productNo") int productNo, Model model) {
		try {
			Product product = pService.selectOneByNo(productNo);
			model.addAttribute("product", product);
			return "shop/product/detailProduct";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 상세페이지 내 주문페이지 이동
	@RequestMapping(value="/detail/orderView", method=RequestMethod.GET)
	public ModelAndView viewOrderPageFromDetail(ModelAndView mv, @RequestParam("qty") Integer qty, @RequestParam("productNo") Integer productNo, HttpSession session) {
	    // 상세 페이지에서 세션에 저장된 product 값을 cList 에 담아 주문서로 전달
	    List<Cart> cList = new ArrayList<>();
	    int sum = 0;
	    Product product = pService.printOneProduct(new Product(productNo));
	    Cart cart = new Cart(product, product.getProductNo(), qty);
	    // 상품 가격 계산 : jsp 에서 sum 으로 값을 받기 때문에 계산 식을 따로 적어줘야함
	    sum = Integer.parseInt(product.getProductPrice()) * qty; // productPrice의 타입이 String이기 때문에 형변환해줘야 함
	    cList.add(cart);
	    mv.addObject("cList", cList).addObject("sum", String.format("%.0f", sum)).setViewName("/shop/pay/order");
	    return mv;
	}

	// 장바구니 내 주문페이지 이동
	@RequestMapping(value="/cart/orderView", method=RequestMethod.GET)
	public ModelAndView viewOrderPageFromCart(ModelAndView mv, HttpSession session) {
	    User loginUser = (User) session.getAttribute("loginUser");
	    // 로그인한 회원의 장바구니에 체크된 상품을 cList로 가지고 와서 주문서로 전달
	    List<Cart> cList = cService.printCheckedCart(loginUser.getUserId());
	    double sum = 0;
	    for (Cart cart : cList) {
	    	// 카트에 product 담기
	        Product product = pService.printOneProduct(new Product(cart.getProductNo()));
	        cart.setProduct(product);
	        // 결제 가격은 누적합으로 계산해서 가져옴
	        sum += Double.parseDouble(product.getProductPrice()) * cart.getCartQuantity();
	    }
	    // 상품 가격이 String이고 double로 가지고 오기 때문에 format 해줘야 함
	    mv.addObject("cList", cList).addObject("sum", String.format("%.0f", sum)).setViewName("/shop/pay/order");
	    return mv;
	}

	
	
	
	
	
	
	// ******************** 관리자 기능 ********************
	// 상품 등록 화면
	@RequestMapping(value="/product/registserView", method=RequestMethod.GET)
	public String productRegisterView() {
		return "shop/admin/adminProductRegister";
	}
	
	// 상품 등록
	@RequestMapping(value="/product/register", method=RequestMethod.POST)
	public String productRegister(
			@ModelAttribute Product product,
			@RequestParam(value="uploadFile1", required=false) MultipartFile uploadFile1,
			@RequestParam(value="uploadFile2", required=false) MultipartFile uploadFile2,
			HttpServletRequest request,
			HttpSession session,
			Model model) {
		try {
			request.setCharacterEncoding("UTF-8");
			if(!uploadFile1.getOriginalFilename().equals("")) {
				String filePath = saveFile1(uploadFile1, request);
				if(filePath != null) {	
					product.setProductFilename1(uploadFile1.getOriginalFilename());
					product.setProductFilepath1(filePath);
				}
			}
			if(!uploadFile2.getOriginalFilename().equals("")) {
				String filePath = saveFile2(uploadFile2, request);
				if(filePath != null) {	
					product.setProductFilename2(uploadFile2.getOriginalFilename());
					product.setProductFilepath2(filePath);
				}
			}
			int result = pService.insertProduct(product);
			if(result > 0) {
				Alert alert = new Alert("/product/adminProductList", "상품 등록이 완료되었습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			}else {
				model.addAttribute("msg", "상품 등록이 완료되지 않았습니다. 관리자에게 문의해주세요");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "모든 정보를 입력해주세요");
			return "common/error";
		}
	}
	
	// 지점 경로로 파일 복사(파일업로드) : 첫번째 파일
	private String saveFile1(MultipartFile uploadFile1, HttpServletRequest request) {
		try {
			String root = request.getSession().getServletContext().getRealPath("resources/images");
			// 운영체제에 따라 경로가 다름, 윈도우는 \ 맥은 /
			String savePath = root + "/product/items";
			// 폴더가 없을 경우 자동 생성
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdir();
			}
			// 실제 파일의 경로
			String filePath = savePath + "/" + uploadFile1.getOriginalFilename();
			// 실제로 파일 저장
			File file = new File(filePath);
			uploadFile1.transferTo(file);
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 지점 경로로 파일 복사(파일업로드) : 두번째 파일
	private String saveFile2(MultipartFile uploadFile2, HttpServletRequest request) {
		try {
			// 원하는 저장 경로
			String root = request.getSession().getServletContext().getRealPath("resources/images");
			String savePath = root + "/product/description";
			// 폴더가 없을 경우 자동 생성
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdir();
			}
			// 실제 파일의 경로
			String filePath = savePath + "/" + uploadFile2.getOriginalFilename();
			// 실제로 파일 저장
			File file = new File(filePath);
			uploadFile2.transferTo(file);
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 조건부 검색
		@RequestMapping(value="/product/adminSearch", method=RequestMethod.GET)
		public String productSearchAdmin(
				@ModelAttribute Search search
				, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
				, Model model) {
			try {
				int totalCount = pService.getSearchProductCount(search);
				PageInfo pi = this.getPageInfoBo(currentPage, totalCount);
				List<Product> pList = pService.searchProduct(search, pi);
				if(!pList.isEmpty()) {
					model.addAttribute("search", search);
					model.addAttribute("pi", pi);
					model.addAttribute("pList", pList);
					return "shop/admin/adminProductSearch";
				} else {
					model.addAttribute("msg", "데이터 조회에 실패했습니다.");
					return "common/error";
				}
			} catch (Exception e) {
				model.addAttribute("msg", e.getMessage());
				return "common/error";
			}
		}
	
	// 상품 목록 조회
	@RequestMapping(value="/product/adminProductList", method=RequestMethod.GET)
	public ModelAndView listAdmin(ModelAndView mv, 
			@RequestParam(value="page", required=false, defaultValue="1") Integer page) {
		int totalCount = pService.getListCount();
		PageInfo pi = this.getPageInfoBo(page, totalCount);
		List<Product> pList = pService.selectAllProduct(pi);
		mv.addObject("pi", pi).addObject("pList", pList).setViewName("/shop/admin/adminProductList");
	    return mv;
	}

	// 상품 상세페이지 이동
	@RequestMapping(value="/product/adminDetailProduct", method=RequestMethod.GET)
	public String detailProductAdmin(@RequestParam("productNo") int productNo, Model model) {
		try {
			Product product = pService.selectOneByNo(productNo);
			model.addAttribute("product", product);
			return "shop/admin/adminProductDetail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 상품 수정화면
	@RequestMapping(value="/product/modifyView", method=RequestMethod.GET)
	public String productModifyView(@RequestParam("productNo") int productNo, Model model) {
		try {
			Product product = pService.selectOneById(productNo);
			if(product != null) {
				model.addAttribute("product", product);
				return "shop/admin/adminProductModify";
			}else {
				model.addAttribute("msg", "상품 정보 수정에 실패하였습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 상품 수정
	@RequestMapping(value="/product/modify", method= {RequestMethod.GET, RequestMethod.POST})
	public String productModify(
		@ModelAttribute Product product,
	    @RequestParam(value="reloadFile1", required=false) MultipartFile reloadFile1,
	    @RequestParam(value="reloadFile2", required=false) MultipartFile reloadFile2,
	    Model model,
	    HttpServletRequest request) {
		try {
			if(reloadFile1 != null && !reloadFile1.isEmpty()) {
				if(product.getProductFilename1() != null) {
					this.deleteFile1(product.getProductFilename1(), request);
				}
				String modifyPath = this.saveFile1(reloadFile1, request);
				if(modifyPath != null) {
					product.setProductFilename1(reloadFile1.getOriginalFilename());
					product.setProductFilepath1(modifyPath);
				}
			}
			if(reloadFile2 != null && !reloadFile2.isEmpty()) {
				if(product.getProductFilename2() != null) {
					this.deleteFile2(product.getProductFilename2(), request);
				}
				String modifyPath2 = this.saveFile2(reloadFile2, request);
				if(modifyPath2 != null) {
					product.setProductFilename2(reloadFile2.getOriginalFilename());
					product.setProductFilepath2(modifyPath2);
				}
			}
			// DB에서 지점정보 수정
			int result = pService.updateProduct(product);
			if(result > 0) {
				Alert alert = new Alert("/product/adminProductList", "상품 수정이 완료되었습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			}else {
				model.addAttribute("msg", "상품 정보수정이 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 기존 파일 삭제 메소드 (첫번째 사진)
	private void deleteFile1(String productFilename1, HttpServletRequest request) throws Exception {
		String root1 = request.getSession().getServletContext().getRealPath("resources");
		String delPath1 = root1 + "/product/items";
		String delFilepath1 = delPath1 + "/" + productFilename1;
		File delFile = new File(delFilepath1);
		if(delFile.exists()) {
			delFile.delete();
		}
	}
	
	// 기존 파일 삭제 메소드 (두번째 사진)
	private void deleteFile2(String productFilename2, HttpServletRequest request) throws Exception {
		String root2 = request.getSession().getServletContext().getRealPath("resources");
		String delPath2 = root2 + "/product/items";
		String delFilepath2 = delPath2 + "/" + productFilename2;
		File delFile = new File(delFilepath2);
		if(delFile.exists()) {
			delFile.delete();
		}
	}
	
	// 상품 삭제
	@RequestMapping(value = "/product/remove", method=RequestMethod.GET)
	public String productRemove(@RequestParam("productNo") int productNo, Model model) {
		try {
			int result = pService.deleteProduct(productNo);
			if(result > 0) {
				Alert alert = new Alert("/product/adminProductList", "상품이 삭제되었습니다.");
				model.addAttribute("alert", alert);
				return "common/alert";
			}else {
				model.addAttribute("msg", "상품 삭제가 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	
	
	
	
	
	
	
	
}
