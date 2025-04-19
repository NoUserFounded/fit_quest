import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ca', 'es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? caText = '',
    String? esText = '',
    String? enText = '',
  }) =>
      [caText, esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SplashScreen
  {
    'il3i6vii': {
      'ca': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Profile
  {
    'bsqja3zl': {
      'ca': 'Info',
      'en': '',
      'es': '',
    },
    'dkz70i2l': {
      'ca': 'Tema',
      'en': '',
      'es': '',
    },
    'op3y07n7': {
      'ca': 'Light Mode',
      'en': '',
      'es': '',
    },
    '71kfx38y': {
      'ca': 'Dark Mode',
      'en': '',
      'es': '',
    },
    'res14g40': {
      'ca': 'User Information',
      'en': '',
      'es': '',
    },
    '4zon5lv7': {
      'ca': 'Neixament',
      'en': '',
      'es': '',
    },
    'px5d84gp': {
      'ca': 'Genere',
      'en': '',
      'es': '',
    },
    'g8355jhc': {
      'ca': 'Correu verificat',
      'en': '',
      'es': '',
    },
    'wfm9uo8e': {
      'ca': 'Idioma',
      'en': '',
      'es': '',
    },
    'rxdcju8e': {
      'ca': 'Select...',
      'en': '',
      'es': '',
    },
    'os0mh7ov': {
      'ca': 'Search...',
      'en': '',
      'es': '',
    },
    'st1cgky8': {
      'ca': 'Catala',
      'en': '',
      'es': '',
    },
    'uk6xdtts': {
      'ca': 'Español',
      'en': '',
      'es': '',
    },
    'ydo9kjv5': {
      'ca': 'English',
      'en': '',
      'es': '',
    },
    'sm2j5w7x': {
      'ca': 'Tancar sessió',
      'en': '',
      'es': '',
    },
    '8kwq6oim': {
      'ca': 'Reptes',
      'en': '',
      'es': '',
    },
    '6fborn5c': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'mxqu8n65': {
      'ca': 'Please select...',
      'en': '',
      'es': '',
    },
    'nfoxrgi0': {
      'ca': 'Search for an item...',
      'en': '',
      'es': '',
    },
    'j7cs7rkh': {
      'ca': 'Pendent',
      'en': '',
      'es': '',
    },
    '9qx9jpei': {
      'ca': 'Completat',
      'en': '',
      'es': '',
    },
    '9qw5v7bf': {
      'ca': 'Fallit',
      'en': '',
      'es': '',
    },
    'kgdingxw': {
      'ca': '\tEn proces',
      'en': '',
      'es': '',
    },
    'k7t4gx32': {
      'ca': 'Resenyes',
      'en': '',
      'es': '',
    },
    'qou63ot9': {
      'ca': 'Perfil',
      'en': '',
      'es': '',
    },
    'sjg0lyph': {
      'ca': 'Profile',
      'en': '',
      'es': '',
    },
  },
  // Editprofile
  {
    'qnfvpq1l': {
      'ca': 'Editar Perfil',
      'en': '',
      'es': '',
    },
    '576egk7x': {
      'ca': 'Canviar Foto',
      'en': '',
      'es': '',
    },
    '8db5tlbw': {
      'ca': 'Nom d\'usuari:',
      'en': '',
      'es': '',
    },
    'lv4na8pt': {
      'ca': 'email:',
      'en': '',
      'es': '',
    },
    'ateunvwx': {
      'ca': 'Genere...',
      'en': '',
      'es': '',
    },
    '6ytbwma6': {
      'ca': 'Search...',
      'en': '',
      'es': '',
    },
    '7slvbrsw': {
      'ca': 'Masculi',
      'en': '',
      'es': '',
    },
    '90s2s4o4': {
      'ca': 'Femeni',
      'en': '',
      'es': '',
    },
    'ebn9jb9l': {
      'ca': 'Altres',
      'en': '',
      'es': '',
    },
    '244v55e0': {
      'ca': 'Guardar Canvis',
      'en': '',
      'es': '',
    },
    'c6971zdv': {
      'ca': 'Home',
      'en': '',
      'es': '',
    },
  },
  // OfertesPage
  {
    '5a2m9864': {
      'ca': 'Ofertes',
      'en': '',
      'es': '',
    },
    '85hewpb5': {
      'ca': 'All',
      'en': '',
      'es': '',
    },
    '1kkyl906': {
      'ca': 'Alimentació',
      'en': '',
      'es': '',
    },
    '3sp0gf49': {
      'ca': 'Gimnas',
      'en': '',
      'es': '',
    },
    '4t5yq2sr': {
      'ca': 'Proteinas',
      'en': '',
      'es': '',
    },
    'p4hxrvyk': {
      'ca': 'Ofertes',
      'en': '',
      'es': '',
    },
  },
  // Receptes
  {
    'x04adki1': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'z1ff5g3p': {
      'ca': 'Pregunta por cualquier cosa',
      'en': '',
      'es': '',
    },
    '42zal9m5': {
      'ca': 'Receptes',
      'en': '',
      'es': '',
    },
    '5etwfuoj': {
      'ca': 'Receptes',
      'en': '',
      'es': '',
    },
  },
  // AllFriends
  {
    'finrht4m': {
      'ca': 'Social',
      'en': '',
      'es': '',
    },
    'kxmlp9po': {
      'ca': 'Afegeix amics per competir entre vosaltres amb els reptes',
      'en': '',
      'es': '',
    },
    '3wxkpvcn': {
      'ca': 'Enter Name to Search..',
      'en': '',
      'es': '',
    },
    'jji3es2o': {
      'ca': 'Amistats',
      'en': '',
      'es': '',
    },
    '4ve72xot': {
      'ca': 'Sol·licituds d\'Amistat',
      'en': '',
      'es': '',
    },
    '9sdfky15': {
      'ca': 'Rebudes',
      'en': '',
      'es': '',
    },
    '7atx2w9d': {
      'ca': 'Enviades',
      'en': '',
      'es': '',
    },
    '08j3it16': {
      'ca': 'Social',
      'en': '',
      'es': '',
    },
  },
  // ReptesList
  {
    'c15grtlr': {
      'ca': 'Els meus reptes',
      'en': '',
      'es': '',
    },
    'gzquskzv': {
      'ca': 'Reptes',
      'en': '',
      'es': '',
    },
  },
  // AuthPage
  {
    'c42bqrka': {
      'ca': 'Crear Cuenta',
      'en': '',
      'es': '',
    },
    'y2ty5hbk': {
      'ca': 'Creación de cuentas',
      'en': '',
      'es': '',
    },
    'paq8j8no': {
      'ca':
          'A continuación debes rellenar  la información para crear una cuenta nueva.',
      'en': '',
      'es': '',
    },
    'd5jjdwop': {
      'ca': 'Email',
      'en': '',
      'es': '',
    },
    'r2bazq6j': {
      'ca': 'Confirma la contraseña',
      'en': '',
      'es': '',
    },
    '245ev9mc': {
      'ca': 'Contraseña',
      'en': '',
      'es': '',
    },
    'mdijg7vx': {
      'ca': 'Crear cuenta',
      'en': '',
      'es': '',
    },
    'hpsr1nmv': {
      'ca': 'Email is required',
      'en': '',
      'es': '',
    },
    'w4a05x2e': {
      'ca': 'Este campo es obligatorio*',
      'en': '',
      'es': '',
    },
    '2fiiahs5': {
      'ca': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    't4zhprjw': {
      'ca': 'Este campo es obligatorio*',
      'en': '',
      'es': '',
    },
    'fiyxoprr': {
      'ca': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    'f7jna3jl': {
      'ca': 'Este campo es obligatorio*',
      'en': '',
      'es': '',
    },
    '28k0xks7': {
      'ca': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    'dn1f5yab': {
      'ca': 'O contectate con',
      'en': '',
      'es': '',
    },
    'unzai3r1': {
      'ca': 'Continuar con Google',
      'en': '',
      'es': '',
    },
    'u1c1yb9c': {
      'ca': 'Iniciar Sesión',
      'en': '',
      'es': '',
    },
    'lrz2txwh': {
      'ca': '¡Bienvenido de nuevo!',
      'en': '',
      'es': '',
    },
    'uoyucgem': {
      'ca':
          'Rellana la información con los datos de tu cuenta para poder iniciar sesión',
      'en': '',
      'es': '',
    },
    'v9p9q6ae': {
      'ca': 'Email',
      'en': '',
      'es': '',
    },
    'wngvb3my': {
      'ca': 'Contraseña',
      'en': '',
      'es': '',
    },
    '5rw0s0dr': {
      'ca': '¿Has olvidado tu contraseña?',
      'en': '',
      'es': '',
    },
    '5uufjrr0': {
      'ca': 'Iniciar sesión',
      'en': '',
      'es': '',
    },
    'p15dvm5o': {
      'ca': 'O contectate con',
      'en': '',
      'es': '',
    },
    'wd96meik': {
      'ca': 'Continuar con Google',
      'en': '',
      'es': '',
    },
    '9530zpbk': {
      'ca': 'Home',
      'en': '',
      'es': '',
    },
  },
  // UserInfo
  {
    '857to9gb': {
      'ca': 'Nom d\'usuari',
      'en': '',
      'es': '',
    },
    'qonjf9uv': {
      'ca': 'Idioma',
      'en': '',
      'es': '',
    },
    'wd03prww': {
      'ca': 'Genere',
      'en': '',
      'es': '',
    },
    'cbtwcbal': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'dfzlfyoe': {
      'ca': 'Select...',
      'en': '',
      'es': '',
    },
    '3q5gw72t': {
      'ca': 'Search...',
      'en': '',
      'es': '',
    },
    '9ucb0wzy': {
      'ca': 'Masculi',
      'en': '',
      'es': '',
    },
    'q92f3a3a': {
      'ca': 'Femeni',
      'en': '',
      'es': '',
    },
    '5yxu6bcc': {
      'ca': 'Altres',
      'en': '',
      'es': '',
    },
    'h8c7s602': {
      'ca': 'Iniciar ',
      'en': '',
      'es': '',
    },
    'cjo8k491': {
      'ca': 'Please enter the patients full name.',
      'en': '',
      'es': '',
    },
    'pzbqm96z': {
      'ca': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    'lc8x9dly': {
      'ca': 'Please enter an age for the patient.',
      'en': '',
      'es': '',
    },
    'b0uej443': {
      'ca': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    'ams74lfi': {
      'ca': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    '7owahkv9': {
      'ca': 'Please enter the date of birth of the patient.',
      'en': '',
      'es': '',
    },
    'shthvrda': {
      'ca': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    'f3m8fw0l': {
      'ca': 'Field is required',
      'en': '',
      'es': '',
    },
    'vs44uocz': {
      'ca': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    'h4oxc0c4': {
      'ca': 'Completa la informació',
      'en': '',
      'es': '',
    },
    'bsi5d4sk': {
      'ca':
          'Necessitem que acabis d\'omplir la informació dels camps que hi ha a continuació',
      'en': '',
      'es': '',
    },
    'n62ze3id': {
      'ca': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Oferta
  {
    'sukytdnb': {
      'ca': 'Category:',
      'en': '',
      'es': '',
    },
    'ak7h9prn': {
      'ca': 'Price',
      'en': '',
      'es': '',
    },
    '3budb9ph': {
      'ca': 'Descompte',
      'en': '',
      'es': '',
    },
    '5rihyd67': {
      'ca': 'Localització',
      'en': '',
      'es': '',
    },
    'x1imfp0z': {
      'ca': 'Anar a l\'oferta',
      'en': '',
      'es': '',
    },
    'z5g0z6nb': {
      'ca': 'Detalls',
      'en': '',
      'es': '',
    },
    '2u027fii': {
      'ca': 'Profile',
      'en': '',
      'es': '',
    },
  },
  // RepteDetail
  {
    'tm0nzcnm': {
      'ca': 'Explicació:',
      'en': '',
      'es': '',
    },
    'kmrrj7qa': {
      'ca': 'Video demostratiu:',
      'en': '',
      'es': '',
    },
    'jgwf7idl': {
      'ca': 'Amics que l\'han completat:',
      'en': '',
      'es': '',
    },
    'kt5zfew2': {
      'ca': 'Completar',
      'en': '',
      'es': '',
    },
    '2sad8v68': {
      'ca': 'Home',
      'en': '',
      'es': '',
    },
  },
  // shareMenu
  {
    '5zi84ruz': {
      'ca': 'Share',
      'en': '',
      'es': '',
    },
    '7b15ef4b': {
      'ca': 'Get Link',
      'en': '',
      'es': '',
    },
  },
  // infoMessage
  {
    'bkki6ss8': {
      'ca': 'Ok',
      'en': '',
      'es': '',
    },
  },
  // forgotPassword
  {
    'zjifpw7x': {
      'ca': 'Recuperación de la cuenta',
      'en': '',
      'es': '',
    },
    '2yd4f37p': {
      'ca':
          'Introduce el correo con el que se ha creado la cuenta para que te mandemos el link para cambiar la constraseña:',
      'en': '',
      'es': '',
    },
    '8hfv2df0': {
      'ca': 'Introduce el correo electronico...',
      'en': '',
      'es': '',
    },
    '2a5jbzkm': {
      'ca': 'Enviar correo',
      'en': '',
      'es': '',
    },
  },
  // yesNoMessage
  {
    'i0agpjob': {
      'ca': 'No',
      'en': '',
      'es': '',
    },
    'emeczml5': {
      'ca': 'Sí',
      'en': '',
      'es': '',
    },
  },
  // changePhoto
  {
    'xnyj2amk': {
      'ca': 'Canviar Foto',
      'en': '',
      'es': '',
    },
    '91fwjhno': {
      'ca': 'Puja la nova foto o introudeix una url d\'internet',
      'en': '',
      'es': '',
    },
    'ncf2h4hp': {
      'ca': 'Add Photo',
      'en': '',
      'es': '',
    },
    'qi9b2b4u': {
      'ca': 'Upload an image here...',
      'en': '',
      'es': '',
    },
    'phk9lsgf': {
      'ca': 'o introdueix la url d\'internet',
      'en': '',
      'es': '',
    },
    '71kjlb1q': {
      'ca': 'Url de l\'imatge...',
      'en': '',
      'es': '',
    },
    'rqtmdcu7': {
      'ca': 'Guardar canvis',
      'en': '',
      'es': '',
    },
    'ax4fucec': {
      'ca': 'Field is required',
      'en': '',
      'es': '',
    },
    '89i356dh': {
      'ca': 'Please enter a real name',
      'en': '',
      'es': '',
    },
    'eitcap5v': {
      'ca': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    'mnsxnt05': {
      'ca': 'Please enter a short desription',
      'en': '',
      'es': '',
    },
    'fe00i7nj': {
      'ca': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    '364izh17': {
      'ca': 'We have to have a URL for the project.',
      'en': '',
      'es': '',
    },
    '826ejfc2': {
      'ca': 'Please enter a valid URL...',
      'en': '',
      'es': '',
    },
    'g9uizka3': {
      'ca': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    'xlh4aug0': {
      'ca': 'Field is required',
      'en': '',
      'es': '',
    },
    '7l4oh0w0': {
      'ca': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
  },
  // friendRequest
  {
    'lmsu8y4m': {
      'ca': 'Rebutjar',
      'en': '',
      'es': '',
    },
    'knhzu4m1': {
      'ca': 'Aceptar',
      'en': '',
      'es': '',
    },
  },
  // lateralBar
  {
    'vczumo3q': {
      'ca': 'Perfil',
      'en': '',
      'es': '',
    },
    'gyc36aay': {
      'ca': 'Amistats',
      'en': '',
      'es': '',
    },
    '4ko9bc2y': {
      'ca': 'Contact Us',
      'en': '',
      'es': '',
    },
    'gabiqglv': {
      'ca': 'About Us',
      'en': '',
      'es': '',
    },
    '7l5ww2o9': {
      'ca': 'Sign Out',
      'en': '',
      'es': '',
    },
  },
  // ofertCard
  {
    '3h99ce1o': {
      'ca': 'Vàlid fins:',
      'en': '',
      'es': '',
    },
    'vwyta8ce': {
      'ca': 'Valorar',
      'en': 'Rate',
      'es': 'Valorar',
    },
  },
  // review
  {
    'exwr2z96': {
      'ca': 'Fes una valoració de l\'orferta',
      'en': '',
      'es': '',
    },
    '9hoq7vy4': {
      'ca': 'Explican\'s com s\'ha sigut l\'experiencia amb l\'orferta',
      'en': '',
      'es': '',
    },
    'pf66fd4u': {
      'ca': 'Explican\'ns la teva experiencia',
      'en': '',
      'es': '',
    },
    'u526wgbv': {
      'ca': 'Valoració: *',
      'en': '',
      'es': '',
    },
    'r1ls28oo': {
      'ca': 'Enviar',
      'en': '',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'yiusonws': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'pbav55dc': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'xosas1w7': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '3rj3uber': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '2l35juzs': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'b74xkyea': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'q6qhl02b': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'mlt2rgmn': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'zhgzab50': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '7t14v7k2': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'zyesr6e6': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '9rc4r6jw': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'mfr8bnu2': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '9iycs3ad': {
      'ca': '',
      'en': '',
      'es': '',
    },
    't5ka9vyz': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'f133cyaf': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '5512zio0': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'xf2z2abh': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'a9s4l4m4': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'zxze9mrh': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'pjoempgb': {
      'ca': '',
      'en': '',
      'es': '',
    },
    't8na4u0k': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'dii1dq6r': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '5nsnmerc': {
      'ca': '',
      'en': '',
      'es': '',
    },
    '8b2qg33k': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'l1j18i4r': {
      'ca': '',
      'en': '',
      'es': '',
    },
    'bs8wud02': {
      'ca': '',
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
