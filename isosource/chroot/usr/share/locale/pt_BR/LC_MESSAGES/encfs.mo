��    ~        �   �      �
     �
  ]   �
  .   /  1   ^  1   �  (   �  "   �  '     -   6  �   d  R   �      N    o     ~     �  *   �  )   �     �       B   '  >   j  0   �     �  S   �  P  B     �  )   �  2   �  -        3  �   K  U     S   o     �     �  6   �     0     A     _  /   y  .   �  #   �     �  j     <   �  (   �  )   �  *     )   >  /   h  .   �  (   �     �  .     3   2  +   f  &   �     �  #   �     �             #   2  (   V  #     (   �  4   �  #        %  �   :  �   �  2   �      �  *     �   ;  �        �  �   �     :     R  l   f      �  5   �  :   *  ?   e  �  �  :   5   .   p   9   �   ?   �   0   !  9   J!  K   �!     �!  *   �!  4   "  %   M"  8   s"  ;   �"  $   �"  '   #  *   5#  *   `#     �#  @   �#  '   �#     �#     $  '   .$  '   V$  5   ~$  5   �$  !   �$  M   %  !   Z%     |%  \   �%     �%     &     &  {   4&     �&     �&  +   �&  4   '    8'     H)  k   e)  .   �)  C    *  D   D*  6   �*  )   �*  +   �*  ;   +  �   R+  q   ,  &   },  I  �,     �-     .  +   .  -   E.     s.     �.  K   �.  >   �.  6   ;/     r/  h   �/  �  �/     �1  8   �1  A   �1  J   2     b2  #  z2  z   �3  `   4  "   z4     �4  [   �4     5     #5     @5  0   `5  7   �5  8   �5     6  �   6  O   �6  a   77  9   �7  Z   �7  4   .8  =   c8  D   �8  J   �8     19  3   E9  9   y9  6   �9  2   �9     :  !   9:     [:     l:     �:  )   �:  0   �:  *   �:  B   !;  ^   d;  2   �;     �;  
  <  �   =  7   >  &   L>  0   s>  �   �>  �   �?     @  �   +@     �@     A  �   >A  #   �A  O   �A  =   7B  ;   uB  �  �B  G   �D  5   �D  Q   �D  E   QE  9   �E  T   �E  S   &F  %   zF  9   �F  E   �F  8    G  Z   YG  a   �G  I   H  G   `H  E   �H  8   �H     'I  ?   -I  9   mI     �I     �I  (   �I  (   J  6   0J  6   gJ  (   �J  Y   �J     !K     @K  @   ^K     �K     �K  )   �K  �   �K     �L     �L  4   �L  9   �L     I   !   Z   Q   *      \   
      .          t          q             v       w                   3      S          U      `   $   _             R   E   -   l   J      }   :         8          0   (                  W   s       B   f       r                 9   	       5                  |       {   7       H   m   j   F   '   x      d   X          ,   a   )   ]   O   1       C   ^   T       [               z   k       y   "          Y          ;   6   e       A   n   4   2                   D   ~   >       h   N   &      o          b          i           #   <   L   g   ?   @       M   p              %   P   +      u   G   =       V   K   c       /      -- change password for volume   -- change password for volume, taking password from standard input.
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
 --reverse specified, not using unique/chained IV 8 byte block cipher A really old EncFS filesystem was found. 
It is not supported in this EncFS build.
 Add random bytes to each block header?
This adds a performance penalty, but ensures that blocks
have different authentication codes.  Note that you can
have the same benefits by enabling per-file initialization
vectors, which does not come with as great of performance
penalty. 
Select a number of bytes, from 0 (no random bytes) to 8:  Block Size: %i bytes Block Size: %i bytes + %i byte MAC header Block Size: %i bytes, including %i byte MAC header Block encoding, hides file name size somewhat Build: encfs version %s Common Options:
  -H			show optional FUSE Mount Options
  -s			disable multithreaded operation
  -f			run in foreground (don't spawn daemon).
			Error messages will be sent to stderr
			instead of syslog.
 Config subversion %i found, but this version of encfs only supports up to version %i. Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. Each file contains 8 byte header with unique IV data.
 EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error decoding volume key, password incorrect
 Error saving modified config file.
 Example: 
%s info ~/.crypt
 External chained IV disabled, as both 'IV chaining'
and 'unique IV' features are required for this option. Failure generating new volume key! Please report this error. File data IV is chained to filename IV.
 Filename encoding: "%s", version %i:%i:%i Filenames encoded using IV chaining mode.
 Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. Found config file %s, but failed to load In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits MAC comparison failure in block %li MAC comparison failure, refusing to read Manual configuration mode selected. Missing one or more arguments, aborting. Must set password program when using mount-on-demand Name coding interface not supported New Encfs Password:  Note: requested single-threaded mode, but an idle
timeout was specified.  The filesystem will operate
single-threaded, but threads will still be used to
implement idle checking. Now you will need to enter a password for your filesystem.
You will need to remember this password, as there is absolutely
no recovery mechanism.  However, the password can be changed
later using encfsctl.

 Paranoia configuration not supported for --reverse Paranoia configuration selected. Passwords did not match, please try again
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
Falling through to Manual configuration mode. Standard configuration selected. Stream encoding, keeps filenames as short as possible The configuration loaded is not compatible with --reverse
 The directory "%s" does not exist. Should it be created? (y,n)  The external initialization-vector chaining option has been
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
Report-Msgid-Bugs-To: vgough@pobox.com
POT-Creation-Date: 2010-11-18 00:12-0800
PO-Revision-Date: 2009-07-18 15:14+0000
Last-Translator: André Gondim <andregondim@ubuntu.com>
Language-Team: Portuguese (Brazil) <pt_BR@li.org>
Language: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n > 1;
X-Launchpad-Export-Date: 2010-06-17 04:44+0000
X-Generator: Launchpad (build Unknown)
X-Rosetta-Version: 0.1
   -- troca a senha do volume   -- troca senha do volume, obtendo-a da entrada padrão.
	Não é necessária a intervenção do usuário.   -- decodifica o nome e imprime em texto puro   -- decodifica o arquivo e imprime seu conteúdo na saída padrão   -- decodifica um volume e escreve o resultado no caminho informado   -- codifica um nome de arquivo e imprime o resultado   -- imprime número de versão e termina   -- mostra informações (comando padrão)   -- mostra nomes de arquivo não-decodificáveis no volume   --extpass=programa	Usa um programa externo para perguntar a senha

Por exemplo, para montar em ~/crypt com os dados codificados armazenados em ~/.crypt :
    encfs ~/.crypt ~/crypt

   --public		operar como um sistema de arquivos
			multi-usuário típico
			(encfs deve ser executado como root)
   --reverse 	 	 encriptação reversa
   -v, --verbose		verboso: imprime mensagens de depuração encfs
  -i, --idle=MINUTOS	Desmonta automaticamente após um período de inatividade
  --anykey		Não verifica se a chave correta está sendo usada
  --forcedecode		Decodifica dados mesmo se um erro for detectado
			(para sistemas de arquivo que usam MAC block headers)
  (Não suportado)
  (utilizando %i:%i:%i)
  -- Suporta blocos de tamanho %i a %i bytes  -- Suporta tamanhos de chave de %i a %i bits  -- tamanho do bloco: %i bytes  -- tamanho da chave: %i bits %s (diretório raiz)
  -- mostra informações do sistema de arquivos, ou 
 --------------------------- AVISO ---------------------------
 --reverse especificado, não está usando o IV isolado Cifra com blocos de 8 bytes Um sistema de arquivos EncFS obsoleto foi encontrado. 
Ele não é suportado por esta versão do EncFS.
 Adicionar bytes aleatórios ao cabeçalho de cada bloco?
Isso implica em degradação do desempenho, mas assegura que
blocos tenham diferentes códigos de autenticação. Observe
que você pode obter o mesmo benefício se habilitar vetores
de inicialização por arquivo, com a vantagem de causar uma
perda de desempenho menor. 
Selecione o número de bytes, de 0 (sem bytes aleatórios)
a 8:  Tamanho do Bloco: %i bytes Tamanho do Bloco: %i bytes + cabeçalho MAC com %i bytes Tamanho do Bloco: %i bytes, incluindo cabeçalho MAC com %i bytes Codificação em bloco, de certa forma oculta o tamanho do nome de arquivo Build: encfs versão %s Opções comuns:
  -H		mostra opções de montagem não-obrigatórias do FUSE
  -s		desabilita operação com múltiplas threads
  -f		executa em primeiro plano (não inicia o daemon).
			Mensagens de erro serão enviadas para a saída 
			de erro padrão (stderr), em vez de para o syslog.
 Configurações relativas à sub-versão %i foram encontradas, mas esta versão do EncFS suporta apenas até a versão %i. Configuração concluída. O sistema de arquivos que será
criado possui os seguintes atributos: Criando novo volume criptografado. Diretório não foi criado. Cada arquivo contem um cabeçalho de 8 bytes com dados do vetor de inicialização único.
 Senha EncFS:  Informe a senha EncFS atual
 Informe a nova senha do EncFS:
 Digite o número que corresponde à sua escolha  Erro decodificando a chave do volume. Senha incorreta.
 Erro ao salvar o arquivo de configurações modificado.
 Exemplo: 
%s info ~/.crypt
 Vetor de inicialização encadeado externo desabilitado,
uma vez que ambas funções, 'Encadeamento de vetor de 
inicialização' e 'Vetor de inicialização único', são
requeridas por esta opção. Falha durante a geração de nova chave de volume. Por favor, relate este erro. Vetor de inicialização do arquivo é encadeado ao vetor
de inicialização do nome de arquivo.
 Codificação de nomes de arquivo: "%s", versão %i:%i:%i Nomes de arquivo codificados utilizando modo de encadeamento de vetor de inicialização.
 Cifra do sistema de arquivos: "%s", versão %i:%i:%i Para maiores informações, veja a página do manual encfs(1) Encontrado %i arquivo inválido. Encontrados %i arquivos inválidos. Arquivo de configurações %s foi encontrado, mas não pôde ser carregado No diretório %s: 
 Número incorreto de argumentos para o comando "%s" Erro interno: Exceção lançada pelo laço principal: %s Erro interno: Foi lançada uma exceção não esperada Erro interno: não foi possível executar programa Erro interno: fork() falhou Erro interno: socketpair() falhou Senha inválida
 Seleção inválida. Tamanho da Chave: %i bits Falha na comparação do MAC no bloco %li Falha na comparação do MAC. Impedindo leitura. Modo de configuração manual selecionado. Um ou mais argumentos não foram informados. Abortando execução. Senha de programas é necessário quando estiver usando mount-on-demand (montagem sob demanda) Interface de codificação de nomes não suportada Nova senha de EncFS:  Nota: foi requisitado o modo single-threaded, mas
um limite de inatividade foi especificado. O
sistema de arquivos irá operar em modo single-
threaded mas, mesmo assim, múltiplas threads 
serão empregadas para implementar a verificação 
de tempo de inatividade. Agora você deve informar uma senha para seu sistema de 
arquivos. Você deverá se lembrar dessa senha, uma vez que não
há absolutamente nenhum mecanismo para recuperá-la. Entretanto,
a senha pode ser alterada posteriormente por meio do encfsctl.

 configuração paranoia não é suportado por --reverse Configuração paranóica selecionada. Senhas não conferem, por favor tente novamente
 Por favor, escolha uma das opções a seguir:
 digite "x" para selecionar o modo avançado de configuração,
 digite "p" para o modo pré-configurado (paranóico),
 qualquer outra coisa selecionará o modo padrão.
?>  Por favor, selecione um tamanho de chave em bits. A cifra 
que você escolheu suporta tamanhos de %i a %i bits, em
incrementos de %i bits. Por exemplo:  Remontagem falhou Selecione um tamanho de bloco em bytes. A cifra que você
escolheu suporta tamanhos de %i a %i bytes, em 
incrementos de %i bytes.
Alternativamente, pressione enter para selecionar o 
tamanho padrão (%i bytes)
 Algoritimo "%s" foi selecionado Tamanho de chave selecionado:  Desculpe, não foi possível localizar a cifra para a 
configuração predefinida. A configuração manual será usada em
vez disso. Congiguração padrão selecionada. Codificação em stream, mantem nomes de arquivo tão pequenos quanto possível A configuração carregada não é compatível com --reverse
 O diretório "%s" não existe. Ele deve ser criado? (y, n)  A opção de encadeamento de vetor de inicialização externo
foi habilitada. Essa opção impossibilita o uso de hard-
links no sistema de arquivos. Sem hard-links, alguns
programas podem não funcionar. Os programas 'mutt' e
'procmail' certamente irão falhar. Para obter mais
informações, por favor leia a lista de e-mails do EncFS.
Caso deseje selecionar outra configuração, por favor
pressione Ctrl+C agora para abortar a execução e começar
novamente. A interface de codificação de nomes solicitada não está disponível Os seguintes algoritmos de cifra estão disponíveis: Os seguintes algoritmos de codificação de nomes de arquivo estão disponíveis: O diretório raw não pode ser um subdiretório do ponto de montagem. A interface de cifra requisitada não está disponível.
 A interface de codificação de nomes de arquivo solicitada não está disponível.
 Esta versão do EncFS não suporta sistemas de arquivos criados antes de 13/08/2004 Não foi possível criar diretório:  Não foi possível encontrar a cifra %s, versão %i:%i:%i Não foi possível encontrar interface de nameio %s, versão %i:%i:%i Não foi possível encontrar a cifra especificada, "%s"
 Não foi possível inicializar o sistema de arquivos criptografado - verifique o caminho.
 Não foi possível instanciar a cifra %s com tamanho de chave %i bits e tamanho de bloco %i bytes Não foi possível carregar ou interpretar o arquivo de configurações.
 Não foi possível localizar o ponto de montagem. Abortando execução. Não foi possível localizar o diretório raiz. Abortando execução. Desmontando sistema de arquivos %s devido à inatividade Uso:
 Uso: %s [opções] rootDir mountPoint [ --[FUSE Mount Options]] Usando blocos do sistema de arquivos com tamanho %i bytes Utilizando chave de %i bits Verifique senha de EncFS:  Configuração Versão 3; criada por %s
 Configuração Versão 4; criada por %s
 Configuração Versão 5; criada por %s (revisão %i)
 Configuração Versão 6; criada por %s (revisão %i)
 Chave de Volume atualizada com sucesso.
 Quando especificar o modo daemon, você deve usar caminhos absolutos (começando com '/') Não é permitida senha vazia
 o diretório %s não existe.
 Uso: %s [opções] rootDir mountPoint [ --[FUSE Mount Options]]
 versão encfs %s encfsctl versão %s Tamanho do bloco do sistema de arquivos:  FUSE falhou. Possíveis causas:
 - módulo kernel do FUSE não foi instalado (modprobe fuse)
 - opções inválidas -- leia as informações de uso
 Erro do getopt: %i Comando inválido: "%s" opção '--public' ignorada para usuário não-root. falha de truncamento: %i bytes lidos, bloco parcial de %i 