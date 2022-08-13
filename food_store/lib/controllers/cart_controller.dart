import 'package:flutter/material.dart';
import 'package:food_store/data/repository/cart_repo.dart';
import 'package:food_store/models/products_model.dart';
import 'package:food_store/utils/colors.dart';
import 'package:get/get.dart';
import 'package:food_store/models/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });

      if (totalQuantity <= 0) {
        _items.remove(product.id!);
      }

    } else {
      if(quantity > 0){
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
          );
        });
      } else {
        Get.snackbar(
          "Item Quantity",
          "You should at least add one item to the Cart",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }

    }

    _items.forEach((key, value) {
      print("The product id is: ${key} and Quantity is ${value.quantity}");
    });
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    int quantity = 0;
    if (_items.containsKey(product.id)) {
      quantity = _items[product.id]!.quantity!;
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }
}
