��    ;      �  O   �        -   	  )   7     a     h  �   w  v   �  8   t  K   �  N   �     H     Z     o  =   �  +   �  /   �  	        )     /  D   7  k   |  (   �  �  	     �
     �
  	   �
        �        �     �     �     �  !        7     ?     P     i     �  }   �  0     �  P  0   �  D     �   `  �   �  �  n  N  h  �   �  X   �     �     �            E   *  '   p     �  @   �  /   �       �  #  1   �  /   �          "  �   1  �   �  G   a  \   �  ^        e          �  @   �  ;   �  ?   %     e     m     t  M   }  ~   �  %   J  �  p     (     F  
   e     p  �   �  )   >     h     p     �  (   �     �     �  !   �      
   +   +   �   W   M   �   �  1!  :   #  P   <#  �   �#  �   $  G  �$  \  �&  '  Z(  f   �)  	   �)     �)     *     *  U   9*  ,   �*     �*  S   �*  9   +     R+           *                  2   .         !   +           7   &                1       -       '   ,          )       ;   5      6       $          	                         0                           8               9      3       
   4      (   %          /         #   :         "    %(INSTALL)d to install %(INSTALL)d to install %(REMOVE)d to remove %(REMOVE)d to remove %s, %s <b>Example</b> <big><b>Checking available language support</b></big>

The availability of translations or writing aids can differ between languages. <small><b>Drag languages to arrange them in order of preference.</b>
Changes take effect next time you log in.</small> <small>Changes take effect next time you log in.</small> <small>Use the same format choice for startup and the login screen.</small> <small>Use the same language choices for startup and the login screen.</small> Apply System-Wide Chinese (simplified) Chinese (traditional) Configure multiple and native language support on your system Could not install the full language support Could not install the selected language support Currency: Date: Details Display numbers, dates and currency amounts in the usual format for: Failed to apply the '%s' format
choice. The examples may show up if you
close and re-open Language Support. Failed to authorize to install packages. If you need to type in languages, which require more complex input methods than just a simple key to letter mapping, you may want to enable this function.
For example, you will need this function for typing Chinese, Japanese, Korean or Vietnamese.
The recommended value for Ubuntu is "IBus".
If you want to use alternative input method systems, install the corresponding packages first and then choose the desired system here. Incomplete Language Support Install / Remove Languages... Installed Installed Languages It is impossible to install or remove any software. Please use the package manager "Synaptic" or run "sudo apt-get install -f" in a terminal to fix this issue at first. Keyboard input method system: Language Language Support Language for menus and windows: No language information available Number: Regional Formats Session Restart Required Set system default language Software database is broken Some translations or writing aids available for your chosen languages are not installed yet. Do you want to install them now? System policy prevented setting default language The language support files for your selected language seem to be incomplete. You can install the missing components by clicking on "Run this action now" and follow the instructions. An active internet connection is required. If you would like to do this at a later time, please use Language Support instead (click the icon at the very right of the top bar and select "System Settings... -> Language Support"). The language support is not installed completely The new language settings will take effect once you have logged out. The system does not have information about the available languages yet. Do you want to perform a network update to get them now?  This is perhaps a bug of this application. Please file a bug report at https://bugs.launchpad.net/ubuntu/+source/language-selector/+filebug This setting only affects the language your desktop and applications are displayed in. It does not set the system environment, like currency or date format settings. For that, use the settings in the Regional Formats tab.
The order of the values displayed here decides which translations to use for your desktop. If translations for the first language are not available, the next one in this list will be tried. The last entry of this list is always "English".
Every entry below "English" will be ignored. This will set the system environment like shown below and will also affect the preferred paper format and other region specific settings.
If you want to display the desktop in a different language than this, please select it in the "Language" tab.
Hence you should set this to a sensible value for the region in which you are located. Usually this is related to an error in your software archive or software manager. Check your preferences in Software Sources (click the icon at the very right of the top bar and select "System Settings... -> Software Sources"). When a language is installed, individual users can choose it in their Language settings. _Install _Remind Me Later _Update alternative datadir check for the given package(s) only -- separate packagenames by comma don't verify installed language support none output all available language support packages for all languages show installed packages as well as missing ones target language code Project-Id-Version: language-selector
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2016-03-19 03:23+0000
Last-Translator: Adolfo Jayme <Unknown>
Language-Team: Spanish <es@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2018-04-14 13:44+0000
X-Generator: Launchpad (build 18610)
Language: es
 %(INSTALL)d por instalar %(INSTALL)d por instalar %(REMOVE)d por eliminar %(REMOVE)d por eliminar %s y %s <b>Ejemplo</b> <big><b>Comprobando el soporte de idiomas disponibles</b></big>

La disponibilidad de traducciones o ayudas a la escritura puede variar de un idioma a otro. <small><b>Arrastre los idiomas para ordenarlos según su preferencia.</b>
Los cambios surtirán efecto la próxima vez que inicie sesión.</small> <small>Los cambios surtirán efecto la próxima vez que acceda.</small> <small>Usar la misma opción de formato para el inicio y para la pantalla de acceso.</small> <small>Usar las mismas opciones de idioma para el inicio y para la pantalla de acceso.</small> Aplicar a todo el sistema Chino (simplificado) Chino (tradicional) Configurar soporte múltiple y nativo de idiomas para su sistema No se ha podido instalar el soporte completo para el idioma No se ha podido instalar el soporte para el idioma seleccionado Moneda: Fecha: Detalles Mostrar números, fechas y cantidades monetarias en el formato habitual para: No se pudo aplicar la elección de
formato «%s». Los ejemplos pueden aparecer
si cierra y vuelve a abrir Soporte de idiomas. Fallo al autorizar instalar paquetes. Si necesita escribir en idiomas que requieren métodos de entrada más complejos que una asignación de una tecla a una letra, quizá quiera activar esta función.
Por ejemplo, necesitará esta función para escribir en chino, japonés, coreano o vietnamita.
El valor recomendado para Ubuntu es «IBus».
Si quiere usar métodos de entrada alternativos, instale primero los paquetes correspondientes y luego elija el método deseado aquí. Soporte de idiomas incompleto Instalar o eliminar idiomas… Instalados Idiomas instalados Es imposible instalar o desinstalar ningún programa. Use primero el gestor de paquetes «Synaptic» (o ejecute «sudo apt-get install -f» en una terminal), para corregir este problema. Sistema de método de entrada de teclado: Idiomas Soporte de idiomas Idioma para menús y ventanas: No hay información de idioma disponible Número: Formatos regionales Es necesario reiniciar la sesión Establecer idioma predeterminado La base de datos del software está dañada No están instaladas todas las traducciones o ayudas a la escritura disponibles para los idiomas seleccionados. ¿Quiere instalarlas ahora? Las directivas del sistema impiden la configuración de idioma predeterminado Los archivos de soporte de idioma para su idioma seleccionado parecen estar incompletos. Puede instalar los componentes que faltan, pulse en «Ejecutar esta acción ahora» y siga las instrucciones. Es necesario una conexión a Internet activa. Si lo desea puede hacer esto en otro momento, utilizando el soporte de idioma (pulse en el icono situado en el extremo derecho de la barra superior y seleccione «Configuración del sistema ... -> Soporte de idioma»). El soporte para el idioma no está completamente instalado Las nuevas opciones de idioma surtirán efecto cuando haya salido de la sesión. El sistema no tiene información sobre los idiomas disponibles. ¿Quiere realizar una actualización en la red para obtenerla ahora?  Esto tal vez se deba a un fallo en la aplicación. Por favor, rellene un informe de fallo en https://bugs.launchpad.net/ubuntu/+source/language-selector/+filebug Esta configuración solo afecta al idioma de su escritorio y las aplicaciones que se muestran en él. No configura el entorno del sistema, como la moneda o la configuración del formato de fecha. Para ello use la configuración en la solapa de formatos regionales.
El orden de los valores que se muestran aquí decide qué traducciones usar en su escritorio. Si las traducciones para el primer idioma no están disponibles, se intentará con el siguiente de la lista. La última entrada en esta lista será siempre «inglés».
Cualquier entrada posterior a «inglés» se ignorará. Esto configurará el entorno del sistema como se muestra debajo y también afectará al formato de papel preferido y otras configuraciones regionales específicas.
Si quiere mostrar el escritorio en un idioma diferente, selecciónelo en la pestaña «Idioma».
Desde aquí, se puede establecer un valor adecuado a la región en la que se encuentra. Por lo general esto se relaciona con un error en el archivo de software o el gestor de software. Compruebe sus preferencias en orígenes del software (pulse en el icono situado en el extremo derecho de la barra superior y seleccione «Configuración del sistema… → Orígenes del software»). Cuando se instala un idioma, los usuarios individuales pueden elegirlo en su configuración de idioma. _Instalar _Recordármelo más tarde Act_ualizar directorio de datos alternativo Comprobar solo los paquetes indicados -- separar los nombres de paquetes con una coma no verificar el soporte de idiomas instalado ninguno muestra todos los paquetes de soporte de idioma disponibles, para todos los idiomas mostrar los paquetes instalados, así como los que faltan Código del idioma de destino 