import 'package:flutter/material.dart';

class add_med_ctrl extends StatefulWidget {
  @override
  _add_med_ctrlState createState() => _add_med_ctrlState();
}
//hedo controller kona 9adrin ndéclariwhom win nakhadmo bsh hakdak yakbr code
// f classe wa7da wlit dertlhom classe wa7dhom kol controller ta3 screen
//7alit classe khasa bah maytkhaltouch
//w khadmthom homa li ykhaliwna nhazo lkatba li rahi f text field

final nom_med_ctrl = TextEditingController();
final clr_inf30_ctrl = TextEditingController();
final clr_sup60_ctrl = TextEditingController();
final clr_entre_30_60_ctrl = TextEditingController();
final bil_inf60_ctrl = TextEditingController();
final bil_sup60_ctrl = TextEditingController();
final tgo_inf55_ctrl = TextEditingController();
final tgo_sup55_ctrl = TextEditingController();


class _add_med_ctrlState extends State<add_med_ctrl> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed. pour allouer la ram
    nom_med_ctrl.dispose();
    clr_inf30_ctrl.dispose();
    clr_sup60_ctrl.dispose();
    clr_entre_30_60_ctrl.dispose();
    bil_inf60_ctrl.dispose();
    bil_sup60_ctrl.dispose();
    tgo_inf55_ctrl.dispose();
    tgo_sup55_ctrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
