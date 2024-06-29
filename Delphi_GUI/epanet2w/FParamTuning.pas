unit FParamTuning;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Uglobals;

const
  objTag: array[JUNCS..VALVES]  of PChar = ('Junc ', 'Resvr ', 'Tank ', 'Pipe ', 'Pump ', 'Valve ');

type
  TParamTuningForm = class(TForm)
    cmbParmType: TComboBox;
    Label1: TLabel;
    cmbObject: TComboBox;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lblParam1: TLabel;
    scrlbVal1: TScrollBar;
    edtVal1: TEdit;
    Label4: TLabel;
    edtStep1: TEdit;
    lblParam2: TLabel;
    lblParam3: TLabel;
    lblParam4: TLabel;
    lblParam5: TLabel;
    lblParam6: TLabel;
    scrlbVal2: TScrollBar;
    scrlbVal3: TScrollBar;
    scrlbVal4: TScrollBar;
    scrlbVal5: TScrollBar;
    scrlbVal6: TScrollBar;
    GridPanel1: TGridPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtStep2: TEdit;
    edtStep3: TEdit;
    edtStep4: TEdit;
    edtStep5: TEdit;
    edtStep6: TEdit;
    edtVal2: TEdit;
    edtVal3: TEdit;
    edtVal4: TEdit;
    edtVal5: TEdit;
    edtVal6: TEdit;
    procedure scrlbVal1Change(Sender: TObject);
    procedure scrlbVal2Change(Sender: TObject);
    procedure scrlbVal3Change(Sender: TObject);
    procedure scrlbVal4Change(Sender: TObject);
    procedure scrlbVal5Change(Sender: TObject);
    procedure scrlbVal6Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PopulateObjectList(ObjType: Integer);
    procedure UpdateTuningParamLabelNames(ObjType: Integer);
    procedure edtVal1Change(Sender: TObject);
    procedure edtVal2Change(Sender: TObject);
    procedure edtVal3Change(Sender: TObject);
    procedure edtVal4Change(Sender: TObject);
    procedure edtVal5Change(Sender: TObject);
    procedure edtVal6Change(Sender: TObject);
    procedure cmbParmTypeChange(Sender: TObject);
    procedure cmbObjectChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ParamTuningForm: TParamTuningForm;

implementation

{$R *.dfm}

procedure TParamTuningForm.FormCreate(Sender: TObject);
var i: Integer;
begin
  if (cmbParmType.ItemIndex = 6) then
    begin
      for i := JUNCS to VALVES do
        begin
              PopulateObjectList(i);
        end;

      UpdateTuningParamLabelNames(JUNCS);
    end
  else
    begin
        PopulateObjectList(cmbParmType.ItemIndex);
        UpdateTuningParamLabelNames(cmbParmType.ItemIndex);
    end;


  cmbObject.ItemIndex := 0
end;


procedure TParamTuningForm.PopulateObjectList(ObjType: Integer);
var i, n: Integer; objIdTxt: String;
begin
    n := Network.Lists[ObjType].Count;
    for i := 0 to n-1 do
      begin
            objIdTxt := objTag[ObjType] + GetID(ObjType,i);
            cmbObject.Items.Add(objIdTxt)
      end;
end;


procedure TParamTuningForm.UpdateTuningParamLabelNames(ObjType: Integer);
begin
       //Junction: Elevation, Base Demand, Emitter Coeff., Initial Quality,
  //          Source Quality
  //Reservoir:  Total Head,  Initial Quality, Source Quality
  //Tank: Elevation, Initial Level, Minimum Level, Maximum Level, Diameter,
  //      Minimum Volume, Mixing Fraction, Reaction Coeff.,  Initial Quality, Source Quality
  //Pipe: Length, Diameter, Roughness, Loss Coeff., Bulk Coeff., Wall Coeff.
  //Pump: Power, Speed,  Energy Price
  //Valve: Diameter, Setting, Loss Coeff.,
  case objType of
    JUNCS:  begin
          lblParam1.Caption := 'Elevation';
          lblParam2.Caption := 'Base Demand';
          lblParam3.Caption := 'Emitter Coeff.';
          lblParam4.Caption := 'Initial Quality';
          lblParam5.Caption := 'Source Quality';
          lblParam6.Caption := 'NA';
    end;

    RESERVS:  begin
          lblParam1.Caption := 'Total Head';
          lblParam2.Caption := 'Initial Quality';
          lblParam3.Caption := 'Source Quality';
          lblParam4.Caption := 'NA';
          lblParam5.Caption := 'NA';
          lblParam6.Caption := 'NA';
    end;

    TANKS:  begin
          lblParam1.Caption := 'Elevation';
          lblParam2.Caption := 'Initial Level';
          lblParam3.Caption := 'Minimum Level';
          lblParam4.Caption := 'Diameter';
          lblParam5.Caption := 'Minimum Volume';
          lblParam6.Caption := 'Mixing Fraction';
    end;

    PIPES: begin
          lblParam1.Caption := 'Length';
          lblParam2.Caption := 'Diameter';
          lblParam3.Caption := 'Roughness';
          lblParam4.Caption := 'Loss Coeff.';
          lblParam5.Caption := 'Bulk Coeff.';
          lblParam6.Caption := 'Wall Coeff.';
    end;

    PUMPS: begin
          lblParam1.Caption := 'Power';
          lblParam2.Caption := 'Speed';
          lblParam3.Caption := 'Energy Price';
          lblParam4.Caption := 'NA';
          lblParam5.Caption := 'NA';
          lblParam6.Caption := 'NA';
    end;

    VALVES: begin
          lblParam1.Caption := 'Diameter';
          lblParam2.Caption := 'Setting';
          lblParam3.Caption := 'Emitter Coeff.';
          lblParam4.Caption := 'Loss Coeff.';
          lblParam5.Caption := 'NA';
          lblParam6.Caption := 'NA';
    end;
  end;
end;


procedure TParamTuningForm.cmbObjectChange(Sender: TObject);
var i: Integer;
begin
      //Load the properties for the select object

      //Fill these properties to this parameter tuning view


end;

procedure TParamTuningForm.cmbParmTypeChange(Sender: TObject);
var i, objType: Integer;
begin
  objType := cmbParmType.ItemIndex;
  cmbObject.Items.Clear;
  if (objType = 6) then
      begin
        for i := JUNCS to VALVES do
          begin
                PopulateObjectList(i);
          end;
          UpdateTuningParamLabelNames(JUNCS);
      end
    else
    begin
         PopulateObjectList(objType);
         UpdateTuningParamLabelNames(objType);
    end;

    cmbObject.ItemIndex := 0;
end;

procedure TParamTuningForm.edtVal1Change(Sender: TObject);
var inputVal, bOk: Integer; stepTxt, valTxt: String; step: Real;
begin
      valTxt :=  edtVal1.Text;
      stepTxt := edtStep1.Text;

      if (valTxt = '') or (stepTxt = '') then
        Exit;

      Val(valTxt, inputVal, bOk);
      if (bOk <> 0) then
        Exit;

      Val(stepTxt, step, bOk);
      if (bOk <> 0) then
        Exit;

      if (inputVal >= 0) and (inputVal <= 1000) then
        scrlbVal1.Position :=  ROUND(inputVal/step);
end;

procedure TParamTuningForm.edtVal2Change(Sender: TObject);
var inputVal: Integer; s: String;
begin

end;

procedure TParamTuningForm.edtVal3Change(Sender: TObject);
var inputVal: Integer; s: String;
begin

end;

procedure TParamTuningForm.edtVal4Change(Sender: TObject);
var inputVal: Integer; s: String;
begin

end;

procedure TParamTuningForm.edtVal5Change(Sender: TObject);
var inputVal: Integer; s: String;
begin

end;

procedure TParamTuningForm.edtVal6Change(Sender: TObject);
var inputVal: Integer; s: String;
begin

end;

procedure TParamTuningForm.FormClose(Sender: TObject; var Action: TCloseAction);
var i: Integer;
begin

end;


procedure TParamTuningForm.scrlbVal1Change(Sender: TObject);
  var inputVal: Integer;
  var step: Real;
  begin
        inputVal :=  scrlbVal1.Position;
        step := StrToFloat(edtStep1.Text);
        edtVal1.Text := FloatToStr(inputVal*step);

        //Save the updated property

        //Re-run the simulation
  end;


procedure TParamTuningForm.scrlbVal2Change(Sender: TObject);
  var inputVal: Integer;
  var step: Real;
  begin
      inputVal :=  scrlbVal2.Position;
      step := StrToFloat(edtStep2.Text);
      edtVal2.Text := FloatToStr(inputVal*step)
  end;

procedure TParamTuningForm.scrlbVal3Change(Sender: TObject);
  var inputVal: Integer;
  var step: Real;
  begin
      inputVal :=  scrlbVal3.Position;
      step := StrToFloat(edtStep3.Text);
      edtVal3.Text := FloatToStr(inputVal*step)
  end;

procedure TParamTuningForm.scrlbVal4Change(Sender: TObject);
  var inputVal: Integer;
  var step: Real;
  begin
      inputVal :=  scrlbVal4.Position;
      step := StrToFloat(edtStep4.Text);
      edtVal4.Text := FloatToStr(inputVal*step)
  end;

procedure TParamTuningForm.scrlbVal5Change(Sender: TObject);
  var inputVal: Integer;
  var step: Real;
  begin
      inputVal :=  scrlbVal5.Position;
      step := StrToFloat(edtStep5.Text);
      edtVal5.Text := FloatToStr(inputVal*step)
  end;

procedure TParamTuningForm.scrlbVal6Change(Sender: TObject);
  var inputVal: Integer;
  var step: Real;
  begin
      inputVal :=  scrlbVal6.Position;
      step := StrToFloat(edtStep6.Text);
      edtVal6.Text := FloatToStr(inputVal*step)
  end;

end.
