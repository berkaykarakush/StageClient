import 'package:flutter/material.dart';
import 'package:stageclient/src/features/activity/activity.dart';
import '../../../DTOs/Activity/Activity.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../services/StageAPI/StageAPI.dart';
import '../../home/home.dart';

class ActivityCreate extends StatefulWidget {
  ActivityCreate({Key? key}) : super(key: key);

  @override
  _ActivityCreateState createState() => _ActivityCreateState();
}

class _ActivityCreateState extends State<ActivityCreate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final Activity activity;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _venueController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    activity = Activity(
        "", "", "", "", "", "", ""); // Initialize your activity object here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: const Text('Activity'),
        shoBackArrow: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
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
                          hintText: "Activity",
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0)),
                      keyboardType: TextInputType.text,
                      controller: _titleController,
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
                          hintText: "Description",
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      controller: _descriptionController,
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
                          hintText: "Category",
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      controller: _categoryController,
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

                    /// Location
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Venue',
                          hintText: "Venue",
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      controller: _venueController,
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

                    /// City
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'City',
                          hintText: "City",
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      keyboardType: TextInputType.text,
                      controller: _cityController,
                      cursorColor: Colors.black,
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

                    /// Date
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Date',
                        hintText: "11/12/2023",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                      controller: _dateController,
                      cursorColor: Colors.black,
                      readOnly: true,
                      // Prevent the keyboard from showing up
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        if (selectedDate != null) {
                          selectedDate = selectedDate.toUtc(); // Convert to UTC
                          setState(() {
                            _dateController.text = selectedDate.toString();
                          });
                        }
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
                            activity.title = _titleController.text;
                            activity.description = _descriptionController.text;
                            activity.category = _categoryController.text;
                            activity.date = _dateController.text;
                            activity.venue = _venueController.text;
                            activity.city = _cityController.text;
                            try {
                              bool result =
                                  await StageAPI.createActivity(activity);

                              if (result) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ActivityScreen()));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Activity created successfully")),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Failed to create activity")),
                                );
                              }
                            } catch (error) {
                              print("Error creating activity: $error");
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
