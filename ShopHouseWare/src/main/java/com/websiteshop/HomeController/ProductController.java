package com.websiteshop.HomeController;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.mail.FetchProfile.Item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.websiteshop.dao.CategoryDAO;
import com.websiteshop.dao.ProductDAO;
import com.websiteshop.entity.Product;
import com.websiteshop.service.ProductService;

@Controller
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    CategoryDAO dao;
    @Autowired
    ProductDAO pdao;

    static void list_All_Items(Model model, @Autowired ProductService ps) {
        // get totalsize item
        model.addAttribute("items", ps.findAll());
        model.addAttribute("totalItemss", ps.findAll().size());
    }

    @GetMapping("/")
    public String home(ModelMap model,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(18);
        Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by("productId").descending());
        Page<Product> resultPage = null;

        if (StringUtils.hasText(name)) {
            resultPage = productService.findByNameContaining(name, pageable);
            model.addAttribute("name", name);
            model.addAttribute("totalItems", productService.countByNameContaining(name));
        } else {
            resultPage = productService.findAll(pageable);
            model.addAttribute("totalItems", productService.findAll().size());
        }

        int totalPages = resultPage.getTotalPages();
        if (totalPages > 0) {
            int start = Math.max(1, currentPage - 2);
            int end = Math.min(currentPage + 2, totalPages);

            if (totalPages > 3) {
                if (end == totalPages)
                    start = end - 4;
                else if (start == 1)
                    end = start + 4;
            }
            List<Integer> pageNumbers = IntStream.rangeClosed(start, end)
                    .boxed()
                    .collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }

        model.addAttribute("productPage", resultPage);
        return "product/list";
    }

    @RequestMapping("/product/list")
    public String list(Model model, @RequestParam("cid") Optional<Long> cid) {
        if (!cid.isPresent()) {
            return "redirect:/home404";
        }
        List<Product> list = productService.findByCategoryId(cid.get());
        model.addAttribute("item", list);
        model.addAttribute("totalItems", pdao.findByCategoryId(cid.get()).size());
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/product/detail/{productId}")
    public String detail(Model model, @PathVariable("productId") Long id) {
        try {
            Product item = productService.findById(id).orElseThrow(() -> new Exception("Product not found"));
            model.addAttribute("item", item);
            model.addAttribute("phukien", pdao.findByPhuKien("sạc dự phòng"));
            model.addAttribute("totalItems", pdao.findByPhuKien("sạc dự phòng").size());
            list_All_Items(model, productService);
        } catch (Exception e) {
            return "redirect:/home404";
        }
        return "product/detail";
    }

    //////////////////////////////

    @RequestMapping("/product/list/hotsale")
    public String hotSale(Model model) {
        String hot = "hot-icon.gif";
        model.addAttribute("item", pdao.findByHotSale(hot));
        // get totalsize item
        model.addAttribute("totalItems", pdao.findByHotSale(hot).size());
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price/duoi-300k")
    public String price1(Model model) {
        return getPriceSearchResult(model, 0, 300000);
    }

    @RequestMapping("/price/tu-150-300k")
    public String price2(Model model) {
        return getPriceSearchResult(model, 150000, 300000);
    }

    @RequestMapping("/price/tu-300-500k")
    public String price3(Model model) {
        return getPriceSearchResult(model, 300000, 500000);
    }

    @RequestMapping("/price/tu-500-700k")
    public String price4(Model model) {
        return getPriceSearchResult(model, 500000, 700000);
    }

    @RequestMapping("/price/tren-700k")
    public String price6(Model model) {
        return getPriceSearchResult(model, 700000, 20000000);
    }

    private String getPriceSearchResult(Model model, int minPrice, int maxPrice) {
        List<Product> items = pdao.findByUnitPrice(minPrice, maxPrice);
        int totalItems = items.size();

        model.addAttribute("item", items);
        model.addAttribute("totalItems", totalItems);

        list_All_Items(model, productService);

        return "product/list_search";
    }

    @RequestMapping("/nxb-2018")
    public String nxb_2018(Model model) {
        model.addAttribute("item", pdao.findByDiscription("2018"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("2018");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/nxb-2019")
    public String nxb_2019(Model model) {
        model.addAttribute("item", pdao.findByDiscription("2019"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("2019");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/nxb-2020")
    public String nxb_2020(Model model) {
        model.addAttribute("item", pdao.findByDiscription("2020"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("2020");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/nxb-2021")
    public String nxb_2021(Model model) {
        model.addAttribute("item", pdao.findByDiscription("2021"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("2021");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/nxb-2022")
    public String nxb_2022(Model model) {
        model.addAttribute("item", pdao.findByDiscription("2022"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("2022");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/nxb-2023")
    public String nxb_2023(Model model) {
        model.addAttribute("item", pdao.findByDiscription("2023"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("2023");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/nxb-2024")
    public String nxb_2024(Model model) {
        model.addAttribute("item", pdao.findByDiscription("2024"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("2024");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/sach-tren-18+")
    public String sach_tren_18(Model model) {
        model.addAttribute("item", pdao.findByDiscription("18+"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("18+");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/brand-vn")
    public String bia_mem(Model model) {
        model.addAttribute("item", pdao.findByDiscription("Việt Nam"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("Việt Nam");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/brand-japan")
    public String bia_cung(Model model) {
        model.addAttribute("item", pdao.findByDiscription("Nhật Bản"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("Nhật Bản");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dgd-samsum")
    public String author_other(Model model) {
        model.addAttribute("item", pdao.findByDiscription("Samsung"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("Samsung");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dgd-toshiba")
    public String author_sl(Model model) {
        model.addAttribute("item", pdao.findByDiscription("Toshiba"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("Toshiba");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dgd-panasonic")
    public String author_bro(Model model) {
        model.addAttribute("item", pdao.findByDiscription("Panasonic"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("Panasonic");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dgd-lg")
    public String author_ce(Model model) {
        model.addAttribute("item", pdao.findByDiscription("LG"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("LG");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dgd-senko")
    public String author_st(Model model) {
        model.addAttribute("item", pdao.findByDiscription("Senko"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("Senko");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dgd-tefal")
    public String author_rf(Model model) {
        model.addAttribute("item", pdao.findByDiscription("Tefal"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("Tefal");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dgd-beplephan")
    public String author_htn(Model model) {
        model.addAttribute("item", pdao.findByDiscription("Beplephan"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("Beplephan");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/product/best-seller")
    public String best_seller(Model model) {
        model.addAttribute("item", pdao.findByDiscription("bán chạy nhất"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("bán chạy nhất");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price-cao-den-thap")
    public String caodenthap(Model model) {
        model.addAttribute("item", pdao.findByPriceDESC());
        // get totalsize item
        List<Product> items = pdao.findByPriceDESC();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price-thap-den-cao")
    public String thapdencao(Model model) {
        model.addAttribute("item", pdao.findByPriceASC());
        // get totalsize item
        List<Product> items = pdao.findByPriceASC();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price-giam")
    public String giam(Model model) {
        model.addAttribute("item", pdao.findByDiscountDESC());
        // get totalsize item
        List<Product> items = pdao.findByDiscountDESC();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price-sale-flash")
    public String sieu_sale(Model model) {
        model.addAttribute("item", pdao.findBySaleFlash());
        // get totalsize item
        List<Product> items = pdao.findBySaleFlash();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/phu-kien")
    public String phu_kien__sac(Model model) {
        model.addAttribute("phukien", pdao.findByPhuKien("sạc dự phòng"));
        // get totalsize item
        List<Product> items = pdao.findByPhuKien("sạc dự phòng");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-sac-nhanh")
    public String sac_nhanh1(Model model) {
        model.addAttribute("phukien", pdao.findByPhuKien("sạc dự phòng"));
        // get totalsize item
        List<Product> items = pdao.findByPhuKien("sạc dự phòng");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

}
