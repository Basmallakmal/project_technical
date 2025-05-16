import 'package:auto_route/annotations.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:project_technical/config/theme/text_input_custom.dart';
import 'package:project_technical/presentation/pages/question_three/provider.dart';
import 'package:project_technical/presentation/utils/app_services.dart';
import 'package:provider/provider.dart';

import '../../../config/theme/theme.dart';
import 'provider.dart';

@RoutePage()
class QuestionTwoPage extends StatefulWidget {
  const QuestionTwoPage({super.key});

  @override
  State<StatefulWidget> createState() => QuestionTwoPageState();
}

class QuestionTwoPageState extends State<QuestionTwoPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<QuestionTwoProvider>().resetState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget detailData({required String title, required String data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 8,
      children: [
        Text(
          title,
          style: Theme.of(AppServices.context).textTheme.labelLarge,
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
        Expanded(
          child: Text(
            data,
            style: Theme.of(AppServices.context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<QuestionTwoProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LanguageValue.question_2),
            elevation: 2,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: provider.state.formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LanguageValue.question_2_desc,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 40),
                    CustomTextInput.inputTextStyleLogin(
                      controller: provider.state.fullnameController,
                      labelText: LanguageValue.full_name,
                      onTapOutside: (event) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      borderRadius: BorderRadius.circular(12),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LanguageValue.full_name_empty;
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    CustomTextInput.inputTextStyleLogin(
                      controller: provider.state.emailController,
                      labelText: LanguageValue.email,
                      keyboardType: TextInputType.emailAddress,
                      onTapOutside: (event) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      borderRadius: BorderRadius.circular(12),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LanguageValue.email_empty;
                        }

                        if (!EmailValidator.validate(value)) {
                          return LanguageValue.email_invalid;
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 32),
                    FilledButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (provider.state.formKey.currentState!.validate()) {
                          provider.setData();
                        }
                      },
                      style: FilledButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        minimumSize: Size(double.infinity, 0),
                      ),
                      child: Text(
                        LanguageValue.submit,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 48),
                    if (provider.state.fullname.isNotEmpty &&
                        provider.state.email.isNotEmpty)
                      Text(
                        LanguageValue.detail_data,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    if (provider.state.fullname.isNotEmpty &&
                        provider.state.email.isNotEmpty)
                      Card.filled(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              detailData(
                                title: LanguageValue.full_name,
                                data: provider.state.fullname,
                              ),
                              SizedBox(height: 16),
                              detailData(
                                title: LanguageValue.email,
                                data: provider.state.email,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
