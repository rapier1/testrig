��    E      D  a   l      �  4   �  &   &     M  �   j  $   �  O     "   i      �  #   �  C   �  4       J	  4   b	  =   �	  A   �	  2   
  ;   J
  9   �
  ?   �
  @      B   A  :   �  A   �  :     :   <  6   w  :   �  :   �  <   $  :   a  G   �  P   �  D   5  2   z     �     �  5   �  +     ,   K  4   x  /   �  9   �  :     "   R     u  :   �  :   �  9     7   ;  1   s     �  1   �  !   �       {   9     �     �     �        ,     =   9  .   w  J   �     �  *   �  �   %  9   �  !     V  (  5     '   �     �  �   �  /   �  b   �  #      .   D  .   s  A   �  G  �     ,  I   H  B   �  :   �  ?     D   P  B   �  D   �  F     B   d  C   �  E   �  @   1  @   r  I   �  @   �  @   >  B     @   �  Q     F   U  C   �  3   �        !   2   =   T   5   �   (   �   3   �   =   %!  3   c!  >   �!  &   �!     �!  ;   "  <   Q"  @   �"  =   �"  \   #  '   j#  ?   �#  #   �#  #   �#  l   $     �$      �$     �$     �$  8   �$  K   '%  ?   s%  K   �%     �%  5   &  �   <&  <   �&  &   '        %       5              '       ,       !      =                     3         E          )             /              0       8   *   &   D             ?            -             6   C      2      (       ;   .          #       1       
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
 Project-Id-Version: 1.7.28
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2012-06-30 18:50+0000
PO-Revision-Date: 2010-04-22 17:45+0100
Last-Translator: Alessandro De Zorzi <lota@nonlontano.it>
Language-Team: debian-l10n-italian@lists.debian.org
Language: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
Vedi anche: deborphan(1), orphaner(8)
Segnala bug a: 
Sono disponibili le seguenti opzioni:
 "apt" è stato rimosso. Esco. "apt" non è installato, trovate delle dipendenze interrotte o impossibile aprire il file di lock, sei root? Stampa "apt-get" commandline e esco: "apt-get" è uscito con il codice di errore %s. "apt-get" sta cercando di rimuove più pacchetti di quelli richiesti da orphaner. Uscita in corso. "deborphan" è stato rimosso. Esco. "deborphan" è uscito con un codice di errore. "dialog" è uscito con il codice di errore %s. "find-circular" non è al momento supportato da "orphaner". Esco. %s %s - Cerca i pacchetti dai quali non dipendono altri pacchetti
Software rilasciato nei termini della Artistic License.

QUESTO PACCHETTO È FORNITO "COSÌ COME È" E SENZA ALCUNA GARANZIA
ESPLICITA O IMPLICITA, COMPRESA, SENZA LIMITAZIONI, LA GARANZIA
IMPLICITA DI COMMERCIABILITÀ O DI IDONEITÀ PER UNO SCOPO PARTICOLARE.
 %s: opzione non valida: %s. %s: È necessario che "dialog" sia in $PATH per usare questa interfaccia. --df-keep                   Legge il file "keepers" di debfoster.
 --find-config		    Cerca file di configurazione "orfani".
 --guess-all                 Tenta tutto quello elencato sopra.
 --guess-common              Tenta di elencare i pacchetti "common".
 --guess-data                Tenta di elencare i pacchetti "data".
 --guess-debug               Tenta di elencare le librerie di debug.
 --guess-dev                 Tenta di elencare i pacchtti di sviluppo.
 --guess-doc                 Tenta di elencare i pacchetti di doc.
 --guess-dummy               Tenta di elencare i pacchetti "dummy".
 --guess-interpreters        Tenta di elencare interpreter libraries.
 --guess-kernel              Tenta di elencare i kernel modules.
 --guess-mono                Tenta di elencare le librerie mono.
 --guess-only                Usa soltanto le opzioni --guess specificate.
 --guess-perl                Tenta di elencare le librerie Perl.
 --guess-pike                Tenta di elencare le librerie Pike.
 --guess-python              Tenta di elencare le librerie Python.
 --guess-ruby                Tenta di elencare le librerie Ruby.
 --guess-section              Tenta di elencare le librerie nelle sezioni errate.
 --libdevel                  Cerca in libdevel oltre a libs e oldlibs.
 --no-df-keep                Ignora il file "keepers" di debfoster.
 --no-show-section           Non mostra le sezioni.
 -A PKGS.. Non elenca i PKGS.
 -H        Ignora il flag "hold".
 -L        Mostra i pacchetti che sono esclusi dalla ricerca.
 -P        Mostra la priorità dei pacchetti trovati.
 -R PKGS.. Elimina PKGS dal file "keep".
 -Z        Elimina tutti i pacchetti dal file keep.
 -a        Confronta tutti i pacchetti, non solo le librerie.
 -d        Visualizza i pacchetti che dipendono da.
 -e LIST   Come se i pacchetti in LIST non fossero installati.
 -f FILE   Usa FILE come "statusfile".
 -h        Questo help.
 -k FILE   Usa FILE per gestire l'elenco dei pacchetti kept
 -n        Disabilita check per `raccomanda' e `suggerisce'.
 -n        Abilita il controllo per `raccomanda' e `suggerisce'.
 -p PRIOR  Seleziona solo i pacchetti con priorità >= PRIOR.
 -s        Mostra le sezioni alle quali il pacchetto
                            appartiene.
 -v        Informazioni sulla versione.
 -z        Mostra la dimensione su disco dei pacchetti trovati.
 Disabilita check per `raccomanda'.
 Disabilita check per `suggerisce'.
 Espressamente specificato status file o richiesta di saltare la chiamata "apt-get". Stampa "apt-get" e esce: "Basename" %s non valida. Nessun pacchetto orfano trovato. Premi invio per continuare. Rimozione di %s Monitor troppo piccolo oppure imposta $LINES e $COLUMNS. Vedi orphaner(8) e deborphan(1) per la lista completa delle opzioni valide. Selezionare i pacchetti da rimuovere oppure annulla per uscire: Seleziona i pacchetti che deborphan non deve mai raccomandare di rimuovere: Simula Lo stato del file è probabilmente non valido. Esco.
 Lo stato del file è improprio.
Uno o più paccketti sono segnalati come semi-installati, semi-configurati,
estratti, triggers-awaited o triggers-pending. Esco.
 Sintassi: %s [--help|--purge|--skip-apt] [deborphan options] Sintassi: %s [OPZIONI] [PACCHETTO]...
 