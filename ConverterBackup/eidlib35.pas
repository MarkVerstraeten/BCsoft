unit eidlib35;

interface
uses Windows, SysUtils, Classes;

const
  EID_OK = 0;
  EID_ERR_PARAM_BAD = $e1d00100;
  EID_ERR_PARAM_RANGE = $e1d00101;
  EID_ERR_BAD_PATH = $e1d00102;
  EID_ERR_ALGO_BAD = $e1d00103;
  EID_ERR_PIN_OPERATION = $e1d00104;
  EID_ERR_PIN_FORMAT = $e1d00105;
  EID_ERR_BAD_USAGE = $e1d00106;
  EID_ERR_CARD = $e1d00200;
  EID_ERR_NOT_AUTHENTICATED = $e1d00201;
  EID_ERR_NOT_SUPPORTED = $e1d00202;
  EID_ERR_PIN_BAD = $e1d00203;
  EID_ERR_PIN_BLOCKED = $e1d00204;
  EID_ERR_NO_CARD = $e1d00205;
  EID_ERR_BAD_P1P2 = $e1d00206;
  EID_ERR_CMD_NOT_ALLOWED = $e1d00207;
  EID_ERR_FILE_NOT_FOUND = $e1d00208;
  EID_ERR_APPLET_VERSION_NOT_FOUND = $e1d00209;
  EID_ERR_NOT_ACTIVATED = $e1d0020A;
  EID_ERR_CARD_COMM = $e1d00300;
  EID_ERR_NO_READER = $e1d00301;
  EID_ERR_PINPAD = $e1d00302;
  EID_ERR_CANT_CONNECT = $e1d00303;
  EID_ERR_CARD_RESET = $e1d00304;
  EID_ERR_CARD_SHARING = $e1d00305;
  EID_ERR_NOT_TRANSACTED = $e1d00306;
  EID_ERR_LIMIT = $e1d00400;
  EID_ERR_CHECK = $e1d00401;
  EID_ERR_PCSC_LIB = $e1d00402;
  EID_ERR_ZLIB_RESOLVE = $e1d00403;
  EID_ERR_UNKNOWN = $e1d00404;
  EID_PINPAD_ERR = $e1d00405;
  EID_CANT_LOAD_LIB = $e1d00406;
  EID_ERR_MEMORY = $e1d00407;
  EID_ERR_DELETE_CACHE = $e1d00408;
  EID_CONF = $e1d00409;
  EID_CACHE_TAMPERED = $e1d0040A;
  EID_ERR_SOCKET_CREATE = $e1d00500;
  EID_ERR_SOCKET_SEND = $e1d00501;
  EID_ERR_SOCKET_RECV = $e1d00502;
  EID_ERR_SOCKET_GETHOST = $e1d00503;
  EID_ERR_SOCKET_CONNECT = $e1d00504;
  EID_ERR_SOCKET_SOCKET = $e1d00510;
  EID_ERR_SOCKET_BIND = $e1d00511;
  EID_ERR_SOCKET_ACCEPT = $e1d00512;
  EID_ERR_PIN_CANCEL = $e1d00600;
  EID_ERR_TIMEOUT = $e1d00601;
  EID_NEW_PINS_DIFFER = $e1d00602;
  EID_WRONG_PIN_FORMAT = $e1d00603;
  EID_WRONG_ASN1_FORMAT = $e1d00700;
  EID_FILE_NOT_OPENED = $e1d00800;
  EID_PERMISSION_DENIED = $e1d00801;
  EID_INVALID_PATH = $e1d00802;
  EID_TOO_MANY_OPENED_FILES = $e1d00803;
  EID_DIR_NOT_OPENED = $e1d00804;
  EID_INTERRUPTION = $e1d00805;
  EID_OVERFLOW = $e1d00806;
  EID_ERROR_IO = $e1d00807;
  EID_ERR_LOGGER_APPLEAVING = $e1d00900;
  EID_ERR_DOCTYPE_UNKNOWN = $e1d00b00;
  EID_ERR_CARDTYPE_BAD = $e1d00b01;
  EID_ERR_CARDTYPE_UNKNOWN = $e1d00b02;
  EID_ERR_CERT_NOISSUER = $e1d00b03;
  EID_ERR_RELEASE_NEEDED = $e1d00b04;
  EID_ERR_BAD_TRANSACTION = $e1d00b05;
  EID_ERR_FILETYPE_UNKNOWN = $e1d00b06;
  EID_ERR_CARD_CHANGED = $e1d00b07;
  EID_ERR_READERSET_CHANGED = $e1d00b08;
  EID_ERR_NOT_ALLOW_BY_USER = $e1d00b09;
  EID_ERR_CERT_NOCRL = $e1d00b0A;
  EID_ERR_CERT_NOOCSP = $e1d00b0B;
  EID_ERR_CERT_NOROOT = $e1d00b0C;
  EID_ERR_USER_MUST_ANSWER = $e1d00b0D;
  EID_ERR_SYSTEM = $e1d00c01;
  EID_ERR_SIGNAL = $e1d00c02;

const // eIDMW::BEID_CardType
  BEID_CARDTYPE_UNKNOWN = 0;
  BEID_CARDTYPE_EID = BEID_CARDTYPE_UNKNOWN + 1;
  BEID_CARDTYPE_KIDS = BEID_CARDTYPE_EID + 1;
  BEID_CARDTYPE_FOREIGNER = BEID_CARDTYPE_KIDS + 1;
  BEID_CARDTYPE_SIS = BEID_CARDTYPE_FOREIGNER + 1;

const // eIDMW::BEID_DocumentType
  BEID_DOCTYPE_FULL = 0;
  BEID_DOCTYPE_ID = BEID_DOCTYPE_FULL + 1;
  BEID_DOCTYPE_PICTURE = BEID_DOCTYPE_ID + 1;
  BEID_DOCTYPE_INFO = BEID_DOCTYPE_PICTURE + 1;
  BEID_DOCTYPE_PINS = BEID_DOCTYPE_INFO + 1;
  BEID_DOCTYPE_CERTIFICATES = BEID_DOCTYPE_PINS + 1;

const // eIDMW::BEID_RawDataType
  BEID_RAWDATA_ID = 0;
  BEID_RAWDATA_ID_SIG = BEID_RAWDATA_ID + 1;
  BEID_RAWDATA_ADDR = BEID_RAWDATA_ID_SIG + 1;
  BEID_RAWDATA_ADDR_SIG = BEID_RAWDATA_ADDR + 1;
  BEID_RAWDATA_PICTURE = BEID_RAWDATA_ADDR_SIG + 1;
  BEID_RAWDATA_CARD_INFO = BEID_RAWDATA_PICTURE + 1;
  BEID_RAWDATA_TOKEN_INFO = BEID_RAWDATA_CARD_INFO + 1;
  BEID_RAWDATA_CERT_RRN = BEID_RAWDATA_TOKEN_INFO + 1;
  BEID_RAWDATA_CHALLENGE = BEID_RAWDATA_CERT_RRN + 1;
  BEID_RAWDATA_RESPONSE = BEID_RAWDATA_CHALLENGE + 1;

const // eIDMW::BEID_PinUsage
  BEID_PIN_USG_UNKNOWN = 0;
  BEID_PIN_USG_AUTH = BEID_PIN_USG_UNKNOWN + 1;
  BEID_PIN_USG_SIGN = BEID_PIN_USG_AUTH + 1;
  BEID_PIN_USG_ADDRESS = BEID_PIN_USG_SIGN + 1;

const // eIDMW::BEID_ValidationProcess 
  BEID_VALIDATION_PROCESS_NONE = 0;
  BEID_VALIDATION_PROCESS_CRL = BEID_VALIDATION_PROCESS_NONE + 1;
  BEID_VALIDATION_PROCESS_OCSP = BEID_VALIDATION_PROCESS_CRL + 1;

const // eIDMW::BEID_ValidationLevel 
  BEID_VALIDATION_LEVEL_NONE = 0;
  BEID_VALIDATION_LEVEL_OPTIONAL = BEID_VALIDATION_LEVEL_NONE + 1;
  BEID_VALIDATION_LEVEL_MANDATORY = BEID_VALIDATION_LEVEL_OPTIONAL + 1;

const // eIDMW::BEID_CertifStatus 
  BEID_CERTIF_STATUS_UNKNOWN = 0;
  BEID_CERTIF_STATUS_REVOKED = BEID_CERTIF_STATUS_UNKNOWN + 1;
  BEID_CERTIF_STATUS_TEST = BEID_CERTIF_STATUS_REVOKED + 1;
  BEID_CERTIF_STATUS_DATE = BEID_CERTIF_STATUS_TEST + 1;
  BEID_CERTIF_STATUS_CONNECT = BEID_CERTIF_STATUS_DATE + 1;
  BEID_CERTIF_STATUS_ISSUER = BEID_CERTIF_STATUS_CONNECT + 1;
  BEID_CERTIF_STATUS_ERROR = BEID_CERTIF_STATUS_ISSUER + 1;
  BEID_CERTIF_STATUS_VALID = BEID_CERTIF_STATUS_ERROR + 1;
  BEID_CERTIF_STATUS_VALID_CRL = BEID_CERTIF_STATUS_VALID + 1;
  BEID_CERTIF_STATUS_VALID_OCSP = BEID_CERTIF_STATUS_VALID_CRL + 1;

const // eIDMW::BEID_CertifType 
  BEID_CERTIF_TYPE_UNKNOWN = 0;
  BEID_CERTIF_TYPE_RRN = BEID_CERTIF_TYPE_UNKNOWN + 1;
  BEID_CERTIF_TYPE_ROOT = BEID_CERTIF_TYPE_RRN + 1;
  BEID_CERTIF_TYPE_CA = BEID_CERTIF_TYPE_ROOT + 1;
  BEID_CERTIF_TYPE_AUTHENTICATION = BEID_CERTIF_TYPE_CA + 1;
  BEID_CERTIF_TYPE_SIGNATURE = BEID_CERTIF_TYPE_AUTHENTICATION + 1;

const // eIDMW::BEID_CrlStatus 
  BEID_CRL_STATUS_UNKNOWN = 0;
  BEID_CRL_STATUS_VALID = BEID_CRL_STATUS_UNKNOWN + 1;
  BEID_CRL_STATUS_CONNECT = BEID_CRL_STATUS_VALID + 1;
  BEID_CRL_STATUS_ERROR = BEID_CRL_STATUS_CONNECT + 1;

const // eIDMW::BEID_HashAlgo 
  BEID_ALGO_MD5 = 0;
  BEID_ALGO_SHA1 = BEID_ALGO_MD5 + 1;

const // eIDMW::BEID_FileType 
  BEID_FILETYPE_UNKNOWN = 0;
  BEID_FILETYPE_TLV = BEID_FILETYPE_UNKNOWN + 1;
  BEID_FILETYPE_XML = BEID_FILETYPE_TLV + 1;
  BEID_FILETYPE_CSV = BEID_FILETYPE_XML + 1;

const // eIDMW::BEID_Param 
  BEID_PARAM_GENERAL_INSTALLDIR = 0;
  BEID_PARAM_GENERAL_INSTALL_PRO_DIR = BEID_PARAM_GENERAL_INSTALLDIR + 1;
  BEID_PARAM_GENERAL_INSTALL_SDK_DIR = BEID_PARAM_GENERAL_INSTALL_PRO_DIR + 1;
  BEID_PARAM_GENERAL_CACHEDIR = BEID_PARAM_GENERAL_INSTALL_SDK_DIR + 1;
  BEID_PARAM_GENERAL_LANGUAGE = BEID_PARAM_GENERAL_CACHEDIR + 1;
  BEID_PARAM_LOGGING_DIRNAME = BEID_PARAM_GENERAL_LANGUAGE + 1;
  BEID_PARAM_LOGGING_PREFIX = BEID_PARAM_LOGGING_DIRNAME + 1;
  BEID_PARAM_LOGGING_FILENUMBER = BEID_PARAM_LOGGING_PREFIX + 1;
  BEID_PARAM_LOGGING_FILESIZE = BEID_PARAM_LOGGING_FILENUMBER + 1;
  BEID_PARAM_LOGGING_LEVEL = BEID_PARAM_LOGGING_FILESIZE + 1;
  BEID_PARAM_LOGGING_GROUP = BEID_PARAM_LOGGING_LEVEL + 1;
  BEID_PARAM_CRL_SERVDOWNLOADNR = BEID_PARAM_LOGGING_GROUP + 1;
  BEID_PARAM_CRL_TIMEOUT = BEID_PARAM_CRL_SERVDOWNLOADNR + 1;
  BEID_PARAM_CRL_CACHEDIR = BEID_PARAM_CRL_TIMEOUT + 1;
  BEID_PARAM_CRL_CACHEFILE = BEID_PARAM_CRL_CACHEDIR + 1;
  BEID_PARAM_CRL_LOCKFILE = BEID_PARAM_CRL_CACHEFILE + 1;
  BEID_PARAM_CERTVALID_ALLOWTESTC = BEID_PARAM_CRL_LOCKFILE + 1;
  BEID_PARAM_CERTVALID_CRL = BEID_PARAM_CERTVALID_ALLOWTESTC + 1;
  BEID_PARAM_CERTVALID_OCSP = BEID_PARAM_CERTVALID_CRL + 1;
  BEID_PARAM_CERTCACHE_CACHEFILE = BEID_PARAM_CERTVALID_OCSP + 1;
  BEID_PARAM_CERTCACHE_LINENUMB = BEID_PARAM_CERTCACHE_CACHEFILE + 1;
  BEID_PARAM_CERTCACHE_VALIDITY = BEID_PARAM_CERTCACHE_LINENUMB + 1;
  BEID_PARAM_CERTCACHE_WAITDELAY = BEID_PARAM_CERTCACHE_VALIDITY + 1;
  BEID_PARAM_PROXY_HOST = BEID_PARAM_CERTCACHE_WAITDELAY + 1;
  BEID_PARAM_PROXY_PORT = BEID_PARAM_PROXY_HOST + 1;
  BEID_PARAM_PROXY_PACFILE = BEID_PARAM_PROXY_PORT + 1;
  BEID_PARAM_SECURITY_SINGLESIGNON = BEID_PARAM_PROXY_PACFILE + 1;
  BEID_PARAM_GUITOOL_STARTWIN = BEID_PARAM_SECURITY_SINGLESIGNON + 1;
  BEID_PARAM_GUITOOL_STARTMINI = BEID_PARAM_GUITOOL_STARTWIN + 1;
  BEID_PARAM_GUITOOL_SHOWPIC = BEID_PARAM_GUITOOL_STARTMINI + 1;
  BEID_PARAM_GUITOOL_SHOWTBAR = BEID_PARAM_GUITOOL_SHOWPIC + 1;
  BEID_PARAM_GUITOOL_VIRTUALKBD = BEID_PARAM_GUITOOL_SHOWTBAR + 1;
  BEID_PARAM_GUITOOL_AUTOCARDREAD = BEID_PARAM_GUITOOL_VIRTUALKBD + 1;
  BEID_PARAM_GUITOOL_CARDREADNUMB = BEID_PARAM_GUITOOL_AUTOCARDREAD + 1;
  BEID_PARAM_GUITOOL_REGCERTIF = BEID_PARAM_GUITOOL_CARDREADNUMB + 1;
  BEID_PARAM_GUITOOL_REMOVECERTIF = BEID_PARAM_GUITOOL_REGCERTIF + 1;
  BEID_PARAM_XSIGN_TSAURL = BEID_PARAM_GUITOOL_REMOVECERTIF + 1;
  BEID_PARAM_XSIGN_ONLINE = BEID_PARAM_XSIGN_TSAURL + 1;
  BEID_PARAM_XSIGN_WORKINGDIR = BEID_PARAM_XSIGN_ONLINE + 1;
  BEID_PARAM_XSIGN_TIMEOUT = BEID_PARAM_XSIGN_WORKINGDIR + 1;

const // eIDMW::BEID_LogLevel
  BEID_LOG_LEVEL_CRITICAL = 0;
  BEID_LOG_LEVEL_ERROR = BEID_LOG_LEVEL_CRITICAL + 1;
  BEID_LOG_LEVEL_WARNING = BEID_LOG_LEVEL_ERROR + 1;
  BEID_LOG_LEVEL_INFO = BEID_LOG_LEVEL_WARNING + 1;
  BEID_LOG_LEVEL_DEBUG = BEID_LOG_LEVEL_INFO + 1;

type

  TBEID_ReaderSet = class;
  TBEID_ReaderContext = class;
  TBEID_Card = class;
  TBEID_MemoryCard = class;
  TBEID_SmartCard = class;
  TBEID_SISCard = class;
  TBEID_EIDCard = class;
  TBEID_KidsCard = class;
  TBEID_ForeignerCard = class;
  TBEID_XMLDoc = class;
  TBEID_Crypto = class;
  TBEID_CardVersionInfo = class;
  TBEID_Picture = class;
  TBEID_SisId = class;
  TBEID_EId = class;
  TBEID_SisFullDoc = class;
  TBEID_EIdFullDoc = class;
  TBEID_Pins = class;
  TBEID_Pin = class;
  TBEID_Certificates = class;
  TBEID_Certificate = class;

  TBEID_Exception = class(TObject)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); virtual;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Exception;
  public
    constructor Create(lError: Integer);
    function GetError: Integer;
    destructor Destroy; override;
  end;

  TBEID_Object = class(TObject)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); virtual;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Object;
  public
    destructor Destroy; override;
  end;

  TBEID_ExReleaseNeeded = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExReleaseNeeded;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExUnknown = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExUnknown;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExDocTypeUnknown = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExDocTypeUnknown;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExFileTypeUnknown = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExFileTypeUnknown;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExParamRange = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExParamRange;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExCmdNotAllowed = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCmdNotAllowed;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExCmdNotSupported = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCmdNotSupported;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExNoCardPresent = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExNoCardPresent;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExCardBadType = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCardBadType;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExCardTypeUnknown = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCardTypeUnknown;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExCertNoIssuer = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCertNoIssuer;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExCertNoCrl = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCertNoCrl;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExCertNoOcsp = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCertNoOcsp;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExCertNoRoot = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCertNoRoot;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExBadUsage = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExBadUsage;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExBadTransaction = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExBadTransaction;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExCardChanged = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCardChanged;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExReaderSetChanged = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExReaderSetChanged;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExNoReader = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExNoReader;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExNotAllowByUser = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExNotAllowByUser;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ExUserMustAnswer = class(TBEID_Exception)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExUserMustAnswer;
  public
    constructor Create;
    destructor Destroy; override;
  end;


  TBEID_ByteArray = class(TBEID_Object)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ByteArray;
  public
    constructor Create; overload;
    constructor Create(bytearray: TBEID_ByteArray); overload;
    constructor Create(const pucData: String; ulSize: Cardinal); overload;
    procedure Append(const pucData: String; ulSize: Cardinal); overload;
    procedure Append(data: TBEID_ByteArray); overload;
    procedure Clear;
    function Equals(data: TBEID_ByteArray): Boolean;
    function Size: Cardinal;
    function GetBytes: pointer;
    function writeToFile(csFilePath: PAnsiChar): Boolean;
    function assign(bytearray: TBEID_ByteArray): TBEID_ByteArray;
    destructor Destroy; override;
  end;

  TBEID_RawData_Eid = class(TObject)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_RawData_Eid;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_RawData_Sis = class(TObject)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_RawData_Sis;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TBEID_ReaderSet = class(TBEID_Object)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ReaderSet;
  public
    class function instance: TBEID_ReaderSet;
    class procedure initSDK(bManageTestCard: Boolean); overload;
    class procedure initSDK; overload;
    class procedure releaseSDK;
    procedure releaseReaders(bAllReference: Boolean); overload;
    procedure releaseReaders; overload;
    function isReadersChanged: Boolean;
    function readerList(bForceRefresh: Boolean): Pointer; overload;
    function readerList: Pointer; overload;
    function getReader: TBEID_ReaderContext;
    function getReaderByName(readerName: PAnsiChar): TBEID_ReaderContext;
    function readerCount(bForceRefresh: Boolean): Cardinal; overload;
    function readerCount: Cardinal; overload;
    function getReaderName(ulIndex: Cardinal): PAnsiChar;
    function getReaderByNum(ulIndex: Cardinal): TBEID_ReaderContext;
    function getReaderByCardSerialNumber(cardSerialNumber: PAnsiChar): TBEID_ReaderContext;
    function flushCache: Boolean;
    destructor Destroy; override;

    property Reader : TBEID_ReaderContext read getReader;
  end;

  TBEID_ReaderContext = class(TBEID_Object)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ReaderContext;
  public
    constructor Create(fileType: Cardinal; fileName: PAnsiChar); overload;
    constructor Create(fileType: Cardinal; data: TBEID_ByteArray); overload;
    constructor Create(data: TBEID_RawData_Eid); overload;
    constructor Create(data: TBEID_RawData_Sis); overload;
    function getName: PAnsiChar;
    function isCardPresent: Boolean;
    procedure releaseCard(bAllReference: Boolean); overload;
    procedure releaseCard; overload;
    function isCardChanged(ulOldId: Pointer): Boolean;
    function getCardType: Cardinal;
    function getCard: TBEID_Card;
    function getEIDCard: TBEID_EIDCard;
    function getKidsCard: TBEID_KidsCard;
    function getForeignerCard: TBEID_ForeignerCard;
    function getSISCard: TBEID_SISCard;
    function SetEventCallback(callback: Pointer; pvRef: Pointer): Cardinal;
    procedure StopEventCallback(ulHandle: Cardinal);
    procedure BeginTransaction;
    procedure EndTransaction;
    function isVirtualReader: Boolean;
    destructor Destroy; override;

    property Card : TBEID_Card read getCard;
    property CardType : cardinal read GetCardType;
    property CardPresent : boolean read isCardPresent;
  end;

  TBEID_Card = class(TBEID_Object)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Card;
  public
    function getType: Cardinal;
    function getDocument(arg0: Cardinal): TBEID_XMLDoc;
    function getRawData(arg0: Cardinal): TBEID_ByteArray;
    function sendAPDU(cmd: TBEID_ByteArray): TBEID_ByteArray;
    function readFile(fileID: PAnsiChar; ulOffset: Cardinal; ulMaxLength: Cardinal): TBEID_ByteArray; overload;
    function readFile(fileID: PAnsiChar; ulOffset: Cardinal): TBEID_ByteArray; overload;
    function readFile(fileID: PAnsiChar): TBEID_ByteArray; overload;
    function writeFile(fileID: PAnsiChar; oData: TBEID_ByteArray; ulOffset: Cardinal): Boolean; overload;
    function writeFile(fileID: PAnsiChar; oData: TBEID_ByteArray): Boolean; overload;
    destructor Destroy; override;
  end;

  TBEID_MemoryCard = class(TBEID_Card)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_MemoryCard;
  public
    destructor Destroy; override;
  end;

  TBEID_SmartCard = class(TBEID_Card)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_SmartCard;
  public
    procedure selectApplication(applicationId: TBEID_ByteArray);
    function sendAPDU(cmd: TBEID_ByteArray; pin: TBEID_Pin; csPinCode: PAnsiChar): TBEID_ByteArray; overload;
    function sendAPDU(cmd: TBEID_ByteArray; pin: TBEID_Pin): TBEID_ByteArray; overload;
    function sendAPDU(cmd: TBEID_ByteArray): TBEID_ByteArray; overload;
    function readFile(fileID: PAnsiChar; _in: TBEID_ByteArray; pin: TBEID_Pin; csPinCode: PAnsiChar): Integer; overload;
    function readFile(fileID: PAnsiChar; _in: TBEID_ByteArray; pin: TBEID_Pin): Integer; overload;
    function readFile(fileID: PAnsiChar; _in: TBEID_ByteArray): Integer; overload;
    function writeFile(fileID: PAnsiChar; _out: TBEID_ByteArray; pin: TBEID_Pin; csPinCode: PAnsiChar): Boolean; overload;
    function writeFile(fileID: PAnsiChar; _out: TBEID_ByteArray; pin: TBEID_Pin): Boolean; overload;
    function writeFile(fileID: PAnsiChar; _out: TBEID_ByteArray): Boolean; overload;
    function pinCount: Cardinal;
    function getPins: TBEID_Pins;
    function certificateCount: Cardinal;
    function getCertificates: TBEID_Certificates;
    function getChallenge(bForceNewInit: Boolean): TBEID_ByteArray; overload;
    function getChallenge: TBEID_ByteArray; overload;
    function getChallengeResponse: TBEID_ByteArray;
    function verifyChallengeResponse(challenge: TBEID_ByteArray; response: TBEID_ByteArray): Boolean;
    destructor Destroy; override;
  end;

  TBEID_SISCard = class(TBEID_MemoryCard)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_SISCard;
  public
    function getDocument(arg0: Cardinal): TBEID_XMLDoc;
    function getFullDoc: TBEID_SisFullDoc;
    function getID: TBEID_SisId;
    function getRawData(arg0: Cardinal): TBEID_ByteArray;
    function getRawData_Id: TBEID_ByteArray;
    destructor Destroy; override;
  end;

  TBEID_EIDCard = class(TBEID_SmartCard)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_EIDCard;
  public
    class function isApplicationAllowed: Boolean;
    function isTestCard: Boolean;
    function getAllowTestCard: Boolean;
    procedure setAllowTestCard(allow: Boolean);
    function getDataStatus: Cardinal;
    function getDocument(arg0: Cardinal): TBEID_XMLDoc;
    function getFullDoc: TBEID_EIdFullDoc;
    function getID: TBEID_EId;
    function getPicture: TBEID_Picture;
    function getVersionInfo: TBEID_CardVersionInfo;
    function getCert(arg0: Cardinal): TBEID_Certificate;
    function getRrn: TBEID_Certificate;
    function getRoot: TBEID_Certificate;
    function getCA: TBEID_Certificate;
    function getSignature: TBEID_Certificate;
    function getAuthentication: TBEID_Certificate;
    function getRawData(arg0: Cardinal): TBEID_ByteArray;
    function getRawData_Id: TBEID_ByteArray;
    function getRawData_IdSig: TBEID_ByteArray;
    function getRawData_Addr: TBEID_ByteArray;
    function getRawData_AddrSig: TBEID_ByteArray;
    function getRawData_Picture: TBEID_ByteArray;
    function getRawData_CardInfo: TBEID_ByteArray;
    function getRawData_TokenInfo: TBEID_ByteArray;
    function getRawData_CertRRN: TBEID_ByteArray;
    function getRawData_Challenge: TBEID_ByteArray;
    function getRawData_Response: TBEID_ByteArray;
    destructor Destroy; override;
  end;

  TBEID_KidsCard = class(TBEID_EIDCard)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_KidsCard;
  public
    destructor Destroy; override;
  end;

  TBEID_ForeignerCard = class(TBEID_EIDCard)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ForeignerCard;
  public
    destructor Destroy; override;
  end;

  TBEID_XMLDoc = class(TBEID_Object)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_XMLDoc;
  public
    function isAllowed: Boolean;
    function getXML: TBEID_ByteArray;
    function getCSV: TBEID_ByteArray;
    function getTLV: TBEID_ByteArray;
    function writeXmlToFile(csFilePath: PAnsiChar): Boolean;
    function writeCsvToFile(csFilePath: PAnsiChar): Boolean;
    function writeTlvToFile(csFilePath: PAnsiChar): Boolean;
    destructor Destroy; override;
  end;

  TBEID_Biometric = class(TBEID_XMLDoc)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Biometric;
  public
    destructor Destroy; override;
  end;

  TBEID_Crypto = class(TBEID_XMLDoc)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Crypto;
  public
    destructor Destroy; override;
  end;

  TBEID_CardVersionInfo = class(TBEID_XMLDoc)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_CardVersionInfo;
  public
    function getSerialNumber: PAnsiChar;
    function getComponentCode: PAnsiChar;
    function getOsNumber: PAnsiChar;
    function getOsVersion: PAnsiChar;
    function getSoftmaskNumber: PAnsiChar;
    function getSoftmaskVersion: PAnsiChar;
    function getAppletVersion: PAnsiChar;
    function getGlobalOsVersion: PAnsiChar;
    function getAppletInterfaceVersion: PAnsiChar;
    function getPKCS1Support: PAnsiChar;
    function getKeyExchangeVersion: PAnsiChar;
    function getAppletLifeCycle: PAnsiChar;
    function getGraphicalPersonalisation: PAnsiChar;
    function getElectricalPersonalisation: PAnsiChar;
    function getElectricalPersonalisationInterface: PAnsiChar;
    function getSignature: TBEID_ByteArray;
    destructor Destroy; override;
  end;

  TBEID_Picture = class(TBEID_Biometric)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Picture;
  public
    function getData: TBEID_ByteArray;
    function getHash: TBEID_ByteArray;
    destructor Destroy; override;
  end;

  TBEID_SisId = class(TBEID_XMLDoc)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_SisId;
  public
    function getName: PAnsiChar;
    function getSurname: PAnsiChar;
    function getInitials: PAnsiChar;
    function getGender: PAnsiChar;
    function getDateOfBirth: PAnsiChar;
    function getSocialSecurityNumber: PAnsiChar;
    function getLogicalNumber: PAnsiChar;
    function getDateOfIssue: PAnsiChar;
    function getValidityBeginDate: PAnsiChar;
    function getValidityEndDate: PAnsiChar;
    destructor Destroy; override;
  end;

  TBEID_EId = class(TBEID_XMLDoc)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_EId;
  public
    function getDocumentVersion: string;
    function getDocumentType: PAnsiChar;
    function getFirstName: PAnsiChar;
    function getFirstName1: PAnsiChar;
    function getFirstName2: PAnsiChar;
    function getSurname: PAnsiChar;
    function getGender: PAnsiChar;
    function getDateOfBirth: PAnsiChar;
    function getLocationOfBirth: PAnsiChar;
    function getNobility: PAnsiChar;
    function getNationality: PAnsiChar;
    function getNationalNumber: PAnsiChar;
    function getDuplicata: PAnsiChar;
    function getSpecialOrganization: PAnsiChar;
    function getMemberOfFamily: PAnsiChar;
    function getLogicalNumber: PAnsiChar;
    function getChipNumber: PAnsiChar;
    function getValidityBeginDate: PAnsiChar;
    function getValidityEndDate: PAnsiChar;
    function getIssuingMunicipality: PAnsiChar;
    function getAddressVersion: PAnsiChar;
    function getStreet: PAnsiChar;
    function getZipCode: PAnsiChar;
    function getMunicipality: PAnsiChar;
    function getCountry: PAnsiChar;
    function getSpecialStatus: PAnsiChar;
    destructor Destroy; override;

    property DocumentVersion : string read getDocumentVersion;
  end;

  TBEID_SisFullDoc = class(TBEID_XMLDoc)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_SisFullDoc;
  public
    destructor Destroy; override;
  end;

  TBEID_EIdFullDoc = class(TBEID_XMLDoc)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_EIdFullDoc;
  public
    destructor Destroy; override;
  end;

  TBEID_Pins = class(TBEID_Crypto)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Pins;
  public
    function count: Cardinal;
    function getPinByNumber(ulIndex: Cardinal): TBEID_Pin;
    destructor Destroy; override;
  end;

  TBEID_Pin = class(TBEID_Crypto)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Pin;
  public
    function getIndex: Cardinal;
    function getType: Cardinal;
    function getId: Cardinal;
    function getUsageCode: Cardinal;
    function getFlags: Cardinal;
    function getLabel: PAnsiChar;
    function getSignature: TBEID_ByteArray;
    function getTriesLeft: Integer;
    function verifyPin: Boolean; overload;
    function verifyPin(csPin: PAnsiChar; ulRemaining: Pointer): Boolean; overload;
    function changePin: Boolean; overload;
    function changePin(csPin1: PAnsiChar; csPin2: PAnsiChar; ulRemaining: Pointer): Boolean; overload;
    destructor Destroy; override;
  end;

  TBEID_Crl = class(TBEID_Object)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Crl;
  public
    constructor Create(uri: PAnsiChar);
    function getUri: PAnsiChar;
    function getIssuerName: PAnsiChar;
    function getIssuer: TBEID_Certificate;
    function getData(crl: TBEID_ByteArray; bForceDownload: Boolean): Cardinal; overload;
    function getData(crl: TBEID_ByteArray): Cardinal; overload;
    destructor Destroy; override;
  end;

  TBEID_OcspResponse = class(TBEID_Object)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_OcspResponse;
  public
    constructor Create(uri: PAnsiChar; hashAlgorithm: Cardinal; issuerNameHash: TBEID_ByteArray; issuerKeyHash: TBEID_ByteArray; serialNumber: TBEID_ByteArray);
    function getUri: PAnsiChar;
    function getResponse(response: TBEID_ByteArray): Cardinal;
    destructor Destroy; override;
  end;

  TBEID_Certificates = class(TBEID_Crypto)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Certificates;
  public
    constructor Create;
    function countFromCard: Cardinal;
    function countAll: Cardinal;
    function getCertFromCard(ulIndexCard: Cardinal): TBEID_Certificate;
    function getCert(ulIndexAll: Cardinal): TBEID_Certificate; overload;
    function getCert(arg0: Cardinal; reserved : integer): TBEID_Certificate; overload;
    function getRrn: TBEID_Certificate;
    function getRoot: TBEID_Certificate;
    function getCA: TBEID_Certificate;
    function getSignature: TBEID_Certificate;
    function getAuthentication: TBEID_Certificate;
    function addCertificate(cert: TBEID_ByteArray): TBEID_Certificate;
    destructor Destroy; override;
  end;

  TBEID_Certificate = class(TBEID_Crypto)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Certificate;
  public
    function getLabel: PAnsiChar;
    function getID: Cardinal;
    function getStatus: Cardinal; overload;
    function getStatus(crl: Cardinal; ocsp: Cardinal): Cardinal; overload;
    function getType: Cardinal;
    function getCertData: TBEID_ByteArray;
    procedure getFormattedData(data: TBEID_ByteArray);
    function getSerialNumber: PAnsiChar;
    function getOwnerName: PAnsiChar;
    function getIssuerName: PAnsiChar;
    function getValidityBegin: PAnsiChar;
    function getValidityEnd: PAnsiChar;
    function getKeyLength: Cardinal;
    function isRoot: Boolean;
    function isTest: Boolean;
    function isFromBeidValidChain: Boolean;
    function isFromCard: Boolean;
    function getIssuer: TBEID_Certificate;
    function countChildren: Cardinal;
    function getChildren(ulIndex: Cardinal): TBEID_Certificate;
    function getCRL: TBEID_Crl;
    function getOcspResponse: TBEID_OcspResponse;
    function verifyCRL(forceDownload: Boolean): Cardinal; overload;
    function verifyCRL: Cardinal; overload;
    function verifyOCSP: Cardinal;
    destructor Destroy; override;
  end;

  TBEID_Config = class(TBEID_Object)
  private
    swigCPtr: Pointer;
    swigCMemOwn: Boolean;
  protected
    constructor CreateIndirect(CPtr: Pointer; CMemOwn: Boolean); override;
    class function CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Config;
  public
    constructor Create(Param: Cardinal); overload;
    constructor Create(csName: PAnsiChar; czSection: PAnsiChar; csDefaultValue: PAnsiChar); overload;
    constructor Create(csName: PAnsiChar; czSection: PAnsiChar; lDefaultValue: Integer); overload;
    function getString: PAnsiChar;
    function getLong: Integer;
    procedure setString(csValue: PAnsiChar);
    procedure setLong(lValue: Integer);
    destructor Destroy; override;
  end;


function DocumentTypeToString(AType : integer) : string;
  
implementation
const
  eidlib_Lib = 'eidlib_delphi.dll';

function _wrap_new_BEID_Exception(lError: Integer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Exception_GetError(swigCPtr: Pointer; var exceptPtr: Pointer): Integer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_Exception(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExReleaseNeeded(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExReleaseNeeded(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExUnknown(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExUnknown(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExDocTypeUnknown(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExDocTypeUnknown(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExFileTypeUnknown(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExFileTypeUnknown(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExParamRange(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExParamRange(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExCmdNotAllowed(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExCmdNotAllowed(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExCmdNotSupported(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExCmdNotSupported(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExNoCardPresent(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExNoCardPresent(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExCardBadType(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExCardBadType(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExCardTypeUnknown(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExCardTypeUnknown(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExCertNoIssuer(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExCertNoIssuer(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExCertNoCrl(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExCertNoCrl(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExCertNoOcsp(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExCertNoOcsp(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExCertNoRoot(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExCertNoRoot(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExBadUsage(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExBadUsage(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExBadTransaction(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExBadTransaction(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExCardChanged(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExCardChanged(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExReaderSetChanged(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExReaderSetChanged(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExNoReader(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExNoReader(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExNotAllowByUser(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExNotAllowByUser(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ExUserMustAnswer(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ExUserMustAnswer(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_Object(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ByteArray__SWIG_0(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_new_BEID_ByteArray__SWIG_1(bytearray: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_new_BEID_ByteArray__SWIG_2(const pucData: PAnsiChar; ulSize: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_BEID_ByteArray_Append__SWIG_0(swigCPtr: Pointer; const pucData: PAnsiChar; ulSize: Cardinal; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_BEID_ByteArray_Append__SWIG_1(swigCPtr: Pointer; data: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_BEID_ByteArray_Clear(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_ByteArray_Equals(swigCPtr: Pointer; data: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_ByteArray_Size(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_ByteArray_GetBytes(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_ByteArray_writeToFile(swigCPtr: Pointer; csFilePath: PAnsiChar; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_ByteArray_assign(swigCPtr: Pointer; bytearray: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ByteArray(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_RawData_Eid(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_RawData_Eid(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_RawData_Sis(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_RawData_Sis(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderSet_instance(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_BEID_ReaderSet_initSDK__SWIG_0(bManageTestCard: Bool; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_BEID_ReaderSet_initSDK__SWIG_1(var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_BEID_ReaderSet_releaseSDK(var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_BEID_ReaderSet_releaseReaders__SWIG_0(swigCPtr: Pointer; bAllReference: Bool; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_BEID_ReaderSet_releaseReaders__SWIG_1(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderSet_isReadersChanged(swigCPtr: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderSet_readerList__SWIG_0(swigCPtr: Pointer; bForceRefresh: Bool; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderSet_readerList__SWIG_1(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderSet_getReader(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderSet_getReaderByName(swigCPtr: Pointer; readerName: PAnsiChar; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderSet_readerCount__SWIG_0(swigCPtr: Pointer; bForceRefresh: Bool; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderSet_readerCount__SWIG_1(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderSet_getReaderName(swigCPtr: Pointer; ulIndex: Cardinal; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderSet_getReaderByNum(swigCPtr: Pointer; ulIndex: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderSet_getReaderByCardSerialNumber(swigCPtr: Pointer; cardSerialNumber: PAnsiChar; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderSet_flushCache(swigCPtr: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ReaderSet(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_ReaderContext__SWIG_0(fileType: Cardinal; fileName: PAnsiChar; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_new_BEID_ReaderContext__SWIG_1(fileType: Cardinal; data: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_new_BEID_ReaderContext__SWIG_2(data: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_new_BEID_ReaderContext__SWIG_3(data: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderContext_getName(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderContext_isCardPresent(swigCPtr: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
procedure _wrap_BEID_ReaderContext_releaseCard__SWIG_0(swigCPtr: Pointer; bAllReference: Bool; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_BEID_ReaderContext_releaseCard__SWIG_1(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderContext_isCardChanged(swigCPtr: Pointer; ulOldId: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderContext_getCardType(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderContext_getCard(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderContext_getEIDCard(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderContext_getKidsCard(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderContext_getForeignerCard(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderContext_getSISCard(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderContext_SetEventCallback(swigCPtr: Pointer; callback: Pointer; pvRef: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
procedure _wrap_BEID_ReaderContext_StopEventCallback(swigCPtr: Pointer; ulHandle: Cardinal; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_BEID_ReaderContext_BeginTransaction(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_BEID_ReaderContext_EndTransaction(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_ReaderContext_isVirtualReader(swigCPtr: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ReaderContext(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_Card_getType(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Card_getDocument(swigCPtr: Pointer; arg0: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Card_getRawData(swigCPtr: Pointer; arg0: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Card_sendAPDU(swigCPtr: Pointer; cmd: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Card_readFile__SWIG_0(swigCPtr: Pointer; fileID: PAnsiChar; ulOffset: Cardinal; ulMaxLength: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Card_readFile__SWIG_1(swigCPtr: Pointer; fileID: PAnsiChar; ulOffset: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Card_readFile__SWIG_2(swigCPtr: Pointer; fileID: PAnsiChar; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Card_writeFile__SWIG_0(swigCPtr: Pointer; fileID: PAnsiChar; oData: Pointer; ulOffset: Cardinal; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_Card_writeFile__SWIG_1(swigCPtr: Pointer; fileID: PAnsiChar; oData: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_Card(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_MemoryCard(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_BEID_SmartCard_selectApplication(swigCPtr: Pointer; applicationId: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_sendAPDU__SWIG_0(swigCPtr: Pointer; cmd: Pointer; pin: Pointer; csPinCode: PAnsiChar; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_sendAPDU__SWIG_1(swigCPtr: Pointer; cmd: Pointer; pin: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_sendAPDU__SWIG_2(swigCPtr: Pointer; cmd: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_readFile__SWIG_0(swigCPtr: Pointer; fileID: PAnsiChar; _in: Pointer; pin: Pointer; csPinCode: PAnsiChar; var exceptPtr: Pointer): Integer; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_readFile__SWIG_1(swigCPtr: Pointer; fileID: PAnsiChar; _in: Pointer; pin: Pointer; var exceptPtr: Pointer): Integer; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_readFile__SWIG_2(swigCPtr: Pointer; fileID: PAnsiChar; _in: Pointer; var exceptPtr: Pointer): Integer; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_writeFile__SWIG_0(swigCPtr: Pointer; fileID: PAnsiChar; _out: Pointer; pin: Pointer; csPinCode: PAnsiChar; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_writeFile__SWIG_1(swigCPtr: Pointer; fileID: PAnsiChar; _out: Pointer; pin: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_writeFile__SWIG_2(swigCPtr: Pointer; fileID: PAnsiChar; _out: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_pinCount(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_getPins(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_certificateCount(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_getCertificates(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_getChallenge__SWIG_0(swigCPtr: Pointer; bForceNewInit: Bool; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_getChallenge__SWIG_1(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_getChallengeResponse(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_SmartCard_verifyChallengeResponse(swigCPtr: Pointer; challenge: Pointer; response: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_SmartCard(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_SISCard_getDocument(swigCPtr: Pointer; arg0: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_SISCard_getFullDoc(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_SISCard_getID(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_SISCard_getRawData(swigCPtr: Pointer; arg0: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_SISCard_getRawData_Id(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_SISCard(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_isApplicationAllowed(var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_isTestCard(swigCPtr: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getAllowTestCard(swigCPtr: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
procedure _wrap_BEID_EIDCard_setAllowTestCard(swigCPtr: Pointer; allow: Bool; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getDataStatus(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getDocument(swigCPtr: Pointer; arg0: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getFullDoc(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getID(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getPicture(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getVersionInfo(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getCert(swigCPtr: Pointer; arg0: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getRrn(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getRoot(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getCA(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getSignature(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getAuthentication(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getRawData(swigCPtr: Pointer; arg0: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getRawData_Id(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getRawData_IdSig(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getRawData_Addr(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getRawData_AddrSig(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getRawData_Picture(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getRawData_CardInfo(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getRawData_TokenInfo(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getRawData_CertRRN(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getRawData_Challenge(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_EIDCard_getRawData_Response(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_EIDCard(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_KidsCard(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_ForeignerCard(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_XMLDoc_isAllowed(swigCPtr: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_XMLDoc_getXML(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_XMLDoc_getCSV(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_XMLDoc_getTLV(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_XMLDoc_writeXmlToFile(swigCPtr: Pointer; csFilePath: PAnsiChar; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_XMLDoc_writeCsvToFile(swigCPtr: Pointer; csFilePath: PAnsiChar; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_XMLDoc_writeTlvToFile(swigCPtr: Pointer; csFilePath: PAnsiChar; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_XMLDoc(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_Biometric(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_Crypto(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getSerialNumber(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getComponentCode(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getOsNumber(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getOsVersion(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getSoftmaskNumber(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getSoftmaskVersion(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getAppletVersion(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getGlobalOsVersion(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getAppletInterfaceVersion(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getPKCS1Support(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getKeyExchangeVersion(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getAppletLifeCycle(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getGraphicalPersonalisation(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getElectricalPersonalisation(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getElectricalPersonalisationInterface(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_CardVersionInfo_getSignature(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_CardVersionInfo(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_Picture_getData(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Picture_getHash(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_Picture(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_SisId_getName(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_SisId_getSurname(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_SisId_getInitials(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_SisId_getGender(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_SisId_getDateOfBirth(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_SisId_getSocialSecurityNumber(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_SisId_getLogicalNumber(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_SisId_getDateOfIssue(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_SisId_getValidityBeginDate(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_SisId_getValidityEndDate(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_SisId(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getDocumentVersion(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getDocumentType(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getFirstName(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getFirstName1(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getFirstName2(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getSurname(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getGender(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getDateOfBirth(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getLocationOfBirth(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getNobility(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getNationality(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getNationalNumber(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getDuplicata(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getSpecialOrganization(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getMemberOfFamily(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getLogicalNumber(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getChipNumber(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getValidityBeginDate(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getValidityEndDate(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getIssuingMunicipality(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getAddressVersion(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getStreet(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getZipCode(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getMunicipality(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getCountry(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_EId_getSpecialStatus(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_EId(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_SisFullDoc(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_EIdFullDoc(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_Pins_count(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Pins_getPinByNumber(swigCPtr: Pointer; ulIndex: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_Pins(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_Pin_getIndex(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Pin_getType(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Pin_getId(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Pin_getUsageCode(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Pin_getFlags(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Pin_getLabel(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_Pin_getSignature(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Pin_getTriesLeft(swigCPtr: Pointer; var exceptPtr: Pointer): Integer; cdecl; external eidlib_Lib;
function _wrap_BEID_Pin_verifyPin__SWIG_0(swigCPtr: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_Pin_verifyPin__SWIG_1(swigCPtr: Pointer; csPin: PAnsiChar; ulRemaining: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_Pin_changePin__SWIG_0(swigCPtr: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_Pin_changePin__SWIG_1(swigCPtr: Pointer; csPin1: PAnsiChar; csPin2: PAnsiChar; ulRemaining: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_Pin(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_Crl(uri: PAnsiChar; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Crl_getUri(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_Crl_getIssuerName(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_Crl_getIssuer(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Crl_getData__SWIG_0(swigCPtr: Pointer; crl: Pointer; bForceDownload: Bool; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Crl_getData__SWIG_1(swigCPtr: Pointer; crl: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_Crl(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_OcspResponse(uri: PAnsiChar; hashAlgorithm: Cardinal; issuerNameHash: Pointer; issuerKeyHash: Pointer; serialNumber: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_OcspResponse_getUri(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_OcspResponse_getResponse(swigCPtr: Pointer; response: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_OcspResponse(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_Certificates(var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificates_countFromCard(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificates_countAll(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificates_getCertFromCard(swigCPtr: Pointer; ulIndexCard: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificates_getCert__SWIG_0(swigCPtr: Pointer; ulIndexAll: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificates_getCert__SWIG_1(swigCPtr: Pointer; arg0: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificates_getRrn(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificates_getRoot(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificates_getCA(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificates_getSignature(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificates_getAuthentication(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificates_addCertificate(swigCPtr: Pointer; cert: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_Certificates(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getLabel(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getID(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getStatus__SWIG_0(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getStatus__SWIG_1(swigCPtr: Pointer; crl: Cardinal; ocsp: Cardinal; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getType(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getCertData(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
procedure _wrap_BEID_Certificate_getFormattedData(swigCPtr: Pointer; data: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getSerialNumber(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getOwnerName(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getIssuerName(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getValidityBegin(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getValidityEnd(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getKeyLength(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_isRoot(swigCPtr: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_isTest(swigCPtr: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_isFromBeidValidChain(swigCPtr: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_isFromCard(swigCPtr: Pointer; var exceptPtr: Pointer): Bool; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getIssuer(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_countChildren(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getChildren(swigCPtr: Pointer; ulIndex: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getCRL(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_getOcspResponse(swigCPtr: Pointer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_verifyCRL__SWIG_0(swigCPtr: Pointer; forceDownload: Bool; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_verifyCRL__SWIG_1(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
function _wrap_BEID_Certificate_verifyOCSP(swigCPtr: Pointer; var exceptPtr: Pointer): Cardinal; cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_Certificate(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
function _wrap_new_BEID_Config__SWIG_0(Param: Cardinal; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_new_BEID_Config__SWIG_1(csName: PAnsiChar; czSection: PAnsiChar; csDefaultValue: PAnsiChar; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_new_BEID_Config__SWIG_2(csName: PAnsiChar; czSection: PAnsiChar; lDefaultValue: Integer; var exceptPtr: Pointer): Pointer; cdecl; external eidlib_Lib;
function _wrap_BEID_Config_getString(swigCPtr: Pointer; var exceptPtr: Pointer): PAnsiChar; cdecl; external eidlib_Lib;
function _wrap_BEID_Config_getLong(swigCPtr: Pointer; var exceptPtr: Pointer): Integer; cdecl; external eidlib_Lib;
procedure _wrap_BEID_Config_setString(swigCPtr: Pointer; csValue: PAnsiChar; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_BEID_Config_setLong(swigCPtr: Pointer; lValue: Integer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;
procedure _wrap_delete_BEID_Config(swigCPtr: Pointer; var exceptPtr: Pointer); cdecl; external eidlib_Lib;


function DocumentTypeToString(AType : integer) : string;
begin
  case AType of
   1: Result := 'Belgian citizen card';
   2: Result := 'European Community citizen card';
   3: Result := 'Non-European Community citizen card';
   4: Result := 'Kids card';
   7: Result := 'Bootstrap card';
   8: Result := 'Habilitation card';
  11: Result := 'Foreigner card type A';
  12: Result := 'Foreigner card type B';
  13: Result := 'Foreigner card type C';
  14: Result := 'Foreigner card type D';
  15: Result := 'Foreigner card type E';
  16: Result := 'Foreigner card type E+';
  17: Result := 'Foreigner card type F+';
  18: Result := 'Foreigner card type F+';
   else
     Result := 'Unknown card';
  end;
end;

procedure HandleException(ExceptPtr: Pointer);
begin
  if ExceptPtr <> nil then
    begin
      HeapFree(GetProcessHeap, 0, ExceptPtr);
      raise Exception.Create('External exception raised');
    end;
end;


function UnWrapStdString(Str: PAnsiChar): String;
begin
  Result := Str;
  HeapFree(GetProcessHeap, 0, Str);
end;

// TBEID_Exception
constructor TBEID_Exception.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_Exception.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_Exception(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_Exception.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Exception;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_Exception.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_Exception.Create(lError: Integer);
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_Exception(lError, exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Exception.GetError: Integer;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Exception_GetError(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExReleaseNeeded
constructor TBEID_ExReleaseNeeded.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExReleaseNeeded.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExReleaseNeeded(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExReleaseNeeded.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExReleaseNeeded;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExReleaseNeeded.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExReleaseNeeded.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExReleaseNeeded(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExUnknown
constructor TBEID_ExUnknown.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExUnknown.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExUnknown(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExUnknown.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExUnknown;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExUnknown.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExUnknown.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExUnknown(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExDocTypeUnknown
constructor TBEID_ExDocTypeUnknown.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExDocTypeUnknown.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExDocTypeUnknown(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExDocTypeUnknown.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExDocTypeUnknown;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExDocTypeUnknown.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExDocTypeUnknown.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExDocTypeUnknown(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExFileTypeUnknown
constructor TBEID_ExFileTypeUnknown.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExFileTypeUnknown.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExFileTypeUnknown(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExFileTypeUnknown.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExFileTypeUnknown;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExFileTypeUnknown.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExFileTypeUnknown.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExFileTypeUnknown(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExParamRange
constructor TBEID_ExParamRange.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExParamRange.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExParamRange(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExParamRange.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExParamRange;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExParamRange.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExParamRange.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExParamRange(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExCmdNotAllowed
constructor TBEID_ExCmdNotAllowed.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExCmdNotAllowed.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExCmdNotAllowed(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExCmdNotAllowed.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCmdNotAllowed;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExCmdNotAllowed.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExCmdNotAllowed.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExCmdNotAllowed(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExCmdNotSupported
constructor TBEID_ExCmdNotSupported.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExCmdNotSupported.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExCmdNotSupported(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExCmdNotSupported.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCmdNotSupported;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExCmdNotSupported.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExCmdNotSupported.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExCmdNotSupported(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExNoCardPresent
constructor TBEID_ExNoCardPresent.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExNoCardPresent.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExNoCardPresent(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExNoCardPresent.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExNoCardPresent;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExNoCardPresent.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExNoCardPresent.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExNoCardPresent(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExCardBadType
constructor TBEID_ExCardBadType.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExCardBadType.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExCardBadType(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExCardBadType.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCardBadType;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExCardBadType.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExCardBadType.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExCardBadType(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExCardTypeUnknown
constructor TBEID_ExCardTypeUnknown.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExCardTypeUnknown.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExCardTypeUnknown(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExCardTypeUnknown.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCardTypeUnknown;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExCardTypeUnknown.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExCardTypeUnknown.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExCardTypeUnknown(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExCertNoIssuer
constructor TBEID_ExCertNoIssuer.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExCertNoIssuer.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExCertNoIssuer(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExCertNoIssuer.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCertNoIssuer;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExCertNoIssuer.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExCertNoIssuer.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExCertNoIssuer(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExCertNoCrl
constructor TBEID_ExCertNoCrl.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExCertNoCrl.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExCertNoCrl(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExCertNoCrl.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCertNoCrl;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExCertNoCrl.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExCertNoCrl.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExCertNoCrl(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExCertNoOcsp
constructor TBEID_ExCertNoOcsp.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExCertNoOcsp.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExCertNoOcsp(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExCertNoOcsp.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCertNoOcsp;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExCertNoOcsp.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExCertNoOcsp.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExCertNoOcsp(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExCertNoRoot
constructor TBEID_ExCertNoRoot.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExCertNoRoot.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExCertNoRoot(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExCertNoRoot.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCertNoRoot;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExCertNoRoot.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExCertNoRoot.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExCertNoRoot(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExBadUsage
constructor TBEID_ExBadUsage.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExBadUsage.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExBadUsage(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExBadUsage.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExBadUsage;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExBadUsage.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExBadUsage.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExBadUsage(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExBadTransaction
constructor TBEID_ExBadTransaction.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExBadTransaction.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExBadTransaction(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExBadTransaction.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExBadTransaction;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExBadTransaction.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExBadTransaction.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExBadTransaction(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExCardChanged
constructor TBEID_ExCardChanged.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExCardChanged.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExCardChanged(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExCardChanged.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExCardChanged;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExCardChanged.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExCardChanged.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExCardChanged(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExReaderSetChanged
constructor TBEID_ExReaderSetChanged.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExReaderSetChanged.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExReaderSetChanged(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExReaderSetChanged.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExReaderSetChanged;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExReaderSetChanged.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExReaderSetChanged.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExReaderSetChanged(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExNoReader
constructor TBEID_ExNoReader.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExNoReader.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExNoReader(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExNoReader.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExNoReader;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExNoReader.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExNoReader.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExNoReader(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExNotAllowByUser
constructor TBEID_ExNotAllowByUser.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExNotAllowByUser.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExNotAllowByUser(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExNotAllowByUser.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExNotAllowByUser;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExNotAllowByUser.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExNotAllowByUser.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExNotAllowByUser(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ExUserMustAnswer
constructor TBEID_ExUserMustAnswer.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ExUserMustAnswer.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ExUserMustAnswer(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ExUserMustAnswer.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ExUserMustAnswer;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ExUserMustAnswer.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ExUserMustAnswer.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ExUserMustAnswer(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_Object
constructor TBEID_Object.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_Object.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_Object(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_Object.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Object;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_Object.CreateIndirect(CPtr, CMemOwn);
end;

// TBEID_ByteArray
constructor TBEID_ByteArray.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ByteArray.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ByteArray(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ByteArray.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ByteArray;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ByteArray.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ByteArray.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ByteArray__SWIG_0(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

constructor TBEID_ByteArray.Create(bytearray: TBEID_ByteArray);
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ByteArray__SWIG_1(bytearray.swigCPtr, exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

constructor TBEID_ByteArray.Create(const pucData: String; ulSize: Cardinal);
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ByteArray__SWIG_2(PAnsiChar(pucData), ulSize, exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

procedure TBEID_ByteArray.Append(const pucData: String; ulSize: Cardinal);
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_ByteArray_Append__SWIG_0(swigCPtr, PAnsiChar(pucData), ulSize, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

procedure TBEID_ByteArray.Append(data: TBEID_ByteArray);
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_ByteArray_Append__SWIG_1(swigCPtr, data.swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

procedure TBEID_ByteArray.Clear;
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_ByteArray_Clear(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ByteArray.Equals(data: TBEID_ByteArray): Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ByteArray_Equals(swigCPtr, data.swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ByteArray.Size: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ByteArray_Size(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ByteArray.GetBytes: pointer;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ByteArray_GetBytes(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ByteArray.writeToFile(csFilePath: PAnsiChar): Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ByteArray_writeToFile(swigCPtr, PAnsiChar(csFilePath), exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ByteArray.assign(bytearray: TBEID_ByteArray): TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_ByteArray_assign(swigCPtr, bytearray.swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_RawData_Eid
constructor TBEID_RawData_Eid.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_RawData_Eid.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_RawData_Eid(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_RawData_Eid.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_RawData_Eid;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_RawData_Eid.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_RawData_Eid.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_RawData_Eid(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_RawData_Sis
constructor TBEID_RawData_Sis.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_RawData_Sis.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_RawData_Sis(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_RawData_Sis.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_RawData_Sis;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_RawData_Sis.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_RawData_Sis.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_RawData_Sis(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ReaderSet
constructor TBEID_ReaderSet.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ReaderSet.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ReaderSet(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ReaderSet.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ReaderSet;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ReaderSet.CreateIndirect(CPtr, CMemOwn);
end;

class function TBEID_ReaderSet.instance: TBEID_ReaderSet;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ReaderSet.CreateObject(_wrap_BEID_ReaderSet_instance(exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

class procedure TBEID_ReaderSet.initSDK(bManageTestCard: Boolean);
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_ReaderSet_initSDK__SWIG_0(bManageTestCard, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

class procedure TBEID_ReaderSet.initSDK;
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_ReaderSet_initSDK__SWIG_1(exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

class procedure TBEID_ReaderSet.releaseSDK;
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_ReaderSet_releaseSDK(exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

procedure TBEID_ReaderSet.releaseReaders(bAllReference: Boolean);
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_ReaderSet_releaseReaders__SWIG_0(swigCPtr, bAllReference, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

procedure TBEID_ReaderSet.releaseReaders;
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_ReaderSet_releaseReaders__SWIG_1(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderSet.isReadersChanged: Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ReaderSet_isReadersChanged(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderSet.readerList(bForceRefresh: Boolean): Pointer;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ReaderSet_readerList__SWIG_0(swigCPtr, bForceRefresh, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderSet.readerList: Pointer;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ReaderSet_readerList__SWIG_1(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderSet.getReader: TBEID_ReaderContext;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ReaderContext.CreateObject(_wrap_BEID_ReaderSet_getReader(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderSet.getReaderByName(readerName: PAnsiChar): TBEID_ReaderContext;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ReaderContext.CreateObject(_wrap_BEID_ReaderSet_getReaderByName(swigCPtr, PAnsiChar(readerName), exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderSet.readerCount(bForceRefresh: Boolean): Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ReaderSet_readerCount__SWIG_0(swigCPtr, bForceRefresh, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderSet.readerCount: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ReaderSet_readerCount__SWIG_1(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderSet.getReaderName(ulIndex: Cardinal): PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ReaderSet_getReaderName(swigCPtr, ulIndex, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderSet.getReaderByNum(ulIndex: Cardinal): TBEID_ReaderContext;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ReaderContext.CreateObject(_wrap_BEID_ReaderSet_getReaderByNum(swigCPtr, ulIndex, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderSet.getReaderByCardSerialNumber(cardSerialNumber: PAnsiChar): TBEID_ReaderContext;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ReaderContext.CreateObject(_wrap_BEID_ReaderSet_getReaderByCardSerialNumber(swigCPtr, PAnsiChar(cardSerialNumber), exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderSet.flushCache: Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ReaderSet_flushCache(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_ReaderContext
constructor TBEID_ReaderContext.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ReaderContext.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ReaderContext(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ReaderContext.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ReaderContext;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ReaderContext.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_ReaderContext.Create(fileType: Cardinal; fileName: PAnsiChar);
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ReaderContext__SWIG_0(fileType, PAnsiChar(fileName), exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

constructor TBEID_ReaderContext.Create(fileType: Cardinal; data: TBEID_ByteArray);
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ReaderContext__SWIG_1(fileType, data.swigCPtr, exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

constructor TBEID_ReaderContext.Create(data: TBEID_RawData_Eid);
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ReaderContext__SWIG_2(data.swigCPtr, exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

constructor TBEID_ReaderContext.Create(data: TBEID_RawData_Sis);
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_ReaderContext__SWIG_3(data.swigCPtr, exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderContext.getName: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ReaderContext_getName(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderContext.isCardPresent: Boolean;
var
  exceptPtr: Pointer;
begin
  if swigCPtr = nil then
    begin
      Result := false;
      Exit;
    end;
  Result := _wrap_BEID_ReaderContext_isCardPresent(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

procedure TBEID_ReaderContext.releaseCard(bAllReference: Boolean);
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_ReaderContext_releaseCard__SWIG_0(swigCPtr, bAllReference, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

procedure TBEID_ReaderContext.releaseCard;
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_ReaderContext_releaseCard__SWIG_1(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderContext.isCardChanged(ulOldId: Pointer): Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ReaderContext_isCardChanged(swigCPtr, ulOldId, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderContext.getCardType: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ReaderContext_getCardType(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderContext.getCard: TBEID_Card;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Card.CreateObject(_wrap_BEID_ReaderContext_getCard(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderContext.getEIDCard: TBEID_EIDCard;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_EIDCard.CreateObject(_wrap_BEID_ReaderContext_getEIDCard(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderContext.getKidsCard: TBEID_KidsCard;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_KidsCard.CreateObject(_wrap_BEID_ReaderContext_getKidsCard(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderContext.getForeignerCard: TBEID_ForeignerCard;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ForeignerCard.CreateObject(_wrap_BEID_ReaderContext_getForeignerCard(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderContext.getSISCard: TBEID_SISCard;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_SISCard.CreateObject(_wrap_BEID_ReaderContext_getSISCard(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderContext.SetEventCallback(callback: Pointer; pvRef: Pointer): Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ReaderContext_SetEventCallback(swigCPtr, callback, pvRef, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

procedure TBEID_ReaderContext.StopEventCallback(ulHandle: Cardinal);
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_ReaderContext_StopEventCallback(swigCPtr, ulHandle, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

procedure TBEID_ReaderContext.BeginTransaction;
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_ReaderContext_BeginTransaction(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

procedure TBEID_ReaderContext.EndTransaction;
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_ReaderContext_EndTransaction(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_ReaderContext.isVirtualReader: Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_ReaderContext_isVirtualReader(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_Card
constructor TBEID_Card.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_Card.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_Card(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_Card.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Card;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_Card.CreateIndirect(CPtr, CMemOwn);
end;

function TBEID_Card.getType: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Card_getType(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Card.getDocument(arg0: Cardinal): TBEID_XMLDoc;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_XMLDoc.CreateObject(_wrap_BEID_Card_getDocument(swigCPtr, arg0, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Card.getRawData(arg0: Cardinal): TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_Card_getRawData(swigCPtr, arg0, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Card.sendAPDU(cmd: TBEID_ByteArray): TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_Card_sendAPDU(swigCPtr, cmd.swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Card.readFile(fileID: PAnsiChar; ulOffset: Cardinal; ulMaxLength: Cardinal): TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_Card_readFile__SWIG_0(swigCPtr, PAnsiChar(fileID), ulOffset, ulMaxLength, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Card.readFile(fileID: PAnsiChar; ulOffset: Cardinal): TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_Card_readFile__SWIG_1(swigCPtr, PAnsiChar(fileID), ulOffset, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Card.readFile(fileID: PAnsiChar): TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_Card_readFile__SWIG_2(swigCPtr, PAnsiChar(fileID), exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Card.writeFile(fileID: PAnsiChar; oData: TBEID_ByteArray; ulOffset: Cardinal): Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Card_writeFile__SWIG_0(swigCPtr, PAnsiChar(fileID), oData.swigCPtr, ulOffset, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Card.writeFile(fileID: PAnsiChar; oData: TBEID_ByteArray): Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Card_writeFile__SWIG_1(swigCPtr, PAnsiChar(fileID), oData.swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_MemoryCard
constructor TBEID_MemoryCard.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_MemoryCard.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_MemoryCard(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_MemoryCard.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_MemoryCard;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_MemoryCard.CreateIndirect(CPtr, CMemOwn);
end;

// TBEID_SmartCard
constructor TBEID_SmartCard.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_SmartCard.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_SmartCard(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_SmartCard.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_SmartCard;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_SmartCard.CreateIndirect(CPtr, CMemOwn);
end;

procedure TBEID_SmartCard.selectApplication(applicationId: TBEID_ByteArray);
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_SmartCard_selectApplication(swigCPtr, applicationId.swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.sendAPDU(cmd: TBEID_ByteArray; pin: TBEID_Pin; csPinCode: PAnsiChar): TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_SmartCard_sendAPDU__SWIG_0(swigCPtr, cmd.swigCPtr, pin.swigCPtr, PAnsiChar(csPinCode), exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.sendAPDU(cmd: TBEID_ByteArray; pin: TBEID_Pin): TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_SmartCard_sendAPDU__SWIG_1(swigCPtr, cmd.swigCPtr, pin.swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.sendAPDU(cmd: TBEID_ByteArray): TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_SmartCard_sendAPDU__SWIG_2(swigCPtr, cmd.swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.readFile(fileID: PAnsiChar; _in: TBEID_ByteArray; pin: TBEID_Pin; csPinCode: PAnsiChar): Integer;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SmartCard_readFile__SWIG_0(swigCPtr, PAnsiChar(fileID), _in.swigCPtr, pin.swigCPtr, PAnsiChar(csPinCode), exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.readFile(fileID: PAnsiChar; _in: TBEID_ByteArray; pin: TBEID_Pin): Integer;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SmartCard_readFile__SWIG_1(swigCPtr, PAnsiChar(fileID), _in.swigCPtr, pin.swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.readFile(fileID: PAnsiChar; _in: TBEID_ByteArray): Integer;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SmartCard_readFile__SWIG_2(swigCPtr, PAnsiChar(fileID), _in.swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.writeFile(fileID: PAnsiChar; _out: TBEID_ByteArray; pin: TBEID_Pin; csPinCode: PAnsiChar): Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SmartCard_writeFile__SWIG_0(swigCPtr, PAnsiChar(fileID), _out.swigCPtr, pin.swigCPtr, PAnsiChar(csPinCode), exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.writeFile(fileID: PAnsiChar; _out: TBEID_ByteArray; pin: TBEID_Pin): Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SmartCard_writeFile__SWIG_1(swigCPtr, PAnsiChar(fileID), _out.swigCPtr, pin.swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.writeFile(fileID: PAnsiChar; _out: TBEID_ByteArray): Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SmartCard_writeFile__SWIG_2(swigCPtr, PAnsiChar(fileID), _out.swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.pinCount: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SmartCard_pinCount(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.getPins: TBEID_Pins;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Pins.CreateObject(_wrap_BEID_SmartCard_getPins(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.certificateCount: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SmartCard_certificateCount(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.getCertificates: TBEID_Certificates;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificates.CreateObject(_wrap_BEID_SmartCard_getCertificates(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.getChallenge(bForceNewInit: Boolean): TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_SmartCard_getChallenge__SWIG_0(swigCPtr, bForceNewInit, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.getChallenge: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_SmartCard_getChallenge__SWIG_1(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.getChallengeResponse: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_SmartCard_getChallengeResponse(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SmartCard.verifyChallengeResponse(challenge: TBEID_ByteArray; response: TBEID_ByteArray): Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SmartCard_verifyChallengeResponse(swigCPtr, challenge.swigCPtr, response.swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_SISCard
constructor TBEID_SISCard.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_SISCard.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_SISCard(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_SISCard.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_SISCard;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_SISCard.CreateIndirect(CPtr, CMemOwn);
end;

function TBEID_SISCard.getDocument(arg0: Cardinal): TBEID_XMLDoc;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_XMLDoc.CreateObject(_wrap_BEID_SISCard_getDocument(swigCPtr, arg0, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SISCard.getFullDoc: TBEID_SisFullDoc;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_SisFullDoc.CreateObject(_wrap_BEID_SISCard_getFullDoc(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SISCard.getID: TBEID_SisId;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_SisId.CreateObject(_wrap_BEID_SISCard_getID(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SISCard.getRawData(arg0: Cardinal): TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_SISCard_getRawData(swigCPtr, arg0, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SISCard.getRawData_Id: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_SISCard_getRawData_Id(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_EIDCard
constructor TBEID_EIDCard.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
  inherited;
end;

destructor TBEID_EIDCard.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_EIDCard(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_EIDCard.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_EIDCard;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_EIDCard.CreateIndirect(CPtr, CMemOwn);
end;

class function TBEID_EIDCard.isApplicationAllowed: Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EIDCard_isApplicationAllowed(exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.isTestCard: Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EIDCard_isTestCard(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getAllowTestCard: Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EIDCard_getAllowTestCard(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

procedure TBEID_EIDCard.setAllowTestCard(allow: Boolean);
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_EIDCard_setAllowTestCard(swigCPtr, allow, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getDataStatus: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EIDCard_getDataStatus(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getDocument(arg0: Cardinal): TBEID_XMLDoc;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_XMLDoc.CreateObject(_wrap_BEID_EIDCard_getDocument(swigCPtr, arg0, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getFullDoc: TBEID_EIdFullDoc;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_EIdFullDoc.CreateObject(_wrap_BEID_EIDCard_getFullDoc(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getID: TBEID_EId;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_EId.CreateObject(_wrap_BEID_EIDCard_getID(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getPicture: TBEID_Picture;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Picture.CreateObject(_wrap_BEID_EIDCard_getPicture(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getVersionInfo: TBEID_CardVersionInfo;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_CardVersionInfo.CreateObject(_wrap_BEID_EIDCard_getVersionInfo(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getCert(arg0: Cardinal): TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_EIDCard_getCert(swigCPtr, arg0, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getRrn: TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_EIDCard_getRrn(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getRoot: TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_EIDCard_getRoot(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getCA: TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_EIDCard_getCA(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getSignature: TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_EIDCard_getSignature(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getAuthentication: TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_EIDCard_getAuthentication(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getRawData(arg0: Cardinal): TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_EIDCard_getRawData(swigCPtr, arg0, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getRawData_Id: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_EIDCard_getRawData_Id(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getRawData_IdSig: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_EIDCard_getRawData_IdSig(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getRawData_Addr: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_EIDCard_getRawData_Addr(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getRawData_AddrSig: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_EIDCard_getRawData_AddrSig(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getRawData_Picture: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_EIDCard_getRawData_Picture(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getRawData_CardInfo: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_EIDCard_getRawData_CardInfo(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getRawData_TokenInfo: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_EIDCard_getRawData_TokenInfo(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getRawData_CertRRN: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_EIDCard_getRawData_CertRRN(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getRawData_Challenge: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_EIDCard_getRawData_Challenge(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EIDCard.getRawData_Response: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_EIDCard_getRawData_Response(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_KidsCard
constructor TBEID_KidsCard.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_KidsCard.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_KidsCard(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_KidsCard.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_KidsCard;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_KidsCard.CreateIndirect(CPtr, CMemOwn);
end;

// TBEID_ForeignerCard
constructor TBEID_ForeignerCard.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_ForeignerCard.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_ForeignerCard(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_ForeignerCard.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_ForeignerCard;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_ForeignerCard.CreateIndirect(CPtr, CMemOwn);
end;

// TBEID_XMLDoc
constructor TBEID_XMLDoc.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_XMLDoc.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_XMLDoc(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_XMLDoc.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_XMLDoc;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_XMLDoc.CreateIndirect(CPtr, CMemOwn);
end;

function TBEID_XMLDoc.isAllowed: Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_XMLDoc_isAllowed(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_XMLDoc.getXML: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_XMLDoc_getXML(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_XMLDoc.getCSV: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_XMLDoc_getCSV(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_XMLDoc.getTLV: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_XMLDoc_getTLV(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_XMLDoc.writeXmlToFile(csFilePath: PAnsiChar): Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_XMLDoc_writeXmlToFile(swigCPtr, PAnsiChar(csFilePath), exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_XMLDoc.writeCsvToFile(csFilePath: PAnsiChar): Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_XMLDoc_writeCsvToFile(swigCPtr, PAnsiChar(csFilePath), exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_XMLDoc.writeTlvToFile(csFilePath: PAnsiChar): Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_XMLDoc_writeTlvToFile(swigCPtr, PAnsiChar(csFilePath), exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_Biometric
constructor TBEID_Biometric.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_Biometric.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_Biometric(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_Biometric.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Biometric;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_Biometric.CreateIndirect(CPtr, CMemOwn);
end;

// TBEID_Crypto
constructor TBEID_Crypto.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_Crypto.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_Crypto(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_Crypto.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Crypto;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_Crypto.CreateIndirect(CPtr, CMemOwn);
end;

// TBEID_CardVersionInfo
constructor TBEID_CardVersionInfo.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_CardVersionInfo.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_CardVersionInfo(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_CardVersionInfo.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_CardVersionInfo;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_CardVersionInfo.CreateIndirect(CPtr, CMemOwn);
end;

function TBEID_CardVersionInfo.getSerialNumber: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_CardVersionInfo_getSerialNumber(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_CardVersionInfo.getComponentCode: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_CardVersionInfo_getComponentCode(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_CardVersionInfo.getOsNumber: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_CardVersionInfo_getOsNumber(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_CardVersionInfo.getOsVersion: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_CardVersionInfo_getOsVersion(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_CardVersionInfo.getSoftmaskNumber: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_CardVersionInfo_getSoftmaskNumber(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_CardVersionInfo.getSoftmaskVersion: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_CardVersionInfo_getSoftmaskVersion(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_CardVersionInfo.getAppletVersion: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_CardVersionInfo_getAppletVersion(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_CardVersionInfo.getGlobalOsVersion: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_CardVersionInfo_getGlobalOsVersion(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_CardVersionInfo.getAppletInterfaceVersion: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_CardVersionInfo_getAppletInterfaceVersion(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_CardVersionInfo.getPKCS1Support: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_CardVersionInfo_getPKCS1Support(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_CardVersionInfo.getKeyExchangeVersion: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_CardVersionInfo_getKeyExchangeVersion(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_CardVersionInfo.getAppletLifeCycle: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_CardVersionInfo_getAppletLifeCycle(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_CardVersionInfo.getGraphicalPersonalisation: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_CardVersionInfo_getGraphicalPersonalisation(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_CardVersionInfo.getElectricalPersonalisation: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_CardVersionInfo_getElectricalPersonalisation(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_CardVersionInfo.getElectricalPersonalisationInterface: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_CardVersionInfo_getElectricalPersonalisationInterface(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_CardVersionInfo.getSignature: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_CardVersionInfo_getSignature(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_Picture
constructor TBEID_Picture.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_Picture.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_Picture(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_Picture.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Picture;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_Picture.CreateIndirect(CPtr, CMemOwn);
end;

function TBEID_Picture.getData: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_Picture_getData(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Picture.getHash: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_Picture_getHash(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_SisId
constructor TBEID_SisId.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_SisId.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_SisId(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_SisId.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_SisId;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_SisId.CreateIndirect(CPtr, CMemOwn);
end;

function TBEID_SisId.getName: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SisId_getName(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SisId.getSurname: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SisId_getSurname(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SisId.getInitials: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SisId_getInitials(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SisId.getGender: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SisId_getGender(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SisId.getDateOfBirth: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SisId_getDateOfBirth(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SisId.getSocialSecurityNumber: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SisId_getSocialSecurityNumber(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SisId.getLogicalNumber: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SisId_getLogicalNumber(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SisId.getDateOfIssue: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SisId_getDateOfIssue(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SisId.getValidityBeginDate: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SisId_getValidityBeginDate(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_SisId.getValidityEndDate: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_SisId_getValidityEndDate(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_EId
constructor TBEID_EId.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_EId.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_EId(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_EId.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_EId;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_EId.CreateIndirect(CPtr, CMemOwn);
end;

function TBEID_EId.getDocumentVersion: string;
var
  exceptPtr: Pointer;
begin
  Result := string(_wrap_BEID_EId_getDocumentVersion(swigCPtr, exceptPtr));
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getDocumentType: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getDocumentType(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getFirstName: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getFirstName(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getFirstName1: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getFirstName1(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getFirstName2: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getFirstName2(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getSurname: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getSurname(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getGender: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getGender(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getDateOfBirth: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getDateOfBirth(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getLocationOfBirth: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getLocationOfBirth(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getNobility: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getNobility(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getNationality: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getNationality(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getNationalNumber: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getNationalNumber(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getDuplicata: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getDuplicata(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getSpecialOrganization: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getSpecialOrganization(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getMemberOfFamily: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getMemberOfFamily(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getLogicalNumber: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getLogicalNumber(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getChipNumber: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getChipNumber(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getValidityBeginDate: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getValidityBeginDate(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getValidityEndDate: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getValidityEndDate(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getIssuingMunicipality: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getIssuingMunicipality(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getAddressVersion: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getAddressVersion(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getStreet: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getStreet(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getZipCode: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getZipCode(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getMunicipality: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getMunicipality(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getCountry: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getCountry(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_EId.getSpecialStatus: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_EId_getSpecialStatus(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_SisFullDoc
constructor TBEID_SisFullDoc.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_SisFullDoc.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_SisFullDoc(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_SisFullDoc.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_SisFullDoc;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_SisFullDoc.CreateIndirect(CPtr, CMemOwn);
end;

// TBEID_EIdFullDoc
constructor TBEID_EIdFullDoc.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_EIdFullDoc.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_EIdFullDoc(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_EIdFullDoc.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_EIdFullDoc;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_EIdFullDoc.CreateIndirect(CPtr, CMemOwn);
end;

// TBEID_Pins
constructor TBEID_Pins.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_Pins.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_Pins(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_Pins.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Pins;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_Pins.CreateIndirect(CPtr, CMemOwn);
end;

function TBEID_Pins.count: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Pins_count(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Pins.getPinByNumber(ulIndex: Cardinal): TBEID_Pin;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Pin.CreateObject(_wrap_BEID_Pins_getPinByNumber(swigCPtr, ulIndex, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_Pin
constructor TBEID_Pin.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_Pin.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_Pin(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_Pin.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Pin;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_Pin.CreateIndirect(CPtr, CMemOwn);
end;

function TBEID_Pin.getIndex: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Pin_getIndex(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Pin.getType: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Pin_getType(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Pin.getId: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Pin_getId(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Pin.getUsageCode: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Pin_getUsageCode(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Pin.getFlags: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Pin_getFlags(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Pin.getLabel: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Pin_getLabel(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Pin.getSignature: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_Pin_getSignature(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Pin.getTriesLeft: Integer;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Pin_getTriesLeft(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Pin.verifyPin: Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Pin_verifyPin__SWIG_0(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Pin.verifyPin(csPin: PAnsiChar; ulRemaining: Pointer): Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Pin_verifyPin__SWIG_1(swigCPtr, PAnsiChar(csPin), ulRemaining, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Pin.changePin: Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Pin_changePin__SWIG_0(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Pin.changePin(csPin1: PAnsiChar; csPin2: PAnsiChar; ulRemaining: Pointer): Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Pin_changePin__SWIG_1(swigCPtr, PAnsiChar(csPin1), PAnsiChar(csPin2), ulRemaining, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_Crl
constructor TBEID_Crl.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_Crl.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_Crl(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_Crl.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Crl;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_Crl.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_Crl.Create(uri: PAnsiChar);
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_Crl(PAnsiChar(uri), exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Crl.getUri: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Crl_getUri(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Crl.getIssuerName: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Crl_getIssuerName(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Crl.getIssuer: TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_Crl_getIssuer(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Crl.getData(crl: TBEID_ByteArray; bForceDownload: Boolean): Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Crl_getData__SWIG_0(swigCPtr, crl.swigCPtr, bForceDownload, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Crl.getData(crl: TBEID_ByteArray): Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Crl_getData__SWIG_1(swigCPtr, crl.swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_OcspResponse
constructor TBEID_OcspResponse.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_OcspResponse.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_OcspResponse(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_OcspResponse.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_OcspResponse;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_OcspResponse.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_OcspResponse.Create(uri: PAnsiChar; hashAlgorithm: Cardinal; issuerNameHash: TBEID_ByteArray; issuerKeyHash: TBEID_ByteArray; serialNumber: TBEID_ByteArray);
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_OcspResponse(PAnsiChar(uri), hashAlgorithm, issuerNameHash.swigCPtr, issuerKeyHash.swigCPtr, serialNumber.swigCPtr, exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_OcspResponse.getUri: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_OcspResponse_getUri(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_OcspResponse.getResponse(response: TBEID_ByteArray): Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_OcspResponse_getResponse(swigCPtr, response.swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_Certificates
constructor TBEID_Certificates.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_Certificates.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_Certificates(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_Certificates.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Certificates;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_Certificates.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_Certificates.Create;
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_Certificates(exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificates.countFromCard: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificates_countFromCard(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificates.countAll: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificates_countAll(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificates.getCertFromCard(ulIndexCard: Cardinal): TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_Certificates_getCertFromCard(swigCPtr, ulIndexCard, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificates.getCert(ulIndexAll: Cardinal): TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_Certificates_getCert__SWIG_0(swigCPtr, ulIndexAll, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;


function TBEID_Certificates.getCert(arg0: Cardinal; reserved : integer): TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_Certificates_getCert__SWIG_1(swigCPtr, arg0, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;


function TBEID_Certificates.getRrn: TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_Certificates_getRrn(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificates.getRoot: TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_Certificates_getRoot(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificates.getCA: TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_Certificates_getCA(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificates.getSignature: TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_Certificates_getSignature(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificates.getAuthentication: TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_Certificates_getAuthentication(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificates.addCertificate(cert: TBEID_ByteArray): TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_Certificates_addCertificate(swigCPtr, cert.swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_Certificate
constructor TBEID_Certificate.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_Certificate.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_Certificate(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_Certificate.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Certificate;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_Certificate.CreateIndirect(CPtr, CMemOwn);
end;

function TBEID_Certificate.getLabel: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_getLabel(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.getID: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_getID(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.getStatus: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_getStatus__SWIG_0(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.getStatus(crl: Cardinal; ocsp: Cardinal): Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_getStatus__SWIG_1(swigCPtr, crl, ocsp, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.getType: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_getType(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.getCertData: TBEID_ByteArray;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_ByteArray.CreateObject(_wrap_BEID_Certificate_getCertData(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

procedure TBEID_Certificate.getFormattedData(data: TBEID_ByteArray);
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_Certificate_getFormattedData(swigCPtr, data.swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.getSerialNumber: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_getSerialNumber(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.getOwnerName: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_getOwnerName(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.getIssuerName: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_getIssuerName(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.getValidityBegin: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_getValidityBegin(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.getValidityEnd: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_getValidityEnd(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.getKeyLength: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_getKeyLength(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.isRoot: Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_isRoot(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.isTest: Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_isTest(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.isFromBeidValidChain: Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_isFromBeidValidChain(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.isFromCard: Boolean;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_isFromCard(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.getIssuer: TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_Certificate_getIssuer(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.countChildren: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_countChildren(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.getChildren(ulIndex: Cardinal): TBEID_Certificate;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Certificate.CreateObject(_wrap_BEID_Certificate_getChildren(swigCPtr, ulIndex, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.getCRL: TBEID_Crl;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_Crl.CreateObject(_wrap_BEID_Certificate_getCRL(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.getOcspResponse: TBEID_OcspResponse;
var
  exceptPtr: Pointer;
begin
  Result := TBEID_OcspResponse.CreateObject(_wrap_BEID_Certificate_getOcspResponse(swigCPtr, exceptPtr), false);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.verifyCRL(forceDownload: Boolean): Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_verifyCRL__SWIG_0(swigCPtr, forceDownload, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.verifyCRL: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_verifyCRL__SWIG_1(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Certificate.verifyOCSP: Cardinal;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Certificate_verifyOCSP(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

// TBEID_Config
constructor TBEID_Config.CreateIndirect(CPtr: Pointer; CMemOwn: Boolean);
begin
  inherited;
  swigCPtr := CPtr;
  swigCMemOwn := CMemOwn;
end;

destructor TBEID_Config.Destroy;
var
  exceptPtr: Pointer;
begin
  if swigCMemOwn then
    begin
      swigCMemOwn := False;
      if swigCPtr <> nil then
        begin
          _wrap_delete_BEID_Config(swigCPtr, exceptPtr);
          if exceptPtr <> nil then HandleException(exceptPtr);
        end;
    end;
  inherited Destroy;
end;

class function TBEID_Config.CreateObject(CPtr: Pointer; CMemOwn: Boolean): TBEID_Config;
begin
  Result := nil;
  if CPtr <> nil then
    Result := TBEID_Config.CreateIndirect(CPtr, CMemOwn);
end;

constructor TBEID_Config.Create(Param: Cardinal);
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_Config__SWIG_0(Param, exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

constructor TBEID_Config.Create(csName: PAnsiChar; czSection: PAnsiChar; csDefaultValue: PAnsiChar);
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_Config__SWIG_1(PAnsiChar(csName), PAnsiChar(czSection), PAnsiChar(csDefaultValue), exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

constructor TBEID_Config.Create(csName: PAnsiChar; czSection: PAnsiChar; lDefaultValue: Integer);
var
  exceptPtr: Pointer;
begin
  CreateIndirect(_wrap_new_BEID_Config__SWIG_2(PAnsiChar(csName), PAnsiChar(czSection), lDefaultValue, exceptPtr), true);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Config.getString: PAnsiChar;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Config_getString(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

function TBEID_Config.getLong: Integer;
var
  exceptPtr: Pointer;
begin
  Result := _wrap_BEID_Config_getLong(swigCPtr, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

procedure TBEID_Config.setString(csValue: PAnsiChar);
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_Config_setString(swigCPtr, PAnsiChar(csValue), exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

procedure TBEID_Config.setLong(lValue: Integer);
var
  exceptPtr: Pointer;
begin
  _wrap_BEID_Config_setLong(swigCPtr, lValue, exceptPtr);
  if exceptPtr <> nil then HandleException(exceptPtr);
end;

end.
