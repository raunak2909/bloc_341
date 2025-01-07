import 'package:bloc_341/list_bloc/list_bloc.dart';
import 'package:bloc_341/list_bloc/list_event.dart';
import 'package:bloc_341/list_bloc/list_state.dart';
import 'package:bloc_341/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: BlocBuilder<ListBloc, ListState>(builder: (_, state) {
        return state.mNotes.isNotEmpty
            ? ListView.builder(
                itemCount: state.mNotes.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(state.mNotes[index].title),
                    subtitle: Text(state.mNotes[index].desc),
                    trailing: SizedBox(
                      width: 110,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                context.read<ListBloc>().add(UpdateItemEvent(
                                    updateNote: NoteModel(
                                        title: "Update title",
                                        desc: "Updated desc"),
                                    index: index));
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                context.read<ListBloc>().add(RemoveItemEvent(index: index));
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    ),
                  );
                })
            : Center(
                child: Text('No Notes yet!!'),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ListBloc>().add(AddItemEvent(
              newNote:
                  NoteModel(title: "My Title", desc: "This is Description")));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
