Þ    T      ¼  q   \            !  ]   A  .     (   Î  "   ÷  '     -   B     p  R   	    Z	     i
     {
  *   
  )   ¹
     ã
     û
  B     >   U  S        è  )   ý  2   '     Z  Í   r  S   @          ³     Ê     Û     ù  /     #   C     g  )     /   ­  .   Ý       .     3   N  +     &   ®     Õ     ó            #   *  (   N     w  ±     *   >     i     ñ          ©      ½  ?   Þ  .     9   M  K        Ó  %   ð  8     $   O     t  @   |  '   ½     å     ÿ  '     '   ?  5   g  5     !   Ó  M   õ     C  \   a     ¾     Ï     ã  {   û     w       +     Ã  Ê  5        Ä  8   V  A     5   Ñ  :     M   B  Ñ        b    ò       "   £  ?   Æ  0     &   7     ^  d   q  =   Ö        #      @   ¿   G    !  #   H!  +  l!  h   "  6   #  6   8#     o#  ;   #  ;   Ã#  D   ÿ#  L   D$     $  P   ©$  K   ú$  9   F%     %  1   %  K   Ï%  ;   &  >   W&  -   &     Ä&     ä&     þ&  -   '  3   G'  !   {'    '  O   ´(  Ñ   )  "  Ö)  0   ù*     *+  *   E+  J   p+  5   »+  F   ñ+  |   8,     µ,  F   Ò,  d   -  I   ~-     È-     Ô-  L   U.  +   ¢.      Î.  0   ï.  0    /  9   Q/  8   /  C   Ä/  v   0  ,   0     ¬0     H1     a1  /   }1  Ý   ­1     2      2  M   ¾2     M   H      ;              L          D   $   C       .   >                     ?              P                    '   &   S            I       @      G   =                 J       9          A          <   N      8       7       "      Q           :      /       *      O   %      #       5   1   E            +   (   B   6   4   K   !       T   ,   )       -       0      F   	       2           R   
       3            -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume   --extpass=program	Use external program for password prompt

Example, to mount at ~/crypt with raw storage in ~/.crypt :
    encfs ~/.crypt ~/crypt

   --public		act as a typical multi-user filesystem
			(encfs must be run as root)
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
 Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error saving modified config file.
 Example: 
%s info ~/.crypt
 Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Invalid password
 Invalid selection. Key Size: %i bits Manual configuration mode selected. Missing one or more arguments, aborting. New Encfs Password:  Note: requested single-threaded mode, but an idle
timeout was specified.  The filesystem will operate
single-threaded, but threads will still be used to
implement idle checking. Passwords did not match, please try again
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
 Version 6 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 When specifying daemon mode, you must use absolute paths (beginning with '/') directory %s does not exist.
 encfs [options] rootDir mountPoint -- [FUSE Mount Options]
valid FUSE Mount Options follow:
 encfs version %s encfsctl version %s filesystem block size:  fuse failed.  Common problems:
 - fuse kernel module not installed (modprobe fuse)
 - invalid options -- see usage message
 getopt error: %i invalid command: "%s" option '--public' ignored for non-root user Project-Id-Version: encfs
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2013-07-06 10:04+0000
Last-Translator: epii <public.epii@gmail.com>
Language-Team: Japanese <ja@li.org>
Language: ja
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
   -- ããªã¥ã¼ã ã®ãã¹ã¯ã¼ããå¤æ´ãã   -- ããªã¥ã¼ã ã®ãã¹ã¯ã¼ããå¤æ´ãããæ¨æºå¥åãããã¹ã¯ã¼ããåå¾ããã
	ãã­ã³ãããè¡¨ç¤ºããªãã   -- ãã¡ã¤ã«åãå¾©å·ããå¹³æãåºåãã   -- ãã¡ã¤ã«åãæå·åãããã®çµæãåºåãã   -- ãã¼ã¸ã§ã³çªå·ãè¡¨ç¤ºãã¦çµäºãã   -- æå ±ãè¡¨ç¤ºãã(ããã©ã«ãã®ã³ãã³ã)   -- ããªã¥ã¼ã åã®å¾©å·ä¸è½ãªãã¡ã¤ã«ã®ä¸è¦§ãè¡¨ç¤ºãã   --extpass=program	ãã¹ã¯ã¼ããã­ã³ããã«å¤é¨ãã­ã°ã©ã ãä½¿ç¨ãã

ä¾ãã°ã~/.crypt ã«ããrawã¹ãã¬ã¼ã¸ã ~/crypt ã«ãã¦ã³ãããã«ã¯ :
    encfs ~/.crypt ~/crypt

   -- public		éå¸¸ã®ãã«ãã¦ã¼ã¶ãã¡ã¤ã«ã·ã¹ãã ã¨ãã¦åä½ãã
			(root æ¨©éã§ encfs ãå®è¡ããå¿è¦ããã)
   -v, --verbose		åé·ã¢ã¼ã: encfsã®ãããã°ã¡ãã»ã¼ã¸ãåºåãã
  -i, --idle=MINUTES	ä¸å®æéä½¿ç¨ãããªãã£ããèªåã§ãã¦ã³ããè§£é¤ãã
  --anykey		æ­£ããéµãä½¿ç¨ããã¦ãããã©ããç¢ºèªããªã
  --forcedecode		ã¨ã©ã¼ãæ¤åºãããå ´åã§ããã¼ã¿ãå¾©å·ãã
			(MAC ãã­ãã¯ããããä½¿ç¨ãããã¡ã¤ã«ã·ã¹ãã ç¨)
  (æªãµãã¼ã)
  (ä½¿ç¨ãã¼ã¸ã§ã³ %i:%i:%i)
  -- ãã­ãã¯ãµã¤ãº %i ãã %i ãã¤ãããµãã¼ã  -- éµé· %i ãã %i ãããããµãã¼ã  -- ãã­ãã¯ãµã¤ãº %i ãã¤ã  -- éµé· %i bits %s (ã«ã¼ããã£ã¬ã¯ããª)
  -- æå®ãããã¡ã¤ã«ã·ã¹ãã ã®æå ±ãè¡¨ç¤ºãã 
 -------------------------- è­¦å --------------------------
 å¤ã EncFS ãã¡ã¤ã«ã·ã¹ãã ãè¦ã¤ããã¾ããã 
ç¾å¨ã® EncFS ãã«ãã§ã¯ãµãã¼ãããã¦ãã¾ããã
 ãã­ãã¯ãµã¤ãº: %i ãã¤ã ãã­ãã¯ãµã¤ãº: %i ãã¤ã + %i ãã¤ã MAC ããã ãã­ãã¯ãµã¤ãº : %i ãã¤ã (%i ãã¤ã MAC ãããå«ã) ãã«ã: encfs ãã¼ã¸ã§ã³ %s å±éã®ãªãã·ã§ã³:
  -H			FUSE ãã¦ã³ããªãã·ã§ã³ãè¡¨ç¤ºãã
  -s			ãã«ãã¹ã¬ãããç¡å¹ã«ãã
  -f			ãã©ã¢ã°ã©ã¦ã³ãã§åä½ãã(ãã¼ã¢ã³åããªã)ã
			ã¨ã©ã¼ã¡ãã»ã¼ã¸ã¯syslogã§ã¯ãªã
			æ¨æºã¨ã©ã¼åºåã«åºåãããã
 è¨­å®ãå®äºãã¾ãããä»¥ä¸ã®ãã­ããã£ã®ãã¡ã¤ã«ã·ã¹ãã ã
ä½æããã¾ã: æ°ããæå·åããªã¥ã¼ã ãä½æãã¾ãã ãã£ã¬ã¯ããªã¯ä½æããã¾ããã§ããã EncFS ãã¹ã¯ã¼ã:  ç¾å¨ã® Encfs ãã¹ã¯ã¼ããå¥åãã¦ãã ãã
 æ°ãã Encfs ãã¹ã¯ã¼ããå¥åãã¦ãã ãã
 ä½¿ç¨ããã¢ã«ã´ãªãºã ã®çªå·ãå¥åãã¦ãã ãã:  å¤æ´ãããã³ã³ãã£ãã°ãã¡ã¤ã«ã®ä¿å­ã«ã¨ã©ã¼çºçã
 ä¾: 
%s info ~/.crypt
 ãã¡ã¤ã«ã·ã¹ãã æå·ã¢ã«ã´ãªãºã : "%s", ãã¼ã¸ã§ã³ %i:%i:%i ããè©³ããæå ±ã¯ man ãã¼ã¸ encfs(1) ãåç§ãã¦ãã ãã %i åã®ç¡å¹ãªãã¡ã¤ã«ãè¦ã¤ããã¾ããã %sãã£ã¬ã¯ããªã«ï¼ 
 ã³ãã³ã"%s"ã®ããã®ä¸æ­£ãªæ°ã®å¼æ° åé¨ã¨ã©ã¼: ã¡ã¤ã³ã«ã¼ãããã®ä¾å¤ãææãã¾ãã: %s åé¨ã¨ã©ã¼: äºæããªãä¾å¤ãææãã¾ãã åé¨ã¨ã©ã¼: ãã­ã°ã©ã ã®å®è¡ã«å¤±æãã¾ãã åé¨ã¨ã©ã¼: fork() ãå¤±æãã¾ãã ç¡å¹ãªãã¹ã¯ã¼ãã§ã
 é¸æé¨ãç¡å¹ã§ã. éµãµã¤ãº: %i ããã æåè¨­å®ã¢ã¼ããé¸æããã¾ãã å¼æ°ãä¸è¶³ãã¦ãã¾ããä¸­æ­¢ãã¾ãã æ°ãã Encfs ãã¹ã¯ã¼ã:  æ³¨æ: ã·ã³ã°ã«ã¹ã¬ããã¢ã¼ãã¨ã¿ã¤ã ã¢ã¦ãã®ä¸¡æ¹ãæå®
ãããå ´åããã¡ã¤ã«ã·ã¹ãã ã¯ã·ã³ã°ã«ã¹ã¬ããã¢ã¼ãã§
åä½ãã¾ãããã¢ã¤ãã«ç¶æã®ãã§ãã¯ãè¡ãããã«å¥ã®ã¹ã¬ãã
ãä½¿ç¨ããã¾ãã ãã¹ã¯ã¼ããä¸è´ãã¾ãããããä¸åº¦ããç´ãã¦ãã ãã
 éµãµã¤ãºããããåä½ã§æå®ãã¦ãã ãããé¸æããã
æå·ã¢ã«ã´ãªãºã ã¯ %i ãã %i ããã (%i ãããéé) ã®
éµãµã¤ãºããµãã¼ããã¦ãã¾ãã
ä¾ãã°:  ãã­ãã¯ãµã¤ãºããã¤ãåä½ã§æå®ãã¦ãã ãããé¸æããã
æå·ã¢ã«ã´ãªãºã ã¯ %i ãã %i ãã¤ã (%i ãã¤ãéé) ã®
ãã­ãã¯ãµã¤ãºããµãã¼ããã¦ãã¾ãã
Enter ãæ¼ãã¨ããã©ã«ãå¤ (%i ãã¤ã) ãä½¿ç¨ãã¾ãã
 ã¢ã«ã´ãªãºã  "%s" ãé¸æããã¾ãã ä½¿ç¨ããéµãµã¤ãº:  æ¨æºã®è¨­å®ãé¸æããã¾ããã ãã£ã¬ã¯ããª "%s" ãå­å¨ãã¾ãããä½æãã¾ãã? (y,N)  ä»¥ä¸ã®æå·ã¢ã«ã´ãªãºã ãä½¿ç¨ã§ãã : ä»¥ä¸ã®ãã¡ã¤ã«åæå·ã¢ã«ã´ãªãºã ãä½¿ç¨ã§ãã¾ã: ãã®ãã¼ã¸ã§ã³ã® EncFS ã¯ 2004-08-13 ããåã«ä½æããããã¡ã¤ã«ã·ã¹ãã ããµãã¼ããã¾ãã ãã£ã¬ã¯ããªãä½æ  æå®ãããæå·ã¢ã«ã´ãªãºã  "%s" ãè¦ã¤ããã¾ãã
 æå·åãã¡ã¤ã«ã·ã¹ãã ãåæåã§ãã¾ããããã¹ãç¢ºèªãã¦ãã ããã
 ã³ã³ãã£ã°ãã¡ã¤ã«ãã­ã¼ãã¾ãã¯ãã¼ã¹ã§ãã¾ãã
 ä½¿ãæ¹:
 ä½¿ãæ¹: %s [ãªãã·ã§ã³] <ã«ã¼ããã£ã¬ã¯ããª> <ãã¦ã³ããã¤ã³ã> [-- [FUSE ãã¦ã³ããªãã·ã§ã³]] ãã¡ã¤ã«ã·ã¹ãã ãã­ãã¯ãµã¤ãº %i ãã¤ããä½¿ç¨ãã¾ã éµãµã¤ãº %i ããããä½¿ç¨ãã¾ã Encfs ãã¹ã¯ã¼ãã®ç¢ºèª:  ãã¼ã¸ã§ã³ï¼ã®è¨­å®ï¼%sã«ããä½æ
 ãã¼ã¸ã§ã³ï¼ã®è¨­å®ï¼%sã«ããä½æ
 ãã¼ã¸ã§ã³ï¼ã®è¨­å®ï¼%sã«ããä½æ (ç %i)
 ãã¼ã¸ã§ã³ï¼ã®è¨­å®; %sã«ããä½æ (ç %i)
 ããªã¥ã¼ã éµãæ­£ããã¢ãããã¼ãããã¾ããã
 ãã¼ã¢ã³ã¢ã¼ããæå®ããå ´åãçµ¶å¯¾ãã¹ãæå®ããå¿è¦ãããã¾ã ('/' ã§å§ã¾ããã¹) ãã£ã¬ã¯ããª %s ãããã¾ããã
 encfs [options] <ã«ã¼ããã£ã¬ã¯ããª> <ãã¦ã³ããã¤ã³ã> -- [FUSE ãã¦ã³ããªãã·ã§ã³]
æå¹ãª FUSE ãã¦ã³ããªãã·ã§ã³:
 encfs ãã¼ã¸ã§ã³ %s encfsctl ãã¼ã¸ã§ã³ %s ãã¡ã¤ã«ã·ã¹ãã ãã­ãã¯ãµã¤ãº:  fuse ãå¤±æãã¾ãããä¸è¬çãªåå ã¨ãã¦ã¯:
 - fuse ã«ã¼ãã«ã¢ã¸ã¥ã¼ã«ãã¤ã³ã¹ãã¼ã«ããã¦ããªã (modeprobe fuse)
 - ç¡å¹ãªãªãã·ã§ã³ -- ä½¿ãæ¹ãåç§ãã¦ãã ãã
 getopt ã¨ã©ã¼: %i ç¡å¹ãªã³ãã³ãï¼ "%s" '--public' ãªãã·ã§ã³ã¯é root ã¦ã¼ã¶ã®å ´åãç¡è¦ããã¾ã 