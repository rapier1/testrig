��    c      4  �   L      p     q  ]   �  .   �  1   	  1   P	  (   �	  "   �	  '   �	  -   �	     $
     6
  *   I
  )   t
     �
     �
  B   �
  >     S   O     �  2   �     �  U     S   Y     �     �  6   �          8  /   R  #   �     �  j   �  <   -  (   j  *   �  )   �  /   �  .        G  .   Z  3   �  +   �  &   �       #   .     R     d     w  #   �  (   �  #   �  (   �  #   #  �   G        �   8  �         �  �   �     7     O      c  :   �  ?   �  :   �  .   :  9   i  ?   �  0   �  9     K   N     �  *   �  %   �  8     $   A  '   f  *   �  *   �     �  @   �  '   -     U     o  '   �  '   �  5   �  5     !   C  M   e  !   �     �     �            {   0     �     �  
  �     �  ^   �  6   Y  ?   �  <   �  -     '   ;  (   c  5   �     �     �  1   �  .        I     f  >   �  >   �  a   �     `   6   z      �   `   �   T   *!     !     �!  2   �!  %   �!     "  *   1"  4   \"     �"  n   �"  I   #  %   g#  !   �#  *   �#  $   �#  ,   �#     ,$  /   >$  .   n$  "   �$  &   �$     �$      %     #%     4%     B%     Y%  #   y%  "   �%  -   �%  ,   �%  �   &     �&  �   �&  ~   �'     $(  �   7(     �(     )     )  >   6)  :   u)  6   �)  ,   �)  9   *  D   N*  7   �*  B   �*  H   +     W+  3   u+  7   �+  :   �+  1   ,  +   N,  &   z,  6   �,     �,  U   �,  ,   5-      b-     �-  %   �-  %   �-  3   �-  3   .     S.  W   s.     �.     �.     
/     /     //  y   J/     �/     �/     .   :          1       [      B          M   <   %       
   C          !   S   ?       7   T      (                   ]         b   #       -   c      G   X   &   +   )              U       P   `   O       D   W   J   Y   	                  "       ^   N   3      \   6      L                 F   I   $   5   8              V   R   =   K               ,   /      H       Q       @              _   >                 E       0                                '           4       A   ;   a   9   Z       *   2            -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- decodes the file and cats it to standard out   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume  (NOT supported)
  (using %i:%i:%i)
  -- Supports block sizes of %i to %i bytes  -- Supports key lengths of %i to %i bits  -- block size %i bytes  -- key length %i bits %s (root dir)
  -- displays information about the filesystem, or 
 -------------------------- WARNING --------------------------
 A really old EncFS filesystem was found. 
It is not supported in this EncFS build.
 Block Size: %i bytes Block Size: %i bytes, including %i byte MAC header Build: encfs version %s Config subversion %i found, but this version of encfs only supports up to version %i. Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. Each file contains 8 byte header with unique IV data.
 Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error saving modified config file.
 Example: 
%s info ~/.crypt
 External chained IV disabled, as both 'IV chaining'
and 'unique IV' features are required for this option. Failure generating new volume key! Please report this error. File data IV is chained to filename IV.
 Filenames encoded using IV chaining mode.
 Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits MAC comparison failure in block %li MAC comparison failure, refusing to read Manual configuration mode selected. Missing one or more arguments, aborting. Name coding interface not supported Now you will need to enter a password for your filesystem.
You will need to remember this password, as there is absolutely
no recovery mechanism.  However, the password can be changed
later using encfsctl.

 Paranoia configuration selected. Please choose from one of the following options:
 enter "x" for expert configuration mode,
 enter "p" for pre-configured paranoia mode,
 anything else, or an empty line will select standard mode.
?>  Please select a key size in bits.  The cipher you have chosen
supports sizes from %i to %i bits in increments of %i bits.
For example:  Remount failed Select a block size in bytes.  The cipher you have chosen
supports sizes from %i to %i bytes in increments of %i.
Or just hit enter for the default (%i bytes)
 Selected algorithm "%s" Selected key size:  Standard configuration selected. The configuration loaded is not compatible with --reverse
 The directory "%s" does not exist. Should it be created? (y,N)  The filename encoding interface requested is not available The following cipher algorithms are available: The following filename encoding algorithms are available: The raw directory may not be a subdirectory of the mount point. The requested cipher interface is not available
 The requested filename coding interface is not available
 This version of EncFS doesn't support filesystems created before 2004-08-13 Unable to create directory:  Unable to find cipher %s, version %i:%i:%i Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to load or parse config file
 Unable to locate mount point, aborting. Unable to locate root directory, aborting. Unmounting filesystem %s due to inactivity Usage:
 Usage: %s [options] rootDir mountPoint [-- [FUSE Mount Options]] Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Version 6 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 When specifying daemon mode, you must use absolute paths (beginning with '/') Zero length password not allowed
 directory %s does not exist.
 encfs version %s encfsctl version %s filesystem block size:  fuse failed.  Common problems:
 - fuse kernel module not installed (modprobe fuse)
 - invalid options -- see usage message
 getopt error: %i invalid command: "%s" Project-Id-Version: Encrypted Filesystem for Linux
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2010-05-06 07:43+0000
Last-Translator: Fredrik Sudmann <fsudmann@gmail.com>
Language-Team: Bokmål, Norwegian <nb@li.org>
Language: nb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- bytt passord for volum   -- endre passord for volum, tar passord fra standard input.
	Ingen tilbakemelding blir gitt.   -- dekoder navn og skriver ut versjon i vanlig tekst   -- dekoder filen og sender utdata med cat til standard utdata   -- dekrypterer et volum og skriver resultatet til filstien   -- enkoder et filnavn og printer resultatet   -- skriv ut versjonsnummer og avslutt   -- vis informasjon (standard kommando)   -- vis filnavn som ikke kan dekodes i dette volumet  (IKKE støttet)
  (bruker %i:%i:%i)
  -- Støtter blokkstørrelser fra %i til %i bytes  -- Støtter nøkkellengder fra %i til %i bits  -- blokkstørrelse %i bytes  -- nøkkellengde %i bits %s (rotkatalog)
  -- viser informasjon om filsystemet, eller 
 ------------------------- ADVVARSEL -------------------------
 Et veldig gammelt EncFS-filsystem ble funnet. 
Det er ikke støttet av denne versjonen av EncFS.
 Blokkstørrelse: %i bytes Blokkstørrelse: %i bytes, inkludert %i bytes MAC-hode Build: encfs versjon %s Konfigurasjosversion %i funnet, men denne versjonen av encfs støtter bare versjoner opp til %i. Konfigurasjonen er fullført. Filsystemet som opprettes vil ha
følgende egenskaper: Oppretter nytt kryptert volum. Katalog ble ikke opprettet. Hver fil inneholder 8-bytes hode med unik IV-data
 Oppgi eksisterende passord for EncFS
 Oppgi nytt passord for EncFS
 Skriv inn tallet som står til ditt valg:  Feil under lagring av modifisert konfigurasjonsfil.
 Eksempel: 
%s info ~/.crypt
 Ekstern lenket IV slått av ettersom både 'IV lenking'
og 'Unik IV' funksjonene trengs for denne operasjonen. Feil ved generering av ny volum nøkkel! venligst rapporter denne feilen. Fildata-IV er lenket med filnavn-IV.
 Filnavn kodet med IV-kjedemodus.
 Filsystemchiffer: «%s», versjon %i:%i:%i For mer informasjon, se man encfs(1) Fant %i ugyldig fil. Fant %i ugyldige filer. I katalogen %s: 
 Ugyldig antall argumenter for kommandoen «%s» Intern feil: Fanget unntak fra hovedløkke: %s Intern feil: Fanget uventet unntak Intern feil: kunne ikke kjøre program Intern feil: fork() feilet Intern feil: socketpair() feilet Ugyldig passord
 Ugyldig valg. Nøkkellengde: %i bits MAC-kompresjonsfeil i blokk %li MAC-kompresjonsfeil, nekter å lese Manuelt konfigurasjonsmodus valgt. Mangler ett eller flere argumenter, avbryter. Grensesnittet for navnkoding er ikke søttet Nå må du oppgi et passord for filsystemet ditt.
Det er ingen gjenopprettingsmekanismer, så det er
viktig at du husker dette. Passordet kan senere 
endres med encfsctl.

 Paranoiakonfigurasjon valgt. Vennligst velg mellom følgende opsoner:
Trykk "x" for ekspert konfigurasjonsmodus
Trykk "p" for forhåndskonfigurert paranoiamodus
Hva som helst ellers, eller tom linje for standardmodus
?>  Velg en nøkkellengde i bits. Chifferet du har valgt
støtter størrelser fra %i til %i bits i steg á %i bits.
For eksempel:  Remontering feilet Velg en blokkstørrelse i bytes. Chifferet du har valgt
støtter størrelser fra %i til %i bytes i steg á %i bytes.
Eller trykk enter for å bruke standardstørrelsen (%i bytes).
 Valgt algoritme «%s» Valgt nøkkellengde:  Standardkonfigurasjon valgt. Innstillingene som er lastet er ikke kompatible med --reverse
 Katalogen "%s" eksisterer ikke. Skal den opprettes? (y,N)  Grensesnittet for å kode filnavn er ikke tilgjengelig Følgende cipheralgoritmer er tilgjengelige: De følgende filnavnkondingsalgoritmene er tilgjengelige: Råmappen er ikke nødvendigvis en undermappe for monteringspunktet. Det ønskede chiffergrensesnittet er ikke tilgjengelig
 Det ønskede grensesnittet for filnavnkoding er ikke tilgjengelig
 Denne versjonen av EncFS støtter ikke filsystemer laget før 13/08-2004 Kunne ikke opprette katalog:  Klarer ikke å finne chifferet %s, versjon %i:%i:%i Klarte ikke å finne det spesifiserte chifferet «%s»
 Kunne ikke initialisere kryptert filsystem - sjekk banen.
 Kunne ikke åpne eller parse konfigurasjonsfilen
 Kunne ikke finne monteringspunkt, avbryter. Kunne ikke finne rotkatalog, avbryter. Avmonterer filsystemet «%s» siden det ikke er i bruk Bruk:
 Bruk: %s [alternativer] rotkatalog monteringpunkt[-- [FUSE monteringersalternativer]] Bruker filsystemblokkstørrelse på %i bytes Bruker nøkkellengde på %i bits Bekreft passord for EncFS:  Versjon 3-konfigurasjon; laget av %s
 Versjon 4-konfigurasjon; laget av %s
 Versjon 5-konfigurasjon; laget av %s (revisjon %i)
 Versjon 6-konfigurasjon. Laget av %s (revisjon %i)
 Volum Nøkkelen ble oppdatert.
 Når du spesifiserer tjener modus, så må du bruke absolutte baner (startende med '/') Blankt passord er ikke tillatt
 katalogen %s eksisterer ikke.
 encfs versjon %s encfsctl versjon %s filsystemblokkstørrelse:  FUSE feilet. Vanlige problemer:
 - kjernemodulen er ikke installert (modprobe fuse)
 - ugydlige valg -- se hjelpemelding
 getopt-feil: %i ugyldig kommando: "%s" 