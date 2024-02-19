//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import 'package:memo_app/providers/accounts.dart';

class AvatarPicker extends StatelessWidget {
  static final routeName = './avatarPicker';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text(
              "Pick Your Avatar",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 3.5,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: SizedBox(
                        width: 250,
                        height: 200,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            provider.setAvatar(index);
                          },
                          child: Image.asset(
                            provider.AvatarList[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: provider.AvatarList.length),
          )
        ],
      ),
    );
  }
}
