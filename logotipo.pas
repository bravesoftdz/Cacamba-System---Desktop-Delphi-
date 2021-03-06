unit logotipo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls, Clipbrd, ExtCtrls, ExtDlgs;

type

  { Tt_logo }

  Tt_logo = class(TForm)
    btn_carregar: TButton;
    Image1: TImage;
    txt_img: TEdit;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    procedure btn_carregarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  t_logo: Tt_logo;

implementation

{$R *.lfm}

{ Tt_logo }
uses DM, home;

procedure Tt_logo.btn_carregarClick(Sender: TObject);
var
  OpenDialog:TOpenDialog;
  Caminho, Ext: String;
  largura, altura, keys:integer;
begin

  OpenDialog := TOpenDialog.Create(nil);
  if OpenDialog.Execute then
        begin
            txt_img.Clear;
            Caminho := OpenDialog.FileName;
            Ext:=ExtractFileExt(Caminho);

    if (Ext = '.jpg') or (Ext = '.jpeg') or (Ext = '.gif') or (Ext = '.png') or (Ext = '.bmp') then
     begin

     txt_img.Text:=Caminho;
     Image1.Picture.LoadFromFile(Caminho);
     FreeAndNil(OpenDialog);
     largura:=Image1.Picture.Width;
     altura:=Image1.Picture.Height;
     keys:=1;

        if (largura <= 170) and (altura <= 120) then
        begin

        DMC.query_img.Close;
        DMC.query_img.SQL.Clear;
        DMC.query_img.SQL.Add('Select * from imagem');
        DMC.query_img.Open;
        DMC.query_img.First;

        if DMC.query_img.RecordCount < 1 then
           begin
            DMC.qr_imagen.Close;
            DMC.qr_imagen.SQL.Clear;
            DMC.qr_imagen.SQL.Text:=('insert into imagem (caminho, key) values (:c, :k)');
            DMC.qr_imagen.ParamByName('c').AsString:=Caminho;
            DMC.qr_imagen.ParamByName('k').AsInteger:=keys;
            DMC.qr_imagen.ExecSQL;
            DMC.SQLTransaction1.Commit;
            showmessage('Logo Registrado com Sucesso!');
            txt_img.Clear;
            Image1.Picture.Clear;
            self.Close;
            t_home.Show;
           end
        else
            begin
              DMC.qr_imagen.Close;
              DMC.qr_imagen.SQL.Clear;
              DMC.qr_imagen.SQL.Text:=('update imagem set caminho = :c where key = :kk');
              DMC.qr_imagen.ParamByName('c').AsString:=Caminho;
              DMC.qr_imagen.ParamByName('kk').AsInteger:=keys;
              DMC.qr_imagen.ExecSQL;
              DMC.SQLTransaction1.Commit;
              showmessage('Logo Atualizado com Sucesso!');
              txt_img.Clear;
              Image1.Picture.Clear;
              self.Close;
              t_home.Show;
            end;
            end
            else
            begin
                 Showmessage('Imagem deve ter as dimensões 170x120!');
                 txt_img.Clear;
                 Image1.Picture.Clear;
            end;
        end
        else
        begin
                Showmessage('Formato Inválido de Imagem!');
                txt_img.Clear;
                Image1.Picture.Clear;
        end;
     end;
end;

procedure Tt_logo.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DMC.qr_imagen.Active:=false;
  DMC.query_img.Active:=false;
  txt_img.Clear;
  Image1.Picture.Clear;
  t_home.Show;
end;

procedure Tt_logo.FormCreate(Sender: TObject);
begin
    DMC.qr_imagen.Active:=true;
    DMC.query_img.Active:=true;
end;

procedure Tt_logo.FormShow(Sender: TObject);
begin
   //DMC.qr_imagen.Active:=true;
end;

end.

