program Verificador;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmVerificador};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmVerificador, frmVerificador);
  Application.Run;
end.
