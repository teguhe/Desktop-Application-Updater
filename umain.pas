  {

    APPLICATION UPDATER
    Digunakan untuk mengupdate aplikasi desktop yang sudah terinstall di sistem
    Dapat digunakan untuk berbagai project aplikasi desktop

    Prerequisites:
    - Server Update
    - API untuk menyediakan data proses versioning dan link installer baru

    Initial project by Teguh Prasetyo (teguhe@gmail.com) on 2024-01-17

  }

unit umain;

interface

uses
  //additional uses
  System.IOUtils, System.IniFiles,

  //default uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfMain = class(TForm)
    mLog: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    download_path : string;

  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
begin

  { TODO   : Initial task }
  BorderStyle :=bsDialog;
  position    :=poScreenCenter;
  Caption     :='Application Updater V 1';
  mLog.Text  :='';

  { TODO : Cek data pada file ini, versi, exeName, link installer baru, dll }

  { TODO : cek apakah file online tersedia }
  if not FileExists(ExtractFilePath(Application.ExeName) + 'update.ini') then
  begin

    MessageDlg('file update.ini tidak ditemukan, proses dihentikan', TMsgDlgType.mtError, [mbOK], 0);
    Application.Terminate;

  end;
  
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'update.ini');
  try
    mLog.Lines.Add('Project Name = '+IniFile.ReadString('updater', 'project_name', ''));
    mLog.Lines.Add('Exe Name     = '+IniFile.ReadString('updater', 'exe_name', ''));
    mLog.Lines.Add('Old Version  = '+IniFile.ReadString('updater', 'version_old', ''));
    mLog.Lines.Add('New Version  = '+IniFile.ReadString('updater', 'version_new', ''));
    mLog.Lines.Add('Update Path  = '+IniFile.ReadString('updater', 'update_path', ''));

  finally
    IniFile.Free;
  end;


  { TODO : jika tidak tersedia, jalankan lagi aplikasi utama }

  { TODO : jika tersedia, lakukan update, download file installer baru }
  download_path :=TPath.GetDownloadsPath;

  { TODO : Optional, check CRC dari installer yang baru }

  { TODO : eksekusi file installer baru }

  { TODO : Jalankan aplikasi versi terkini }



end;

end.
