program cacambas;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, inicial, logon, home, DM, gerenciar_cacamba, preco, funcionarios,
  financeiro, pedidos, relatorio_cacamba, fortes324forlaz, relatorio_financeiro,
  relatorio_financeiro_semanal, relatorio_mensal_receitas,
  relatorio_semanal_receitas, relatorio_anual_gastos, relatorio_anual_receitas,
  relatorio_mensal_locacao, relatorio_anual_locacao, logotipo
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='Caçamba System';
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(Tt_inicial, t_inicial);
  Application.CreateForm(Tt_logon, t_logon);
  Application.CreateForm(Tt_home, t_home);
  Application.CreateForm(TDMC, DMC);
  Application.CreateForm(Tt_cacamba, t_cacamba);
  Application.CreateForm(Tt_preco, t_preco);
  Application.CreateForm(Tt_funcionarios, t_funcionarios);
  Application.CreateForm(Tt_financeiro, t_financeiro);
  Application.CreateForm(Tt_pedidos, t_pedidos);
  Application.CreateForm(Tt_rel_cacamba, t_rel_cacamba);
  Application.CreateForm(Tt_rel_financeiro, t_rel_financeiro);
  Application.CreateForm(TForm1, t_Form1);
  Application.CreateForm(Trelatorio_mensal_receita, t_relatorio_mensal_receita);
  Application.CreateForm(Trelatorio_semanal_receitas, t_relatorio_semanal_receitas);
  Application.CreateForm(Tt_relatorio_anual_gastos, t_relatorio_anual_gastos);
  Application.CreateForm(Tt_relatorio_anual_receitas, t_relatorio_anual_receitas
    );
  Application.CreateForm(Tt_relatorio_mensal_locacao, t_relatorio_mensal_locacao
    );
  Application.CreateForm(Tt_relatorio_anual_locacao, t_relatorio_anual_locacao);
  Application.CreateForm(Tt_logo, t_logo);
  Application.Run;
end.

