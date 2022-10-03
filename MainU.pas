unit MainU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent,
  cxTextEdit, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  Datasnap.Provider;


type
  TCovidQ = class(TObject);
  TMainForm = class(TForm)
    BtnCallAPI: TButton;
    NetHTTPClient1: TNetHTTPClient;
    NetHTTPRequest1: TNetHTTPRequest;
    ClientDataSet1: TClientDataSet;
    TxtID: TEdit;
    ClientDataSet1_id: TIntegerField;
    ClientDataSet1No: TIntegerField;
    ClientDataSet1announce_date: TSQLTimeStampField;
    ClientDataSet1Notified_date: TSQLTimeStampField;
    ClientDataSet1sex: TStringField;
    ClientDataSet1age: TIntegerField;
    ClientDataSet1Unit: TStringField;
    ClientDataSet1nationality: TStringField;
    ClientDataSet1province_of_isolation: TStringField;
    ClientDataSet1risk: TStringField;
    ClientDataSet1province_of_onset: TStringField;
    ClientDataSet1district_of_onset: TStringField;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    procedure BtnCallAPIClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses  RootUnit, Pkg.Json.DTO;

procedure TMainForm.BtnCallAPIClick(Sender: TObject);
var
 Covid: TRoot;
 Res : IHTTPResponse;
  i : integer;
begin
i := 0;
 Covid := TRoot.Create();


  try
   NetHTTPRequest1.CustomHeaders['api-key'] := 'qln8uWQGLdkiTshJXyyAr7EqOlBrLHvk';
   Res:=  NetHTTPRequest1.get('https://opend.data.go.th/get-ckan/datastore_search?resource_id=4688036a-cd89-45f7-a0c3-a34dbe35a50c&limit=5');

   Covid.AsJson := Res.ContentAsString();
     TXTID.Text := COVID.Result.ResourceId ;
   if  COVID.Result.Records.Count > 0 then
    begin

                For i := 0 to   COVID.Result.Records.Count -1 do
                  begin
                     //Load Loaddata
                     ClientDataSet1.Append;
                     ClientDataSet1.FieldByName('_id').AsInteger :=   COVID.Result.Records[i].Id ;
                     ClientDataSet1.FieldByName('province_of_isolation').AsString :=   COVID.Result.Records[i].ProvinceOfIsolation ;
                     ClientDataSet1.FieldByName('nationality').AsString :=   COVID.Result.Records[i].Nationality ;
                     ClientDataSet1.FieldByName('district_of_onset').AsString :=   COVID.Result.Records[i].DistrictOfOnset ;
                     ClientDataSet1.FieldByName('province_of_onset').AsString :=   COVID.Result.Records[i].ProvinceOfOnset ;
                     ClientDataSet1.FieldByName('Notified_date').AsDateTime :=   COVID.Result.Records[i].NotifiedDate ;
                     ClientDataSet1.FieldByName('announce_date').AsDateTime :=   COVID.Result.Records[i].AnnounceDate ;
                     ClientDataSet1.FieldByName('No').AsInteger :=   COVID.Result.Records[i].No ;
                     ClientDataSet1.FieldByName('sex').AsString :=   COVID.Result.Records[i].Sex ;
                     ClientDataSet1.FieldByName('age').AsInteger :=   COVID.Result.Records[i].Age ;
                     ClientDataSet1.FieldByName('Unit').AsString :=   COVID.Result.Records[i].&Unit ;
                     ClientDataSet1.FieldByName('risk').AsString :=   COVID.Result.Records[i].Risk ;
                     ClientDataSet1.Post;
                     next;

                  end;
            //     ClientDataSet1.RefreshRecord;
            //     DBGrid1.DataSource := DataSource1;
            //     DBGrid1.Refresh;

    end;


  finally
    Covid.Free;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ClientDataSet1.CreateDataSet;
  ClientDataSet1.Open;

end;

end.
