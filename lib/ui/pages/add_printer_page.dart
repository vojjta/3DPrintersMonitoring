import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:printer_monitoring/presentation/bloc/printer/add_printer_bloc.dart';
import 'package:printer_monitoring/ui/navigation/routes.dart';

class AddPrinterPage extends StatefulWidget {
  const AddPrinterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddPrinterPageState();
  }
}

class _AddPrinterPageState extends State<AddPrinterPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext ctx) => BlocProvider(
        create: (ctx) => AddPrinterBloc(),
        child: BlocListener<AddPrinterBloc, AddPrinterState>(
          listener: (context, state) {
            if (state is AddPrinterSuccess) {
              context.go(AppRoute.home.path);
            }
          },
          child: Builder(
            builder: (ctx) {
              return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    final isValid = _formKey.currentState?.saveAndValidate() ?? false;
                    if (isValid) {
                      BlocProvider.of<AddPrinterBloc>(ctx).add(AddPrinterCall(
                        name: _formKey.currentState?.value['Name'] as String,
                        address: _formKey.currentState?.value['Address'] as String,
                        port: int.parse(_formKey.currentState?.value['Port'].toString() as String),
                      ));
                    }
                  },
                  shape: const CircleBorder(),
                  child: const Icon(Icons.add),
                ),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: FormBuilder(
                        key: _formKey,
                        child: Column(
                          children: [
                            FormBuilderTextField(
                              name: 'Name',
                              decoration: const InputDecoration(
                                labelText: 'Name',
                              ),
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.minLength(3),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Flexible(
                                  flex: 4,
                                  child: FormBuilderTextField(
                                    name: 'Address',
                                    decoration:
                                        const InputDecoration(labelText: 'Address', helperText: 'Example: 192.168.1.4'),
                                    keyboardType: TextInputType.number,
                                    validator: FormBuilderValidators.compose(
                                      [
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.ip(),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  flex: 1,
                                  child: FormBuilderTextField(
                                    name: 'Port',
                                    initialValue: '80',
                                    decoration: const InputDecoration(
                                      labelText: 'Port',
                                      helperText: 'Default: 80',
                                    ),
                                    keyboardType: TextInputType.number,
                                    validator: FormBuilderValidators.compose(
                                      [
                                        FormBuilderValidators.numeric(),
                                        FormBuilderValidators.min(0),
                                        FormBuilderValidators.max(65535),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
              );
            },
          ),
        ),
      );
}
