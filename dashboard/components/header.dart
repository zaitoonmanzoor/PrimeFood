import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../controllers/MenuController.dart';
import '../../../constants.dart';
import '../../../responsive.dart';

class Header extends StatelessWidget {
  const Header({
    this.email, this.name
  });

  final String? email, name;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!Responsive.isDesktop(context))
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: context.read<MenuController>().controlMenu,
              ),
            if (!Responsive.isMobile(context))
              Text(
                "Dashboard",
                style: Theme.of(context).textTheme.headline6,
              ),

           // Text('$email'),

            if (!Responsive.isMobile(context))
              Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
            // Expanded(child: SearchField()),
//          ProfileCard(email: email, name: name, )
            ProfileCard(),
          ],
        ),
      ),
    );
  }
}


class ProfileCard extends StatelessWidget {
   ProfileCard({this.email, this.name});

  final String? email, name;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Container(
          margin: EdgeInsets.only(left: defaultPadding),
          padding: EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.white10),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/images/profile_pic.png",
                height: 38,
              ),
              if (!Responsive.isMobile(context))
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  child: Text("Angelina Jolie"),
                ),
          Column(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton<String> (
                  icon: Icon(Icons.keyboard_arrow_down),
                    items: [
                      DropdownMenuItem(
                      //child: Text('$name '  ' $email'),
                        child: Text('$email' ),
                     value: '$name',
                    ),
                    ],
                    onChanged: (value){
                      print(value);
                    }
                ),
              ),
            ],
          ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
