package com.example.demo.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.domain.Product;
import com.example.demo.service.ProductService;
import com.example.demo.service.UploadService;

import jakarta.validation.Valid;

@Controller
public class ProductController {
    private ProductService productService;
    private UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    // Start Create Product
    @GetMapping("/admin/product/create")
    public String createProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create"; // trả về trang create.jsp
    }

    @PostMapping("/admin/product/create")
    public String postProductPage(Model model, @ModelAttribute("newProduct") @Valid Product product,
            BindingResult bindingResult, @RequestParam("productImgFile") MultipartFile file) {
        if (bindingResult.hasErrors()) {
            // Lấy danh sách tất cả các lỗi
            List<FieldError> errors = bindingResult.getFieldErrors();

            // In ra console để debug
            for (FieldError error : errors) {
                System.out.println(
                        error.getField() + " - " + error.getDefaultMessage());
            }

            // TODO: Trả về view với thông báo lỗi để người dùng thấy
            return "admin/product/create"; // Ví dụ: trả về lại trang tạo user
        }

        // ✅ XỬ LÝ FILE UPLOAD
        System.out.println("=== FILE UPLOAD DEBUG ===");
        System.out.println("File name: " + file.getOriginalFilename());
        System.out.println("File size: " + file.getSize() + " bytes");
        System.out.println("File empty: " + file.isEmpty());

        String image = this.uploadService.handleSaveUploadFile(file, "product");
        System.out.println("Saved image path: " + image);
        product.setImage(image);

        this.productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }

    // End Create Product
    // Hiển thị dữ liệu từ database lên trang show.jsp
    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> productList = this.productService.getAllProduct();
        model.addAttribute("products", productList);
        return "admin/product/show";
    }

    // View Detail Product,Hiển thị dữ liệu từ database lên theo id
    @GetMapping("/admin/product/{id}")
    public String getDetailProduct(Model model, @PathVariable Long id) {
        Product product = this.productService.getById(id);
        model.addAttribute("products", product);
        return "admin/product/detail";
    }
    // Delete product

    // Update product. 2 bước, lấy dữ liệu lên, sau đó sửa và đẩy dữ liệu vào lại
    // Database
    // Bước 1: Lấy data từ database hiển thị lên view
    @GetMapping("/admin/product/update/{id}")
    public String getProductUpdate(Model model, @PathVariable Long id) {
        Product product = this.productService.getById(id);
        model.addAttribute("products", product);
        return "admin/product/update";
    }

    // Bước 2: Lưu dữ liệu vào database
    @PostMapping("/admin/product/update")
    public String postProductUpdate(Model model, @ModelAttribute("products") Product updateProduct) {
        Product product = this.productService.getById(updateProduct.getId());
        if (product != null) {
            product.setName(updateProduct.getName());
            product.setPrice(updateProduct.getPrice());
            product.setDetailDesc(updateProduct.getDetailDesc());
            product.setShortDesc(updateProduct.getShortDesc());
            product.setQuantity(updateProduct.getQuantity());
            product.setFactory(updateProduct.getFactory());
            product.setTarget(updateProduct.getTarget());
            this.productService.handleSaveProduct(product);
        }
        return "redirect:/admin/product/" + updateProduct.getId();
    }

    // Update product. 2 bước, lấy dữ liệu lên, sau đó sửa và đẩy dữ liệu vào lại
    // Database
    // Bước 1: Lấy data từ database
    @GetMapping("/admin/product/delete/{id}")
    public String getProductDelete(Model model, @PathVariable Long id) {
        Product product = this.productService.getById(id);
        model.addAttribute("deleteProduct", product);
        return "/admin/product/delete";
    }

    // Bước 2: Xóa product
    @PostMapping("/admin/product/delete")
    public String postProductDelete(@ModelAttribute("deleteProduct") Product delProduct) {
        if (delProduct != null && delProduct.getId() != 0) {
            this.productService.deleteProductById(delProduct.getId());
        }
        return "redirect:/admin/product";
    }

}
