import 'package:flutter/material.dart';
import 'package:food_store/controllers/cart_controller.dart';
import 'package:food_store/data/repository/popular_product_repo.dart';
import 'package:food_store/models/cart_model.dart';
import 'package:food_store/utils/colors.dart';
import 'package:get/get.dart';
import 'package:food_store/models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  void setQuantity(bool increment) {
    if (increment) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (_inCartItems+quantity < 0) {
      Get.snackbar(
        "Item count",
        "Quantity can't be less than 0 !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
        animationDuration: Duration(milliseconds: 300),
      );
      return -_inCartItems; //for example: quantity -3 , inCartItems 3 = 0
    } else if (_inCartItems+quantity > 20) {
      Get.snackbar(
        "Item count",
        "Quantity can't be more than 20",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
        animationDuration: Duration(milliseconds: 300),
      );
      return 20 - _inCartItems; // for example: inCartItems 16, quantity 20-16 = 4 ==> total 20
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if(exist){
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _inCartItems = _cart.getQuantity(product);
      update();
  }

  int get totalItems{
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }
}
