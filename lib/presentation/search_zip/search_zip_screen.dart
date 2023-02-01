import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_zip/application/search_zip/search_zip_bloc.dart';

class SearchZipScreen extends StatelessWidget {
  SearchZipScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  Timer? _throttle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Search Zip Code'),
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Name",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                autofocus: false,
                maxLines: 1,
                validator: (val){
                  if(val!.isNotEmpty){
                    return null;
                  }else{
                    return 'This field is required';
                  }
                },
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  hintText: 'Enter your name',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("Email",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.text,
                autofocus: false,
                maxLines: 1,
                validator: (val){
                  if(val!.isNotEmpty){
                    return null;
                  }else{
                    return 'This field is required';
                  }
                },
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  hintText: 'Enter your email',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("Zip Code",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: zipController,
                keyboardType: TextInputType.text,
                autofocus: false,
                maxLines: 1,
                onChanged: (val){
                  if (_throttle?.isActive??false) _throttle?.cancel();
                  _throttle = Timer(const Duration(milliseconds: 500), () {
                    BlocProvider.of<SearchZipBloc>(context).add(SearchZipEvent.fetch(zipCode: val));
                  });
                },
                validator: (val){
                  if(val!.isNotEmpty){
                    return null;
                  }else{
                    return 'This field is required';
                  }
                },
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  hintText: 'Enter your zip code',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              BlocBuilder<SearchZipBloc,SearchZipState>(
                builder: ((context, state) {
                  return state.result.isNotEmpty?
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 400),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.5),
                            blurRadius: 20.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                            offset: const Offset(
                              5.0, // Move to right 10  horizontally
                              5.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Card(
                        color: Colors.white,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 16),
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: state.result.length,
                          itemBuilder: (context,index){
                            return ListTile(
                              dense: true,
                              onTap: (){
                                zipController.text = state.result[index];
                                BlocProvider.of<SearchZipBloc>(context).add(const SearchZipEvent.initialized());
                              },
                              title: Text(state.result[index],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ):const SizedBox.shrink();
                }),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: (){
                    if(_formKey.currentState!.validate()){

                    }
                  },
                  child: const Text("Submit",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
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
