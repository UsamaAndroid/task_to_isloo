import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_to_isloo/model/product_model.dart';

class JobDetail extends StatelessWidget {
  JobDetail({required this.item});

  GetProducts item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Image.network(
                        item.image.toString(),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 11),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.price}  \$',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            '${item.title}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.amber),
                          ),
                          Text(
                            '${item.description}.',
                            // maxLines: 1,
                            // overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 14),
                          ),
                          Center(
                            child: FlatButton(
                              onPressed: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 22, right: 22),
                                child: Text(
                                  'Add To Cart',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              shape: StadiumBorder(),
                              color: Colors.amber,
                            ),
                          )
                        ],
                      ))
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey[200]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(FontAwesomeIcons.arrowLeft),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
