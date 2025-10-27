import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/features/profile/presentation/views/widgets/about_us_title_and_sub.dart';

import 'about_us_colors_products.dart';

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              'Tminder هو ابلكيشن بيساعدك في إدارة المنتجات اللي قربت صلاحيتها تنتهي بشكل منظم وسهل. عشان تقدر تتابع كل حاجة بشكل مستمر وتاخد قرارات سريعة.',
              style: TextStyles.semiBold14.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'مميزات ابلكيشن Tminder ⚙️',
                  style: TextStyles.bold19,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const AboutUsTitleAndSub(
              title: '• تنبيهات دقيقة في الوقت المناسب :',
              subtitle:
                  'مفيش حاجة هتفوتك! التطبيق بيفكرك بشكل منتظم قبل انتهاء الصلاحية بشهر، أسبوعين، وأسبوع، وبعد كده هنوصلك تنبيهات يومية في آخر أيام المنتج عشان تضمن التصرف قبل ما المنتجات تخرج من الخدمة وتنتهي.',
            ),
            const AboutUsTitleAndSub(
              title: '• مسح باركود بسهولة :',
              subtitle:
                  'باستخدام خاصية الباركود، تقدر تضيف المنتجات بسرعة ومن غير تعب إدخال البيانات يدويًا.',
            ),
            const AboutUsTitleAndSub(
              title: '• حساب عدد الأيام المتبقية :',
              subtitle:
                  'اعرف بسهولة المدة المتبقية لكل منتج، وده هيساعدك تخطط بشكل أفضل لتصريف المنتجات قبل انتهاء صلاحيتها.',
            ),
            const AboutUsTitleAndSub(
              title: '• حذف تلقائي للمنتجات المنتهية :',
              subtitle:
                  'بمجرد انتهاء صلاحية أي منتج، التطبيق هيحذفه تلقائيًا من النظام عشان تكون قايمتك دايمًا منظمة ومحدثة.',
            ),
            const AboutUsTitleAndSub(
              title: '• نظام ألوان لحالة المنتج :',
              subtitle:
                  'Tminder بيستخدم نظام ألوان بسيط يوضح حالة كل منتج بسرعة :',
            ),
            const AboutUsColorsProducts(),
            const SizedBox(
              height: 16,
            ),
            const AboutUsTitleAndSub(
              title: '• تنسيق مع فريقك :',
              subtitle:
                  'مش بس هتتابع المنتجات بنفسك، لكن كمان كل فريقك اللي في نفس الزون هيكون عنده نفس المعلومات والتحديثات. ده بيخلي التعاون بينكم أسهل وأكتر فعالية.',
            ),
            const SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '- إدارة منتجات احترافية، تنظيم أفضل، توفير وقت .',
                style: TextStyles.bold14,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
