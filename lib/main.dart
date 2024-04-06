import 'package:belajar_bloc1/bloc/bloc/form_username_bloc.dart';
import 'package:belajar_bloc1/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<FormUsernameBloc>(
          create: (context) => FormUsernameBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          BlocBuilder<CounterBloc, CounterStateSuccess>(
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      "${state.value}",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<CounterBloc>()
                            .add(IncrementCounterEvent());
                      },
                      child: const Text(
                        'Increment',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<CounterBloc>()
                            .add(DecrementCounterEvent());
                      },
                      child: const Text(
                        'Decrement',
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          BlocBuilder<FormUsernameBloc, FormUsernameState>(
            builder: (context, state) {
              return TextFormField(
                onChanged: (value) {
                  context.read<FormUsernameBloc>().add(
                        InputUsernameEvent(query: value),
                      );
                },
                decoration: InputDecoration(
                  errorText:
                      state is FormUsernameNotValid ? state.message : null,
                ),
              );
            },
          ),
          BlocBuilder<FormUsernameBloc, FormUsernameState>(
            builder: (context, state) {
              return TextFormField(
                onChanged: (value) {
                  context.read<FormUsernameBloc>().add(
                        InputPasswordEvent(query: value),
                      );
                },
                decoration: InputDecoration(
                  errorText:
                      state is FormPasswordNotValid ? state.message : null,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
