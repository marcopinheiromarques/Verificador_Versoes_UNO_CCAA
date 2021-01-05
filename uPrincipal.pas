unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.VCLUI.Wait,
  FireDAC.Phys.ODBCBase, FireDAC.Comp.UI, Vcl.DBCtrls, Vcl.ExtCtrls,
  System.Generics.Collections, Datasnap.DBClient;

type
  TfrmVerificador = class(TForm)
    StatusBar: TStatusBar;
    FDConnection: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryTbCCAAUnoVersao: TFDQuery;
    ds_TbCCAAUnoVersao: TDataSource;
    qyTbAdiamentoVersao: TFDQuery;
    ds_Tb_Adiamento_Versao: TDataSource;
    qyTbControleVersao: TFDQuery;
    ds_TbControleVersao: TDataSource;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    Panel1: TPanel;
    btnAtualizar: TButton;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox3: TGroupBox;
    DBGrid3: TDBGrid;
    TabSheet2: TTabSheet;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    ListView: TListView;
    GroupBox6: TGroupBox;
    mmoQuantitativos: TMemo;
    DBGrid4: TDBGrid;
    dsFranquiasPorVersao: TDataSource;
    ClientDataSet: TClientDataSet;
    ClientDataSetID_HOST: TStringField;
    ClientDataSetNUM_VERSAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAtualizarClick(Sender: TObject);
    procedure ListViewItemChecked(Sender: TObject; Item: TListItem);
  private
    { Private declarations }
    procedure CarregarVersoes;
    procedure MontarQuantitativoFranquias;
    procedure ExibirFranquiasNaVersao;
  public
    { Public declarations }
  end;

var
  frmVerificador: TfrmVerificador;

implementation

{$R *.dfm}

procedure TfrmVerificador.btnAtualizarClick(Sender: TObject);
begin
  FDConnection.Connected := False;

  qryTbCCAAUnoVersao .Close;
  qyTbAdiamentoVersao.Close;
  qyTbControleVersao .Close;

  FDConnection.Connected := True;

  qryTbCCAAUnoVersao .Open;
  qyTbAdiamentoVersao.Open;
  qyTbControleVersao .Open;

  StatusBar.Panels[0].Text := formatdatetime ('dddd","dd" de "mmmm" de "yyyy',now);
  StatusBar.Panels[1].Text := 'Para uso exclusivo da TI - CCAA';
  StatusBar.Panels[2].Text := 'UNO Produção';

  CarregarVersoes;
end;

procedure TfrmVerificador.CarregarVersoes;
var
  lista : TList<String>;
begin
  //Preenche as versões
  ListView.Items.Clear;
  ClientDataSet.EmptyDataSet;

  lista := TList<String>.Create();

  qyTbControleVersao.DisableControls;

  qyTbControleVersao.First;

  while not qyTbControleVersao.Eof do
  begin
    if not lista.Contains(qyTbControleVersao.FieldByName('NUM_VERSAO').AsString) then
    begin
       lista.Add(qyTbControleVersao.FieldByName('NUM_VERSAO').AsString);

       ListView.Items.Add.Caption := qyTbControleVersao.FieldByName('NUM_VERSAO').AsString;
    end;

    qyTbControleVersao.Next;
  end;

  qyTbControleVersao.First;

  qyTbControleVersao.EnableControls;

  lista.free;
end;

procedure TfrmVerificador.ExibirFranquiasNaVersao;
var
  I : Integer;
begin
  ClientDataSet.EmptyDataSet;

  qyTbControleVersao.DisableControls;

  for I := 0 to ListView.Items.Count - 1 do
  begin
     if ListView.Items[I].Checked then
     begin
       qyTbControleVersao.First;

       while not qyTbControleVersao.Eof do
       begin
         if qyTbControleVersao.FieldByName('NUM_VERSAO').AsString = ListView.Items[I].Caption then
         begin
            ClientDataSet.Insert;
            ClientDataSet.FieldByName('ID_HOST'   ).AsString := qyTbControleVersao.FieldByName('ID_HOST').AsString;
            ClientDataSet.FieldByName('NUM_VERSAO').AsString := qyTbControleVersao.FieldByName('NUM_VERSAO').AsString;
            ClientDataSet.Post;
         end;

         qyTbControleVersao.Next;
       end;
     end;
  end;

   qyTbControleVersao.First;

   qyTbControleVersao.EnableControls;
end;

procedure TfrmVerificador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDConnection.Connected := False;

  qryTbCCAAUnoVersao .Close;
  qyTbAdiamentoVersao.Close;
  qyTbControleVersao .Close;
end;

procedure TfrmVerificador.FormCreate(Sender: TObject);
begin
  FDConnection.Connected := True;

  qryTbCCAAUnoVersao .Open;
  qyTbAdiamentoVersao.Open;
  qyTbControleVersao .Open;

  StatusBar.Panels[0].Text := formatdatetime ('dddd","dd" de "mmmm" de "yyyy',now);
  StatusBar.Panels[1].Text := 'Para uso exclusivo da TI - CCAA';
  StatusBar.Panels[2].Text := 'UNO Produção';

  CarregarVersoes;
end;

procedure TfrmVerificador.ListViewItemChecked(Sender: TObject; Item: TListItem);
begin
  //Monta o quantitativo de franquias na versão selecionada
  MontarQuantitativoFranquias;

  //Exibe as franquias por versão
  ExibirFranquiasNaVersao;
end;

procedure TfrmVerificador.MontarQuantitativoFranquias;
var
  I        : Integer;
  contador : Integer;
begin
   qyTbControleVersao.DisableControls;

   mmoQuantitativos.Clear;

   for I := 0 to ListView.Items.Count - 1 do
   begin
     if ListView.Items[I].Checked then
     begin
       qyTbControleVersao.First;
       contador := 0;

       while not qyTbControleVersao.Eof do
       begin
         if qyTbControleVersao.FieldByName('NUM_VERSAO').AsString = ListView.Items[I].Caption then
           Inc(contador);

         qyTbControleVersao.Next;
       end;

       mmoQuantitativos.Lines.Add('versão ' + ListView.Items[I].Caption + ': ' + IntToStr(contador) + ' franquia(s).');
     end;
   end;

   qyTbControleVersao.First;

   qyTbControleVersao.EnableControls;
end;

end.
