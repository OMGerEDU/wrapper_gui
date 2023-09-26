import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';


class FormFields {





  TextStyle blueStyle =  const TextStyle(
      color: Colors.blue,
      fontSize: 20
  );


  // Functions :

  void _toggleSelection(List<String> selectedValues, String value,int max) {
    setState(() {
      selectedValues.contains(value) ? selectedValues.remove(value) : (selectedValues.length < max ? selectedValues.add(value) : null);
    });
  }

  List<PlatformFile> createPlatformFile(AsyncSnapshot snapshot, String key) {
    if (snapshot == null || !snapshot.hasData || snapshot.data[key] == null) {
      return [];
    }
    String filePath = snapshot.data[key];
    File file = File(filePath);
    if (!file.existsSync()) {
      return [];
    }
    return [PlatformFile(path: file.path, name: file.path, size: 0)];
  }


  List<PlatformFile> createPlatformFileWO(String filePath) {


    File file = File(filePath);
    if (!file.existsSync()) {
      return [];
    }
    return [PlatformFile(path: file.path, name: file.path, size: 0)];
  }



  double stringToDouble(AsyncSnapshot snapshot,String key,double initialValue) {
    String str;
    try {
      str = snapshot.data![key].toString();
    } catch (e) {
      return initialValue;
    }
    print("parsing: $str");
    if (str == null || str == " " || str == "") {
      return initialValue;
    } else {
      try {
        print("Parsing: $str");
        if (double.tryParse(str) == null) {
          return initialValue;
        }
        double parsedValue = double.parse(str);
        if (parsedValue >= 0 && parsedValue <= 100) {
          return parsedValue;
        }
      } catch (e) {
        return initialValue;
      }
    }
    return initialValue;
  }

  // Widgets :
  Divider divider() {
    return const Divider(
      color:Color.fromARGB(195, 55, 127, 185),
      height: 100,
      // space:100,
      thickness:5,
      indent:20,
      endIndent:20,
    );
  }


  FormBuilderCheckbox checkbox(bool initialValue, String name, String title, String id) {
    return FormBuilderCheckbox(
      name: name,
      title: Text(title),
      initialValue: (initialValue),
    );
  }



  FormBuilderSlider slider(
      double initialValue, String id, String label, [double min = 1.0, double max = 100.0, int divisions = 100]) {
    initialValue < 1 ? initialValue = 1 : initialValue;
    return FormBuilderSlider(
      name: id,
      min: min,
      max: max,
      initialValue: initialValue,
      divisions: divisions,
      activeColor: Colors.red,
      inactiveColor: Colors.pink[100],
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }


  Widget dropDown(String initialValue, String id, String label, String hint, List<String> options) {
    // options.insert(0, 'None');
    return FormBuilderDropdown<String>(
      initialValue: initialValue,
      name: id,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      items: options.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      // validator: FormBuilderValidators.required(context),
      valueTransformer: (value) {
        if (value == null) {
          return null;
        }
        return value.toString();
      },
    );
  }



  FormBuilderTextField textField(String initialValue, String id, String label, {String? hintText,TextEditingController? controller}) {
    return FormBuilderTextField(
      controller: controller,
      name: id,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText, // Modify here
        labelStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
  // for some reason you can't use controller and initial value, who dafuq knows why.
  FormBuilderTextField textFieldNoInitialValue( String id, String label, {String? hintText,TextEditingController? controller}) {
    return FormBuilderTextField(
      controller: controller,
      name: id,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText, // Modify here
        labelStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }




  FormBuilderTextField multilineTextField(String initialValue, String id, String label,
      {String? hintText, int minLines = 1, int maxLines = 5, int maxLength = 800}){
    return FormBuilderTextField(
      name: id,
      initialValue: initialValue,
      maxLength: maxLength,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        hintText: hintText,
        labelStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always, // Always float the label
      ),
      keyboardType: TextInputType.multiline,
      minLines: minLines, // starting lines of widget autoComplete with high of lines
      maxLines: maxLines, // max number of Autofit lines to represent dynamically
    );
  }


  FormBuilderFilePicker buildFormBuilderFilePicker(String filePath, BuildContext context,String id,String label,String extension,
      String tip) {
    return FormBuilderFilePicker(
      name: id,
      decoration: InputDecoration(labelText: label),
      maxFiles: 1,
      initialValue: createPlatformFileWO(filePath),
      previewImages: true,
      onChanged: (val) {
        if (val != null && !val.toString().contains(extension)  && !val.isEmpty) {
          print("$val wrong file format");
          showDialog(
            context: context,
            builder: (_) => FilePickerContainer(), ); }; },
      typeSelectors: [
        TypeSelector(
          type: FileType.any,

          selector: Row(
            children: <Widget>[
              Icon(Icons.add_circle),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(tip),
              ),
            ],
          ),
        ),
      ],
      onFileLoading: (val) {
        print(val);
      },
    );
  }


  void setState(Null Function() param0) {}
}
class FilePickerContainer extends StatelessWidget {
  const FilePickerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 200, height: 100,
          decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Invalid file format. Please select a .txt file or your program will crash on submission.",
              style: TextStyle( fontSize: 16,),
            ), ), ), ), );
  }
}


// ChoiceChip chipOption(String value,List<String> selectedValues) {
//   return ChoiceChip(
//     label: Text(value),
//     selected: selectedValues.contains(value),
//     selectedColor: Color.fromARGB(179, 56, 72, 160),
//     onSelected: (selected) {
//       _toggleSelection(selectedValues,value,types.length);
//     },
//   );
// }
//
// Column formFilterChip(String name,List<String> chips,int min,int max,List<String> selectedValues) {
//   List<ChoiceChip> chipOptions = chips.map((value) => chipOption(value,selectedValues)).toList();
//   return Column(
//     children:  [
//       const Text("Features: ",
//         style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),
//       Container(
//         margin: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: const Color.fromARGB(111, 40, 88, 160),
//         ),
//         child: Wrap(
//           spacing: 8,
//           runSpacing: 8,
//           children: chipOptions,
//         ),
//       )
//     ],
//   );
// }




// FormBuilderSlider slider(AsyncSnapshot<Map<String, dynamic>> snapshot,String id, String label,[double? min,double? max,int? divisions]) {
//   min ??= 1;
//   max ??= 100;
//   divisions ??= 100;
//
//
//   return FormBuilderSlider(
//     name: id,
//     // onChanged: _onChanged,
//     min: min,
//     max: max,
//       //"recordedSlider": _formKey.currentState?.value['recordedSlider'] ?? ' '
//
//     initialValue: stringToDouble(snapshot,"scheduledSlider",12),
//     divisions: divisions,
//     activeColor: Colors.red,
//     inactiveColor: Colors.pink[100],
//     decoration: const InputDecoration(
//       labelText: label,
//       labelStyle: TextStyle(color: Colors.black,fontSize: 20),
//
//     ),
//   );
// }



