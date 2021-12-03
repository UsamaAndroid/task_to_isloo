import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:task_to_isloo/controller/product_controller.dart';
import 'package:task_to_isloo/job_detail.dart';

class All extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value)
        return Container(child: Center(child: CircularProgressIndicator()));
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: productController.productList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                      color: Colors.transparent,
                                      child: Image.network(
                                          '${productController.productList[index].image}'))),
                              Expanded(
                                  flex: 6,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 11),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${productController.productList[index].title}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${productController.productList[index].price} \$',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.amber,
                                                fontSize: 18),
                                          ),
                                          FlatButton(
                                            onPressed: () {},
                                            child: Text('Add To Cart'),
                                            shape: StadiumBorder(),
                                            color: Colors.amber,
                                            height: 25,
                                          )
                                        ],
                                      ))),
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  Get.to(JobDetail(
                                      item: productController
                                          .productList[index]));
                                },
                                child: Container(
                                    padding:
                                        EdgeInsets.only(top: 14, bottom: 14),
                                    child: Icon(
                                      FontAwesomeIcons.angleRight,
                                      color: Colors.grey[400],
                                      size: 20,
                                    )),
                              )),
                            ]),
                          ),
                        ),
                      ),
                    );
                  });
            }),
            Text('Top Machinery'),
            Obx(() {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: productController.productList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                      color: Colors.transparent,
                                      child: Image.network(
                                          '${productController.productList[index].image}'))),
                              Expanded(
                                  flex: 6,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 11),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${productController.productList[index].title}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${productController.productList[index].price} \$',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.amber,
                                                fontSize: 18),
                                          ),
                                          FlatButton(
                                            onPressed: () {},
                                            child: Text('Add To Cart'),
                                            shape: StadiumBorder(),
                                            color: Colors.amber,
                                            height: 25,
                                          )
                                        ],
                                      ))),
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  Get.to(JobDetail(
                                      item: productController
                                          .productList[index]));
                                },
                                child: Container(
                                    padding:
                                    EdgeInsets.only(top: 14, bottom: 14),
                                    child: Icon(
                                      FontAwesomeIcons.angleRight,
                                      color: Colors.grey[400],
                                      size: 20,
                                    )),
                              )),
                            ]),
                          ),
                        ),
                      ),
                    );
                  });
            }),
            Text('Lorem ipsem dolry')
          ],
        ),
      );
    });
  }
}
