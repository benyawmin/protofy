import 'package:Enter/features/card_management/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:Enter/features/card_management/presentation/pages/dashboard_page.dart';
import 'package:Enter/features/card_management/presentation/widgets/login_page_widgets/loading.dart';
import 'package:Enter/features/card_management/presentation/widgets/login_page_widgets/login_error.dart';
import 'package:Enter/features/card_management/presentation/widgets/login_page_widgets/main_widget.dart';
import 'package:Enter/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (_) => sl<LoginBloc>(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.h),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is AuthenticationInitial) {
                        return LoginMainBody();
                      } else if (state is AuthenticationInProgress) {
                        return Stack(children: [LoginMainBody(), Loading()]);
                      } else if (state is AuthenticationSuccess) {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  Dashboard(userData: state.userData),
                            ),
                          );
                        });
                      } else if (state is AuthenticationError) {
                        //! Different types of erros are handled inside logic but
                        //! according to design the same error will be shown
                        // state.message,
                        return LoginError();
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
