��    E      D  a   l      �  4   �  &   &     M  �   j  $   �  O     "   i      �  #   �  C   �  4       J	  4   b	  =   �	  A   �	  2   
  ;   J
  9   �
  ?   �
  @      B   A  :   �  A   �  :     :   <  6   w  :   �  :   �  <   $  :   a  G   �  P   �  D   5  2   z     �     �  5   �  +     ,   K  4   x  /   �  9   �  :     "   R     u  :   �  :   �  9     7   ;  1   s     �  1   �  !   �       {   9     �     �     �        ,     =   9  .   w  J   �     �  *   �  �   %  9   �  !     �  (  ]     9   |  =   �  Q  �  ?   F  �   �  C     B   c  >   �  �   �  !  i  *   �  s   �  L   *  [   w  x   �  b   L  g   �  l      n   �   s   �   h   g!  |   �!  ^   M"  b   �"  ^   #  b   n#  b   �#  d   4$  b   �$  �   �$  R   �%  Q   �%  F   H&  I   �&  >   �&  �   '  W   �'  B   (  E   D(  R   �(  i   �(  �   G)  \   �)  !   =*  �   _*  �   +  �   �+  a    ,  Q   �,  A   �,  j   -  I   �-  G   �-  �   .  3   �.  4   //  6   d/     �/  [   �/  e   0  ^   s0  m   �0     @1  k   S1  Y  �1  Y   3  D   s3        %       5              '       ,       !      =                     3         E          )             /              0       8   *   &   D             ?            -             6   C      2      (       ;   .          #       1       
           >       A   4   <                 "      	   B   $   :                     9       7       @         +    
See also: deborphan(1), orphaner(8)
Report bugs to: 
The following options are available:
 "apt" got removed.  Exiting. "apt" is not installed, broken dependencies found or could not open lock file, are you root?  Printing "apt-get" commandline and exiting: "apt-get" returned with exitcode %s. "apt-get" tries to remove more packages than requested by "orphaner".  Exiting. "deborphan" got removed.  Exiting. "deborphan" returned with error. "dialog" returned with exitcode %s. "find-circular" is currently not supported by "orphaner".  Exiting. %s %s - Find packages without other packages depending on them
Distributed under the terms of the Artistic License.

THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 %s: Invalid option: %s. %s: You need "dialog" in $PATH to run this frontend. --df-keep                   Read debfoster's "keepers" file.
 --find-config               Find "orphaned" configuration files.
 --guess-all                 Try all of the above.
 --guess-common              Try to report common packages.
 --guess-data                Try to report data packages.
 --guess-debug               Try to report debugging libraries.
 --guess-dev                 Try to report development packages.
 --guess-doc                 Try to report documentation packages.
 --guess-dummy               Try to report dummy packages.
 --guess-interpreters        Try to report interpreter libraries.
 --guess-kernel              Try to report kernel modules.
 --guess-mono                Try to report mono libraries.
 --guess-only                Use --guess options only.
 --guess-perl                Try to report perl libraries.
 --guess-pike                Try to report pike libraries.
 --guess-python              Try to report python libraries.
 --guess-ruby                Try to report ruby libraries.
 --guess-section             Try to report libraries in wrong sections.
 --libdevel                  Search in libdevel in addition to libs and oldlibs.
 --no-df-keep                Do not read debfoster's "keepers" file.
 --no-show-section           Do not show sections.
 -A PKGS.. Never report PKGS.
 -H        Ignore hold flags.
 -L        List the packages that are never reported.
 -P        Show priority of packages found.
 -R PKGS.. Remove PKGS from the "keep" file.
 -Z        Remove all packages from the "keep" file.
 -a        Compare all packages, not just libs.
 -d        Show dependencies for packages that have them.
 -e LIST   Work as if packages in LIST were not installed.
 -f FILE   Use FILE as statusfile.
 -h        This help.
 -k FILE   Use FILE to get/store info about kept packages.
 -n        Disable checks for `recommends' and `suggests'.
 -n        Enable checks for `recommends' and `suggests'.
 -p PRIOR  Select only packages with priority >= PRIOR.
 -s        Show the sections the packages are in.
 -v        Version information.
 -z        Show installed size of packages found.
 Disable checks for `recommends'.
 Disable checks for `suggests'.
 Explicitly specified status file or requested calling "apt-get" to be skipped.  Printing "apt-get" commandline and exiting: Invalid basename: %s. No orphaned packages found. Press enter to continue. Removing %s Screen too small or set $LINES and $COLUMNS. See orphaner(8) and deborphan(1) for a list of valid options. Select packages for removal or cancel to quit: Select packages that should never be recommended for removal in deborphan: Simulate Status file is probably invalid. Exiting.
 The status file is in an improper state.
One or more packages are marked as half-installed, half-configured,
unpacked, triggers-awaited or triggers-pending. Exiting.
 Usage: %s [--help|--purge|--skip-apt] [deborphan options] Usage: %s [OPTIONS] [PACKAGE]...
 Project-Id-Version: deborphan 1.7.28
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2012-06-30 18:50+0000
PO-Revision-Date: 2009-07-13 22:06+0400
Last-Translator: Yuri Kozlov <yuray@komyakino.ru>
Language-Team: Russian <debian-l10n-russian@lists.debian.org>
Language: ru
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: KBabel 1.11.4
Plural-Forms:  nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
 
Смотрите также: deborphan(1), orphaner(8)
Об ошибках сообщать: 
Доступны следующие параметры:
 "apt" был удалён. Завершение работы. "apt" не установлен, обнаружены сломанные зависимости или не удаётся открыть файл блокировки, у вас есть права суперпользователя? Печатается командная строка "apt-get" и работа завершается: Работа "apt-get" завершилась с кодом %s. "apt-get" пытается удалить больше пакетов, чем было запрошено "orphaner". Завершение работы. "deborphan" был удалён. Завершение работы. Работа "deborphan" завершилась с ошибкой. Работа "dialog" завершилась с кодом %s. "find-circular", в настоящее время, не поддерживается "orphaner". Завершение работы. %s %s - ищет пакеты, от которых не зависят другие пакеты
Распространяется на условиях Artistic License.

ЭТОТ ПАКЕТ ПРЕДОСТАВЛЯЕТСЯ "КАК ЕСТЬ", БЕЗ КАК-ЛИБО ЯВНЫХ ИЛИ
ПОДРАЗУМЕВАЕМЫХ ГАРАНТИЙ, ВКЛЮЧАЯ, НО НЕ ОГРАНИЧИВАЯСЬ, ПОДРАЗУМЕВАЕМЫМИ
ГАРАНТИЯМИ КОММЕРЧЕСКОЙ ЦЕННОСТИ И ПРИГОДНОСТИ ДЛЯ КОНКРЕТНОЙ ЦЕЛИ.
 %s: неверный параметр: %s. %s: для работы требуется программа "dialog" в одном из каталогов $PATH. --df-keep                   читать файл "keepers" от debfoster.
 --find-config               найти "брошенные" файлы настройки.
 --guess-all                 попытаться сообщить обо всём, перечисленном выше.
 --guess-common              попытаться сообщить об общих пакетах.
 --guess-data                попытаться сообщить о пакетах с данными.
 --guess-debug               попытаться сообщить о библиотеках отладки.
 --guess-dev                 попытаться сообщить о пакетах разработчика.
 --guess-doc                 попытаться сообщить о пакетах с документацией.
 --guess-dummy               попытаться сообщить о фиктивных пакетах.
 --guess-interpreters        попытаться сообщить о библиотеках интерпретаторов.
 --guess-kernel              попытаться сообщить о модулях ядра.
 --guess-mono                попытаться сообщить о библиотеках mono.
 --guess-only                использовать только параметры --guess.
 --guess-perl                попытаться сообщить о библиотеках perl.
 --guess-pike                попытаться сообщить о библиотеках pike.
 --guess-python              попытаться сообщить о библиотеках python.
 --guess-ruby                попытаться сообщить о библиотеках ruby.
 --guess-section             попытаться сообщить о библиотеках в неправильных
                            разделах.
 --libdevel                  поиск в libdevel, помимо libs и oldlibs.
 --no-df-keep                не читать файл "keepers" от debfoster.
 --no-show-section           не показывать разделы.
 -A СПИС.. не сообщать о пакетах из СПИСКА.
 -H        игнорировать флаг фиксации.
 -L        показать список пакетов, о которых никогда не
                            сообщается.
 -P        показывать приоритеты найденных пакетов.
 -R ПКТЫ...Удалить ПАКЕТЫ из файла "keep".
 -Z        удалить все пакеты из файла "keep".
 -a        сравнивать все пакеты, а не только в libs.
 -d        показывать зависимости пакетов, у которых они есть.
 -e СПИСОК работать, как если бы пакеты из СПИСКА не были
                            установлены.
 -f ФАЙЛ   использовать ФАЙЛ вместо файла состояния.
 -h        эта справка.
 -k ФАЙЛ   использовать ФАЙЛ для получен/хранен данных об
                            удержанных пакетах.
 -n        выключить проверки для 'рекомендуемых' и
                            'предлагаемых'.
 -n        включить проверки для 'рекомендуемых' и
                            'предлагаемых'.
 -p ПРИОР  выбрать пакеты только с приоритетом >= ПРИОР.
 -s        показывать разделы найденных пакетов.
 -v        показать информацию о версии.
 -z        показывать размер найденных установленных пакетов.
 Выключить проверки для 'рекомендуемых'.
 Выключить проверки для 'предлагаемых'.
 Явно указанный файл состояния или запрашиваемый вызов "apt-get" пропущен. Печатается командная строка "apt-get" и работа завершается: Неправильное базовое имя: %s. Брошенные пакеты не найдены. Чтобы продолжить, нажмите enter. Удаляется %s Слишком маленький экран, или настройте $LINES и $COLUMNS. Список возможных параметров смотрите в orphaner(8) и deborphan(1). Выберите пакеты для удаления или отмены при выходе: Выберите пакеты, которые не нужно рекомендовать к удалению: Симуляция Возможно, некорректный файл состояния. Завершение работы.
 Испорчен файл состояния.
Один или более пакетов помечены как частично установленные, частично
настроенные, распакованные, выполняют или ожидание выполнения триггеров.
Завершение работы.
 Использование: %s [--help|--purge|--skip-apt] [параметры deborphan] Использование: %s [ПАРАМЕТРЫ] [ПАКЕТ]...
 