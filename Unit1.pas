unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    UpDown1: TUpDown;
    TrackBar1: TTrackBar;
    Image1: TImage;
    OpenDialog1: TOpenDialog;
    UpDown2: TUpDown;
    SpeedButton1: TSpeedButton;
    UpDown3: TUpDown;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;
  filename,sourcename,fext : string;
  droplets : integer;
  arr_droplets : Array[1..100] of TRect;
  arr_coords : Array[1..100] of TPoint;
  img1 : TBitmap;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
 if OpenDialog1.Execute then begin
     sourcename:=OpenDialog1.FileName;
     filename:=sourcename;
     img1:=TBitmap.Create;
     fext:=ExtractFileExt(filename);
     img1.LoadFromFile(filename);
     filename:=ExtractFileName(filename);
     Delete(filename,Length(filename)-3,4);
     Edit4.Text:=filename;
     Image1.Width:=img1.Width;
     Image1.Height:=img1.Height;
     Image1.Picture.Bitmap:=img1;
     Image1.Canvas.Brush.Style:=bsClear;
     Image1.Canvas.Pen.Color:=clWhite;
     Image1.Canvas.Font.Color:=clWhite;
     TrackBar1.Max:=Image1.Height;
     TrackBar1.Height:=Image1.Height;
     droplets:=0;
     SpeedButton1.Enabled:=True;
 end;

end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if Button=mbRight then begin
    SpeedButton1.Down:=False;
    Button2.Enabled:=True;
 end;
 if (SpeedButton1.Down) AND (Button=mbLeft) then begin
     inc(droplets);
     arr_coords[droplets].X:=X;
     arr_coords[droplets].Y:=Y;
     arr_droplets[droplets].Left:=x - StrToInt(Edit1.Text) div 2;
     arr_droplets[droplets].Top:=y - StrToInt(Edit2.Text) div 2;
     arr_droplets[droplets].Right:=x + StrToInt(Edit1.Text) div 2;
     arr_droplets[droplets].Bottom:=y + StrToInt(Edit2.Text) div 2;
     Image1.Canvas.Rectangle(arr_droplets[droplets]);
     Image1.Canvas.TextOut(x-Image1.Canvas.TextWidth(IntToStr(droplets)) div 2,arr_droplets[droplets].Bottom,IntToStr(droplets));
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var img2 : TBitmap;
    j,tmp,realW,realH,filenumb,filemax : Integer;
begin
 Image1.Picture.SaveToFile('0source-'+filename+fext);
 if Edit5.Text='' then begin
     tmp:=StrToInt(Edit4.Text);
     while FileExists(IntToStr(tmp)+fext) do inc(tmp);
     filemax:=tmp-1;
 end
 else filemax:=StrToInt(Edit5.Text);

 img2:=TBitmap.Create;
 realW:=arr_droplets[1].Right-arr_droplets[1].Left;
 realH:=arr_droplets[1].Bottom-arr_droplets[1].Top;
 img2.Width:=droplets*realW;
 img2.Height:=(filemax-StrToInt(Edit4.Text)+1) * realH;
 for filenumb:=StrToInt(Edit4.Text) To filemax do begin
     img1.LoadFromFile(IntToStr(filenumb)+fext);
     for j:=1 to droplets do
         img2.Canvas.CopyRect(Rect((j-1)*realW,(filenumb-1)*realH,j*realW,filenumb*realH),img1.Canvas,arr_droplets[j]);
 end;
 img2.SaveToFile('0result-from'+Edit4.Text+' to '+Edit5.Text+fext);
 img1.Free;
 img2.Free;
 Image1.Free;
 ShowMessage('Done!');
end;

procedure TForm1.UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
var i,x,y : Integer;
begin
 Image1.Picture.Bitmap:=img1;
 Image1.Canvas.Brush.Style:=bsClear;
 Image1.Canvas.Pen.Color:=clWhite;
 Image1.Canvas.Font.Color:=clWhite;
 for i:=1 to droplets do begin
     //Image1MouseDown(Self, mbLeft,[],arr_coords[i].X, arr_coords[i].Y);
     x:=arr_coords[i].X;
     y:=arr_coords[i].Y;
     arr_droplets[i].Left:=X - StrToInt(Edit1.Text) div 2;
     arr_droplets[i].Top:=Y - StrToInt(Edit2.Text) div 2;
     arr_droplets[i].Right:=X + StrToInt(Edit1.Text) div 2;
     arr_droplets[i].Bottom:=Y + StrToInt(Edit2.Text) div 2;
     Image1.Canvas.Rectangle(arr_droplets[i]);
     Image1.Canvas.TextOut(x-Image1.Canvas.TextWidth(IntToStr(i)) div 2,arr_droplets[i].Bottom,IntToStr(i));
 end;
end;

end.
