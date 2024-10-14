package dev.myodan.polycafe.controller;

import dev.myodan.polycafe.model.Member;
import dev.myodan.polycafe.model.Product;
import dev.myodan.polycafe.model.ProductImage;
import dev.myodan.polycafe.service.ProductImageService;
import dev.myodan.polycafe.service.ProductService;
import dev.myodan.polycafe.util.Pageable;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/products")
@RequiredArgsConstructor
public class ProductController {

    private final static String UPLOAD_DIRECTORY = "d:/uploads/";
    private final static String PRODUCT_PATH = "products";

    private final ProductService productService;
    private final ProductImageService productImageService;

    @GetMapping
    public String listProducts(Model model, Pageable pageable) {
        model.addAttribute("list", productService.findAll(pageable));
        return PRODUCT_PATH + "/list";
    }

    @GetMapping("/{id}")
    public String viewProduct(@PathVariable Long id, Model model) {
        model.addAttribute("item", productService.findById(id));
        return PRODUCT_PATH + "/detail";
    }

    @GetMapping("/add")
    public String showAddProductForm() {
        return PRODUCT_PATH + "/add";
    }

    @PostMapping("/add")
    public String addProduct(Product product, List<MultipartFile> uploadFile, @SessionAttribute Member member) throws IOException {
        for (MultipartFile file : uploadFile) {
            if (file != null && !file.isEmpty()) {
                String filename = file.getOriginalFilename();
                String uuid = UUID.randomUUID().toString();

                product.getProductImages().add(ProductImage.builder().filename(filename).uuid(uuid).build());
                file.transferTo(new File(UPLOAD_DIRECTORY + uuid));
            }
        }

        product.setCreator(member);
        product.setUpdater(member);
        System.out.println("=====================");
        System.out.println(product);
        System.out.println("=====================");
        productService.create(product);

        return "redirect:/" + PRODUCT_PATH;
    }

    @GetMapping("/edit")
    public String showEditProductForm(Product product, Model model) {
        model.addAttribute("item", productService.findById(product.getId()));
        return PRODUCT_PATH + "/edit";
    }

    @PostMapping("/edit")
    public String updateProduct(Product product, List<MultipartFile> uploadFile) throws IOException {

        for (MultipartFile file : uploadFile) {
            if (file != null && !file.isEmpty()) {
                String filename = file.getOriginalFilename();
                String uuid = UUID.randomUUID().toString();

                product.getProductImages().add(ProductImage.builder().filename(filename).uuid(uuid).build());
                file.transferTo(new File(UPLOAD_DIRECTORY + uuid));
            }
        }

        productService.update(product);

        return "redirect:/" + PRODUCT_PATH;
    }

    @GetMapping("/delete/{id}")
    public String removeProduct(@PathVariable Long id) {
        Product product = productService.findById(id);

        productService.deleteById(id);

        for (ProductImage productImage : product.getProductImages()) {
            File file = new File(UPLOAD_DIRECTORY + productImage.getUuid());
            file.delete();
        }

        return "redirect:/" + PRODUCT_PATH;
    }

    @ResponseBody
    @DeleteMapping("/images/{id}")
    public String deleteProductImage(@PathVariable Long id) {
        File file = new File(UPLOAD_DIRECTORY + id);
        file.delete();

        productImageService.deleteById(id);
        return "ok";
    }

}
