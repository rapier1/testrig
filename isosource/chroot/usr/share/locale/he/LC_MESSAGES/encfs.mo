Þ    y      ä  £   ¬      8
     9
  ]   Y
  .   ·
  1   æ
  1     (   J  "   s  '     -   ¾     ì  R         Ö    ÷            *   +  )   V            B   ¯  >   ò  S   1  P       Ö  )   ë  2        H  Í   `  U   .  S        Ø     ÷  6     &  E     l     }       /   µ  .   å  #        8  j   T  <   ¿  (   ü  )   %  *   O  )   z  /   ¤  .   Ô       .     3   E  +   y  &   ¥     Ì  #   ê                3  #   E  (   i  #     (   ¶  4   ß  #        8  ±   M  Ï   ÿ      Ï  *   ð  Ç        ã     k     z          2  l   F      ³  :   Ô  ?       O  :   ß  .      9   I   ?      0   Ã   9   ô   K   .!     z!  *   !  4   Â!  %   ÷!  8   "  ;   V"  $   "  '   ·"  *   ß"  *   
#     5#  @   =#  '   ~#     ¦#     À#  '   Ø#  '    $  5   ($  5   ^$  !   $  M   ¶$  !   %     &%  \   D%     ¡%     ²%     Æ%  {   Þ%     Z&     k&  +   &  4   ­&  ü  â&     ß(  s   ÿ(  I   s)  O   ½)  G   *  ?   U*  5   *  5   Ë*  M   +  ¼   O+  s   ,  )   ,    ª,     B.     T.  2   l.  A   .  !   á.  #   /  O   '/  @   w/  k   ¸/  É  $0      î1  ?   2  I   O2     2     ·2  n   Ø3  h   G4  !   °4     Ò4  h   ï4     X5     ù6  7   
7  *   B7  -   m7  C   7  6   ß7     8     48  ]   Ä8  :   "9  3   ]9  B   9  9   Ô9  ;   :  O   J:     :  D   ­:  L   ò:  >   ?;  9   ~;  (   ¸;  .   á;     <     '<      =<  *   ^<  0   <  $   º<  1   ß<  \   =  *   n=     =  ó   ³=  *  §>  &   Ò?  =   ù?  ä   7@  ©   A     ÆA  ï   ãA      ÓB     ôB     C  $   C  ;   ¾C  I   úC    DD  B   bF  8   ¥F  L   ÞF  i   +G  3   G  ?   ÉG  {   	H  $   H  6   ªH  =   áH  3   I  L   SI  K    I  C   ìI  8   0J  6   iJ  P    J     ñJ  a   þJ  P   `K  7   ±K     éK  -   L  -   /L  =   ]L  =   L  +   ÙL  g   M  5   mM  #   £M     ÇM     RN     fN  +   }N  ³   ©N     ]O      sO  [   O  H   ðO            +           S      :      -      q   h   P   j   9              4   ,   p   J   H   \      #      w   v   !               f       ;   [   l      U       m      6                C   `   ^   "              u   O       3      e          &              *   i   K      x       T   
   8   A   ?   /   W   d       D       _   	   )   %          o              G       $   B   y          c   =   N       Q   7   V   I   a           Z      R      X   1   @   .              F           s           g   M          r   2   n   Y   E   ]               '   5       0                 t       L      >   k      <       (   b      -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- decodes the file and cats it to standard out   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume   --extpass=program	Use external program for password prompt

Example, to mount at ~/crypt with raw storage in ~/.crypt :
    encfs ~/.crypt ~/crypt

   --public		act as a typical multi-user filesystem
			(encfs must be run as root)
   --reverse		reverse encryption
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
 Add random bytes to each block header?
This adds a performance penalty, but ensures that blocks
have different authentication codes.  Note that you can
have the same benefits by enabling per-file initialization
vectors, which does not come with as great of performance
penalty. 
Select a number of bytes, from 0 (no random bytes) to 8:  Block Size: %i bytes Block Size: %i bytes + %i byte MAC header Block Size: %i bytes, including %i byte MAC header Build: encfs version %s Common Options:
  -H			show optional FUSE Mount Options
  -s			disable multithreaded operation
  -f			run in foreground (don't spawn daemon).
			Error messages will be sent to stderr
			instead of syslog.
 Config subversion %i found, but this version of encfs only supports up to version %i. Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. Each file contains 8 byte header with unique IV data.
 Enable block authentication code headers
on every block in a file?  This adds about 12 bytes per block
to the storage requirements for a file, and significantly affects
performance but it also means [almost] any modifications or errors
within a block will be caught and will cause a read error. EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error decoding volume key, password incorrect
 Error saving modified config file.
 Example: 
%s info ~/.crypt
 External chained IV disabled, as both 'IV chaining'
and 'unique IV' features are required for this option. Failure generating new volume key! Please report this error. File data IV is chained to filename IV.
 Filename encoding: "%s", version %i:%i:%i Filenames encoded using IV chaining mode.
 Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits MAC comparison failure in block %li MAC comparison failure, refusing to read Manual configuration mode selected. Missing one or more arguments, aborting. Must set password program when using mount-on-demand Name coding interface not supported New Encfs Password:  Note: requested single-threaded mode, but an idle
timeout was specified.  The filesystem will operate
single-threaded, but threads will still be used to
implement idle checking. Now you will need to enter a password for your filesystem.
You will need to remember this password, as there is absolutely
no recovery mechanism.  However, the password can be changed
later using encfsctl.

 Paranoia configuration selected. Passwords did not match, please try again
 Please choose from one of the following options:
 enter "x" for expert configuration mode,
 enter "p" for pre-configured paranoia mode,
 anything else, or an empty line will select standard mode.
?>  Please select a key size in bits.  The cipher you have chosen
supports sizes from %i to %i bits in increments of %i bits.
For example:  Remount failed Select a block size in bytes.  The cipher you have chosen
supports sizes from %i to %i bytes in increments of %i.
Or just hit enter for the default (%i bytes)
 Selected algorithm "%s" Selected key size:  Sorry, unable to locate cipher for predefined configuration...
Falling through to Manual configuration mode. Standard configuration selected. The configuration loaded is not compatible with --reverse
 The directory "%s" does not exist. Should it be created? (y,N)  The external initialization-vector chaining option has been
enabled.  This option disables the use of hard links on the
filesystem. Without hard links, some programs may not work.
The programs 'mutt' and 'procmail' are known to fail.  For
more information, please see the encfs mailing list.
If you would like to choose another configuration setting,
please press CTRL-C now to abort and start over. The filename encoding interface requested is not available The following cipher algorithms are available: The following filename encoding algorithms are available: The raw directory may not be a subdirectory of the mount point. The requested cipher interface is not available
 The requested filename coding interface is not available
 This version of EncFS doesn't support filesystems created before 2004-08-13 Unable to create directory:  Unable to find cipher %s, version %i:%i:%i Unable to find nameio interface %s, version %i:%i:%i Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to instanciate cipher %s, key size %i, block size %i Unable to load or parse config file
 Unable to locate mount point, aborting. Unable to locate root directory, aborting. Unmounting filesystem %s due to inactivity Usage:
 Usage: %s [options] rootDir mountPoint [-- [FUSE Mount Options]] Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Version 6 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 When specifying daemon mode, you must use absolute paths (beginning with '/') Zero length password not allowed
 directory %s does not exist.
 encfs [options] rootDir mountPoint -- [FUSE Mount Options]
valid FUSE Mount Options follow:
 encfs version %s encfsctl version %s filesystem block size:  fuse failed.  Common problems:
 - fuse kernel module not installed (modprobe fuse)
 - invalid options -- see usage message
 getopt error: %i invalid command: "%s" option '--public' ignored for non-root user truncate failure: read %i bytes, partial block of %i Project-Id-Version: Encrypted Filesystem for Linux
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2009-07-07 20:26+0000
Last-Translator: Omri Strumza <blueomega@gmail.com>
Language-Team: Hebrew <he@li.org>
Language: he
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- ×©× × ×¡××¡×× ×× ×¤×   -- ×©× × ×¡××¡×× ×¢×××¨ ××¢×¨×, ×××§× ×¡××¡×× ××§×× ×¡×× ××¨××.
	××¦×¢××ª ×× ×××¤×§×.   -- ××¤×¢× × ×©× ××××¤××¡ ×××ª× ××××¨×¡×ª ××§×¡× ×¤×©××   -- ×¤×¢× × ××ª ××§×××¥ ××××¦× ×××ª× ×××¦××× ×¡×× ××¨×××ª   -- ××¤×¢× × ××ª ××¢×¨× ××××ª× ××ª ××ª××¦×××ª ×× ×ª××   -- ×§××× ××ª ×©× ××§×××¥ ××××¤×¡ ××ª ××ª××¦××   -- ×××¤××¡ ××ª ××¡×¤×¨ ××××¨×¡× ××××¦×   -- ××¦× ××××¢ (×¤×§×××ª ××¨××¨×ª ××××)   -- ××¦× ×©×××ª ×§××¦×× ××××ª× × ××ª× ×× ××¤×¢× ×× ×××¨×   --extpass=×ª××× ××ª	××©×ª××©×ª ××ª××× ××ª ×××¦×× ××ª ×××§×©×ª ×¡××¡××

×××××, ××¢×× × ~/crypt ×¢× ××××¡×× × × × ~/.crypt :
    encfs ~/.crypt ~/crypt

   --×¤××××		×¤××¢× ×××¢×¨××ª ×¨××ª ××©×ª××©×× ×××¤××¡××ª
			(encfs ×××× ××¨××¥ ××× ××)
   --reverse		 ×××¤× ××ª ×××¦×¤× ×
   -v, --verbose		×¨×-×××××: ×¤×× ××××¢××ª × ××¤×× encfs
  -i, --idle=MINUTES	××¡×¨ ×¢×××× ××××××××ª ××××¨ ××× ××¡×××× ×©× ×××¡×¨-×¤×¢××××ª
  --anykey		×× ×ª×××× ×× ××¤×ª× × ××× × ××¦× ××©××××©
  --forcedecode		×¤×¢× × ××××¢ ×× ×× × ×ª×××ª× ×©××××
			(×¢×××¨ ××¢×¨×××ª ×§××¦×× ×××©×ª××©××ª ×××§××¢× "×¨××©" MAC )
  (×× × ×ª××)
  (××©×ª××© %i:%i:%i)
  -- ×××× ××××§ × ×ª×× %i ×¢× %i ××ª××  -- ×ª××× ××××¨×× ××¤×ª×××ª ×©× %i ×¢× %i ×××××  -- ×××× ××××§ %i ××ª××  -- ×××¨× ××¤×ª× %i ××××× %s (root dir)
  -- ××¦×× ××××¢ ×××××ª ××¢×¨××ª ××§××¦××, ×× 
 -------------------------- ××××¨×--------------------------
 ××¢×¨××ª ×§××¦×× EncFS ×××× ××©× × ×××¦××.
××¢×¨××ª ×× ××× × × ×ª×××ª ×¢"× EncFS.
 ××××¡××£ ×××××× ××§×¨×××× ××× ×¨××© ××§××¢?
×× ×××¨×¢ ×××××¦××¢××, ××× ××××× ×©×××§××¢×× ×××× ×§××× ×××××ª ×©×× ××.
×©×× ×× ×©××ª× ××××××ª ×××××ª ×× ×××ª× ×××××ª ×¢"× ××¤×¢××ª ××§×××¨× 
×××ª××× ××× ×§×××¥, ××©×¨ ××× × ×××××× ××¨××¢× ×¨×× ×××××¦××¢××. 
×××¨ ××ª ××¡×¤×¨ ×××××××, × 0 (××× ×××××× ××§×¨×××) × 8:  ×××× ×§××¢: %i ×××××× ×××× ××××§: %i ×××××× + %i ×××××× ×¨××© MAC ×××× ××××§: %i ××××××, ×××× + %i ×××××× ×¨××© MAC ×× ××: encfs ×××¨×¡× %s ××¤×©×¨××××ª × ×¤××¦××ª:
  -H			 ××¦×× ××¤×©×¨××××ª ×¢×××× FUSE ××¤×©×¨×
  -s			 × ×××¨×× ×¤×¢××××ª ×§×¨××× ××¨××××ª
  -f			 ×¨××¥ ××§××× (×× ×ª××¦××¨ ×ª××× ×ª ×©×¨×ª).
			 ××××¢×ª ×©×××× ×ª××©××× × stderr
			 ×××§×× × syslog.
 × ××¦× ×ª×ª-×××¨×¡× %i ×-Config, ×× ××××¨×¡× ××× ×©× encfs ×ª××××ª ×¨×§ ×¢× ×××¨×¡× %i. ×¢××¦×× ××¡×ª×××. ×××¢×¨××ª ××§××¦×× ×©× ××¦×¨× ××©
××ª ××××¤××× ×× ×××××: ×××¦×¨ ××¨× ×××¦×¤× ×××© ××ª×§××× ×× × ××¦×¨× ×× ×§×××¥ ×××× ×××ª×¨×ª ×¢×××× × ××××× 8 ×××××× ×¢× ××××¢ IV ××××××.
 ×××¤×©×¨ ×××××ª ×§×× ×××ª×¨××ª ××××§××
××× ×××××§×× ××§×××¥? ×× ×××¡××£ ××¢×¨× 12 ×××××× ××× ××××§
×¢×××¨ ××¨××©××ª ×××××¡×× ×©× ××§×××¥, ×××©×¤××¢ ××¦××¨× ××©××¢××ª××ª
×¢× ××××¦××¢×× ××× ×× ××××¨ ×× [×©×××¢×] ×©×× ××©×× ×××× ×× ××©×××××ª
××ª×× ×××××§ ××ª××× ××××¨×× ××©×××× ×××ª×××. ×¡×¡××ª EncFS:  ××× ××ª ××¡××¡×× ×× ×××××ª ×¢×××¨ Encfs
 ××× ×¡××¡×× ×××©× ×¢×××¨ Encfs
 ××× ×¡ ××¡×¤×¨ ××ª××× ×××××¨×ª×:  ×©×××× ××¤××¢× ×× ××¤×ª× ×××¨×, ×¡××¡×× ×©××××
 ×©×××× ××©×××¨×ª ×§×××¥ ×-config ×©×©×× ×
 ×××××:
%s info ~/.crypt
 IV ××©××¨×©×¨ ×××¦×× × ×××××, ×× ××¡×£ ×××¤×©×¨××××ª '×©××¨×©××¨ IV'
× 'IV ××××××' × ××¨×©××ª ×××¤×©×¨××ª ××. ×××©××× ×××¦××¨×ª ××¤×ª× ×¢×¨× ×××©! ×× × ×××× ×××××ª ×©×××× ××. ××××¢ ××§×××¥ IV ××©××¨×©×¨ ××©× ××§×××¥ IV.
 ×§×××× ×©× ×§×××¥: "%s", ×××¨×¡× %i:%i:%i ×©×××ª ××§××¦×× ×§×××× ××¢××¨×ª ××¦× ×©×¨×©×¨×ª IV.
 ×¦××¤× ××¢×¨××ª ××§××¦××:"%s", ×××¨×¡×%i:%i:%i ××©××× ×¢×× ××××¢, ×¤× × ×××£ ××××¢ encfs(1) × ××¦× %i ×§×××¥ ×× ×××§×. × ××¦×× %i ×§××¦×× ×× ×××§×××. ××ª×§××× %s: 
 ××¡×¤×¨ ×©××× ×©× ××¨×××× ××× ×¢×××¨ ××¤×§××× "%s" ×©×××× ×¤× ××××ª: × ×ª×¤×¡× ××¨××× ×××××× ××¨××©××ª: %s ×©×××× ×¤× ××××ª: × ×ª×¤×¡× ××¨××× ×× ××××¢× ×©×××× ×¤× ××××ª: × ××©× ××××¦××¢ ×ª××× × ×©×××× ×¤× ××××ª: fork() × ××©× ×©×××× ×¤× ××××ª: socketpair() × ××©× ×¡××¡×× ×©××××
 ××××¨× ×©×××× ×××× ××¤×ª×: %i ××××× ××©××××ª MAC × ××©×× ×××§××¢ %li ××©××××ª MAC × ××©××, ××¡×¨× ××§×¨×× ××××¨××ª ××× ×××ª × ×××¨× ××¡×¨ ×¤×¨×××¨ ××× ×× ×××ª×¨, ××××. ××© ××××××¨ ×ª××× ×ª ×¡××¡×× ×Ö¾'×¢××××Ö¾××¤×Ö¾××§×©×' (mount-on-demand) ×××©×§ ×§×××× ×©× ××× × × ×ª×× ×¡×¡××ª EncFS ×××©×:  ××¢×¨×: × ×ª××§×© ××¦× ××¢× ×ª×××× ×××, ××× ×¤×¡×§ ××× ×¡×¨×§ ×¦××××.
××¢×¨××ª ××§××¦×× ×ª×¤×¢× ×××¦× ×ª×××× ×××, ××× ××ª×××××× ×¢×××× ××××
××©××××© ××××©×× ××××§×ª ×¡×¨×§. ××¢×ª ×ª××¨×© ××××× ×¡××¡×× ×¢×××¨ ××¢×¨××ª ××§××¦×× ×©××.
×ª×¦××¨× ×××××¨ ××ª ××¡××¡××, ×××ª ×××××× ×©××× ××× ××¤×©×¨××ª
××× ××ª ××©×××¨ ×××ª×. ××× ×××¤×, ××¡××¡×× × ××ª× ×ª ××©×× ×× 
×××××¨ ×××ª×¨ ××¢××¨×ª encfsctl.

 ××××¨××ª ×¤×¨×× ××× × ×××¨× ××¡××¡××××ª ××× × ×ª×××××ª. ×× × × ×¡× ×©××
 ×××¨ ××¤×©×¨××ª ××××¤×©×¨××××ª ×××××ª:
 "x" - ××¦× ××××¨××ª ××§×¦××¢×××ª,
 "p" - ××××¨××ª ××¨××© ×× ××¦× ×¤×¨×× ×××,
 ×× ×××¨ ×××¨, ×× ×©××¨× ×¨××§× ××××¢× ×××¦× ×¨×××  ×× × ×××¨ ××ª ×××× ××§×××¥ ××××××. ××¦××¤× ×©×××¨×ª
×ª××× ×××××× × %i ×¢× %i ××××× ×××××× ×©× %i ×××××.
××××××:  ×¢×××× ××××© × ××©× ×× × ×××¨ ××ª ×××× ×××××§ ×××××××. ××¦××¤× ×©×××¨×ª
×ª××× ×××××× × %i ×¢× %i ×××××× ×××××× ×©× %i ×××××.
×× ×¤×©×× ×××¥ ×× ××¨ ×¢×××¨ ××¨××¨×ª ××××× (%i ××××××).
 ××××××¨××ª× "%s" × ×××¨ ×××¨ ×××× ××¤×ª×:  ×¡××××, × ××©× ××××ª××¨ ××¦××¤× ×¢×××¨ ×¢××¦×× ××××××¨ ××¨××©...
×¢××§× ×××¨ ××¦× ××¢××¦×× ×××× ×. ××××¨××ª ×¨×××××ª × ×××¨× ××ª×¦××¨× ×©× ××¢× × ××× × ×ª××××ª × --reverse
 ××ª×§××× "%s" ××× × ×§××××ª. ××× ×××¦××¨ ×××ª×? (y,N)  ××¤×©×¨××ª ×××¦×× ××ª ××××ª××× ××§×××¨× ×©××¨×©××¨ ×××¤×¢××.
××¤×©×¨××ª ×× ×× ××¨××ª ××ª ××©××××© ××§××©××¨×× ×§×©××
×××¢×¨××ª ××§××¦××. ××× ××§××©××¨×× ××§×©××, ×××§
×××ª××× ××ª ×¢×××××ª ×× ××¢×××. ××××¢ ×©××ª××× ××ª 'mutt' ×
'procmail' ×××©××. ×××××¢ × ××¡×£, ×× × ×¢××× ××¨×©×××ª
××××××¨ ×©× encfs. ×× ××ª× ×¨××¦× ×××××¨ ××¤×©×¨××ª
××××¨× ×××¨×ª, ×× × ×××¥ ××¢×ª ×¢× CTRL-C ××××××
×××ª×× ××××©. ×××©×§ ×§×××× ×©× ××§×××¥ ×©×××§×©×ª ××× × ×××× ×××××¨××ª×× ×××¦×¤× × ××××× ×××× ××: ××××××¨××ª××× ××××× ×××¦×¤× ×ª ×©× ××§×××¥ ×××× ××: ××ª×§××× ×"× ××" ××× ×× ××××× ×××××ª ×ª×ª-×ª×§××× ×¢×××¨ × ×§×××ª ×¢××××. ×××©×§ ××¦××¤× ×××××§×© ××× × ××××
 ×××©×§ ×§×××× ×©× ××§×××¥ ×××××§×© ×× ××××
 ×××¨×¡× ×× ×©× EncFS ××× × ×ª××××ª ×××¢×¨×××ª-×§××¦×× ××©×¨ × ××¦×¨× ××¤× × ××ª××¨×× 2004-08-13 × ××©× ×××¦××¨×ª ××ª×§×××:  × ××©× ×××¦×××ª ×¦××¤× %s, ×××¨×¡× %i:%i:%i × ××©× ×××¦×××ª ×××©×§ nameio %s, ×××¨×¡× %i:%i:%i × ××©× ×××¦×××ª ××¦××¤× ××¦×××× "%s"
 × ××©× ×××ª×× ××¢×¨××ª ×§××¦×× ×××¦×¤× ×ª - ××××§ × ×ª××.
 × ××©× ××××××ª ×¦××¤× %s, ×××× ××¤×ª× %i, ×××× ×§××¢ %i ××× ××¤×©×¨××ª ×××¢×× ×× ×× ×ª× ×§×××¥ ××××¨××ª
 × ××©× ××××ª××¨ × ×§×××ª ××¢××××, ××××. × ××©× ××××ª××¨ ×ª×§×××ª ××× ××, ××××. ××¡××¨ ××ª ×¢×××× ××¢×¨××ª ××§××¦×× %s ××©× ×××¡×¨ ×¤×¢××××ª ×©××××©:
 ×©××××©: %s [××¤×©×¨××××ª] rootDir mountPoint [-- [××¤×©×¨××××ª ×¢×××× ×©× FUSE]] ×××× ××××§ ×××¢×¨××ª ×§××¦×× ×©× %i ××ª×× × ××¦× ××©××××© ××¤×ª× ××××× %i ××××× × ××¦× ××©××××© ×××ª ×¡×¡××ª EncFS:  ×ª×¦××¨×ª ×××¨×¡× 3; × ××¦×¨× ×¢"× %s
 ×ª×¦××¨×ª ×××¨×¡× 4; × ××¦×¨× ×¢"× %s
 ×ª×¦××¨×ª ×××¨×¡× 3; × ××¦×¨× ×¢"× %s (×ª××§×× %i)
 ×ª×¦××¨×ª ×××¨×¡× 6: × ××¦×¨× ×¢"× %s (×©×× ×× %i)
 ××¤×ª× ×××¨× ×¢×××× ×××¦×××.
 ××©××¦××× ××¦× ×¨×§×¢, ×¢××× ×××©×ª××© ×× ×ª×××× ××××× (××ª××××× ×¢× '/') ×¡××¡××××ª ×× × ××¤×¡ ×ª×××× ××¡××¨××ª
 ×ª×§××× %s ××× × ×§××××ª.
 encfs [××¤×©×¨××××ª] rootDir mountPoint -- [××¤×©×¨××××ª ×¢×××× FUSE]
××¤×©×¨××××ª ×¢×××× FUSE ×××§×××ª ××××:
 encfs ×××¨×¡× %s encfsctl ×××¨×¡× %s ×××× ×××× ×××¢×¨××ª ×§××¦××:  fuse × ××©×. ××¢×××ª × ×¤××¦××ª:
 - ×××××× ×©× fuse ××××× ×× ×¤×¢×× (modprobe fuse)
 - ×¤×¨×××¨×× ×©××××× -- ×¨×× ××××¢×ª ××¡××¨ ×©××××©
 ×©××××ª getopt: %i ×¤×§××× ×× ×××§××ª: "%s" ××¤×©×¨××ª '--public' × ×ª×§×× ×××ª×¢××××ª ×××©×ª××© ×©××× ××× × ×× ×× ×©××××ª ×§××¦××¥: ×§×¨× %i ××ª××, ××¡××× ×××§××ª ×©× %i 