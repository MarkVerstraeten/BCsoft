unit BilliardsMember;

interface

uses
  Classes,
  Graphics,
  JPEG;

type
  TBilliardMember = class
  private
    fBirthDate: string;
    fDocumentType: string;
    fStreet: string;
    fValidFrom: string;
    fLastName: string;
    fCardNumber: string;
    fZipCode: string;
    fMunicipality: string;
    fNickName: string;
    fId: integer;
    fNationality: string;
    fNationalNumber: string;
    fChipNumber: string;
    fGender: string;
    fCountry: string;
    fFirstName: string;
    fBirthPlace: string;
    fValidUntil: string;
    fPicture: TJpegImage;
    function GetFullName: string;
    function GetListName: string;
    function GetPicture: TJpegImage;
    procedure SetPicture(const Value: TJpegImage);
  public
    procedure Clear;
    function Exist: boolean;
    procedure Retrieve(aID: integer);
    procedure Update;
    procedure Store;
    procedure StorePicture;
    function ToString: string; override;
    procedure LoadPictureFromStream(aStream: TStream);

    property ID: integer read fId write fId;
    property LastName: string read fLastName write fLastName;
    property FirstName: string read fFirstName write fFirstName;
    property FullName: string read GetFullName;
    property NickName: string read fNickName write fNickName;
    property ListName: string read GetListName;
    property BirthDate: string read fBirthDate write fBirthDate;
    property BirthPlace: string read fBirthPlace write fBirthPlace;
    property NationalNumber: string read fNationalNumber write fNationalNumber;
    property Gender: string read fGender write fGender;
    property Nationality: string read fNationality write fNationality;
    property Municipality: string read fMunicipality write fMunicipality;
    property CardNumber: string read fCardNumber write fCardNumber;
    property ValidFrom: string read fValidFrom write fValidFrom;
    property ValidUntil: string read fValidUntil write fValidUntil;
    property DocumentType: string read fDocumentType write fDocumentType;
    property ChipNumber: string read fChipNumber write fChipNumber;
    property Street: string read fStreet write fStreet;
    property ZipCode: string read fZipCode write fZipCode;
    property Country: string read fCountry write fCountry;
    property Picture: TJpegImage read GetPicture write SetPicture;
  end;

implementation

uses
  SysUtils,
  Dialogs,
  DB,
  IBDatabase,
  IBQuery,
  IBCustomDataSet,
  BilliardsDataModule;

{ TBilliardMember }

procedure TBilliardMember.Clear;
begin
  ID := 0;
  LastName := '';
  FirstName := '';
  NickName := '';
  BirthDate := '';
  BirthPlace := '';
  NationalNumber := '';
  Gender := '';
  Nationality := '';
  Municipality := '';
  CardNumber := '';
  ValidFrom := '';
  ValidUntil := '';
  DocumentType := '';
  ChipNumber := '';
  Street := '';
  ZipCode := '';
  Country := '';
  if Assigned(fPicture) then
    FreeAndNil(fPicture);
end;

procedure TBilliardMember.Retrieve(aID: integer);
begin
  if fId <> aID then
    fId := aID;
  Update;
end;

function TBilliardMember.Exist: boolean;
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    SL.Add('select ID');
    SL.Add(' from MEMBERS');
    SL.Add(' where LASTNAME = :lastname ');
    SL.Add(' and FIRSTNAME = :firstname');
    BilliardDataModule.sqlQuery.SQL.Assign(SL);
  finally
    SL.Free;
  end;
  BilliardDataModule.sqlQuery.ParamByName('lastname').AsString := fLastName;
  BilliardDataModule.sqlQuery.ParamByName('firstname').AsString := fFirstName;
  BilliardDataModule.sqlQuery.Open;
  Result := (BilliardDataModule.sqlQuery.RecordCount > 0);
  if Result then
  begin
    BilliardDataModule.sqlQuery.First;
    fId := BilliardDataModule.sqlQuery.FieldByName('ID').AsInteger;
  end;
  BilliardDataModule.sqlQuery.Close;
end;

function TBilliardMember.GetFullName: string;
begin
  Result := fLastName;
  if fFirstName <> '' then
    Result := Result + ', ' + fFirstName;
end;

function TBilliardMember.GetListName: string;
begin
  Result := FullName;
  if fNickName <> '' then
    Result := Result + '(' + fNickName + ')';
end;

function TBilliardMember.GetPicture: TJpegImage;
begin
  Result := fPicture;
end;

procedure TBilliardMember.LoadPictureFromStream(aStream: TStream);
begin
  if not Assigned(fPicture) then
    fPicture := TJpegImage.Create;
  aStream.Position := 0;
  fPicture.LoadFromStream(aStream);
end;

procedure TBilliardMember.SetPicture(const Value: TJpegImage);
begin
  if not Assigned(fPicture) then
    fPicture := TJpegImage.Create;
  fPicture.Assign(Value);
end;

procedure TBilliardMember.Store;
var
  SL: TStringList;
  bExist: boolean;
begin
  SL := TStringList.Create;
  try
    bExist := Exist;
    if bExist then
    begin
      SL.Add('UPDATE MEMBERS SET');
      SL.Add('LASTNAME = :LASTNAME,');
      SL.Add('FIRSTNAME = :FIRSTNAME,');
      SL.Add('GENDER = :GENDER,');
      SL.Add('BIRTHDATE = :BIRTHDATE,');
      SL.Add('BIRTHPLACE = :BIRTHPLACE,');
      SL.Add('NATIONALITY = :NATIONALITY,');
      SL.Add('NATIONALNUMBER = :NATIONALNUMBER,');
      SL.Add('STREET = :STREET,');
      SL.Add('ZIPCODE = :ZIPCODE,');
      SL.Add('MUNICIPALITY = :MUNICIPALITY,');
      SL.Add('COUNTRY = :COUNTRY,');
      SL.Add('CHIPNUMBER = :CHIPNUMBER,');
      SL.Add('CARDNUMBER = :CARDNUMBER,');
      SL.Add('DOCUMENTTYPE = :DOCUMENTTYPE,');
      SL.Add('VALIDFROM = :VALIDFROM,');
      SL.Add('VALIDUNTIL = :VALIDUNTIL,');
      SL.Add('WHERE ID = :ID');
    end
    else
    begin
      SL.Add('INSERT INTO MEMBERS ');
      SL.Add('(LASTNAME,');
      SL.Add(' FIRSTNAME,');
      SL.Add(' GENDER,');
      SL.Add(' BIRTHDATE,');
      SL.Add(' BIRTHPLACE,');
      SL.Add(' NATIONALITY,');
      SL.Add(' NATIONALNUMBER,');
      SL.Add(' STREET,');
      SL.Add(' ZIPCODE,');
      SL.Add(' MUNICIPALITY,');
      SL.Add(' COUNTRY,');
      SL.Add(' CHIPNUMBER,');
      SL.Add(' CARDNUMBER,');
      SL.Add(' DOCUMENTTYPE,');
      SL.Add(' VALIDFROM,');
      SL.Add(' VALIDUNTIL)');
      SL.Add('values (:LASTNAME,');
      SL.Add(' :FIRSTNAME,');
      SL.Add(' :GENDER,');
      SL.Add(' :BIRTHDATE,');
      SL.Add(' :BIRTHPLACE,');
      SL.Add(' :NATIONALITY,');
      SL.Add(' :NATIONALNUMBER,');
      SL.Add(' :STREET,');
      SL.Add(' :ZIPCODE,');
      SL.Add(' :MUNICIPALITY,');
      SL.Add(' :COUNTRY,');
      SL.Add(' :CHIPNUMBER,');
      SL.Add(' :CARDNUMBER,');
      SL.Add(' :DOCUMENTTYPE,');
      SL.Add(' :VALIDFROM,');
      SL.Add(' :VALIDUNTIL)');
    end;
    BilliardDataModule.sqlCommand.SQL.Assign(SL);
  finally
    SL.Free;
  end;
  BilliardDataModule.sqlCommand.ParamByName('LASTNAME').AsString := fLastName;
  BilliardDataModule.sqlCommand.ParamByName('FIRSTNAME').AsString := fFirstName;
  BilliardDataModule.sqlCommand.ParamByName('GENDER').AsString := fGender;
  BilliardDataModule.sqlCommand.ParamByName('BIRTHDATE').AsString := fBirthDate;
  BilliardDataModule.sqlCommand.ParamByName('BIRTHPLACE').AsString := fBirthPlace;
  BilliardDataModule.sqlCommand.ParamByName('NATIONALITY').AsString := fNationality;
  BilliardDataModule.sqlCommand.ParamByName('NATIONALNUMBER').AsString := fNationalNumber;
  BilliardDataModule.sqlCommand.ParamByName('STREET').AsString := fStreet;
  BilliardDataModule.sqlCommand.ParamByName('ZIPCODE').AsString := fZipCode;
  BilliardDataModule.sqlCommand.ParamByName('MUNICIPALITY').AsString := fMunicipality;
  BilliardDataModule.sqlCommand.ParamByName('COUNTRY').AsString := fCountry;
  BilliardDataModule.sqlCommand.ParamByName('CHIPNUMBER').AsString := fChipNumber;
  BilliardDataModule.sqlCommand.ParamByName('CARDNUMBER').AsString := fCardNumber;
  BilliardDataModule.sqlCommand.ParamByName('DOCUMENTTYPE').AsString := fDocumentType;
  BilliardDataModule.sqlCommand.ParamByName('VALIDFROM').AsString := fValidFrom;
  BilliardDataModule.sqlCommand.ParamByName('VALIDUNTIL').AsString := fValidUntil;
  if bExist then
    BilliardDataModule.sqlCommand.ParamByName('ID').AsInteger := fId;
  BilliardDataModule.sqlCommand.ExecQuery;
  ShowMessage(IntToStr(BilliardDataModule.sqlCommand.RowsAffected) + ' row s affected.');
  BilliardDataModule.BilliardDBTransaction.Commit;
  bExist := Exist;
  if Assigned(fPicture) then
    StorePicture;
end;

procedure TBilliardMember.StorePicture;
var
  stream: TStream;
  SL: TStringList;
begin
  stream := TMemoryStream.Create;
  try
    stream.Position := 0;
    fPicture.SaveToStream(stream);
    stream.Position := 0;
    SL := TStringList.Create;
    try
      SL.Add('UPDATE MEMBERS SET');
      SL.Add('PICTURE = :PICTURE');
      SL.Add('WHERE ID = :ID');
      BilliardDataModule.sqlCommand.SQL.Assign(SL);
    finally
      SL.Free;
    end;
    BilliardDataModule.sqlCommand.ParamByName('PICTURE').LoadFromStream(stream);
    BilliardDataModule.sqlCommand.ParamByName('ID').AsInteger := fId;
    BilliardDataModule.sqlCommand.ExecQuery;
    ShowMessage(IntToStr(BilliardDataModule.sqlCommand.RowsAffected) + ' row s affected.');
    BilliardDataModule.BilliardDBTransaction.Commit;
  finally
    FreeAndNil(stream);
  end;
end;

function TBilliardMember.ToString: string;
begin
  Result := '"Member": { ';
  Result := Result + Format('"ID": "%d", ', [fId]);
  Result := Result + Format(#13#10'"LastName": "%s", ', [fLastName]);
  Result := Result + Format(#13#10'"FirstName": "%s", ', [fFirstName]);
  Result := Result + Format(#13#10'"NickName": "%s", ', [fNickName]);
  Result := Result + Format(#13#10'"BirthDate": "%s", ', [fBirthDate]);
  Result := Result + Format(#13#10'"BirthPlace": "%s", ', [fBirthPlace]);
  Result := Result + Format(#13#10'"NationalNumber": "%s", ', [fNationalNumber]);
  Result := Result + Format(#13#10'"Gender": "%s", ', [fGender]);
  Result := Result + Format(#13#10'"Nationality": "%s", ', [fNationality]);
  Result := Result + Format(#13#10'"Municipality": "%s", ', [fMunicipality]);
  Result := Result + Format(#13#10'"CardNumber": "%s", ', [fCardNumber]);
  Result := Result + Format(#13#10'"ValidFrom": "%s", ', [fValidFrom]);
  Result := Result + Format(#13#10'"ValidUntil": "%s", ', [fValidUntil]);
  Result := Result + Format(#13#10'"DocumentType": "%s", ', [fDocumentType]);
  Result := Result + Format(#13#10'"ChipNumber": "%s", ', [fChipNumber]);
  Result := Result + Format(#13#10'"Street": "%s", ', [fStreet]);
  Result := Result + Format(#13#10'"Zip": "%s", ', [fZipCode]);
  Result := Result + Format(#13#10'"Country": "%s" ', [fCountry]);
  Result := Result + #13#10'}';
end;

procedure TBilliardMember.Update;
var
  SL: TStringList;
  stream: TMemoryStream;
begin
  SL := TStringList.Create;
  try
    SL.Add('SELECT *');
    SL.Add(' FROM MEMBERS');
    SL.Add(' WHERE ID = :id');
    BilliardDataModule.sqlQuery.SQL.Assign(SL);
  finally
    SL.Free;
  end;
  BilliardDataModule.sqlQuery.ParamByName('id').AsInteger := fId;
  BilliardDataModule.sqlQuery.Open;
  try
    if BilliardDataModule.sqlQuery.RecordCount = 1 then
    begin
      ID := BilliardDataModule.sqlQuery.FieldByName('ID').AsInteger;
      LastName := BilliardDataModule.sqlQuery.FieldByName('LASTNAME').AsString;
      FirstName := BilliardDataModule.sqlQuery.FieldByName('FIRSTNAME').AsString;
      NickName := BilliardDataModule.sqlQuery.FieldByName('NICKNAME').AsString;
      BirthDate := BilliardDataModule.sqlQuery.FieldByName('BIRTHDATE').AsString;
      BirthPlace := BilliardDataModule.sqlQuery.FieldByName('BIRTHPLACE').AsString;
      NationalNumber := BilliardDataModule.sqlQuery.FieldByName('NATIONALNUMBER').AsString;
      Gender := BilliardDataModule.sqlQuery.FieldByName('GENDER').AsString;
      Nationality := BilliardDataModule.sqlQuery.FieldByName('NATIONALITY').AsString;
      Municipality := BilliardDataModule.sqlQuery.FieldByName('MUNICIPALITY').AsString;
      CardNumber := BilliardDataModule.sqlQuery.FieldByName('CARDNUMBER').AsString;
      ValidFrom := BilliardDataModule.sqlQuery.FieldByName('VALIDFROM').AsString;
      ValidUntil := BilliardDataModule.sqlQuery.FieldByName('VALIDUNTIL').AsString;
      DocumentType := BilliardDataModule.sqlQuery.FieldByName('DOCUMENTTYPE').AsString;
      ChipNumber := BilliardDataModule.sqlQuery.FieldByName('CHIPNUMBER').AsString;
      Street := BilliardDataModule.sqlQuery.FieldByName('STREET').AsString;
      ZipCode := BilliardDataModule.sqlQuery.FieldByName('ZIPCODE').AsString;
      Country := BilliardDataModule.sqlQuery.FieldByName('COUNTRY').AsString;
      stream := TMemoryStream.Create;
      try
        stream.Position := 0;
        TBlobField(BilliardDataModule.sqlQuery.FieldByName('PICTURE')).SaveToStream(stream);
        if stream.Position > 0 then
        begin
          if not Assigned(fPicture) then
            fPicture := TJpegImage.Create;
          stream.Position := 0;
          fPicture.LoadFromStream(stream);
        end;
      finally
        stream.Free;
      end;
    end;
  finally
    BilliardDataModule.sqlQuery.Close;
  end;
end;

end.
