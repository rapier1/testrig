��    E      D  a   l      �  4   �  &   &     M  �   j  $   �  O     "   i      �  #   �  C   �  4       J	  4   b	  =   �	  A   �	  2   
  ;   J
  9   �
  ?   �
  @      B   A  :   �  A   �  :     :   <  6   w  :   �  :   �  <   $  :   a  G   �  P   �  D   5  2   z     �     �  5   �  +     ,   K  4   x  /   �  9   �  :     "   R     u  :   �  :   �  9     7   ;  1   s     �  1   �  !   �       {   9     �     �     �        ,     =   9  .   w  J   �     �  *   �  �   %  9   �  !     X  (  =   �  ,   �  #   �  �     0   �  ]   �  )   W  "   �  /   �  W   �  �   ,     �  G     L   M  L   �  4   �  ?     >   \  ?   �  A   �  E     @   c  D   �  <   �  F   &  :   m  C   �  C   �  E   0  C   v  L   �  N     N   V  .   �  )   �  -   �  ;   ,   2   h   4   �   <   �   5   !  <   C!  `   �!  0   �!     "  g   ."  G   �"  I   �"  5   (#  <   ^#     �#  ?   �#  *   �#  '   $$  �   L$      �$  $   �$  $   %     B%  F   T%  ?   �%  H   �%  S   $&  	   x&  8   �&  �   �&  <   �'  "   �'        %       5              '       ,       !      =                     3         E          )             /              0       8   *   &   D             ?            -             6   C      2      (       ;   .          #       1       
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
 Project-Id-Version: deborphan
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2012-06-30 18:50+0000
PO-Revision-Date: 2010-11-26 21:51+0100
Last-Translator: Miroslav Kure <kurem@debian.cz>
Language-Team: Czech <debian-l10n-czech@lists.debian.org>
Language: cs
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
Viz též: deborphan(1), orphaner(8)
Chyby hlaste na adresu: 
K dispozici jsou následující parametry:
 „apt“ byl odstraněn. Končím. „apt“ není nainstalován, byly nalezeny porušené závislosti, nebo se nepodařilo otevřít zámkový soubor. Jste root? Vypisuji příkazový řádek „apt-get“ a končím: „apt-get“ skončil s návratovým kódem %s. „apt-get“ se pokouší odstranit víc balíků, než „orphaner“ vyžadoval. Končím. „deborphan“ byl odstraněn. Končím. „deborphan“ skončil s chybou. „dialog“ skončil s návratovým kódem %s. „find-circular“ není momentálně nástrojem „orphaner“ podporován. Končím. %s %s - Hledá balíky, na nichž nezávisí jiné instalované balíky
Distribuovaný pod podmínkami licence Artistic.

TENTO BALÍK JE POSKYTOVÁN „TAK JAK JE“ BEZ JAKÉKOLIV ZÁRUKY.
 %s: Neplatná volba: %s. %s: Pro spuštění programu musíte mít v $PATH cestu k „dialog“. --df-keep                   Načte soubor „keepers“ programu debfoster.
 --find-config               Najde „opuštěné“ konfigurační soubory.
 --guess-all                 Zkusí vše zmíněné.
 --guess-common              Zkusí nahlásit běžné balíky.
 --guess-data                Zkusí nahlásit datové balíky.
 --guess-debug               Zkusí nahlásit ladicí knihovny.
 --guess-dev                 Zkusí nahlásit balíky pro vývoj.
 --guess-doc                 Zkusí nahlásit balíky s dokumentací.
 --guess-dummy               Zkusí nahlásit prázdné balíky.
 --guess-interpreters        Zkusí nahlásit knihovny interpretrů.
 --guess-kernel              Zkusí nahlásit moduly jádra.
 --guess-mono                Zkusí nahlásit knihovny platformy mono.
 --guess-only                Použije pouze volby --guess.
 --guess-perl                Zkusí nahlásit knihovny jazyka perl.
 --guess-pike                Zkusí nahlásit knihovny jazyka pike.
 --guess-python              Zkusí nahlásit knihovny jazyka python.
 --guess-ruby                Zkusí nahlásit knihovny jazyka ruby.
 --guess-section             Zkusí nahlásit knihovny v chybných sekcích.
 --libdevel                  Kromě sekcí libs a oldlibs hledá i v libdevel.
 --no-df-keep                Nenačte soubor „keepers“ programu debfoster.
 --no-show-section           Nezobrazí sekce.
 -A BALÍKY Nikdy nebude hlásit BALÍKY.
 -H        Ignoruje příznak pro podržení.
 -L        Zobrazí balíky, které nejsou nikdy hlášeny.
 -P        Zobrazí prioritu nalezených balíků.
 -R BALÍKY Odstraní BALÍKY ze souboru „keep“.
 -Z        Odstraní všechny balíky ze souboru „keep“.
 -a        Porovná všechny balíky, nejen knihovny.
 -d        Zobrazí závislosti u balíků, které je mají.
 -e SEZNAM Pracuje, jako by balíky v SEZNAMu nebyly
                            nainstalované.
 -f SOUBOR Jako stavový soubor použije SOUBOR.
 -h        Tato nápověda.
 -k SOUBOR K získání informací o držených balících použije
                            SOUBOR.
 -n        Nebude kontrolovat „doporučované“ a „navrhované“.
 -n        Povolí kontrolu „doporučovaných“ a „navrhovaných“.
 -p PRIOR  Vybere pouze balíky s prioritou >= PRIOR.
 -s        Zobrazí sekce, ve kterých se balíky nachází.
 -v        Informace o verzi.
 -z        Zobrazí instalovanou velikost nalezených balíků.
 Zakáže kontrolu „doporučovaných“.
 Zakáže kontrolu „navrhovaných“.
 Explicitně zadaný stavový soubor nebo volání „apt-get“ bude přeskočeno. Vypisuji příkazový řádek „apt-get“ a končím: Neplatné základní jméno: %s. Nebyly nalezeny opuštěné balíky. Pro pokračování stiskněte enter. Odstraňuje se %s Obrazovka je příliš malá, nebo musíte nastavit $LINES a $COLUMNS. Seznam platných voleb naleznete v  orphaner(8) a deborphan(1). Vyberte balíky pro odstranění, nebo použijte Zrušit pro ukončení: Vyberte balíky, které by nikdy neměly být deborphanem nabízeny k odstranění: Simulovat Stavový soubor je pravděpodobně neplatný. Končím.
 Stavový soubor se není v konzistentním stavu.
Jeden nebo více balíků jsou označeny jako částečně nainstalované,
částečně nakonfigurované, rozbalené nebo očekávající zpracování
spouštěčů. Končím.
 Použití: %s [--help|--purge|--skip-apt] [volby deborphanu] Použití: %s [VOLBY] [BALÍK]...
 