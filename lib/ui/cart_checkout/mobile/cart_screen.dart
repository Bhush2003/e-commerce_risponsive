import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../framework/repository/cart_checkout/repository/cart_provider.dart';
import '../../product/mobile/product_detail/product_detail.dart';
import '../../utils/consts/colors/colors.dart';

class CartScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List productDetailList = ref.read(cartProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Cart"), centerTitle: true),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetail(
                    productDetailModel: productDetailList[index],
                  ),
                ),
              );
            },
            leading: Container(
              height: 100,
              width: 100,
              padding: EdgeInsetsGeometry.all(5),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                image: DecorationImage(
                  image: NetworkImage(productDetailList[index].url[0]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(productDetailList[index].name),
            subtitle: Text(
              productDetailList[index].description,
              softWrap: true,
            ),
            trailing: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_circle_outline),
                ),
                Text("  "),
                IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(child: Icon(Icons.minimize)),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
        itemCount: ref.watch(cartProvider).length,
      ),
    );
  }
}
