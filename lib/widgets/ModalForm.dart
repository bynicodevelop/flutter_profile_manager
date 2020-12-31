import 'package:flutter/material.dart';
import 'package:flutter_inputs/forms/inputs/EmailInput.dart';
import 'package:flutter_inputs/forms/inputs/TextInput.dart';
import 'package:flutter_profile_manager/enums/TypeField.dart';
import 'package:flutter_profile_manager/models/Field.dart';

class ModalForm extends StatefulWidget {
  final Function(dynamic value, FieldModel fieldModel) onUpdated;
  final Function(FieldModel fieldModel) onCancled;

  final FieldModel fieldModel;

  final String submitLabel;
  final String cancelLabel;
  final String defaultContentLabel;

  ModalForm({
    Key key,
    @required this.fieldModel,
    @required this.onUpdated,
    this.onCancled,
    this.submitLabel = 'Submit',
    this.cancelLabel = 'Cancel',
    this.defaultContentLabel = 'Enter a content',
  }) : super(key: key);

  @override
  _ModalFormState createState() => _ModalFormState();
}

class _ModalFormState extends State<ModalForm> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  Widget _input;

  @override
  void initState() {
    super.initState();

    setState(() {
      _controller.text = widget.fieldModel.value;

      _input = TextInput(
        controller: _controller,
        placeholder:
            widget.fieldModel.fieldPlaceholder ?? widget.defaultContentLabel,
        onChanged: (value) {}, // TODO: Remove when the package is updated
      );

      if (widget.fieldModel.type == TypeField.EMAIL) {
        _input = EmailInput(
          controller: _controller,
          placeholder:
              widget.fieldModel.fieldPlaceholder ?? widget.defaultContentLabel,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Container(
        padding: EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Wrap(
          children: [
            _input,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () => widget.onCancled(widget.fieldModel),
                  child: Text(
                    widget.cancelLabel,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                FlatButton(
                  onPressed: () {
                    if (_keyForm.currentState.validate()) {
                      widget.onUpdated(_controller.text, widget.fieldModel);
                    }
                  },
                  child: Text(
                    widget.submitLabel,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
