import 'package:flutter/material.dart';
import 'package:rpg_game/model/character.dart';
import 'package:rpg_game/shared/styled_text.dart';
import 'package:rpg_game/theme.dart';

class StatsTable extends StatefulWidget {
  //const StatsTable(this.character, {super.key,});
  //这两个构造函数没啥区别，就是看使用的时候写不写参数名

  const StatsTable({
    super.key,
    required this.hero  //我可以给它取别的名字
  });

  final Character hero;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(

        children: [

          Container(
            color: AppColors.navy.withAlpha(30),
            padding: const EdgeInsets.all(8),
            child: Row(
              children : [
                Icon(Icons.star_rate_rounded,
                    color: widget.hero.points > 0 ? AppColors.orange : Colors.grey),
                const SizedBox(width: 20),
                const StyledText('Points available: '),
                const Expanded(child: SizedBox(width: 20)),
                StyledHeading(widget.hero.points.toString()),  //这里必须写widget，不然它找不到hero。这里的widget指的是statstable
              ]
            )
          ),

          Table(

            children: widget.hero.statsAsFormattedList.map((stat) {
              return TableRow(
                decoration: BoxDecoration(
                  color: AppColors.navy.withAlpha(15)
                ),
                children: [

                  //表头
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,

                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: StyledText(stat['title']!)
                  )),

                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,

                      child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: StyledHeading(stat['value']!)
                    )
                  ),

                  //上升
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,

                    child: IconButton(
                      icon: Icon(Icons.arrow_upward, color: AppColors.orange),
                      onPressed: () {
                        setState(() {
                          widget.hero.increaseStat(stat['title']!);
                        });
                      }
                    ),
                  ),

                  //下降
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,

                    child: IconButton(
                        icon: Icon(Icons.arrow_downward, color: AppColors.orange),
                        onPressed: () {
                          setState(() {
                            widget.hero.decreaseStat(stat['title']!);
                          });
                        }
                    ),
                  ),
                ]

              );
            }).toList(),
          ),



        ]
      )
    );
  }
}

