// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_final_fields, unused_field
import 'package:byon_care/constents.dart';
import 'package:byon_care/drawer/tablecontainer.dart';
import 'package:byon_care/drawer/termsandconditionwidget.dart';
import 'package:byon_care/models/complaints_model.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key, this.complaintModel}) : super(key: key);

  final ComplaintModel? complaintModel;

  @override
  State<TermsAndConditions> createState() => _ServiceManagerDashboardState();
}

class _ServiceManagerDashboardState extends State<TermsAndConditions> {
  bool _customeIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           
          backgroundColor: kbyoncolor3,
          elevation: 0,
          title: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Terms And Conditions',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: kfontPoppinsSemiBold,
                  fontSize: 22),
            ),
          )),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Column(
              children: [
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.5),
                            blurRadius: 0.5,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: ExpansionTile(
                      expandedAlignment: Alignment.centerLeft,
                      initiallyExpanded: false,
                      onExpansionChanged: (value) {},
                      tilePadding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 5),
                      title: Row(
                        children: [
                          Image.asset(
                            "images/inverter.png",
                            width: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "Inverter Warranty Terms And Conditions",
                              style: TextStyle(
                                  color: Color(0xff00281F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ChildreWidget(
                                  subtitleText: "Congratulation",
                                  paragrapghText:
                                      """on becoming a proud owner of Raymax Home UPS
A Raymax home UPS device has been designed as a complete package to provide superior performance and reliability. It is compact and lighter than any other UPS in its class. It is ergonomically designed to give best operating environment for critical components to offer ultimate reliability with good aesthetics.
WARRANTY TERMS
1. Livog a Home UPS is warranted for 48 months from the date of salle. After 24 months cost of material will be chargeble.
2. The Warranty is limited to all defects arising from the use of faulty material or poor workmanship. Consequential liabilities will not be entertained.
3. In the event of any major complaint, the product has to be returned to the authorised Livoga service location.
 4. In the event of repair(s) of any part(s) of the unit, this Warranty will thereafter continue and remain in force only for the balance period of the Warranty. Moreover, the time taken for repair and transit, whether under the Warranty or otherwise shall not be excluded from the Warranty period.
5. Defective parts arising out of rectification/replacement under Warranty will become property of Livoga.
6. The Warranty does not cover. If the product has been subject to
a) abnormal use or conditional, improper storage, faulty wiring, excessive moisture or dampness, exposure to beyond the specified temperature, un-authorised modification, un-authorised repair, willful abuse, destruction by fire, collision or theft, accident, spill of food or liquids, improper installation by un-authorised persons or handling, breakage or damage and damage due to natural calamities.
b) If the customer has not communicated/notified the defect of the product to company during the applicable Warranty period.
c) The product serial number code or the accessory date code has been removed, defaced or altered
d) If the product is not connected to loads as recommended and are used for connecting loads
that are not recommended by the company.
e) If the seal is torn/broken or show evidence of tampering or the battery has been used other than that for which it has been specified for use by company.
f) All plastic surfaces and all other. Extemally exposed parts that are scratched or damages caused due to abnormal customer use.
g) If the product is connected to appliances and gadgets not recommended by company.
7) The right to determine whether the complaint is covered under Warranty rests with company Livoga.
8) Ensure that Livoga Home UPS is serviced by authorised service engineers from Livoga only. Service by
un-authorised person will invalidate the Warranty.
9) Re-installation is not covered under Warranty and would be charged extra."""),
                              ChildreWidget(
                                  subtitleText: "Warrenty",
                                  paragrapghText:
                                      """Uvog & Home UPS tormented for 40 months from the date of sale. After 24 months cost of material will be chargeble.
2. The Warranty is limited to all defects arising from the use of faulty material sroukmanship. Consequential liabilities will not be entertained.
3. In the event of any major complaint, the product has to be returned to the authorised Uiroga service locatica
4. In the event of repairs of any parts of the unit this warrenty will threather continue and remein in force only period of the Warranty. Moreo oreover, the tr for repair and transit, whether under the Warranty or otherwise shall not be excluded from the Warranty
period
6. Defective parts arising out of rectification/replacement under Warranty will become property of Livoga
6. The Warranty does not cover: If the product has haan subject to
a) abnonnal use or conditional, improper storage, faulty wiring, excessive moisture or dampness, exposure to beyond the apesified temperature, un-authorised modification, un-authorised repair willful abruse, destruction by fire, collision or theft, accident, spill of food or liquids, improper installation by un authorised persons arhandling, breakage or damage and damage due to natural colomities.
b) If the customer has not communicated/notified the defect of the product to company duri the applicable Warranty period.
c) The product serial number code or the accessory date code has been removed defaced or atsed
d) If the product le not connected to loads as recommended and are used for connecting loads that are not recommended by the company
e) Ir the seal is tom/broken or show evidence idence of tampering or the battery has been used other than that for which it has been specified for use by company ) All plastie surfaces and all other. Estamailly expooed parts that are scratched or damages  g) If the product is connected to appliances and gadgets not recommended by company.
7) The right to determine whether the complaint is covered under Warranty rests with company Livoga.
8) Ensure that Livoga Home UPS is serviced by authorised service engineers from Livoga only. Service by
un-authorised person will invalidate the Warranty.
9) Re-installation is not covered under Warranty and would be charged extra.
Note:
1. The Warranty registration card must be dully filled and returned to company. Failing to do so will invalidate this Warranty.
2. Customers are deemed to have read, understood and to have agreed to these conditions at the time of purchase. Please refer Warranty card supplied along with battery for terms and conditions on battery as this Warranty is for the Livoga Home UPS only.
Dear Channel Partner
This portion of Warranty card must be filled properly as per the guidelines within 7 days of sale/fitment, whichever is earlier and to be handed over to company's representative or
to be posted directed to company based on which company will process necessary documentation for initiation of Warranty, otherwise company decision would be final.
1. Full bridge configuration based on power MOSFETs.
2. DSP based intelligent control.
3. LCD based display for user-friendly display of parameters and status.
4. Protection against 440V mains input.
6. Protection against reverse polarity.
6. Dynamic short circuit protection with fold-back current limiting.
7. Protection against all Possible errors like battery low, over load, heavy load, short circuit
etc.
8. Early warning for battery low and overload conditions. System Continue normaly if the arror is corrected.
9. Cutoff and auto restart with permanent cut after S consecutive cutoff. 10. SMPS type 4 step charging.
11. Pure sinewave output resulting in silent operation of motor and fans. Safe to all kind of loads.
12. Ideal for mixed load application"""),
                              ChildreWidget(
                                  subtitleText: "Note",
                                  paragrapghText:
                                      """1. The Warranty registration card must be dully filled and returned to company. Failing to do so will invalidate this Warranty.
2. Customers are deemed to have read, understood and to have agreed to these conditions at the time of purchase. Please refer Warranty card supplied along with battery for terms and conditions on battery as this Warranty is for the Livoga Home UPS only."""),
                              ChildreWidget(
                                  subtitleText: "Dear Channel Partner",
                                  paragrapghText:
                                      """This portion of Warranty card must be filled properly as per the guidelines within 7 days of sale/fitment, whichever is earlier and to be handed over to company's representative or
to be posted directed to company based on which company will process necessary documentation for initiation of Warranty, otherwise company decision would be final.
1. Full bridge configuration based on power MOSFETs.
2. DSP based intelligent control.
3. LCD based display for user-friendly display of parameters and status.
4. Protection against 440V mains input.
6. Protection against reverse polarity.
6. Dynamic short circuit protection with fold-back current limiting.
7. Protection against all Possible errors like battery low, over load, heavy load, short circuit
etc.
8. Early warning for battery low and overload conditions. System Continue normaly if the arror is corrected.
9. Cutoff and auto restart with permanent cut after S consecutive cutoff. 10. SMPS type 4 step charging.
11. Pure sinewave output resulting in silent operation of motor and fans. Safe to all kind of loads.
12. Ideal for mixed load application
"""),
                              ChildreWidget(
                                  subtitleText: "SAFETY PRECAUTIONS",
                                  paragrapghText:
                                      """A careful operator is the best operator. Before using the home UPS read all instructions and cautionary markings on the home UPS, as well as all appropriate section of this user manual. 1) The home UPS is designed for interiors only. Avoid installing the home UPS in open, excessively humid place or where there is water. Care must be taken to ensure that the home UPS is kept away from heat emitting appliances such as heater, blower, oven etc. The unit must also be placed in a manner that it avoids exposure to sunlight. The place of installation should be well ventilated & easily accessible for servicing.
2) Do not cover your home UPS with any cover or cloth.
3) Do not install home UPS on or near flammable materials (plywood, chemicals, gasoline etc.)
4) When going for vacation main switch of home UPS panel should be switched OFF.
5) To switch OFF the home UPS output in emergency, use switch on the front panel. Also disconnect the mains cord and battery wires.
6) Do not disassemble the home UPS; take it to a service center when service or repair is
required. Opening by unqualified personnel entails electric shock or fire hazard.
7) To reduce electric shock, disconnect all wiring before cleaning.
8) Connect appropriate load suitable to the capacity of home UPS
9) To avoid rebooting of computer (when UPS mode on) do not connect heavy load such as air conditioner, refrigerator etc.
10) The home UPS should be always be rested on base. Any other orientation will damage home UPS.

Congratulation
on harnminn and ner of Reunay Home LIDS
♫ 11:30
that are not recommended by the company.
e) If the seal is torn/broken or show evidence of tampering or the battery has been used other than
7. Protection against all Possible errors like battery low, over load, heavy load, short circuit
etc.""")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.5),
                            blurRadius: 0.5,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: ExpansionTile(
                      expandedAlignment: Alignment.centerLeft,
                      initiallyExpanded: false,
                      onExpansionChanged: (value) {},
                      tilePadding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 5),
                      title: Row(
                        children: [
                          Image.asset(
                            "images/battery.png",
                            width: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "Battery Warrenty Terms And Conditions",
                              style: TextStyle(
                                  color: Color(0xff00281F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ChildreWidget(
                                  subtitleText: "Congratulation",
                                  paragrapghText:
                                      """Now you are the proud owner of Raymax tubular /Solar battery. Every battery is inspect- ed and tested thoroughly before leaving our premises. The most up to date design and manufaturing standards make this is an idial tubular battery.."""),
                              ChildreWidget(
                                  subtitleText: "Pro-rated compensation",
                                  paragrapghText:
                                      """Now you are the proud owner of Raymax tubular /Solar battery. Every battery is inspect- ed and tested thoroughly before leaving our premises. The most up to date design and manufaturing standards make this is an idial tubular battery.
 Pro-rated compensation"""),
                              ChildreWidget(
                                  subtitleText: "Term And Conditions",
                                  paragrapghText:
                                      """1. It is strongly recommended that your Raymax battery is checked and serviced by an authorized Raymax battery service only.
 2. Keep the top of the battery clean and dry at
 all times assuring the vent plugs are secured. Make sure that all the external electrical connec- tions are properly secured. It is advisable to apply petroleum jelly on the terminals.
 3. Adding acid is strongly not advisable 4. Loss of power is caused due to terminal corrosion, dirt and moisture leading to make the battery weak.
 5. During usage the cells loose water. Electro- lyte level is to be maintained within the indicated band mark on stem of the level indicator.
 6. Battery grade water is to be only usage as and when necessary to top up.
 7. Set the normal charge voltage at 14.4v.Later reduced to 13.8v.
 8. Specific gravity filling:
 1250+0.005 at27c.Charger to be matched with the battery. Liability under the Warranty is limited to making good the defects caused due to poor workmanship or improper material during the process of manufacture."""),
                              ChildreWidget(
                                  subtitleText: "Dear Channel Partner",
                                  paragrapghText:
                                      """This portion of Warranty card must be filled properly as per the guidelines within 7 days of sale/fitment, whichever is earlier and to be handed over to company's representative or
 to be posted directed to company based on which company will process necessary documentation for initiation of Warranty, otherwise company decision would be final.
 1. Full bridge configuration based on power MOSFETs.
 2. DSP based intelligent control.
 3. LCD based display for user-friendly display of parameters and status.
 4. Protection against 440V mains input.
 6. Protection against reverse polarity.
 6. Dynamic short circuit protection with fold-back current limiting.
 7. Protection against all Possible errors like battery low, over load, heavy load, short circuit
 etc.
 8. Early warning for battery low and overload conditions. System Continue normaly if the arror is corrected.
 9. Cutoff and auto restart with permanent cut after S consecutive cutoff. 10. SMPS type 4 step charging.
 11. Pure sinewave output resulting in silent operation of motor and fans. Safe to all kind of loads.
 12. Ideal for mixed load application
 """),
                              TableContainerWithSubtitle(
                                subtitleText:
                                    "Terms And Conditions of Warrenty As Follows",
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
