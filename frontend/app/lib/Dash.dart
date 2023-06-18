import 'package:flutter/material.dart';

class Dash extends StatefulWidget {
  const Dash({super.key});

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  final TextEditingController _searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    double widthvalue = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 140,
              width: double.infinity,
              color: const Color.fromRGBO(255, 255, 255, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      child: CircleAvatar(
                        child: Icon(
                          Icons.menu,
                          size: 35,
                          color: Colors.black,
                        ),
                        radius: 25,
                        backgroundColor: const Color.fromARGB(20, 0, 0, 0),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset(
                        'assets/images/main logo.png',
                        height: 200,
                        width: 200,
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 60,
                    height: 60,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Icon(
                      Icons.add_shopping_cart_outlined,
                      size: 30,
                    ),
                  )
                ],
              ),
            )
            // ROW END

            ,
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  // Add padding around the search bar
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  // Use a Material design search bar
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      // Add a clear button to the search bar
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _searchController.clear(),
                      ),
                      // Add a search icon or button to the search bar
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // Perform the search here
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ROW END

            SizedBox(
              width: double.infinity,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Specify the number of items in the list
                itemBuilder: (context, index) {
                  // Return the widget for each list item
                  return Container(
                    margin: EdgeInsets.only(left: 10),
                    // color: Colors.black,
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 40,
                    ),
                  );
                },
              ),
            ),

            // ROW END

            Container(
              width: widthvalue-20,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
                  // color: const Color.fromARGB(255, 0, 0, 0),
                ),
                child: Image.asset(
                  "assets/images/onlinepharmacy.jpg",
                ))



                // ROW END


                ,SizedBox(
                  width: widthvalue-20,
                  height:650,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns in the grid
                    crossAxisSpacing: 10, // Spacing between columns
                    mainAxisSpacing: 10, // Spacing between rows
                  ),
                  itemCount: 9, // Specify the number of items in the grid
                  itemBuilder: (context, index) {
                    // Return the widget for each grid item
                    return Container(
                      decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
                      color: Colors.blue,
                  // color: const Color.fromARGB(255, 0, 0, 0),
                ),
                      child: Center(
                        child: Text('Item $index'),
                      ),
                    );
                  },
                ),
                )
          ],
        ),
      ),
    );
  }
}
