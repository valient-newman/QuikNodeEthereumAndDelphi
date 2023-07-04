{******************************************************************************}
{                                                                              }
{                                  Delphereum                                  }
{                                                                              }
{             Copyright(c) 2018 Stefan van As <svanas@runbox.com>              }
{           Github Repository <https://github.com/svanas/delphereum>           }
{                                                                              }
{             Distributed under GNU AGPL v3.0 with Commons Clause              }
{                                                                              }
{   This program is free software: you can redistribute it and/or modify       }
{   it under the terms of the GNU Affero General Public License as published   }
{   by the Free Software Foundation, either version 3 of the License, or       }
{   (at your option) any later version.                                        }
{                                                                              }
{   This program is distributed in the hope that it will be useful,            }
{   but WITHOUT ANY WARRANTY; without even the implied warranty of             }
{   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              }
{   GNU Affero General Public License for more details.                        }
{                                                                              }
{   You should have received a copy of the GNU Affero General Public License   }
{   along with this program.  If not, see <https://www.gnu.org/licenses/>      }
{                                                                              }
{******************************************************************************}
// Delphereum Study. Tutorial 'Transferring ERC-20 tokens with Delphi'
// Project in Embarcadero Delphi 11 made with source of this tutorial: https://medium.com/quiknode/quiknode-ethereum-and-delphi-f7bfc9671c23
// Prepared by Valient Newman <valient.newman@proton.me>
// My Github Repository <https://github.com/valient-newman>

unit QuikNodeEthereumAndDelphiUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses
  web3, web3.eth, Velthuis.BigIntegers;


procedure TForm1.Button1Click(Sender: TObject);
begin
  var client: IWeb3 := TWeb3.Create('https://<your-node-name>.quiknode.pro/<your-token>/');
  web3.eth.blockNumber(client, procedure(num: BigInteger; err: IError)
  begin
    TThread.Synchronize(nil, procedure
    begin
      if Assigned(err) then
        MessageDlg(err.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0)
      else
        MessageDlg('The number of the most recent block in the node is'+#10+num.ToString, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    end);
  end);
end;

end.
