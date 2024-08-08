import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  SummaryPage(this.summeryData, {super.key});
  final List<Map<String, Object>> summeryData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...summeryData.map(
          (e) => Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: (e["user_answer"] == e["correct_answer"])
                        ? Colors.green
                        : Colors.red,
                    child: Text(((e["Question_index"] as int) + 1).toString()),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e["Question"].toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // condition for check if correct user answer true it be green color false it be red
                        (e["user_answer"] == e["correct_answer"])
                            ? Text(
                                e["user_answer"].toString(),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green),
                              )
                            : Text(e["user_answer"].toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red,
                                )),
                        Text(
                          e["correct_answer"].toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        )
      ],
    );
  }
}
