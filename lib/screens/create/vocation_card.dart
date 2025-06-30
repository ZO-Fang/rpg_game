import 'package:flutter/material.dart';
import 'package:rpg_game/model/vocation.dart';
import 'package:rpg_game/shared/styled_text.dart';
import 'package:rpg_game/theme.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({
    super.key,
    required this.vocation,
    required this.onTap,
    required this.selected
  });

  final Vocation vocation;
  final void Function(Vocation) onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(vocation);   //这里的onTap就是create页面上的updateVocation function，
        // 这个function需要参数vocation，而在这里，这个参数传给了这个函数
      },
        child: Card(
          color: selected ? AppColors.orange.withAlpha(50) : null, //这里写null，没被选中的卡片颜色就可以呈现默认值
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: selected ? AppColors.orange : Colors.transparent,
              width: 2.0,
            ),
          ),
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                    children:
                    [
                      Image.asset('assets/img/vocations/${vocation.image}',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover, // 图片会被裁剪以填满整个区域，保持宽高比
                        alignment: Alignment.topCenter, // 从顶部中心开始显示
                        // colorBlendMode: BlendMode.darken, // 或者 BlendMode.multiply
                        // color: !selected ? Colors.grey.withAlpha(200) : null,
                        //这代码是有效果的，但是我觉得这样很难看，就不用了
                      ),
                      const SizedBox(width: 20),

                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StyledHeading(vocation.title),
                                StyledText(vocation.description)
                              ]
                          )
                      )
                    ]
                )
            )
        )
    );
  }
}
