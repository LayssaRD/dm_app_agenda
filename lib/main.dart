import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/tarefa.dart';

import 'mock/tarefas_mock.dart';

void main() {
  runApp(const AgendaApp());
}

class AgendaApp extends StatefulWidget {
  const AgendaApp({super.key});

  @override
  State<AgendaApp> createState() => _AgendaAppState();
}

class _AgendaAppState extends State<AgendaApp> {
  void _reordenarTarefas(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Tarefa tarefa = tarefasMock.removeAt(oldIndex);
      tarefasMock.insert(newIndex, tarefa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu, size: 48),
          title: const Text('TAREFAS'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ReorderableListView.builder(
                buildDefaultDragHandles: false,
                itemCount: tarefasMock.length,
                onReorder: _reordenarTarefas,
                itemBuilder: (context, index) {
                  return ListTile(
                    key: ObjectKey(tarefasMock[index]),
                    leading: Checkbox(
                      value: tarefasMock[index].concluida,
                      onChanged: (valor) {
                        setState(() {
                          tarefasMock[index].concluida = valor ?? false;
                        });
                      },
                    ),
                    title: Text(
                      tarefasMock[index].titulo ?? '',
                      style: TextStyle(
                        decoration: tarefasMock[index].concluida
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${tarefasMock[index].dataTarefa.hour}:${tarefasMock[index].dataTarefa.minute.toString().padLeft(2, '0')}",
                        ),
                        const SizedBox(width: 16),
                        ReorderableDragStartListener(
                          index: index,
                          child: const Icon(Icons.drag_handle),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(DateFormat('dd/MM/yyyy').format(DateTime.now())),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              tarefasMock.add(
                Tarefa(
                  titulo: "Nova Tarefa",
                  dataTarefa: DateTime.now().add(const Duration(hours: 1)),
                ),
              );
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
