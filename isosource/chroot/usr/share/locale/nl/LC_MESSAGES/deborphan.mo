��    C      4  Y   L      �  4   �  &   �       �   *  $   �  O   �  "   )      L  #   m  4  �     �  4   �  =   	  A   Q	  2   �	  ;   �	  9   
  ?   <
  @   |
  B   �
  :      A   ;  :   }  :   �  6   �  :   *  :   e  <   �  :   �  G     P   `  D   �  2   �     )     G  5   e  +   �  ,   �  4   �  /   )  9   Y  :   �  "   �     �  :     :   B  9   }  7   �  1   �     !  1   A  !   s     �  {   �     1     G     c     |  ,   �  =   �  .   �  J   "     m  �   v  9     !   W  l  y  D   �  &   +  0   R  �   �  #   0  `   T  6   �  "   �  "     B  2     u  @   �  F   �  D     9   [  G   �  B   �  I      G   j  J   �  C   �  M   A  C   �  F   �  :     F   U  F   �  H   �  F   ,  q   s  I   �  K   /  2   {  !   �  "   �  <   �  5   0   1   f   ;   �   >   �   $   !  c   8!  *   �!     �!  t   �!  ]   R"  @   �"  >   �"  ,   0#     ]#  _   {#  (   �#  '   $  �   ,$     �$  "   �$     
%     )%  .   F%  H   u%  B   �%  G   &     I&  �   R&  :   .'  !   i'     <            0       &          1   9   (                       %   /   :      ,   )                    ;      3   6   8   4              	      =   -              #   $           '       .   C      B      5       +   A   !       *                 @   2   ?   7   "                          
   >                             
See also: deborphan(1), orphaner(8)
Report bugs to: 
The following options are available:
 "apt" got removed.  Exiting. "apt" is not installed, broken dependencies found or could not open lock file, are you root?  Printing "apt-get" commandline and exiting: "apt-get" returned with exitcode %s. "apt-get" tries to remove more packages than requested by "orphaner".  Exiting. "deborphan" got removed.  Exiting. "deborphan" returned with error. "dialog" returned with exitcode %s. %s %s - Find packages without other packages depending on them
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
 Explicitly specified status file or requested calling "apt-get" to be skipped.  Printing "apt-get" commandline and exiting: Invalid basename: %s. No orphaned packages found. Press enter to continue. Removing %s Screen too small or set $LINES and $COLUMNS. See orphaner(8) and deborphan(1) for a list of valid options. Select packages for removal or cancel to quit: Select packages that should never be recommended for removal in deborphan: Simulate The status file is in an improper state.
One or more packages are marked as half-installed, half-configured,
unpacked, triggers-awaited or triggers-pending. Exiting.
 Usage: %s [--help|--purge|--skip-apt] [deborphan options] Usage: %s [OPTIONS] [PACKAGE]...
 Project-Id-Version: deborphan 1.7.23
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2012-06-30 18:50+0000
PO-Revision-Date: 2008-07-31 18:04+0200
Last-Translator: Thijs Kinkhorst <thijs@debian.org>
Language-Team: Debian l10n Dutch <debian-l10n-dutch@lists.debian.org>
Language: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
Zie ook: deborphan(1), orphaner(8)
Meld fouten (in het Engels) aan: 
De volgende opties zijn beschikbaar:
 apt werd verwijderd; bewerking wordt afgebroken. apt is niet geïnstalleerd, er zijn defecte vereisten geconstateerd of kon lockfile niet openen; bent u wel root? Bewerking wordt afgebroken; dit is de apt-get commandline: "apt-get" sloot af met foutcode %s. "apt-get" wil meer pakketten verwijderen dan gevraagd door orphaner. Bewerking wordt afgebroken. deborphan werd verwijderd; bewerking wordt afgebroken. "deborphan" sloot af met een fout. "dialog" sloot af met foutcode %s. %s %s - Vind pakketten zonder pakketten die er afhankelijk van zijn.
Gedistribueerd onder de voorwaarden van de Artistic License.

THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 %s: Ongeldige optie: %s. %s: "dialog" moet in $PATH staan om deze interface te gebruiken. --df-keep                   Lees het "keepers"-bestand van debfoster.
 --find-config               Vind "verweesde" configuratiebestanden.
 --guess-all                 Probeer al het bovenstaande.
 --guess-common              Probeer gedeelde pakketten te rapporteren.
 --guess-data                Probeer datapakketten te rapporteren.
 --guess-debug               Probeer ontkeverbibliotheken te rapporteren.
 --guess-dev                 Probeer ontwikkelpakketten te rapporteren.
 --guess-doc                 Probeer documentatiepakketten te rapporteren.
 --guess-dummy               Probeer dummypakketten te rapporteren.
 --guess-interpreters        Probeer interpreter-bibliotheken te rapporteren.
 --guess-kernel              Probeer kernel modules te rapporteren.
 --guess-mono                Probeer mono-bibliotheken te rapporteren.
 --guess-only                Gebruik enkel --guess-opties.
 --guess-perl                Probeer perl-bibliotheken te rapporteren.
 --guess-pike                Probeer pike-bibliotheken te rapporteren.
 --guess-python              Probeer python-bibliotheken te rapporteren.
 --guess-ruby                Probeer ruby-bibliotheken te rapporteren.
 --guess-section             Probeer pakketten in de verkeerde sectie te
                            rapporteren.
 --libdevel                  Doorzoek naast libs en oldlibs ook libdevel.
 --no-df-keep                Lees het "keepers"-bestand van debfoster niet.
 --no-show-section           Toon de secties niet.
 -A PKGS.. Rapporteer PKGS nooit.
 -H        Negeer hold-indicaties.
 -L        Toon de pakketten die nooit gerapporteerd worden.
 -P        Toon de prioriteit van gevonden pakketten.
 -Z        Verwijder PKGS van het "keep"-bestand.
 -Z        Verwijder alle pakketten uit het "keep" bestand.
 -a        Vergelijk alle pakketten, niet alleen bibliotheken.
 -d        Toon eventuele vereisten.
 -e LIJST  Handel alsof de pakketten in LIJST niet
                            geïnstalleerd zijn.
 -f FILE   Gebruik FILE als statusbestand.
 -h        Deze hulp.
 -k FILE   FILE gebruiken voor het lezen/bewaren van
                            informatie over behouden pakketten.
 -n        Schakel controles voor `recommends' en `suggests'
                            uit.
 -n        Schakel controles voor `recommends' en `suggests' in.
 -p PRIOR  Selecteer alleen pakketten met prioriteit >= PRIOR.
 -s        Toon de secties van de pakketten.
 -v        Versie-informatie.
 -z        Toon de geïnstalleerde groottes van gevonden
                            pakketten.
 Schakel controles voor `recommends' uit
 Schakel controles voor `suggests' uit.
 Het status-bestand werd expliciet opgegeven of er werd verzocht om de "apt-get"-aanroep over te slaan. Bewerking wordt afgebroken; dit is de apt-get commandline: Ongeldige basisnaam: %s. Geen verweesde pakketten gevonden. Druk op enter om door te gaan. Bezig met verwijderen van %s Scherm te klein of stel $LINES en $COLUMNS in. Raadpleeg orphaner(8) en deborphan(1) voor een lijst met geldige opties. Selecteer pakketten om te verwijderen of "afbreken" om te stoppen: Selecteer pakketten die deborphan nooit voor verwijdering mag aanraden: Simuleer Het status-bestand is in een inconsistente toestand. Een of meer pakketten zijn gemarkeerd als half-geïnstalleerd, half-geconfigureerd, uitgepakt, wachtend-op-triggers of triggers-wachtend. Bewerking wordt afgebroken.
 Gebruik: %s [--help|--purge|--skip-apt] [deborphan-opties] Gebruik: %s [OPTIES] [PAKKET]...
 