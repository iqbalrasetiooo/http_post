import 'package:http_get_post/export.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    UsersBloc userBloc = context.read<UsersBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP GET'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Add(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersSuccess) {
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: state.user.length,
              itemBuilder: (context, index) {
                var item = state.user[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(item.name.toString()),
                  subtitle: Text(item.age.toString()),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
