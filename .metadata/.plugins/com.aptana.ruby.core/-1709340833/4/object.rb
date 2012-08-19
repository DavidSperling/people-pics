class Object < BasicObject
  include Kernel

  ARGF = ARGF
  ARGV = []
  ArgumentError = ArgumentError
  Array = Array
  BasicObject = BasicObject
  Bignum = Bignum
  Binding = Binding
  CROSS_COMPILING = nil
  Class = Class
  Comparable = Comparable
  Complex = Complex
  Config = RbConfig
  Data = Data
  Date = Date
  DateTime = DateTime
  Dir = Dir
  ENV = {"TERM"=>"xterm", "IMSETTINGS_MODULE"=>"none", "rvm_version"=>"1.15.5 (stable)", "SESSION_MANAGER"=>"local/unix:@/tmp/.ICE-unix/923,unix/unix:/tmp/.ICE-unix/923", "GNOME_DESKTOP_SESSION_ID"=>"this-is-deprecated", "IMSETTINGS_INTEGRATE_DESKTOP"=>"yes", "MAIL"=>"/var/spool/mail/david", "GDMSESSION"=>"gnome", "PWD"=>"/home/david", "HOSTNAME"=>"sperling.fedora", "NLSPATH"=>"/usr/dt/lib/nls/msg/%L/%N.cat", "MY_RUBY_HOME"=>"/home/david/.rvm/rubies/ruby-1.9.3-p194", "HISTSIZE"=>"1000", "PATH"=>"/home/david/.rvm/gems/ruby-1.9.3-p194/bin:/home/david/.rvm/gems/ruby-1.9.3-p194@global/bin:/home/david/.rvm/rubies/ruby-1.9.3-p194/bin:/home/david/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/david/.local/bin:/home/david/bin:/home/david/.rvm/bin:/home/david/.rvm/bin:/home/david/.local/bin:/home/david/bin", "APTANA_VERSION"=>"3.2.1.1340641778", "rvm_env_string"=>"ruby-1.9.3-p194", "rvm_path"=>"/home/david/.rvm", "XAUTHORITY"=>"/var/run/gdm/auth-for-david-EEq6MC/database", "XDG_SEAT"=>"seat0", "WINDOWPATH"=>"1", "rvm_ruby_string"=>"ruby-1.9.3-p194", "XDG_SESSION_ID"=>"2", "USERNAME"=>"david", "XDG_VTNR"=>"1", "GEM_PATH"=>"/home/david/.rvm/gems/ruby-1.9.3-p194:/home/david/.rvm/gems/ruby-1.9.3-p194@global", "GNOME_KEYRING_CONTROL"=>"/run/user/david/keyring-n06dJg", "SHLVL"=>"3", "XFILESEARCHPATH"=>"/usr/dt/app-defaults/%L/Dt", "__array_start"=>"0", "COLORTERM"=>"gnome-terminal", "QT_IM_MODULE"=>"xim", "rvm_prefix"=>"/home/david", "WINDOWID"=>"31457286", "LOGNAME"=>"david", "IRBRC"=>"/home/david/.rvm/rubies/ruby-1.9.3-p194/.irbrc", "GPG_AGENT_INFO"=>"/run/user/david/keyring-n06dJg/gpg:0:1", "XMODIFIERS"=>"@im=none", "RUBY_VERSION"=>"ruby-1.9.3-p194", "_"=>"/home/david/bin/Aptana_Studio_3/AptanaStudio3", "SSH_AUTH_SOCK"=>"/run/user/david/keyring-n06dJg/ssh", "SHELL"=>"/bin/bash", "DBUS_SESSION_BUS_ADDRESS"=>"unix:abstract=/tmp/dbus-s0AOr6xxIf,guid=f8fc3c9c4b29870ad5564db30000003d", "GNOME_KEYRING_PID"=>"919", "rvm_bin_path"=>"/home/david/.rvm/bin", "escape_flag"=>"1", "_first"=>"0", "DESKTOP_SESSION"=>"gnome", "_second"=>"1", "GEM_HOME"=>"/home/david/.rvm/gems/ruby-1.9.3-p194", "DISPLAY"=>":0", "USER"=>"david", "HISTCONTROL"=>"ignoredups", "HOME"=>"/home/david", "LESSOPEN"=>"||/usr/bin/lesspipe.sh %s", "LS_COLORS"=>"rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.tbz=01;31:*.tbz2=01;31:*.bz=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=01;36:*.au=01;36:*.flac=01;36:*.mid=01;36:*.midi=01;36:*.mka=01;36:*.mp3=01;36:*.mpc=01;36:*.ogg=01;36:*.ra=01;36:*.wav=01;36:*.axa=01;36:*.oga=01;36:*.spx=01;36:*.xspf=01;36:*.pdf=00;33:*.ps=00;33:*.ps.gz=00;33:*.txt=00;33:*.patch=00;33:*.diff=00;33:*.log=00;33:*.tex=00;33:*.xls=00;33:*.xlsx=00;33:*.ppt=00;33:*.pptx=00;33:*.rtf=00;33:*.doc=00;33:*.docx=00;33:*.odt=00;33:*.ods=00;33:*.odp=00;33:*.xml=00;33:*.epub=00;33:*.abw=00;33:*.htm=00;33:*.html=00;33:*.shtml=00;33:*.wpd=00;33:", "XDG_RUNTIME_DIR"=>"/run/user/david", "LANG"=>"en_US.UTF-8"}
  EOFError = EOFError
  Encoding = Encoding
  EncodingError = EncodingError
  Enumerable = Enumerable
  Enumerator = Enumerator
  Errno = Errno
  Etc = Etc
  Exception = Exception
  FALSE = false
  FalseClass = FalseClass
  Fiber = Fiber
  FiberError = FiberError
  File = File
  FileTest = FileTest
  FileUtils = FileUtils
  Fixnum = Fixnum
  Float = Float
  FloatDomainError = FloatDomainError
  GC = GC
  Gem = Gem
  Hash = Hash
  IO = IO
  IOError = IOError
  IndexError = IndexError
  Integer = Integer
  Interrupt = Interrupt
  Kernel = Kernel
  KeyError = KeyError
  LoadError = LoadError
  LocalJumpError = LocalJumpError
  Marshal = Marshal
  MatchData = MatchData
  Math = Math
  Method = Method
  Module = Module
  Mutex = Mutex
  NIL = nil
  NameError = NameError
  NilClass = NilClass
  NoMemoryError = NoMemoryError
  NoMethodError = NoMethodError
  NotImplementedError = NotImplementedError
  Numeric = Numeric
  OUTPUT_PATH = "/home/david/Git/people-pics/.metadata/.plugins/com.aptana.ruby.core/-1709340833/4/"
  Object = Object
  ObjectSpace = ObjectSpace
  Proc = Proc
  Process = Process
  Psych = Psych
  RUBY_COPYRIGHT = "ruby - Copyright (C) 1993-2012 Yukihiro Matsumoto"
  RUBY_DESCRIPTION = "ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-linux]"
  RUBY_ENGINE = "ruby"
  RUBY_PATCHLEVEL = 194
  RUBY_PLATFORM = "x86_64-linux"
  RUBY_RELEASE_DATE = "2012-04-20"
  RUBY_REVISION = 35410
  RUBY_VERSION = "1.9.3"
  Random = Random
  Range = Range
  RangeError = RangeError
  Rational = Rational
  RbConfig = RbConfig
  Regexp = Regexp
  RegexpError = RegexpError
  RubyVM = RubyVM
  RuntimeError = RuntimeError
  STDERR = IO.new
  STDIN = IO.new
  STDOUT = IO.new
  ScanError = StringScanner::Error
  ScriptError = ScriptError
  SecurityError = SecurityError
  Signal = Signal
  SignalException = SignalException
  StandardError = StandardError
  StopIteration = StopIteration
  String = String
  StringIO = StringIO
  StringScanner = StringScanner
  Struct = Struct
  Syck = Syck
  Symbol = Symbol
  SyntaxError = SyntaxError
  SystemCallError = SystemCallError
  SystemExit = SystemExit
  SystemStackError = SystemStackError
  TOPLEVEL_BINDING = #<Binding:0x00000002239fb8>
  TRUE = true
  TSort = TSort
  Thread = Thread
  ThreadError = ThreadError
  ThreadGroup = ThreadGroup
  Time = Time
  TrueClass = TrueClass
  TypeError = TypeError
  URI = URI
  UnboundMethod = UnboundMethod
  YAML = Psych
  ZeroDivisionError = ZeroDivisionError
  Zlib = Zlib

  def self.yaml_tag(arg0)
  end


  def psych_to_yaml(arg0, arg1, *rest)
  end

  def to_yaml(arg0, arg1, *rest)
  end

  def to_yaml_properties
  end


  protected


  private

  def dir_names(arg0)
  end

  def file_name(arg0)
  end

  def get_classes
  end

  def grab_instance_method(arg0, arg1)
  end

  def print_args(arg0)
  end

  def print_instance_method(arg0, arg1)
  end

  def print_method(arg0, arg1, arg2, arg3, arg4, *rest)
  end

  def print_type(arg0)
  end

  def print_value(arg0)
  end

end
