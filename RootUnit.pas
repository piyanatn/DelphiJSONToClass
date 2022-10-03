unit RootUnit;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TFields = class;
  TLinks = class;
  TRecords = class;

  TLinks = class
  private
    FNext: string;
    FStart: string;
  published
    property Next: string read FNext write FNext;
    property Start: string read FStart write FStart;
  end;

  TRecords = class
  private
    FAge: Integer;
    [SuppressZero, JSONName('announce_date')]
    FAnnounceDate: TDateTime;
    [JSONName('district_of_onset')]
    FDistrictOfOnset: string;
    [JSONName('_id')]
    FId: Integer;
    FNationality: string;
    [JSONName('No.')]
    FNo: Integer;
    [SuppressZero, JSONName('Notified date')]
    FNotifiedDate: TDateTime;
    [JSONName('province_of_isolation')]
    FProvinceOfIsolation: string;
    [JSONName('province_of_onset')]
    FProvinceOfOnset: string;
    FRisk: string;
    FSex: string;
    FUnit: string;
  published
    property Age: Integer read FAge write FAge;
    property AnnounceDate: TDateTime read FAnnounceDate write FAnnounceDate;
    property DistrictOfOnset: string read FDistrictOfOnset write FDistrictOfOnset;
    property Id: Integer read FId write FId;
    property Nationality: string read FNationality write FNationality;
    property No: Integer read FNo write FNo;
    property NotifiedDate: TDateTime read FNotifiedDate write FNotifiedDate;
    property ProvinceOfIsolation: string read FProvinceOfIsolation write FProvinceOfIsolation;
    property ProvinceOfOnset: string read FProvinceOfOnset write FProvinceOfOnset;
    property Risk: string read FRisk write FRisk;
    property Sex: string read FSex write FSex;
    property &Unit: string read FUnit write FUnit;
  end;

  TFields = class
  private
    FId: string;
    FType: string;
  published
    property Id: string read FId write FId;
    property &Type: string read FType write FType;
  end;

  TResult = class(TJsonDTO)
  private
    [JSONName('fields'), JSONMarshalled(False)]
    FFieldsArray: TArray<TFields>;
    [GenericListReflect]
    FFields: TObjectList<TFields>;
    [JSONName('include_total')]
    FIncludeTotal: Boolean;
    FLimit: Integer;
    [JSONName('_links')]
    FLinks: TLinks;
    [JSONName('records'), JSONMarshalled(False)]
    FRecordsArray: TArray<TRecords>;
    [GenericListReflect]
    FRecords: TObjectList<TRecords>;
    [JSONName('records_format')]
    FRecordsFormat: string;
    [JSONName('resource_id')]
    FResourceId: string;
    FTotal: Integer;
    function GetFields: TObjectList<TFields>;
    function GetRecords: TObjectList<TRecords>;
  protected
    function GetAsJson: string; override;
  published
    property Fields: TObjectList<TFields> read GetFields;
    property IncludeTotal: Boolean read FIncludeTotal write FIncludeTotal;
    property Limit: Integer read FLimit write FLimit;
    property Links: TLinks read FLinks;
    property Records: TObjectList<TRecords> read GetRecords;
    property RecordsFormat: string read FRecordsFormat write FRecordsFormat;
    property ResourceId: string read FResourceId write FResourceId;
    property Total: Integer read FTotal write FTotal;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

  TRoot = class(TJsonDTO)
  private
    FHelp: string;
    FResult: TResult;
    FSuccess: Boolean;
  published
    property Help: string read FHelp write FHelp;
    property Result: TResult read FResult;
    property Success: Boolean read FSuccess write FSuccess;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TResult }

constructor TResult.Create;
begin
  inherited;
  FLinks := TLinks.Create;
end;

destructor TResult.Destroy;
begin
  FLinks.Free;
  GetFields.Free;
  GetRecords.Free;
  inherited;
end;

function TResult.GetFields: TObjectList<TFields>;
begin
  Result := ObjectList<TFields>(FFields, FFieldsArray);
end;

function TResult.GetRecords: TObjectList<TRecords>;
begin
  Result := ObjectList<TRecords>(FRecords, FRecordsArray);
end;

function TResult.GetAsJson: string;
begin
  RefreshArray<TFields>(FFields, FFieldsArray);
  RefreshArray<TRecords>(FRecords, FRecordsArray);
  Result := inherited;
end;

{ TRoot }

constructor TRoot.Create;
begin
  inherited;
  FResult := TResult.Create;
end;

destructor TRoot.Destroy;
begin
  FResult.Free;
  inherited;
end;

end.
