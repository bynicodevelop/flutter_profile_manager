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

  const ProfileManager({
    Key key,
    this.fields = const [],
    this.onUpdated,
    this.onCancled,
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
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: ModalForm(
                      fieldModel: e,
                      onUpdated: (value, fieldModel) {
                        widget.onUpdated(value, fieldModel);

                        Navigator.pop(context);
                      },
                      onCancled: (fieldModel) {
                        widget.onCancled(fieldModel);

                        Navigator.pop(context);
                      },
                    ),
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
                onUpdated: (value) => widget.onUpdated(value, e),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
