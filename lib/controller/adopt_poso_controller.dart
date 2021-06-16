import 'package:flutter/material.dart';

class adopt_poso_ctrl extends StatefulWidget {
  @override
  _adopt_poso_ctrlState createState() => _adopt_poso_ctrlState();
}

final poids_ctrl = TextEditingController();
final clairance_cntrl = TextEditingController();
final bilurbine_cntrl = TextEditingController();
final tgo_cntrl = TextEditingController();

class _adopt_poso_ctrlState extends State<adopt_poso_ctrl> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed. pour allouer la ram
    poids_ctrl.dispose();
    clairance_cntrl.dispose();
    bilurbine_cntrl.dispose();
    tgo_cntrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
