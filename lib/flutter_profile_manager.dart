import 'package:flutter/material.dart';
import 'package:flutter_profile_avatar/flutter_profile_avatar.dart';
import 'package:flutter_profile_manager/enums/TypeField.dart';
import 'package:flutter_profile_manager/models/Field.dart';
import 'package:flutter_profile_manager/widgets/ItemField.dart';
import 'package:flutter_profile_manager/widgets/ModalForm.dart';

class ProfileManager extends StatefulWidget {
  final Function onUpdated;
  final Function onCancled;

  final List<FieldModel> fields;

  final String submitLabel;
  final String cancelLabel;
  final String defaultContentLabel;

  const ProfileManager({
    Key key,
    this.fields = const [],
    this.onUpdated,
    this.onCancled,
    this.cancelLabel = 'Cancel',
    this.submitLabel = 'Submit',
    this.defaultContentLabel = 'Enter a content',
  }) : super(key: key);

  @override
  _ProfileManagerState createState() => _ProfileManagerState();
}

class _ProfileManagerState extends State<ProfileManager> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.fields.map(
        (e) {
          if (e.type != TypeField.AVATAR) {
            return ItemField(
              onTap: () => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return ModalForm(
                    submitLabel: widget.submitLabel,
                    cancelLabel: widget.cancelLabel,
                    defaultContentLabel: widget.defaultContentLabel,
                    fieldModel: e,
                    onUpdated: (value, fieldModel) {
                      widget.onUpdated(value, fieldModel);

                      Navigator.pop(context);
                    },
                    onCancled: (fieldModel) {
                      widget.onCancled(fieldModel);

                      Navigator.pop(context);
                    },
                  );
                },
              ),
              label: e.label,
              value: e.value,
              icon: e.icon,
            );
          }

          return Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              color: Theme.of(context).primaryColor,
              child: ProfileAvatar(
                size: 70.0,
                username: e.defaultValue,
                avatarURL: e.value,
                onUpdated: (value) async {
                  await widget.onUpdated(value, e);

                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
