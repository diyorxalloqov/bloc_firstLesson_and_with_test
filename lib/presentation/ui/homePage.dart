import 'package:bloc_first/application/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final TextEditingController nameController = TextEditingController();
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("HomePage User"),
          ),
          body: Builder(builder: (context) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is UserErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state is UserCompleteState) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.data[index].name.toString()),
                    subtitle: Text(state.data[index].email.toString()),
                  );
                },
                itemCount: state.data.length,
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                context.read<UserBloc>().add(const UserUpdateEvent());

                // add(UserSignUpEvent(
                //     name: nameController.text,
                //     lastName: "lastName",
                //     email: "email",
                //     password: "password"));
              },
              label: const Text("get data")),
        );
      },
    );
  }
}
