��    E      D  a   l      �  4   �  &   &     M  �   j  $   �  O     "   i      �  #   �  C   �  4       J	  4   b	  =   �	  A   �	  2   
  ;   J
  9   �
  ?   �
  @      B   A  :   �  A   �  :     :   <  6   w  :   �  :   �  <   $  :   a  G   �  P   �  D   5  2   z     �     �  5   �  +     ,   K  4   x  /   �  9   �  :     "   R     u  :   �  :   �  9     7   ;  1   s     �  1   �  !   �       {   9     �     �     �        ,     =   9  .   w  J   �     �  *   �  �   %  9   �  !     �  (  G   '  $   o  %   �  �   �  -   s  W   �  *   �  &   $  ,   K  >   x  :  �     �  =     ?   N  G   �  <   �  H     A   \  J   �  G   �  E   1  H   w  J   �  ?     @   K  9   �  A   �  B     C   K  D   �  V   �  G   +   D   s   0   �   '   �   '   !  <   9!  '   v!  3   �!  6   �!  =   	"  :   G"  c   �"  (   �"     #  e   %#  <   �#  ;   �#  8   $  #   =$     a$  1   �$  "   �$  $   �$     �$     {%  &   �%  +   �%     �%  :   �%  A   /&  :   q&  K   �&  	   �&  8   '  �   ;'  9   0(      j(        %       5              '       ,       !      =                     3         E          )             /              0       8   *   &   D             ?            -             6   C      2      (       ;   .          #       1       
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
 Project-Id-Version: deborphan 1.7.18nReport-Msgid-Bugs-To: 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2012-06-30 18:50+0000
PO-Revision-Date: 2010-11-27 10:08+0100
Last-Translator: Robert Luberda < <robert@debian.org>
Language-Team: Polish <debian-l10n-polish@lists.debian.org>>
Language: pl
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: Lokalize 1.0
Plural-Forms:  nplurals=3; plural=(n==1 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
 
Patrz także: deborphan(1), orphaner(8)
Proszę zgłaszać błędy do: 
Dostępne są następujące opcje:
 "apt" zostało usunięte. Kończenie. "apt" nie jest zainstalowane, znaleziono popsute zależności lub nie powiodło się otwarcie pliku blokady, jesteś administratorem? Wypisywanie linii poleceń "apt-get" i kończenie: "apt-get" zakończył się kodem wyjścia %s. "apt-get" próbuje usunąć więcej pakietów, niż polecił mu "orphaner". Kończenie. "deborphan" został usunięty. Kończenie. "deborphan" zakończył się błędem. "dialog" zakończył się kodem wyjścia %s. "orphaner" nie obsługuje obecnie "find-circular". Kończenie. %s %s - Znajduje pakiety, których nie wymagają żadne inne pakiety
Distributed under the terms of the Artistic License.

THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 %s: Nieprawidłowa opcja: %s. %s: Ten interfejs wymaga programu "dialog" w ścieżce $PATH. --df-keep                   Czytaj plik zatrzymań debfostera.
 --find-config               Znajdź "osierocone" pliki konfiguracyjne.
 --guess-all                 Próbuj wszystkich powyższych.
 --guess-common              Próbuj zgłaszać pakiety współdzielone.
 --guess-data                Próbuj zgłaszać pakiety z danymi.
 --guess-debug               Próbuj zgłaszać biblioteki do debugowania.
 --guess-dev                 Próbuj zgłaszać pakiety "developement".
 --guess-doc                 Próbuj zgłaszać pakiety dokumentacji.
 --guess-dummy               Próbuj zgłaszać pakiety "puste" (dummy).
 --guess-interpreters        Próbuj zgłaszać biblioteki interpreterów.
 --guess-kernel              Próbuj zgłaszać moduły jądra.
 --guess-mono                Próbuj zgłaszać biblioteki Mono.
 --guess-only                Używaj tylko opcji --guess.
 --guess-perl                Próbuj zgłaszać biblioteki Perla.
 --guess-pike                Próbuj zgłaszać biblioteki Pike'a.
 --guess-python              Próbuj zgłaszać biblioteki Pythona.
 --guess-ruby                Próbuj zgłaszać biblioteki Ruby'ego.
 --guess-section             Próbuj zgłaszać biblioteki w niewłaściwych sekcjach.
 --libdevel                  Szukaj w libdevel, oprócz libs i oldlibs.
 --no-df-keep                Nie czytaj pliku zatrzymań debfostera.
 --no-show-section           Nie pokazuj sekcji.
 -A PKT..  Nie zgłaszaj pakietów PKT.
 -H        Ignoruj flagę "wstrzymany".
 -L        Wypisuj pakiety, które nie są nigdy zgłaszane.
 -P        Pokaż priorytety pakietów.
 -R PKT..  Usuń podane pakiety z pliku zatrzymań.
 -Z        Usuń wszystkie pakiety z pliku zatrzymań.
 -a        Porównaj wszystkie pakiety, nie tylko biblioteki.
 -d        Pokaż zależności pakietów, które je mają.
 -e LISTA  Działaj tak, jakby pakiety z LISTA nie były
                            zainstalowane.
 -f PLIK   Użyj PLIKU jako pliku stanu.
 -h        Ten tekst.
 -k PLIK   Przechowuj informacje na temat zatrzymanych pakietów
                            w PLIKU.
 -n        Wyłącz sprawdzanie "polecania" i "sugerowania".
 -n        Włącz sprawdzanie "polecania" i "sugerowania".
 -p PRIOR  Wybierz tylko pakiety z priorytetem >= PRIOR.
 -s        Pokaż sekcje pakietów.
 -v        Informacja o wersji.
 -z        Wyświetl rozmiar wyszukanego pakietu.
 Wyłącz sprawdzanie "polecania".
 Wyłącz sprawdzanie "sugerowania".
 Wyraźnie podano plik stanu lub zażądano pominięcia wywołania "apt-get". Wypisywanie linii poleceń "apt-get" i kończenie: Nieprawidłowa nazwa: %s. Nie znaleziono osieroconych pakietów. Proszę nacisnąć enter, aby kontynuować. Usuwanie %s Ekran jest za mały - spróbuj ustawić $LINES i $COLUMNS. Opcje można znaleźć w podręczniku orphaner(8) i deborphan(1). Wybierz pakiety do usunięcia lub anuluj, aby zakończyć: Wybierz pakiety, których usunięcia deborphan nigdy nie powinien zalecać: Symulacja Prawdopodobnie plik stanu jest niepoprawny. Kończenie.
 Stan pliku statusu jest w nieprawidłowy.
Jeden lub więcej pakietów jest oznaczonych jako w połowie zainstalowanych,
w połowie skonfigurowanych, rozpakowanych, oczekujących na wyzwalacze
lub w trakcie przetwarzania wyzwalaczy. Kończenie.
 Użycie: %s [--help|--purge|--skip-apt] [opcje deborphan] Użycie: %s [OPCJE] [PAKIET]...
 