import 'package:books_app/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:books_app/main.dart';
import 'package:books_app/screen/cart_screen.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;
  BookDetailScreen(
      {required this.book}); //אני מחייבת את המחלקה להשתמש באובייקט של בוק
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //ציר y
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 25,
                top: 50), //הכנת תשתית לאפבר עושה לו גבולות.
            child: Row(
              children: [
                GestureDetector(
                  //button
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 45,
                    height: 40,
                    decoration: BoxDecoration(
                      //. כונטטינר לא מכיר סטייל, אלא רק דקוריישן. שהכפתור יהיה בצורת כרטיס
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width:10,),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ),
                    )
                  },
                ),
              ],
            ),
          ), //סיימנו עם האפ בר ולכן יוצאים מהפדינג ועוברים לעצב את התמונה
          Center(
            //אני ממרכזת את התמונה
            child: SizedBox(
              height: 300,
              child: Hero(
                tag: book.imgeURL,
                child: ClipRRect(
                  //מעצב את התמונה
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    book.imgeURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              //תופס את כל המסך
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: Padding(
                padding: EdgeInsets.all(35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      book.author,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "\$" + book.price,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Book Description",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      book.description,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          cart.add(book);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("${book.title} add to cart"),
                          ));
                        },
                        child: Text("Add to cart"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
