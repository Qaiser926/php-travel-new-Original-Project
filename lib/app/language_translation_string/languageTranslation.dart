import 'package:get/get.dart';
import 'package:phptravelapp/app/language_translation_string/arabic.dart';
import 'package:phptravelapp/app/language_translation_string/chiness.dart';
import 'package:phptravelapp/app/language_translation_string/english.dart';
import 'package:phptravelapp/app/language_translation_string/filipino.dart';
import 'package:phptravelapp/app/language_translation_string/french.dart';
import 'package:phptravelapp/app/language_translation_string/indonesia.dart';
import 'package:phptravelapp/app/language_translation_string/khmer.dart';
import 'package:phptravelapp/app/language_translation_string/korean.dart';
import 'package:phptravelapp/app/language_translation_string/rassian.dart';
import 'package:phptravelapp/app/language_translation_string/spanish.dart';
import 'package:phptravelapp/app/language_translation_string/turkish.dart';
import 'german.dart';
class TranslationPage extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    // turkish
    'turkish':turkish,
    // rassian
    'ra':ra,
    // filipino
    'filipin':filipin,
    // korean
    'korean':korean,
    // khmer
    'khmer':khmer,
    // indonesia
    'indonesia':indonesia,
    // french
    'french':french,
    // spanish
    'spanish':spanish,
    // english
    'en':en,
    // german
    'german':german,
    // chiness
    'chnes':chines,
    // arabic
    'arabic':arabic,
  };

}