import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Customer/pages/screens/dashboard.dart';
import 'package:starter_project/Customer/pages/screens/orderConfirmPage.dart';
import 'package:starter_project/Customer/pages/screens/widgets/date_time_picker_widget2.dart';
import 'package:starter_project/Customer/pages/screens/widgets/notifcation_dialog.dart';
import 'package:starter_project/Customer/pages/utils/CustomTextStyle.dart';
import 'package:starter_project/Customer/pages/utils/CustomUtils.dart';
import 'package:starter_project/core/repositories/cart_repository.dart';
import 'package:starter_project/models/cart_item.dart';
import 'package:starter_project/ui_helpers/size_config/size_config.dart';

// import 'CheckOutPage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CartRepository>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) {
          return ListView(
            children: <Widget>[
              createHeader(),
              createSubTitle(),
              createCartList(),
              footer(context, model)
            ],
          );
        },
      ),
    );
  }

  footer(BuildContext context, CartRepository model) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Total",
                  style: CustomTextStyle.textFormFieldMedium
                      .copyWith(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  model.currentPrice.toString(),
                  style: CustomTextStyle.textFormFieldBlack
                      .copyWith(color: Color(0xff9477cb), fontSize: 14),
                ),
              ),
            ],
          ),
          Utils.getSizedBox(height: 8),
         
            
          _datePicker(),
        
          ElevatedButton(
            onPressed: () async{
              bool s = await model.checkoutCart(selectedDate.toString());
              if(s) Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
              // Navigator.push(context,
              //     new MaterialPageRoute(builder: (context) => OrderConfirmPage()));
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xff9477cb),
              padding:
                  EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24))),
            ),
            child: Text(
              "Book Now",
              style: CustomTextStyle.textFormFieldSemiBold
                  .copyWith(color: Colors.white),
            ),
          ),
          Utils.getSizedBox(height: 8),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }

  createHeader() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "BOOKING CART",
        style: CustomTextStyle.textFormFieldBold
            .copyWith(fontSize: 16, color: Colors.black),
      ),
      margin: EdgeInsets.only(left: 12, top: 12),
    );
  }

  createSubTitle() {
    final model = Provider.of<CartRepository>(context);
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Total(${model.cart.length}) Items",
        style: CustomTextStyle.textFormFieldBold
            .copyWith(fontSize: 12, color: Colors.grey),
      ),
      margin: EdgeInsets.only(left: 12, top: 4),
    );
  }

  createCartList() {
    final model = Provider.of<CartRepository>(context);
    return model.cart.length == 0 ? Padding(
      padding: EdgeInsets.all(SizeConfig.widthOf(10)),
      child: Center(child: Text(
          'Cart is Empty',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
          ),
      ),),
    ) : ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        return createCartListItem(position, model);
      },
      itemCount: model.cart.length,
    );
  }

  createCartListItem(int i, var model) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Colors.blue.shade200,
                    image: model.cart[i].product.image == null ? null : DecorationImage(image: NetworkImage(model.cart[i].product.image))),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          model.cart[i].product.service,
                          maxLines: 2,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldSemiBold
                              .copyWith(fontSize: 14),
                        ),
                      ),
                      Utils.getSizedBox(height: 6),
                      Text(
                        model.cart[i].product.description,
                        style: CustomTextStyle.textFormFieldRegular
                            .copyWith(color: Colors.grey, fontSize: 14),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              model.cart[i].product.price,
                              style: CustomTextStyle.textFormFieldBlack
                                  .copyWith(color: Color(0xff9477cb)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  InkWell(
                                    onTap: (){
                                      model.decrementQuantity(index: i);
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 24,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.grey.shade200,
                                    padding: const EdgeInsets.only(
                                        bottom: 2, right: 12, left: 12),
                                    child: Text(
                                      model.cart[i].quantity.toString(),
                                      style:
                                          CustomTextStyle.textFormFieldSemiBold,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      model.incrementQuantity(index: i);
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 24,
                                      color: Colors.grey.shade700,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: (){
              model.removeItemFromCart(index: i);
            },
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10, top: 8),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Color(0xff9477cb)),
            ),
          ),
        )
      ],
    );
  }

  Widget _datePicker() {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(dateFormat.format(selectedDate)),
        RaisedButton(
          child: Text('Choose new date time'),
          onPressed: () async {
            showDateTimeDialog(context, initialDate: selectedDate,
                onSelectedDate: (selectedDate) {
                  setState(() {
                    selectedDate = selectedDate;
                  });
                });
          },
        ),
      ],
    );
  }
}
