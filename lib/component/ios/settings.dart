// Settings : ...........
import 'package:flutter/cupertino.dart';
import 'package:platform_convertor/provider/month_pro.dart';
import 'package:provider/provider.dart';

class SettingsDesign extends StatefulWidget {
  const SettingsDesign({super.key});

  @override
  State<SettingsDesign> createState() => _SettingsDesignState();
}

class _SettingsDesignState extends State<SettingsDesign> {
  @override
  Widget build(BuildContext context) {
    var monthProvider = Provider.of<MonthProvider>(context);
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Date',
                      style: TextStyle(fontSize: 18),
                    ),
                    const Spacer(),
                    Text(
                      (monthProvider.iDateChecked)
                          ? monthProvider.dateModel.date
                          : monthProvider.iDate(),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  height: 55,
                  width: double.infinity,
                  color: CupertinoColors.activeBlue,
                  child: CupertinoButton(
                    onPressed: () {
                      monthProvider.iDateFind(context);
                    },
                    child: const Text(
                      'Change Date',
                      style:
                          TextStyle(color: CupertinoColors.white, fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Time',
                    style: TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  Text(
                    (monthProvider.iTimeChecked)
                        ? monthProvider.timeModel.timeOfDay
                        : monthProvider.iTime(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                height: 55,
                width: double.infinity,
                color: CupertinoColors.activeBlue,
                child: CupertinoButton(
                  onPressed: () {
                    monthProvider.iTimeFind(context);
                  },
                  child: const Text(
                    'Change Time',
                    style:
                        TextStyle(color: CupertinoColors.white, fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
