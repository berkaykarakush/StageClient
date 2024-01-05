import 'package:flutter/material.dart';
import 'package:stageclient/src/features/activity/activity.dart';
import '../../../DTOs/Activity/Activity.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../services/StageAPI/StageAPI.dart';
import '../../home/home.dart';

class ActivityDetails extends StatefulWidget {
  const ActivityDetails({super.key, required this.activity});

  final Activity activity;

  @override
  State<ActivityDetails> createState() => _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController = TextEditingController();
  late TextEditingController _descriptionController = TextEditingController();
  late TextEditingController _categoryController = TextEditingController();
  late TextEditingController _cityController = TextEditingController();
  late TextEditingController _venueController = TextEditingController();
  late TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.activity.title);
    _descriptionController =
        TextEditingController(text: widget.activity.description);
    _categoryController = TextEditingController(text: widget.activity.category);
    _cityController = TextEditingController(text: widget.activity.city);
    _venueController = TextEditingController(text: widget.activity.venue);
    _dateController = TextEditingController(text: widget.activity.date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(widget.activity.title),
        shoBackArrow: true,
        actions: [
          GestureDetector(
            onTap: () async {
              try {
                bool result = await StageAPI.deleteActivity(widget.activity.id);

                if (result) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ActivityScreen()));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Activity deleted successfully")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Failed to delete activity")),
                  );
                }
              } catch (error) {
                print("Error deleting activity: $error");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("An error occurred")),
                );
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.delete_rounded,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    /// Title
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Title',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0)),
                      controller: _titleController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Title is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),

                    /// Description
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold)),
                      controller: _descriptionController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      // initialValue: activity.description,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Description is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),

                    /// Category
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Category',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold)),
                      controller: _categoryController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      // initialValue: activity.category,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Category is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),

                    /// City
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'City',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold)),
                      controller: _cityController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      // initialValue: activity.city,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'City is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),

                    /// Venue
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Venue',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold)),
                      controller: _venueController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      // initialValue: activity.venue,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Venue is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),

                    /// Date
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Date',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold)),
                      controller: _dateController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      // initialValue: activity.date,
                      onTap: () async {
                        DateTime? date = DateTime(1900);
                        FocusScope.of(context).requestFocus(FocusNode());
                        date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Date is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            widget.activity.title = _titleController.text;
                            widget.activity.description =
                                _descriptionController.text;
                            widget.activity.category = _categoryController.text;
                            widget.activity.date = _dateController.text;
                            widget.activity.venue = _venueController.text;
                            widget.activity.city = _cityController.text;
                            Activity activity = widget.activity;

                            try {
                              bool result =
                                  await StageAPI.updateActivity(activity);

                              if (result) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ActivityScreen()));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Activity updated successfully")),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Failed to update activity")),
                                );
                              }
                            } catch (error) {
                              print("Error updating activity: $error");
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("An error occurred")),
                              );
                            }
                          }
                        },
                        child: const Text(
                          "Kaydet",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
