Þ    ;      ô  O   Ì        -   	  )   7     a     h     w  v   ý  8   t  K   ­  N   ù     H     Z     o  =     +   Ã  /   ï  	        )     /  D   7  k   |  (   è  ª  	     ¼
     Ø
  	   ö
        ¨        ½     Û     ä     õ  !        7     ?     P     i       }   ¡  0       P  0   ê  D        `     â  ù  n  N  h  ã   ·  X        ô     ý            E   *  '   p       @     /   Þ       ¬  #     Ð     í     	       k     Y     3   å  K     K   e     ±     Ä     Ó  *   â       $   ,  	   Q  	   [     e  <   r  g   ¯       (  6     _     u  	             ¨     /     H     O     \     u  	                  ¾     ×  K   ð  $   <  >  a  *      *   Ë  U   ö  |   L   ¸  É   û   "  Ó   ~#  K   R$  
   $     ©$  
   À$     Ë$  <   á$  $   %     C%  6   G%  !   ~%      %           *                  2   .         !   +           7   &                1       -       '   ,          )       ;   5      6       $          	                         0                           8               9      3       
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
PO-Revision-Date: 2016-09-01 11:27+0000
Last-Translator: Walter Cheuk <wwycheuk@gmail.com>
Language-Team: Chinese (Hong Kong) <zh_HK@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
X-Launchpad-Export-Date: 2018-04-14 13:44+0000
X-Generator: Launchpad (build 18610)
Language: zh_HK
 å®è£ %(INSTALL)d åé ç® ç§»é¤ %(REMOVE)d åé ç® %så%s <b>ç¯ä¾</b> <big><b>æª¢æ¥å¯æä¾ä¹èªè¨æ¯æ´</b></big>

åå¥èªè¨ä¸ä¸å®æä¾ç¿»è­¯ææææå­å·¥å·ã <small><b>ææ³ä»¥æ´æ¹åªåæ¬¡åºã</b>
è®æ´æå¨ä¸æ¬¡ç»å¥å¾çæã</small> <small>æ¹åææ¼ä¸æ¬¡ç»å¥æçæã</small> <small>åå§ååèç»å¥ç«é¢é½ä½¿ç¨ç¸åçæ ¼å¼é¸æã</small> <small>åå§ååèç»å¥ç«é¢é½ä½¿ç¨ç¸åçèªè¨é¸æã</small> å¥ç¨è³å¨ç³»çµ± ä¸­æ(ç°¡é«) ä¸­æ(ç¹é«) å¨ç³»çµ±éç½®å¤éååçèªè¨æ¯æ´ ç¡æ³å®è£å®æ´èªè¨æ¯æ´ ç¡æ³å®è£å·²é¸åçèªè¨æ¯æ´ è²¨å¹£ï¼ æ¥æï¼ è©³ç´°è³æ ä»¥ä¸åå°åæ£ç¨æ ¼å¼é¡¯ç¤ºæ¸å­ãæ¥æåè²¨å¹£ï¼ ç¡æ³å¥ç¨ã%sãæ ¼å¼é¸æã
è¥æ¨ééä¸éæ°éåãèªè¨
æ¯æ´ãç¯ä¾å¯è½åºç¾ã ç¡æ³ææ¬ä»¥å®è£å¥ä»¶ã å¦æéè¦è¼¸å¥è¼çºè¤éçæå­ï¼å°±éè¦åç¨éååè½ã
ä¾å¦è¦è¼¸å¥ä¸­æãæ¥æãéææè¶åæé½éè¦éååè½ã
Ubuntu å»ºè­°çè¨­å®å¼æ¯ãiBusãã
å¦ææ³è¦ä½¿ç¨å¶ä»è¼¸å¥æ³ç³»çµ±ï¼è«åå®è£ç¸æçå¥ä»¶ï¼ç¶å¾å¨éè£¡é¸ææ³è¦çã èªè¨æ¯æ´æªå®å å®è£æç§»é¤èªè¨... å·²å®è£ å·²å®è£èªè¨ ç¡æ³å®è£æç§»é¤å¥ä»¶ãè«åä»¥ãSynaptic å¥ä»¶ç®¡çå¡ãæå¨çµç«¯æ©å·è¡ãsudo apt-get install -fãä¿®æ­£åé¡ã éµç¤è¼¸å¥æ³ç³»çµ±ï¼ èªè¨ èªè¨æ¯æ´ é¸å®åè¦çªèªè¨ï¼ æ²æèªè¨è³è¨ æ¸å­ï¼ ååæ ¼å¼ å¿ééæ°ååä½æ¥­éæ®µ è¨­å®ç³»çµ±é è¨­èªè¨ è»ä»¶è³æåº«å·²æå£ æäºæé¸èªè¨çç¿»è­¯ææå­å·¥å·æªå®è£ãæ³é¦¬ä¸å®è£åï¼ ç³»çµ±æ¿ç­é²æ­¢è¨­å®é è¨­èªè¨ æé¸èªè¨çæ¯æ´æªæ¡ä¼¼ä¹ä¸å®æ´ãä½ å¯ä»¥ééé»æãç«å»å·è¡æ­¤åä½ãæéï¼ä¸¦éµç§æç¤ºå®è£ç¼ºå°çåä»¶ãæ­¤åä½éè¦ç¶²çµ¡é£ç·ãè¥æ³è¦ç¨å¾å·è¡ï¼è«æ¹ç¨ãèªè¨æ¯æ´ã (é»æé ç«¯åçæå³ç«¯åç¤ºï¼ä¸¦é¸åãç³»çµ±è¨­å®å¼ã...-> ãèªè¨æ¯æ´ã)ã å°æ­¤èªè¨çæ¯æ´ä¸¦æªå®æ´å®è£å¥½ æ°èªè¨è¨­å®æå¨æ¨ç»åºå¾çæã ç³»çµ±æ²æå¯ç¨èªè¨çè³è¨ãæ³é¦¬ä¸é²è¡ä¸æ¬¡ç¶²çµ¡æ´æ°ä¾åå¾åï¼  éå¯è½æ¯ç¨å¼çè­è²ãè«å¨ https://bugs.launchpad.net/ubuntu/+source/language-selector/+filebug æäº¤è­è²å ±å æ­¤è¨­å®åå½±é¿æ¡é¢èæç¨ç¨å¼æè¦é¡¯ç¤ºçèªè¨èä¸æè¨­å®ç³»çµ±ç°å¢ï¼åæ¬è²¨å¹£ãæ¥ææ ¼å¼ç­è¨­å®ãè¥è¦è¨­å®ç³»çµ±ç°å¢ï¼è«ä½¿ç¨ãååæ ¼å¼ãåé çè¨­å®ã
æ­¤èé¡¯ç¤ºæ¬¡åºææ±ºå®æ¡é¢ç°å¢ä½¿ç¨çç¿»è­¯ãè¥å°æªæç¬¬ä¸åèªè¨çç¿»è­¯ï¼æ¥èæåè©¦æ¸å®ä¸­çä¸ä¸åèªè¨ãæ¸å®çæå¾ä¸åé ç®ä¸å®æ¯ãè±æãã
ç³»çµ±ä¸çæãè±æãä»¥ä¸çé ç®ã éæè¨­å®å¦ä¸æ¹æé¡¯ç¤ºçç³»çµ±ç°å¢ï¼ä¸¦ä¸æå½±é¿åå¥½çç´å¼µæ ¼å¼èå¶ä»ååæ§è¨­å®ã
è¥æ³è¦ä»¥èæ­¤ä¸åçèªè¨é¡¯ç¤ºæ¡é¢ï¼è«å¨ãèªè¨ãåé é¸åã
å æ­¤æ¨æè©²å°å®è¨­çºæ¨æå¨ååçåçå¼ã éå¸¸éèæ¨çè»ä»¶å°å­æè»ä»¶ç®¡çå¡çé¯èª¤æéãè«æª¢æ¥æ¨ãè»ä»¶ä¾æºãå§çåå¥½è¨­å® (é»æé ç«¯åçæå³ç«¯åç¤ºï¼ä¸¦é¸åãç³»çµ±è¨­å®å¼ã... -> ãè»ä»¶ä¾æºã)ã å®è£æ°èªè¨å¾ï¼åå¥ç¨æ¶å¯æ¼å¶åèªãèªè¨ãè¨­å®é¸åã å®è£(_I) ç¨å¾åæéæ(_R) æ´æ°(_U) æ¿ä»£çè³æè·¯å¾ åªæª¢æ¥çµ¦äºçå¥ä»¶ -- ä»¥éè "," ééå¥ä»¶åç¨± ä¸è¦é©è­å·²å®è£çèªè¨æ¯æ´ ç¡ è¼¸åºææèªè¨å¶ææå¯ç¨çèªè¨æ¯æ´å¥ä»¶ é¡¯ç¤ºå·²å®è£èæ¬ ç¼ºçå¥ä»¶ ç®æ¨èªè¨ä»£ç¢¼ 