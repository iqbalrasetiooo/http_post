import 'package:http_get_post/export.dart';

class Add extends StatelessWidget {
  Add({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UsersBloc usersBloc = context.read<UsersBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nama',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.number,
            controller: ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Umur',
            ),
          ),
          const SizedBox(height: 25),
          Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                usersBloc.add(
                  CreateUserEvent(
                    name: nameController.text,
                    age: int.parse(ageController.text),
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}
