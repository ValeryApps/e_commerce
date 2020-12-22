//import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/product_dto.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = 'edit-produt';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final TextEditingController _imageController = TextEditingController();
  final FocusNode _imageFocusNode = FocusNode();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  ProductDto productDto = ProductDto();
  bool _isInit = true;
  Product product;
  @override
  void initState() {
    _imageFocusNode.addListener(_showImagePreview);
    super.initState();
  }

  _showImagePreview() {
    if (!_imageFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final String id = ModalRoute.of(context).settings.arguments as String;
      if (id != null) {
        product = Provider.of<ProductProvider>(context).findProductById(id);
        _imageController.text = product.imageUrl;
      } else {
        product = Product(
          id: '',
          title: '',
          price: 0,
          description: '',
          imageUrl: '',
        );
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    //  _imageFocusNode.dispose();
    // _imageFocusNode.removeListener(_showImagePreview);
    // _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //if (product.imageUrl != null) print(product.imageUrl);

    void handleForm() {
      var isValid = _form.currentState.validate();
      final data = Provider.of<ProductProvider>(context, listen: false);
      if (isValid) {
        _form.currentState.save();
        //print(product);
        if (product.id == '') {
          final newProduct = Product(
              id: DateTime.now().toIso8601String(),
              title: productDto.title,
              imageUrl: productDto.imageUrl,
              price: productDto.price,
              description: productDto.description);

          data.addProduct(newProduct);
        } else {
          final newProduct = Product(
              id: product.id,
              title: productDto.title,
              imageUrl: productDto.imageUrl,
              price: productDto.price,
              description: productDto.description);
          data.editProduct(product.id, newProduct);
        }
        Navigator.of(context).pushNamed(ProductOverviewScreen.routeName);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            product != null ? "Editing: ${product.title}" : 'Add new product'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: handleForm,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: product.title,
                decoration: InputDecoration(labelText: "Title"),
                onSaved: (value) {
                  productDto.title = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "The title is required";
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: product.price.toString(),
                decoration: InputDecoration(labelText: "price"),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  productDto.price = double.parse(value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "the price is required";
                  }
                  if (double.tryParse(value) <= 0) {
                    return "price must be greater than zero";
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: product.description,
                decoration: InputDecoration(labelText: "description"),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onSaved: (value) {
                  productDto.description = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Descripion is required";
                  }
                  if (value.length < 20) {
                    return "must be at least 20 characters";
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 2),
                            top: BorderSide(width: 2),
                            left: BorderSide(width: 2),
                            right: BorderSide(width: 2))),
                    width: 100,
                    height: 100,
                    child: _imageController.text.isEmpty
                        ? Text("NO IMAGE")
                        : Image.network(
                            _imageController.text,
                            fit: BoxFit.cover,
                          ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextFormField(
                      //initialValue: product.imageUrl,
                      decoration: InputDecoration(labelText: "image url"),
                      keyboardType: TextInputType.url,
                      controller: _imageController,
                      focusNode: _imageFocusNode,
                      onSaved: (value) {
                        productDto.imageUrl = value;
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
