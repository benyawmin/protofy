import 'package:flutter/scheduler.dart';
import 'package:protofy/features/order_pickup/presentation/bloc/order_input_bloc/salad_list_bloc.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/order_input_page_widgets/salad_list.dart';
import 'package:protofy/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protofy/features/order_pickup/presentation/widgets/order_input_page_widgets/salad_list_widgets.dart';

class SaladListPage extends StatelessWidget {
  const SaladListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (_) => sl<SaladListBloc>(),
          child: Column(
            children: <Widget>[
              BlocBuilder<SaladListBloc, SaladListState>(
                builder: (context, state) {
                  //! Handling different pages and logics based on the state
                  //! emmited from the bloc
                  if (state is SaladListStateInitial) {
                    debugPrint('Initial');
                    BlocProvider.of<SaladListBloc>(context)
                        .add(LoadSaladList());
                    return const SizedBox();
                  } else if (state is SaladListStateLoading) {
                    return const Stack(
                        alignment: Alignment.center,
                        children: [SizedBox(), Loading()]);
                  } else if (state is SaladListStateLoaded) {
                    // Animated fade in transition to the next page
                    // return const Text('The state is loaded');
                    debugPrint('LOADED');
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                            transitionDuration: const Duration(seconds: 1),
                            pageBuilder: (_, __, ___) => SaladList(
                                  saladList: state.saladList,
                                )),
                      );
                    });
                  } else if (state is SaladListStateError) {
                    return SaladListError(message: state.message);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
