import 'package:flutter/material.dart';
import 'package:rest_api/Controller/RestApiCalling.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<RestApiCalling>? storeData;
  bool isLoaded = false;

  getData()async{
   storeData = await RequestRestAPI().myData();
   setState(() {
     isLoaded = true;
   });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Visibility(
          visible: isLoaded == true,
          replacement: const Center(child: CircularProgressIndicator(),),
          child: ListView.builder(
            itemCount: storeData!.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(storeData![index].title),
                  subtitle: Text(storeData![index].body),
                );
              }
              ),
        ),
      ),
    );
  }
}
