unit FParamTuning;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Uglobals,
  System.Generics.Collections, Uinput, Uoutput, Uexport, Uutils, Fbrowser, Fmain, Fmap,
  Epanet2;

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
    procedure runSimulationSilent();
    procedure doExecSimulation();
    function  RunHydraulics: Integer;
    procedure RunQuality();
  private
    { Private declarations }
    ObjNameIdMap: TDictionary<string, Integer>;
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
  ObjNameIdMap := TDictionary<string, Integer>.Create;
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

  cmbObject.ItemIndex := 0;
  cmbObjectChange(cmbObject);
end;


procedure TParamTuningForm.PopulateObjectList(ObjType: Integer);
var i, n: Integer; objIdTxt: String;
begin
    n := Network.Lists[ObjType].Count;
    for i := 0 to n-1 do
      begin
            objIdTxt := objTag[ObjType] + GetID(ObjType,i);
            cmbObject.Items.Add(objIdTxt);
            ObjNameIdMap.AddOrSetValue(objIdTxt, i);
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
          lblParam4.Caption := 'Maximum Level';
          lblParam5.Caption := 'Diameter';
          lblParam6.Caption := 'Minimum Volume';
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
          lblParam3.Caption := 'Loss Coeff.';
          lblParam4.Caption := 'NA';
          lblParam5.Caption := 'NA';
          lblParam6.Caption := 'NA';
    end;
  end;
end;


procedure TParamTuningForm.cmbObjectChange(Sender: TObject);
var objType, objIndex: Integer; objIdTxt: String;
begin
    //Load the properties for the select object
    objIndex := cmbObject.ItemIndex;    //The original index in the the dropdown list
    if (objIndex < 0) then
      Exit;

    objType := cmbParmType.ItemIndex;
    if (objType = 6) then   //All types
    begin
         objIdTxt :=  cmbObject.Items[objIndex];
         if (not ObjNameIdMap.TryGetValue(objIdTxt, objIndex)) then
              Exit;

         if (objIdTxt.StartsWith('junc', true)) then
            objType :=  JUNCS;
         if (objIdTxt.StartsWith('resvr', true)) then
            objType :=  RESERVS;
         if (objIdTxt.StartsWith('tank', true)) then
            objType :=  TANKS;
         if (objIdTxt.StartsWith('pipe', true)) then
            objType :=  PIPES;
         if (objIdTxt.StartsWith('pump', true)) then
            objType :=  PUMPS;
         if (objIdTxt.StartsWith('valve', true)) then
            objType :=  VALVES;
    end;

    //Get the properties
    case objType of
    JUNCS:  begin
          lblParam1.Caption := 'Elevation';
          lblParam2.Caption := 'Base Demand';
          lblParam3.Caption := 'Emitter Coeff.';
          lblParam4.Caption := 'Initial Quality';
          lblParam5.Caption := 'Source Quality';
          lblParam6.Caption := 'NA';
          edtVal1.Text := Node(JUNCS,objIndex).Data[JUNC_ELEV_INDEX];
          edtVal2.Text := Node(JUNCS,objIndex).Data[JUNC_DEMAND_INDEX];
          edtVal3.Text := Node(JUNCS,objIndex).Data[JUNC_EMITTER_INDEX];
          edtVal4.Text := Node(JUNCS,objIndex).Data[JUNC_INITQUAL_INDEX];
          edtVal5.Text := Node(JUNCS,objIndex).Data[JUNC_SRCQUAL_INDEX];
          edtVal6.Text := '0';

          edtVal1Change(edtVal1);
          edtVal2Change(edtVal2);
          edtVal3Change(edtVal3);
          edtVal4Change(edtVal4);
          edtVal5Change(edtVal5);
    end;

    RESERVS:  begin
          lblParam1.Caption := 'Total Head';
          lblParam2.Caption := 'Initial Quality';
          lblParam3.Caption := 'Source Quality';
          lblParam4.Caption := 'NA';
          lblParam5.Caption := 'NA';
          lblParam6.Caption := 'NA';

          edtVal1.Text := Node(RESERVS,objIndex).Data[RES_HEAD_INDEX];
          edtVal2.Text := Node(RESERVS,objIndex).Data[RES_INITQUAL_INDEX];
          edtVal3.Text := Node(RESERVS,objIndex).Data[RES_SRCQUAL_INDEX];
          edtVal4.Text := '0';
          edtVal5.Text := '0';
          edtVal6.Text := '0';

          edtVal1Change(edtVal1);
          edtVal2Change(edtVal2);
          edtVal3Change(edtVal3);
    end;

    TANKS:  begin
          lblParam1.Caption := 'Elevation';
          lblParam2.Caption := 'Initial Level';
          lblParam3.Caption := 'Minimum Level';
          lblParam4.Caption := 'Diameter';
          lblParam5.Caption := 'Minimum Volume';
          lblParam6.Caption := 'Mixing Fraction';

          edtVal1.Text := Node(TANKS,objIndex).Data[TANK_ELEV_INDEX];
          edtVal2.Text := Node(TANKS,objIndex).Data[TANK_INITLVL_INDEX];
          edtVal3.Text := Node(TANKS,objIndex).Data[TANK_MINLVL_INDEX];
          edtVal4.Text := Node(TANKS,objIndex).Data[TANK_MAXLVL_INDEX];
          edtVal5.Text := Node(TANKS,objIndex).Data[TANK_DIAM_INDEX];
          edtVal6.Text := Node(TANKS,objIndex).Data[TANK_MINVOL_INDEX];

          edtVal1Change(edtVal1);
          edtVal2Change(edtVal2);
          edtVal3Change(edtVal3);
          edtVal4Change(edtVal4);
          edtVal5Change(edtVal5);
          edtVal5Change(edtVal6);
    end;

    PIPES: begin
          lblParam1.Caption := 'Length';
          lblParam2.Caption := 'Diameter';
          lblParam3.Caption := 'Roughness';
          lblParam4.Caption := 'Loss Coeff.';
          lblParam5.Caption := 'Bulk Coeff.';
          lblParam6.Caption := 'Wall Coeff.';

          edtVal1.Text := Link(PIPES,objIndex).Data[2];
          edtVal2.Text := Link(PIPES,objIndex).Data[3];
          edtVal3.Text := Link(PIPES,objIndex).Data[4];
          edtVal4.Text := Link(PIPES,objIndex).Data[5];
          edtVal5.Text := Link(PIPES,objIndex).Data[7];
          edtVal6.Text := Link(PIPES,objIndex).Data[8];

          edtVal1Change(edtVal1);
          edtVal2Change(edtVal2);
          edtVal3Change(edtVal3);
          edtVal4Change(edtVal4);
          edtVal5Change(edtVal5);
          edtVal5Change(edtVal6);
    end;

    PUMPS: begin
          lblParam1.Caption := 'Power';
          lblParam2.Caption := 'Speed';
          lblParam3.Caption := 'Energy Price';
          lblParam4.Caption := 'NA';
          lblParam5.Caption := 'NA';
          lblParam6.Caption := 'NA';

          edtVal1.Text := Link(PUMPS,objIndex).Data[3];
          edtVal2.Text := Link(PUMPS,objIndex).Data[4];
          edtVal3.Text := Link(PUMPS,objIndex).Data[8];
          edtVal4.Text := '0';
          edtVal5.Text := '0';
          edtVal6.Text := '0';

          edtVal1Change(edtVal1);
          edtVal2Change(edtVal2);
          edtVal3Change(edtVal3);
    end;

    VALVES: begin
          lblParam1.Caption := 'Diameter';
          lblParam2.Caption := 'Setting';
          lblParam3.Caption := 'Loss Coeff.';
          lblParam4.Caption := 'NA';
          lblParam5.Caption := 'NA';
          lblParam6.Caption := 'NA';

          edtVal1.Text := Link(VALVES,objIndex).Data[2];
          edtVal2.Text := Link(VALVES,objIndex).Data[4];
          edtVal3.Text := Link(VALVES,objIndex).Data[5];
          edtVal4.Text := '0';
          edtVal5.Text := '0';
          edtVal6.Text := '0';

          edtVal1Change(edtVal1);
          edtVal2Change(edtVal2);
          edtVal3Change(edtVal3);
    end;
  end;

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
    cmbObjectChange(cmbObject)
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
var inputVal, bOk: Integer; stepTxt, valTxt: String; step: Real;
begin
      valTxt :=  edtVal2.Text;
      stepTxt := edtStep2.Text;

      if (valTxt = '') or (stepTxt = '') then
        Exit;

      Val(valTxt, inputVal, bOk);
      if (bOk <> 0) then
        Exit;

      Val(stepTxt, step, bOk);
      if (bOk <> 0) then
        Exit;

      if (inputVal >= 0) and (inputVal <= 1000) then
        scrlbVal2.Position :=  ROUND(inputVal/step);
end;

procedure TParamTuningForm.edtVal3Change(Sender: TObject);
var inputVal, bOk: Integer; stepTxt, valTxt: String; step: Real;
begin
      valTxt :=  edtVal3.Text;
      stepTxt := edtStep3.Text;

      if (valTxt = '') or (stepTxt = '') then
        Exit;

      Val(valTxt, inputVal, bOk);
      if (bOk <> 0) then
        Exit;

      Val(stepTxt, step, bOk);
      if (bOk <> 0) then
        Exit;

      if (inputVal >= 0) and (inputVal <= 1000) then
        scrlbVal3.Position :=  ROUND(inputVal/step);
end;

procedure TParamTuningForm.edtVal4Change(Sender: TObject);
var inputVal, bOk: Integer; stepTxt, valTxt: String; step: Real;
begin
      valTxt :=  edtVal4.Text;
      stepTxt := edtStep4.Text;

      if (valTxt = '') or (stepTxt = '') then
        Exit;

      Val(valTxt, inputVal, bOk);
      if (bOk <> 0) then
        Exit;

      Val(stepTxt, step, bOk);
      if (bOk <> 0) then
        Exit;

      if (inputVal >= 0) and (inputVal <= 1000) then
        scrlbVal4.Position :=  ROUND(inputVal/step);
end;

procedure TParamTuningForm.edtVal5Change(Sender: TObject);
var inputVal, bOk: Integer; stepTxt, valTxt: String; step: Real;
begin
      valTxt :=  edtVal5.Text;
      stepTxt := edtStep5.Text;

      if (valTxt = '') or (stepTxt = '') then
        Exit;

      Val(valTxt, inputVal, bOk);
      if (bOk <> 0) then
        Exit;

      Val(stepTxt, step, bOk);
      if (bOk <> 0) then
        Exit;

      if (inputVal >= 0) and (inputVal <= 1000) then
        scrlbVal5.Position :=  ROUND(inputVal/step);
end;

procedure TParamTuningForm.edtVal6Change(Sender: TObject);
var inputVal, bOk: Integer; stepTxt, valTxt: String; step: Real;
begin
      valTxt :=  edtVal6.Text;
      stepTxt := edtStep6.Text;

      if (valTxt = '') or (stepTxt = '') then
        Exit;

      Val(valTxt, inputVal, bOk);
      if (bOk <> 0) then
        Exit;

      Val(stepTxt, step, bOk);
      if (bOk <> 0) then
        Exit;

      if (inputVal >= 0) and (inputVal <= 1000) then
        scrlbVal6.Position :=  ROUND(inputVal/step);
end;

procedure TParamTuningForm.FormClose(Sender: TObject; var Action: TCloseAction);
var i: Integer;
begin
      ObjNameIdMap.Clear;
      ObjNameIdMap.Free;
end;


procedure TParamTuningForm.scrlbVal1Change(Sender: TObject);
  var inputVal, objType, objIndex: Integer;
  objIdTxt, objValTxt: String;
  step: Real;
  validSucceed: Boolean;
  begin
        objIndex := cmbObject.ItemIndex;
        if (objIndex < 0) then
          Exit;

        inputVal :=  scrlbVal1.Position;
        step := StrToFloat(edtStep1.Text);
        edtVal1.Text := FloatToStr(inputVal*step);
        objValTxt := edtVal1.Text;

        //Save the updated property
        validSucceed := False;
        objType := cmbParmType.ItemIndex;
        if objType = 6 then
          begin    //All types selected, do the adjustment for index and type
               objIdTxt :=  cmbObject.Items[objIndex];
               if (not ObjNameIdMap.TryGetValue(objIdTxt, objIndex)) then
                    Exit;

               if (objIdTxt.StartsWith('junc', true)) then
                  objType :=  JUNCS;
               if (objIdTxt.StartsWith('resvr', true)) then
                  objType :=  RESERVS;
               if (objIdTxt.StartsWith('tank', true)) then
                  objType :=  TANKS;
               if (objIdTxt.StartsWith('pipe', true)) then
                  objType :=  PIPES;
               if (objIdTxt.StartsWith('pump', true)) then
                  objType :=  PUMPS;
               if (objIdTxt.StartsWith('valve', true)) then
                  objType :=  VALVES;
          end;

        EditorObject := objType;
        EditorIndex := objIndex;
        case objType of
          JUNCS:  begin
                validSucceed := Uinput.ValidJunc(5, objValTxt);    // -1: avoid data re-fetch!!
          end;

          RESERVS:  begin
                validSucceed := Uinput.ValidReserv(5, objValTxt);
          end;

          TANKS:  begin
                validSucceed := Uinput.ValidTank(5, objValTxt);
          end;

          PIPES: begin
                validSucceed := Uinput.ValidPipe(5, objValTxt);
          end;

          PUMPS: begin
                validSucceed := Uinput.ValidPump(6, objValTxt);
          end;

          VALVES: begin
                validSucceed := Uinput.ValidValve(5, objValTxt);
          end;
        end;

        if validSucceed then
           runSimulationSilent;

        //Re-run the simulation
  end;


  //Run the simulation without popup dialog
  procedure TParamTuningForm.runSimulationSilent;
  var i: Integer;
  OldDir: String;
  begin
        // Clear all previous results
    Uoutput.ClearOutput;
    BrowserForm.InitMapPage;
    RunStatus := rsNone;
    MainForm.ShowRunStatus;

  // Create temporary files
    MainForm.DeleteTempFiles;
    MainForm.CreateTempFiles;

  // Display simulation dialog form ****
//    with TSimulationForm.Create(self) do
//    try
//      ShowModal;
//    finally
//      Free;
//    end;
    //Run the actual resolver for the network
    // Change to temporary directory
    GetDir(0,OldDir);
    ChDir(TempDir);

    // Update the form's display
//    Update;

    // Execute the simulation
    doExecSimulation;

    // Restore original directory
    ChDir(OldDir);

  // Hide Cancel button & enable OK button
//    CancelBtn.Visible := False;
//    OKBtn.Visible := True;
//    OKbtn.SetFocus;

  // Delete temporary files if run ended prematurely
    if (RunStatus = rsShutdown)               //Fatal error in solver DLL
    or (RunStatus = rsCancelled) then         //User cancelled run
    begin
      MainForm.DeleteTempFiles;
    end;

  // Set RunFlag if run produced results
    if RunStatus in [rsSuccess, rsWarning] then
      RunFlag := True;
//    if RunStatus = rsError then MnuReportStatusClick(Self);

  // Retrieve results if run was successful
    if RunFlag then
    begin
      Screen.Cursor := crHourGlass;
      MainForm.ShowRunStatus;
      Uoutput.GetBasicOutput;
      BrowserForm.EnableTimeControls;
      Screen.Cursor := crDefault;
    end;

  // Refresh map display and all existing output display forms
    BrowserForm.RefreshMap;
    MapForm.DrawNodeLegend;
    MapForm.DrawLinkLegend;
    MainForm.RefreshForms;

  // Display any warning messages in Status Report
//    if RunStatus = rsWarning then
//    begin
////      MnuReportStatusClick(Self);
//      if ActiveMDIChild is TStatusForm then
//        TStatusForm(ActiveMDIChild).SelectText(TXT_WARNING);
//    end;

  end;

  procedure TParamTuningForm.doExecSimulation;
  var
  err: Integer;
  InpFile, RptFile, OutFile: AnsiString;
  begin
        // Save current input data to temporary file
        Uexport.ExportDataBase(TempInputFile,False);

      // Open solver and read in network data
        try
          InpFile := AnsiString(TempInputFile);
          RptFile := AnsiString(TempReportFile);
          OutFile := AnsiString(TempOutputFile);
          err := ENopen(PAnsiChar(InpFile), PAnsiChar(RptFile), PAnsiChar(OutFile));

      // Solve for hydraulics & water quality, then close solver
          if (err = 0) and (RunStatus <> rsCancelled) then  err := RunHydraulics;
          if (err = 0) and (RunStatus <> rsCancelled) then  RunQuality;
          ENclose;

      // Close solver if an exception occurs
        except
          on E: Exception do
          begin
//            Uutils.MsgDlg(E.Message, mtError, [mbOK]);
            ENclose;
            Runstatus := rsShutdown;
          end;
        end;

      // Display run status
//        DisplayRunStatus;
      if not (RunStatus in [rsCancelled, rsShutdown]) then
      begin
        if GetFileSize(TempReportFile) <= 0 then RunStatus := rsFailed
        else RunStatus := Uoutput.CheckRunStatus(TempOutputFile);
      end;
  end;


  function TParamTuningForm.RunHydraulics: Integer;
  var
  err: Integer;
  t, tstep: Longint;
  h: Single;
  slabel: String;
  begin
       // Open hydraulics solver
        err := 0;
//        StatusLabel.Caption := TXT_REORDERING;
//        StatusLabel.Refresh;
        try
          if ENopenH() = 0 then
          begin

          // Initialize hydraulics solver
            ENinitH(1);
            h := 0;
//            slabel := TXT_SOLVING_HYD;

          // Solve hydraulics in each period
            repeat
//              StatusLabel.Caption := Format('%s %.2f',[slabel,h]);
              Application.ProcessMessages;
              err := ENrunH(t);
              tstep := 0;
              if err <= 100 then err := ENnextH(tstep);
              h := h + tstep/3600;
            until (tstep = 0) or (err > 100) or (RunStatus = rsCancelled);
          end;

        // Close hydraulics solver & ignore warning conditions
          ENcloseH();
          if err <= 100 then err := 0;
          Result := err;

      // Exception handler
        except
          ENcloseH();
          raise;
        end;
  end;


  procedure TParamTuningForm.RunQuality;
  var
  err: Integer;
  t, tstep: Longint;
  h: Single;
  slabel: String;
  begin
         // Open WQ solver
          h := 0;
//          if UpperCase(Trim(Network.Options.Data[QUAL_PARAM_INDEX])) = 'NONE'
//          then slabel := TXT_SAVING_HYD
//          else slabel := TXT_SOLVING_WQ;
          try
            if ENopenQ() = 0 then
            begin

          // Initialize WQ solver & solve WQ in each period
              ENinitQ(1);
              repeat
//                StatusLabel.Caption := Format('%s %.2f',[slabel,h]);
                err := ENrunQ(t);
                tstep := 0;
                if err <= 100 then err := ENnextQ(tstep);
                h := h + tstep/3600;
                Application.ProcessMessages;
              until (tstep = 0) or (err > 100) or (RunStatus = rsCancelled);
            end;

          // Close WQ solver & ignore warning conditions
            ENcloseQ();

          except
            ENcloseQ();
            raise;
          end;
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
