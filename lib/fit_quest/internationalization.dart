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
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // Profile
  {
    'bsqja3zl': {
      'ca': 'Info',
      'en': 'Info',
      'es': 'Información',
    },
    'dkz70i2l': {
 'ca': 'Tema',
      'en': 'Theme',
      'es': 'Tema',
    },
    'op3y07n7': {
      'ca': 'Light Mode',
      'en': 'Light Mode',
      'es': 'Modo Claro',
    },
    '71kfx38y': {
      'ca': 'Dark Mode',
      'en': 'Dark Mode',
      'es': 'Modo Oscuro',
    },
    'res14g40': {
      'ca': 'User  Information',
      'en': 'User  Information',
      'es': 'Información del Usuario',
    },
    '4zon5lv7': {
      'ca': 'Neixament',
      'en': 'Birthdate',
      'es': 'Fecha de Nacimiento',
    },
    'px5d84gp': {
      'ca': 'Genere',
      'en': 'Gender',
      'es': 'Género',
    },
    'g8355jhc': {
      'ca': 'Correu verificat',
      'en': 'Verified Email',
      'es': 'Correo Verificado',
    },
    'wfm9uo8e': {
      'ca': 'Idioma',
      'en': 'Language',
      'es': 'Idioma',
    },
    'rxdcju8e': {
      'ca': 'Select...',
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    'os0mh7ov': {
      'ca': 'Search...',
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'st1cgky8': {
      'ca': 'Catala',
      'en': 'Catalan',
      'es': 'Catalán',
    },
    'uk6xdtts': {
      'ca': 'Español',
      'en': 'Spanish',
      'es': 'Español',
    },
    'ydo9kjv5': {
      'ca': 'English',
      'en': 'English',
      'es': 'Inglés',
    },
    'sm2j5w7x': {
      'ca': 'Tancar sessió',
      'en': 'Log Out',
      'es': 'Cerrar Sesión',
    },
    '8kwq6oim': {
      'ca': 'Reptes',
      'en': 'Challenges',
      'es': 'Retos',
    },
    '6fborn5c': {
      'ca': 'Active',
      'en': 'Active',
      'es': 'Activo',
    },
    'mxqu8n65': {
      'ca': 'Please select...',
      'en': 'Please select...',
      'es': 'Por favor selecciona...',
    },
    'nfoxrgi0': {
      'ca': 'Search for an item...',
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    '14yy6icm': {
      'ca': 'Active',
      'en': 'Active',
      'es': 'Activo',
    },
    'j7cs7rkh': {
      'ca': 'In Active',
      'en': 'Inactive',
      'es': 'Inactivo',
    },
    '9qx9jpei': {
      'ca': 'Pause',
      'en': 'Pause',
      'es': 'Pausa',
    },
    '3gjba6y8': {
      'ca': 'Rating',
      'en': 'Rating',
      'es': 'Calificación',
    },
    '6mzql06i': {
      'ca': 'Hello World',
      'en': 'Hello World',
      'es': 'Hola Mundo',
    },
    'k7t4gx32': {
      'ca': 'Resenyes',
      'en': 'Reviews',
      'es': 'Reseñas',
    },
    '2jfrh105': {
      'ca': 'Abdullah',
      'en': 'Abdullah',
      'es': 'Abdullah',
    },
    '18jrhhnt': {
      'ca': '10/9/2023',
      'en': '10/9/2023',
      'es': '10/9/2023',
    },
    'xjo3ytj2': {
      'ca':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ',
      'en': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ',
      'es': 'Lorem Ipsum es simplemente texto de marcador de posición de la industria de la impresión y la composición tipográfica. Lorem Ipsum ',
    },
    'qou63ot9': {
      'ca': 'Perfil',
      'en': 'Profile',
      'es': 'Perfil',
    },
    'sjg0lyph': {
      'ca': 'Profile',
      'en': 'Profile',
      'es': 'Perfil',
    },
  },
  // Editprofile
  {
    'qnfvpq1l': {
      'ca': 'Editar Perfil',
      'en': 'Edit Profile',
      'es': 'Editar Perfil',
    },
    '576egk7x': {
      'ca': 'Canviar Foto',
      'en': 'Change Photo',
      'es': 'Cambiar Foto',
    },
    '8db5tlbw': {
      'ca': 'Nom d\'usuari:',
      'en': 'Username:',
      'es': 'Nombre de usuario:',
    },
    'lv4na8pt': {
      'ca': 'email:',
      'en': 'email:',
      'es': 'correo electrónico:',
    },
    'ateunvwx': {
      'ca': 'Genere...',
      'en': 'Gender...',
      'es': 'Género...',
    },
    '6ytbwma6': {
      'ca': 'Search...',
      'en': 'Search...',
      'es': 'Buscar...',
    },
    '7slvbrsw': {
      'ca': 'Masculi',
      'en': 'Male',
      'es': 'Masculino',
    },
    '90s2s4o4': {
      'ca': 'Femeni',
      'en': 'Female',
      'es': 'Femenino',
    },
    'ebn9jb9l': {
      'ca': 'Altres',
      'en': 'Other',
      'es': 'Otros',
    },
    '244v55e0': {
      'ca': 'Guardar Canvis',
      'en': 'Save Changes',
      'es': 'Guardar Cambios',
    },
    'c6971zdv': {
      'ca': 'Home',
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // OfertesPage
  {
    '5a2m9864': {
      'ca': 'Ofertes',
      'en': 'Offers',
      'es': 'Ofertas',
    },
    '85hewpb5': {
      'ca': 'All',
      'en': 'All',
      'es': 'Todo',
    },
    '1kkyl906': {
      'ca': 'Alimentació',
      'en': 'Food',
      'es': 'Alimentación',
    },
    '3sp0gf49': {
      'ca': 'Gimnas',
      'en': 'Gyms',
      'es': 'Gimnasios',
    },
    '4t5yq2sr': {
      'ca': 'Proteinas',
      'en': 'Proteins',
      'es': 'Proteínas',
    },
    'p4hxrvyk': {
      'ca': 'Ofertes',
      'en': 'Offers',
      'es': 'Ofertas',
    },
  },
  // review
  {
    '1alwccsv': {
      'ca': 'Give review to user',
      'en': 'Give review to user',
      'es': 'Dar reseña al usuario',
    },
    'lv2su245': {
      'ca': 'Tell us about your Experience with Seller.',
      'en': 'Tell us about your Experience with Seller.',
      'es': 'Cuéntanos sobre tu experiencia con el vendedor.',
    },
    'dobdskxz': {
      'ca': 'Share your Experience...',
      'en': 'Share your Experience...',
      'es': 'Comparte tu experiencia...',
    },
    'u7dwiulu': {
      'ca': 'Give Rating to Seller',
      'en': 'Give Rating to Seller',
      'es': 'Dar calificación al vendedor',
    },
    '3qyivw9r': {
      'ca': 'Send',
      'en': 'Send',
      'es': 'Enviar',
    },
    '7m6i0ayw': {
      'ca': 'Home',
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // Receptes
  {
    'x04adki1': {
      'ca': 'Receptes',
      'en': 'Recipes',
      'es': 'Recetas',
    },
    'z1ff5g3p': {
      'ca': 'Pregunta per qualsevol cosa',
      'en': 'Ask anything',
      'es': 'Pregunta por cualquier cosa',
    },
    '42zal9m5': {
      'ca': 'Receptes',
      'en': 'Recipes',
      'es': ' Recetas',
    },
    '5etwfuoj': {
      'ca': 'Receptes',
      'en': 'Recipes',
      'es': 'Recetas',
    },
  },
  // AllFriends
  {
    'finrht4m': {
      'ca': 'Social',
      'en': 'Social',
      'es': 'Social',
    },
    'kxmlp9po': {
      'ca': 'Afegeix amics per competir entre vosaltres amb els reptes',
      'en': 'Add friends to compete with each other in challenges',
      'es': 'Agrega amigos para competir entre ustedes en los retos',
    },
    '3wxkpvcn': {
      'ca': 'Enter Name to Search..',
      'en': 'Enter Name to Search..',
      'es': 'Ingresa el nombre para buscar..',
    },
    'jji3es2o': {
      'ca': 'Amistats',
      'en': 'Friends',
      'es': 'Amigos',
    },
    '4ve72xot': {
      'ca': 'Sol·licituds d\'Amistat',
      'en': 'Friend Requests',
      'es': 'Solicitudes de Amistad',
    },
    '9sdfky15': {
      'ca': 'Rebudes',
      'en': 'Received',
      'es': 'Recibidas',
    },
    '7atx2w9d': {
      'ca': 'Enviades',
      'en': 'Sent',
      'es': 'Enviadas',
    },
    '08j3it16': {
      'ca': 'Social',
      'en': 'Social',
      'es': 'Social',
    },
  },
  // ReptesList
  {
    'c15grtlr': {
      'ca': 'Els meus reptes',
      'en': 'My Challenges',
      'es': 'Mis Retos',
    },
    'gzquskzv': {
      'ca': 'Reptes',
      'en': 'Challenges',
      'es': 'Retos',
    },
  },
  // AuthPage
  {
    'c42bqrka': {
      'ca': 'Crear Cuenta',
      'en': 'Create Account',
      'es': 'Crear Cuenta',
    },
    'y2ty5hbk': {
      'ca': 'Creación de comptes',
      'en': 'Account Creation',
      'es': 'Creación de cuentas',
    },
    'paq8j8no': {
      'ca':
          'A continuació has de completar la informació per crear un nou compte.',
      'en': 'Next, you need to fill in the information to create a new account.',
      'es': 'A continuación, debes completar la información para crear una nueva cuenta.',
    },
    'd5jjdwop': {
      'ca': 'Email',
      'en': 'Email',
      'es': 'Correo Electrónico',
    },
    'r2bazq6j': {
      'ca': 'Confirma la contrasenya',
      'en': 'Confirm Password',
      'es': 'Confirma la contraseña',
    },
    '245ev9mc': {
      'ca': 'Contrasenya',
      'en': 'Password',
      'es': 'Contraseña',
    },
    'mdijg7vx': {
      'ca': 'Crear compte',
      'en': 'Create account',
      'es': 'Crear cuenta',
    },
    'hpsr1nmv': {
      'ca': 'Email és obligatori',
      'en': 'Email is required',
      'es': 'El correo electrónico es obligatorio',
    },
    'w4a05x2e': {
      'ca': 'Aquest camp és obligatori*',
      'en': 'This field is required*',
      'es': 'Este campo es obligatorio*',
    },
    '2fiiahs5': {
      'ca': 'Si us plau, tria una opció del desplegable',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elige una opción del desplegable',
    },
    't4zhprjw': {
      'ca': 'Aquest camp és obligatori*',
      'en': 'This field is required*',
      'es': 'Este campo es obligatorio*',
    },
    'fiyxoprr': {
      'ca': 'Si us plau, tria una opció del desplegable',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elige una opción del desplegable',
    },
    'f7jna3jl': {
      'ca': 'Si us plau, tria una opció del desplegable',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elige una opción del desplegable',
    },
    '28k0xks7': {
      'ca': 'Si us plau, tria una opció del desplegable',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elige una opción del desplegable',
    },
    'dn1f5yab': {
      'ca': 'O connecta amb',
      'en': 'Or connect with',
      'es': 'O conéctate con',
    },
    'unzai3r1': {
      'ca': 'Continuar amb Google',
      'en': 'Continue with Google',
      'es': 'Continuar con Google',
    },
    'u1c1yb9c': {
      'ca': 'Iniciar Sessió',
      'en': 'Log In',
      'es': 'Iniciar Sesión',
    },
    'lrz2txwh': {
      'ca': '¡Benvingut de nou!',
      'en': 'Welcome back!',
      'es': '¡Bienvenido de nuevo!',
    },
    'uoyucgem': {
      'ca':
          'Omple la informació amb les dades del teu compte per poder iniciar sessió',
      'en': 'Fill in the information with your account details to log in',
      'es': 'Rellena la información con los datos de tu cuenta para iniciar sesión',
    },
    'v9p9q6ae': {
      'ca': 'Email',
      'en': 'Email',
      'es': 'Correo Electrónico',
    },
    'wngvb3my': {
      'ca': 'Contrasenya',
      'en': 'Password',
      'es': 'Contraseña',
    },
    '5rw0s0dr': {
      'ca': '¿Has oblidat la teva contrasenya?',
      'en': 'Forgot your password?',
      'es': '¿Olvidaste tu contraseña?',
    },
    '5uufjrr0': {
      'ca': 'Iniciar sessió',
      'en': 'Log In',
      'es': 'Iniciar sesión',
    },
    'p15dvm5o': {
      'ca': 'O connecta amb',
      'en': 'Or connect with',
      'es': 'O conéctate con',
    },
    'wd96meik': {
      'ca': 'Continuar amb Google',
      'en': 'Continue with Google',
      'es': 'Continuar con Google',
    },
    '9530zpbk': {
      'ca': 'Home',
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // UserInfo
  {
    '857to9gb': {
      'ca': 'Nom d\'usuari',
      'en': 'Username',
      'es': 'Nombre de usuario',
    },
    'qonjf9uv': {
      'ca': 'Idioma',
      'en': 'Language',
      'es': 'Idioma',
    },
    'wd03prww': {
      'ca': 'Genere',
      'en': 'Gender',
      'es': 'Género',
    },
    'cbtwcbal': {
      'ca': 'Selecciona...',
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    'dfzlfyoe': {
      'ca': 'Selecciona...',
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    '3q5gw72t': {
      'ca': 'Cerca...',
      'en': 'Search...',
      'es': 'Buscar...',
    },
    '9ucb0wzy': {
      'ca': 'Masculi',
      'en': 'Male',
      'es': 'Masculino',
    },
    'q92f3a3a': {
      'ca': 'Femeni',
      'en': 'Female',
      'es': 'Femenino',
    },
    '5yxu6bcc': {
      'ca': 'Altres',
      'en': 'Other',
      'es': 'Otros',
    },
    'h8c7s602': {
      'ca': 'Iniciar ',
      'en': 'Start',
      'es': 'Iniciar',
    },
    'cjo8k491': {
      'ca': 'Si us plau, introdueix el nom complet del pacient.',
      'en': 'Please enter the patient\'s full name.',
      'es': 'Por favor, introduce el nombre completo del paciente.',
    },
    'pzbqm96z': {
      'ca': 'Si us plau, tria una opció del desplegable',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elige una opción del desplegable',
    },
    'lc8x9dly': {
      'ca': 'Si us plau, introdueix una edat per al pacient.',
      'en': 'Please enter an age for the patient.',
      'es': 'Por favor, introduce una edad para el paciente.',
    },
    'b0uej443': {
      'ca': 'Si us plau, tria una opció del desplegable',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elige una opción del desplegable',
    },
    'ams74lfi': {
      'ca': 'Si us plau, tria una opció del desplegable',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elige una opción del desplegable',
    },
    '7owahkv9': {
      'ca': 'Si us plau, introdueix la data de naixement del pacient.',
      'en': 'Please enter the date of birth of the patient.',
      'es': 'Por favor, introduce la fecha de nacimiento del paciente.',
    },
    'shthvrda': {
      'ca': 'Si us plau, tria una opció del desplegable',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elige una opción del desplegable',
    },
    'f3m8fw0l': {
      'ca': 'El camp és obligatori',
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
    },
    'vs44uocz': {
      'ca': 'Si us plau, tria una opció del desplegable',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elige una opción del desplegable',
    },
    'h4oxc0c4': {
      'ca': 'Completa la informació',
      'en': 'Complete the information',
      'es': 'Completa la información',
    },
    'bsi5d4sk': {
      'ca':
          'Necessitem que acabis d\'omplir la informació dels camps que hi ha a continuació',
      'en': 'We need you to complete the information in the fields below',
      'es': 'Necesitamos que completes la información en los campos a continuación',
    },
    'n62ze3id': {
      'ca': 'Home',
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // Oferta
  {
    'sukytdnb': {
      'ca': 'Categoria:',
      'en': 'Category:',
      'es': 'Categoría:',
    },
    'ak7h9prn': {
      'ca': 'Preu',
      'en': 'Price',
      'es': 'Precio',
    },
    '3budb9ph': {
      'ca': 'Descompte',
      'en': 'Discount',
      'es': 'Descuento',
    },
    '5rihyd67': {
      'ca': 'Localització',
      'en': 'Location',
      'es': 'Ubicación',
    },
    'x1imfp0z': {
      'ca': 'Anar a l\'oferta',
      'en': 'Go to offer',
      'es': 'Ir a la oferta',
    },
    'z5g0z6nb': {
      'ca': 'Detalls',
      'en': 'Details',
      'es': 'Detalles',
    },
    '2u027fii': {
      'ca': 'Perfil',
      'en': 'Profile',
      'es': 'Perfil',
    },
  },
  // RepteDetail
  {
    'tm0nzcnm': {
      'ca': 'Explicació:',
      'en': 'Explanation:',
      'es': 'Explicación:',
    },
    'kmrrj7qa': {
      'ca': 'Video demostratiu:',
      'en': 'Demonstration Video:',
      'es': 'Video demostrativo:',
    },
    'jgwf7idl': {
      'ca': 'Amics que l\'han completat:',
      'en': 'Friends who completed it:',
      'es': 'Amigos que lo completaron:',
    },
    'kt5zfew2': {
      'ca': 'Obtenir entrades',
      'en': 'Get Tickets',
      'es': 'Obtener Entradas',
    },
    '2sad8v68': {
      'ca': 'Home',
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // shareMenu
  {
    '5zi84ruz': {
      'ca': 'Comparteix',
      'en': 'Share',
      'es': 'Compartir',
    },
    '7b15ef4b': {
      'ca': 'Obtenir Enllaç',
      'en': 'Get Link',
      'es': 'Obtener Enlace',
    },
  },
  // infoMessage
  {
    'bkki6ss8': {
      'ca': 'D\'acord',
      'en': 'Ok',
      'es': 'Ok',
    },
  },
  // forgotPassword
  {
    'zjifpw7x': {
      'ca': 'Recuperació del compte',
      'en': 'Account Recovery',
      'es': 'Recuperación de la cuenta',
    },
    '2yd4f37p': {
      'ca':
          'Introdueix el correu amb el qual es va crear el compte per enviar-te l\'enllaç per canviar la contrasenya:',
      'en': 'Enter the email used to create the account to send you the link to change the password:',
      'es': 'Introduce el correo con el que se creó la cuenta para enviarte el enlace para cambiar la contraseña:',
    },
    '8hfv2df0': {
      'ca': 'Introdueix el correu electrònic...',
      'en': 'Enter email...',
      'es': 'Introduce el correo electrónico...',
    },
    '2a5jbzkm': {
      'ca': 'Enviar correu',
      'en': 'Send email',
      'es': 'Enviar correo',
    },
  },
  // yesNoMessage
  {
    'i0agpjob': {
      'ca': 'No',
      'en': 'No',
      'es': 'No',
    },
    'emeczml5': {
      'ca': 'Sí',
      'en': 'Yes',
      'es': 'Sí',
    },
  },
  // changePhoto
  {
    'xnyj2amk': {
      'ca': 'Canviar Foto',
      'en': 'Change Photo',
      'es': 'Cambiar Foto',
    },
    '91fwjhno': {
      'ca': 'Puja la nova foto o introdueix una url d\'internet',
      'en': 'Upload a new photo or enter a URL',
      'es': 'Sube una nueva foto o introduce una URL',
    },
    'ncf2h4hp': {
      'ca': 'Afegir Foto',
      'en': 'Add Photo',
      'es': 'Agregar Foto',
    },
    'qi9b2b4u': {
      'ca': 'Puja una imatge aquí...',
      'en': 'Upload an image here...',
      'es': 'Sube una imagen aquí...',
    },
    'phk9lsgf': {
      'ca': 'o introdueix la url d\'internet',
      'en': 'or enter the URL',
      'es': 'o introduce la URL',
    },
    '71kjlb1q': {
      'ca': 'URL de la imatge...',
      'en': 'Image URL...',
      'es': 'URL de la imagen...',
    },
    'rqtmdcu7': {
      'ca': 'Guardar canvis',
      'en': 'Save changes',
      'es': 'Guardar cambios',
    },
    'ax4fucec': {
      'ca': 'El camp és obligatori',
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
    },
    '89i356dh': {
      'ca': 'Si us plau, introdueix un nom real',
      'en': 'Please enter a real name',
      'es': 'Por favor, introduce un nombre real',
    },
    'eitcap5v': {
      'ca': 'Si us plau, tria una opció del desplegable',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elige una opción del desplegable',
    },
    'mnsxnt05': {
      'ca': 'Si us plau, introdueix una descripció breu',
      'en': 'Please enter a short description',
      'es': 'Por favor, introduce una descripción corta',
    },
    'fe00i7nj': {
      'ca': 'Si us plau, tria una opció del desplegable',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elige una opción del desplegable',
    },
    '364izh17': {
      'ca': 'Hem de tenir una URL per al projecte.',
      'en': 'We need to have a URL for the project.',
      'es': 'Necesitamos tener una URL para el proyecto.',
    },
    '826ejfc2': {
      'ca': 'Si us plau, introdueix una URL vàlida...',
      'en': 'Please enter a valid URL...',
      'es': 'Por favor, introduce una URL válida...',
    },
    'g9uizka3': {
      'ca': 'Si us plau, tria una opció del desplegable',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elige una opción del desplegable',
    },
    'xlh4aug0': {
      'ca': 'El camp és obligatori',
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
    },
    '7l4oh0w0': {
      'ca': 'Si us plau, tria una opció del desplegable',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elige una opción del desplegable',
    },
  },
  // friendRequest
  {
    'lmsu8y4m': {
      'ca': 'Rebutjar',
      'en': 'Reject',
      'es': 'Rechazar',
    },
    'knhzu4m1': {
      'ca': 'Acceptar',
      'en': 'Accept',
      'es': 'Aceptar',
    },
  },
  // lateralBar
  {
    'vczumo3q': {
      'ca': 'Perfil',
      'en': 'Profile',
      'es': 'Perfil',
    },
    'gyc36aay': {
      'ca': 'Amistats',
      'en': 'Friends',
      'es': 'Amigos',
    },
    '4ko9bc2y': {
      'ca': 'Contacta amb nosaltres',
      'en': 'Contact Us',
      'es': 'Contáctanos',
    },
    'gabiqglv': {
      'ca': 'Sobre nosaltres',
      'en': 'About Us',
      'es': 'Sobre nosotros',
    },
    '7l5ww2o9': {
      'ca': 'Tancar sessió',
      'en': 'Sign Out',
      'es': 'Cerrar sesión',
    },
  },
  // ofertCard
  {
    '3h99ce1o': {
      'ca': 'Vàlid fins:',
      'en': 'Valid until:',
      'es': 'Válido hasta:',
    },
    'vwyta8ce': {
      'ca': 'Valorar',
      'en': 'Rate',
      'es': 'Valorar',
    },
  },
  // Miscellaneous
  {
    'yiusonws': {
      'ca': 'Error',
      'en': 'Error',
      'es': 'Error',
    },
    'pbav55dc': {
      'ca': 'Càrrega...',
      'en': 'Loading...',
      'es': 'Cargando...',
    },
    'xosas1w7': {
      'ca': 'Completat',
      'en': 'Completed',
      'es': 'Completado',
    },
    '3rj3uber': {
      'ca': 'No disponible',
      'en': 'Not available',
      'es': 'No disponible',
    },
    '2l35juzs': {
      'ca': 'Intenta de nou',
      'en': 'Try again',
      'es': 'Intenta de nuevo',
    },
  },
  // Miscellaneous
  {
    'yiusonws': {
      'ca': 'Error',
      'en': 'Error',
      'es': 'Error',
    },
    'pbav55dc': {
      'ca': 'Càrrega...',
      'en': 'Loading...',
      'es': 'Cargando...',
    },
    'xosas1w7': {
      'ca': 'Completat',
      'en': 'Completed',
      'es': 'Completado',
    },
    '3rj3uber': {
      'ca': 'No disponible',
      'en': 'Not available',
      'es': 'No disponible',
    },
    '2l35juzs': {
      'ca': 'Intenta de nou',
      'en': 'Try again',
      'es': 'Intenta de nuevo',
    },
    'b74xkyea': {
      'ca': 'Torna a carregar',
      'en': 'Reload',
      'es': 'Recargar',
    },
    'q6qhl02b': {
      'ca': 'Desconegut',
      'en': 'Unknown',
      'es': 'Desconocido',
    },
    'mlt2rgmn': {
      'ca': 'No s\'ha trobat',
      'en': 'Not found',
      'es': 'No encontrado',
    },
    'zhgzab50': {
      'ca': 'Error desconegut',
      'en': 'Unknown error',
      'es': 'Error desconocido',
    },
    '7t14v7k2': {
      'ca': 'Acció no vàlida',
      'en': 'Invalid action',
      'es': ' Acción no válida',
    },
    'zyesr6e6': {
      'ca': 'Acció completada',
      'en': 'Action completed',
      'es': 'Acción completada',
    },
    '9rc4r6jw': {
      'ca': 'Acció fallida',
      'en': 'Action failed',
      'es': 'Acción fallida',
    },
    'mfr8bnu2': {
      'ca': 'No s\'ha pogut completar l\'acció',
      'en': 'Could not complete the action',
      'es': 'No se pudo completar la acción',
    },
    '9iycs3ad': {
      'ca': 'Acció no autoritzada',
      'en': 'Unauthorized action',
      'es': 'Acción no autorizada',
    },
    't5ka9vyz': {
      'ca': 'Acció no reconeguda',
      'en': 'Unrecognized action',
      'es': 'Acción no reconocida',
    },
    'f133cyaf': {
      'ca': 'Error de connexió',
      'en': 'Connection error',
      'es': 'Error de conexión',
    },
    '5512zio0': {
      'ca': 'Error de servidor',
      'en': 'Server error',
      'es': 'Error de servidor',
    },
    'xf2z2abh': {
      'ca': 'Error de validació',
      'en': 'Validation error',
      'es': 'Error de validación',
    },
    'a9s4l4m4': {
      'ca': 'Error desconegut',
      'en': 'Unknown error',
      'es': 'Error desconocido',
    },
    'zxze9mrh': {
      'ca': 'Error de permisos',
      'en': 'Permission error',
      'es': 'Error de permisos',
    },
    'pjoempgb': {
      'ca': 'Error de format',
      'en': 'Format error',
      'es': 'Error de formato',
    },
    't8na4u0k': {
      'ca': 'Error de dades',
      'en': 'Data error',
      'es': 'Error de datos',
    },
    'dii1dq6r': {
      'ca': 'Error de sincronització',
      'en': 'Sync error',
      'es': 'Error de sincronización',
    },
    '5nsnmerc': {
      'ca': 'Error de càrrega',
      'en': 'Loading error',
      'es': 'Error de carga',
    },
    '8b2qg33k': {
      'ca': 'Error de resposta',
      'en': 'Response error',
      'es': 'Error de respuesta',
    },
    'l1j18i4r': {
      'ca': 'Error de configuració',
      'en': 'Configuration error',
      'es': 'Error de configuración',
    },
    'bs8wud02': {
      'ca': 'Error de connexió',
      'en': 'Connection error',
      'es': 'Error de conexión',
    },
  },
].reduce((a, b) => a..addAll(b));
