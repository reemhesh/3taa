import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
   //late PickedFile _imageFile;
  //final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:115.0,
      width:115.0,
      child:Stack(
          fit:StackFit.expand ,
          //overflow:Overflow.all ,
          children: [
            CircleAvatar(
              //radius: 80.0,
              backgroundImage:AssetImage("images/download.jpg")

            ),
           //images/download.jpg
            Positioned(
              right:-12,
              bottom: 0,
              child: SizedBox(
                  height:46,
                  width:46,
                  child:FlatButton(
                    padding:EdgeInsets.zero ,
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(50),
                      side:BorderSide(color:Colors.white ) ,
                    ) ,
                    color:Color(0xFFF5F6F9) ,
                    child:InkWell(
                      onTap: () {
                        showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheet()),
                    );
                    },
                      child: Icon(
                          Icons.camera_alt),
                    ),
                    onPressed:(){},

                  )
              ),
            )
          ]

      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    //final pickedFile = await _picker.getImage(
      //source: source,
    //);
    setState(() {
    //  _imageFile = pickedFile!;
    });
  }
}

