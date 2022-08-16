import 'package:flutter/material.dart';
import 'package:furnitureapp/constans.dart';
import 'package:furnitureapp/loginregister/register/PageRegister.dart';

class register extends StatelessWidget {
  const register({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            'Belum Punya Akun ??',
            style: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUp(),
            ),
          ),
          child: Text(
            'Daftar',
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Opensans'),
          ),
        )
      ],
    );
  }
}
