��    R      �  m   <      �     �  ]     .   o  1   �  1   �  (     "   +  '   N  -   v  �   �    ;	     J
     \
  *   o
  )   �
     �
     �
  B   �
  >   6  S   u     �  )   �  2        ;  �   S  U   !  S   w     �     �  6        8     I     g  /   �  #   �     �  <   �  (   .  /   W  .   �     �  .   �  &   �       #   =     a     s     �  #   �     �  *   �  �   �  �   �     $     <      P  ?   q  .   �  9   �  K        f  %   �  8   �  $   �       @     '   P     x     �  '   �  '   �  5   �  !   0  !   R     t  \   �     �                ,  4   B  �  w      w  o   �  *     7   3  5   k  0   �  !   �  (   �  *     �   H    �     �       6   "  2   Y     �     �  >   �  ?     ]   A     �  .   �  6   �       �   5  d     M   j      �     �  3   �     "   #   2      V   *   t   A   �      �   O   �   $   N!  -   s!  .   �!     �!  ,   �!  -   "     :"  !   V"     x"     �"     �"  $   �"     �"  )   �"  �   #  �   �#     Q$     g$     �$  6   �$  .   �$  ;   %  N   @%     �%  3   �%  B   �%  =   !&     _&  K   f&  ,   �&     �&     �&  +   '  +   D'  9   p'     �'  %   �'     �'  o   (     x(     �(     �(     �(  5   �(     ?       E      I       (                  F   N   H      ,       +                            :           B   -           <   *           @         8   6         1       R   =          L      M   .   %      $   	   9   K         )              &       O          J          >       P          A   0   '   4          7   2   #              !   3   5   ;      D   "   
   C   G             /       Q          -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- decodes the file and cats it to standard out   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume   --extpass=program	Use external program for password prompt

Example, to mount at ~/crypt with raw storage in ~/.crypt :
    encfs ~/.crypt ~/crypt

   -v, --verbose		verbose: output encfs debug messages
  -i, --idle=MINUTES	Auto unmount after period of inactivity
  --anykey		Do not verify correct key is being used
  --forcedecode		decode data even if an error is detected
			(for filesystems using MAC block headers)
  (NOT supported)
  (using %i:%i:%i)
  -- Supports block sizes of %i to %i bytes  -- Supports key lengths of %i to %i bits  -- block size %i bytes  -- key length %i bits %s (root dir)
  -- displays information about the filesystem, or 
 -------------------------- WARNING --------------------------
 A really old EncFS filesystem was found. 
It is not supported in this EncFS build.
 Block Size: %i bytes Block Size: %i bytes + %i byte MAC header Block Size: %i bytes, including %i byte MAC header Build: encfs version %s Common Options:
  -H			show optional FUSE Mount Options
  -s			disable multithreaded operation
  -f			run in foreground (don't spawn daemon).
			Error messages will be sent to stderr
			instead of syslog.
 Config subversion %i found, but this version of encfs only supports up to version %i. Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. Each file contains 8 byte header with unique IV data.
 EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error saving modified config file.
 Example: 
%s info ~/.crypt
 Failure generating new volume key! Please report this error. File data IV is chained to filename IV.
 For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits Manual configuration mode selected. New Encfs Password:  Passwords did not match, please try again
 Please select a key size in bits.  The cipher you have chosen
supports sizes from %i to %i bits in increments of %i bits.
For example:  Select a block size in bytes.  The cipher you have chosen
supports sizes from %i to %i bytes in increments of %i.
Or just hit enter for the default (%i bytes)
 Selected algorithm "%s" Selected key size:  Standard configuration selected. The directory "%s" does not exist. Should it be created? (y,N)  The following cipher algorithms are available: The following filename encoding algorithms are available: This version of EncFS doesn't support filesystems created before 2004-08-13 Unable to create directory:  Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to load or parse config file
 Usage:
 Usage: %s [options] rootDir mountPoint [-- [FUSE Mount Options]] Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 Zero length password not allowed
 directory %s does not exist.
 encfs [options] rootDir mountPoint -- [FUSE Mount Options]
valid FUSE Mount Options follow:
 encfs version %s encfsctl version %s filesystem block size:  invalid command: "%s" truncate failure: read %i bytes, partial block of %i Project-Id-Version: Encrypted Filesystem for Linux
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2012-04-03 12:30+0000
Last-Translator: Aputsiaĸ Niels Janussen <aj@isit.gl>
Language-Team: Danish <da@li.org>
Language: da
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- ændre kodeord for delarkiv   -- skift adgangskode for delarkiv med anvendelse af adgangskode fra standard-input.
	Der kommer ingen prompt.   -- afkoder navn og udskriver tekstudgave   -- dekoder filen og udskriver den til standard output   -- dekryptere et drev og skriver resultatet til sti   -- indkoder et filnavn og udskriver resultatet   -- vis versionsnummer og afbryd   -- vis information (standard kommando)   -- vis uafkodelige filnavne i delarkivet   --extpass=program\tBenyt eksternt program for kodeordsefterspørgsel

Eksempel: For at montere på ~/crypt med råt lager i ~/.crypt :
    encfs ~/.crypt ~/crypt

   -v, --verbose		Vis fejlsøgningsinformation
  -i, --idle=MINUTTER	Afmonter efter en periode uden aktivitet
  --anykey		Verificer ikke om den korrekte nøgle bruges
  --forcedecode		Afkod data selvom fejl opstår
			(for filsystemer der benytter MAC blokhoveder)
  (IKKE understøttet)
  (bruger %i:%i:%i)
  -- Understøtter blok størrelser fra %i til %i bytes  -- Understøtter nøglelængder fra %i til %i bit  -- blok størrelse %i bytes  -- nøglelængde %i bit %s (rodkatalog)
  -- viser information om filsystemet, eller 
 -------------------------- ADVARSEL --------------------------
 Et meget gammelt EncFS filsystem er fundet.
Det er ikke understøttet i denne EncFS version.
 Blok størrelse: %i bytes Blok størrelse: %i bytes + %i byte MAC header Blok størrelse: %i bytes, inklusiv %i byte MAC header Byg: encfs version %s Standardtilvalg:
  -H			vis mulige FUSE monteringstilvalg
  -s			deaktiver flertrådet udførsel
  -f			kør i forgrunden (start ikke dæmon).
			Fejlbeskeder bliver sendt til stderr,
			istedet for syslog.
 Fandt konfiguration underversion %i, men denne version af encfs understøtter kun op til version %i. Konfigurationen afsluttet. Filsystemet som oprettes har
følgende egenskaber: Opretter nyt krypteret delarkiv. Mappe ikke oprettet. Hver fil indeholder 8 byte hoved med unik IV data.
 EncFS kodeord:  Indtast aktuelle Encfs adgangskode
 Indtast ny Encfs adgangskode
 Indtast nummeret der svarer til dit valg:  En fejl opstod under skrivning af modificeret konfigurationsfil.
 Eksempel: 
%s info ~/.crypt
 Fejl under udarbejdelse af ny delarkivnøgle! Indrapporter venligst denne fejl. Fildata IV er kædet til filnavn IV
 For mere information, se manualsiden encfs(1) Fandt %i ugyldig fil. Fandt %i ugyldige filer. I mappen %s: 
 Forkert antal argumenter for kommandoen "%s" Intern fejl: Mislykkedes i at udføre program Intern fejl: fork() fejlede Intern fejl: socketpair() fejlede Forkert adgangskode
 Ugyldig markering Nøglestørrelse: %i bit Manuel konfigurationstilstand valgt. Nyt EncFS kodeord:  Kodeord stemte ikke overens. Prøv igen:
 Vælg venligst en nøglestørrelse i bit. Koden du har valgt
understøtter størrelse fra %i til %i bit i inddelinger på %i bit.
Fx:  Vælg en blokstørrelse i bytes. Koden du har valgt
understøtter størrelser fra %i til %i bytes i inddelinger på %i.
Eller tryk på enter for at bruge standard (%i bytes)
 Valgt algoritme: "%s" Valgt nøglestørrelse:  Standard konfiguration valgt. Mappen "%s" eksisterer ikke. Skal den oprettes? (y,N)  Følgende chiffer algoritmer er tilgængelige: De følgende filnavn krypteringsalgoritmer er tilgængelige Denne version af EncFS understøtter ikke filsystemer oprettet før 13-08-2004 Mappen kan ikke oprettes:  Ude af stand til at finde den specifikke kode "%s"
 Ikke  i stand til at initialisere krypteret filsystem - tjek sti.
 Ude af stand til at læse eller analysere konfiguration fil.
 Brug:
 Brug: %s [tilvalg] rodkatalog monteringspunkt [-- [FUSE monteringstilvalg]] Bruger filsystem blokstørrelse på %i bytes Bruger %i bit nøglestørrelse Verificer EncFS kodeord:  Version 3 konfiguration; fremstillet af %s
 Version 4 konfiguration; fremstillet af %s
 Version 5 konfiguration; fremstillet af %s (revision %i)
 Drev nøgle blev opdateret
 Kodeord med længde nul ikke tilladt
 Mappen %s eksisterer ikke.
 encfs [tilvalg] rodkatalog monteringspunkt -- [FUSE monteringstilvalg]
gyldige FUSE monteringstilvalg følger:
 encfs version %s encfsctl version %s Filsystemets blokstørrelse:  Ugyldig kommando: "%s" afskærings fejl: læst %i bytes, partiel blok på %i 