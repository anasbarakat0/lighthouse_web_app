import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lighthouse_web_app/common/widget/my_button.dart';
import 'package:lighthouse_web_app/core/resources/colors.dart';
import 'package:lighthouse_web_app/core/utils/responsive.dart';



// A simple Client model for demo purposes.
class Client {
  final String uuid;
  final String name;
  final String email;
  final String phoneNumber;
  final String study;
  final String gender;
  final String birthDate;
  final String addingDateTime;

  Client({
    required this.uuid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.study,
    required this.gender,
    required this.birthDate,
    required this.addingDateTime,
  });
}

/// The main responsive screen.
class ClientProfileScreen extends StatelessWidget {
  final Client client;

  const ClientProfileScreen({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return ClientProfileDesktop(client: client);
    } else {
      return ClientProfileMobile(client: client);
    }
  }
}

/// Mobile & tablet version.
class ClientProfileMobile extends StatelessWidget {
  final Client client;
  const ClientProfileMobile({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              client.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: navy),
            ),
            const SizedBox(height: 40),
            // The ClientInfoWidget uses the editable tiles.
            ClientInfoWidget(
              uuid: client.uuid,
              email: client.email,
              phoneNumber: client.phoneNumber,
              study: client.study,
              gender: client.gender,
              birthDate: client.birthDate,
              color: orange,
            ),
            const SizedBox(height: 20),
            Divider(
              thickness: 1,
              color: navy,
              indent: MediaQuery.of(context).size.width * 0.1,
              endIndent: MediaQuery.of(context).size.width * 0.1,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Adding Date: ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: orange),
                ),
                Text(
                  // DateFormat('yyyy/MM/dd')
                  //     .format(DateTime.parse(client.addingDateTime)),
                  client.addingDateTime,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

/// Desktop version with a different, side-by-side layout.
class ClientProfileDesktop extends StatelessWidget {
  final Client client;
  const ClientProfileDesktop({Key? key, required this.client}) : super(key: key);

  Widget _buildProfileSummary(BuildContext context) {
    return Column(
      children: [
        Text("Client Info",style: Theme.of(context).textTheme.titleLarge?.copyWith(color: orange),),
        SizedBox(height: 100),
        Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: yellow,
                  child: Text(
                    client.name.isNotEmpty ? client.name[0].toUpperCase() : "",
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      client.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "ID: ${client.uuid}",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditableInfoSection(BuildContext context) {
    // Using a two-column grid layout for desktop.
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Wrap(
          spacing: 40,
          runSpacing: 20,
          children: [
            SizedBox(
              width: 350,
              child: EditableUserInfoTile(
                icon: Icons.email,
                title: "Email",
                value: client.email,
              ),
            ),
            SizedBox(
              width: 350,
              child: EditableUserInfoTile(
                icon: Icons.phone,
                title: "Phone",
                value: client.phoneNumber,
              ),
            ),
            SizedBox(
              width: 350,
              child: EditableUserInfoTile(
                icon: Icons.school,
                title: "Study",
                value: client.study,
              ),
            ),
            SizedBox(
              width: 350,
              child: EditableUserInfoTile(
                icon: Icons.wc,
                title: "Gender",
                value: client.gender,
              ),
            ),
            SizedBox(
              width: 350,
              child: EditableUserInfoTile(
                icon: Icons.calendar_today,
                title: "Birth Date",
                value: client.birthDate,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: Center(
        child: Container(
          // width: 1000,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left side: Profile Summary
              FittedBox(child: _buildProfileSummary(context)),
              // Right side: Editable Information
              SizedBox(width: 400,child: _buildEditableInfoSection(context)),
            ],
          ),
        ),
      ),
    );
  }
}

/// The ClientInfoWidget used in the mobile version.
class ClientInfoWidget extends StatelessWidget {
  final String uuid;
  final String email;
  final String phoneNumber;
  final String study;
  final String gender;
  final String birthDate;
  final Color color;

  const ClientInfoWidget({
    Key? key,
    required this.uuid,
    required this.email,
    required this.phoneNumber,
    required this.study,
    required this.gender,
    required this.birthDate,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header section.
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: orange,
            ),
            child: const Text(
              "Client Info",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Body with avatar and editable info.
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Top row: Avatar and basic info.
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: yellow,
                      child: Text(
                        "أنس بركات"[0].toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "أنس بركات",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "ID: $uuid",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                EditableUserInfoTile(
                  icon: Icons.email,
                  title: "Email",
                  value: email,
                ),
                EditableUserInfoTile(
                  icon: Icons.phone,
                  title: "Phone",
                  value: phoneNumber,
                ),
                EditableUserInfoTile(
                  icon: Icons.school,
                  title: "Study",
                  value: study,
                ),
                EditableUserInfoTile(
                  icon: Icons.wc,
                  title: "Gender",
                  value: gender,
                ),
                EditableUserInfoTile(
                  icon: Icons.calendar_today,
                  title: "Birth Date",
                  value: birthDate,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Editable tile (as defined earlier)
class EditableUserInfoTile extends StatefulWidget {
  final String title;
  String value;
  final IconData icon;
  final Color color;
  final ValueChanged<String>? onChanged;

  EditableUserInfoTile({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    this.color = orange,
    this.onChanged,
  }) : super(key: key);

  @override
  _EditableUserInfoTileState createState() => _EditableUserInfoTileState();
}

class _EditableUserInfoTileState extends State<EditableUserInfoTile> {
  bool isEditing = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() {
      widget.value = _controller.text;
      isEditing = false;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(widget.value);
    }
  }

  void _cancel() {
    setState(() {
      _controller.text = widget.value;
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          isEditing = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row with icon, title and an edit hint.
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(widget.icon, size: 20, color: widget.color),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                if (!isEditing)
                  Icon(
                    Icons.edit,
                    size: 16,
                    color: Colors.grey,
                  ),
              ],
            ),
            const SizedBox(height: 4),
            // Either a TextField (when editing) or display text.
            isEditing
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _controller,
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          hintText: "Enter new ${widget.title.toLowerCase()}",
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: widget.color,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyButton(
                            onPressed: _submit,
                            child: Text(
                              "Submit",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                          MyButton(
                            onPressed: _cancel,
                            color: lightGrey,
                            side: BorderSide(color: orange, width: 1),
                            child: Text(
                              "Cancel",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Text(
                    widget.value,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
            if (!isEditing)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  "Double tap to edit",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[500],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}