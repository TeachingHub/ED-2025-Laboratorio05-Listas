program listas_ej11;

uses
  uListaEnlazadaDobleGetAt,
  SysUtils;

function bool_to_str(b: boolean): string;
begin
  if b then
    bool_to_str := 'bien.'
  else
    bool_to_str := 'mal.';
end;

procedure crear_lista_vacia(var list: tListaDoble);
begin
  initialize(list);
end;

procedure crear_lista_con_elementos(var list: tListaDoble);
begin
  initialize(list);
  insert_at_end(list, 1);
  insert_at_end(list, 2);
  insert_at_end(list, 3);
end;

procedure test_get_at_lista_vacia();
var
  list: tListaDoble;
  valor_obtenido: integer;
  exito: boolean;
  resultado: string;
  esperado_exito: boolean;
begin
  WriteLn('Test get_at: Lista vacia');
  crear_lista_vacia(list);
  valor_obtenido := get_at(list, 1);
  // No deberia devolver nada, pero no se puede verificar
  WriteLn(' Valor obtenido = ', valor_obtenido); // Sera un valor aleatorio
end;

procedure test_get_at_posicion_1();
var
  list: tListaDoble;
  valor_obtenido: integer;
  exito: boolean;
  resultado: string;
  esperado_valor: integer;
  esperado_exito: boolean;

begin
  WriteLn('Test get_at: Posicion 1');
  crear_lista_con_elementos(list);
  valor_obtenido := get_at(list, 1); 
  resultado := IntToStr(valor_obtenido);
  esperado_valor := 1;
  esperado_exito := True;
  WriteLn(' Lista: ', to_string(list));
  WriteLn('  Resultado valor = ', resultado, ', Esperado valor = ', IntToStr(esperado_valor), ', Test Valor: ', bool_to_str(valor_obtenido = esperado_valor));
  exito := (valor_obtenido = esperado_valor); 
  WriteLn('  Resultado exito = ', bool_to_str(exito), ', Esperado exito = ', bool_to_str(esperado_exito) , ', Test Exito: ', bool_to_str(exito = esperado_exito));
end;

procedure test_get_at_posicion_media();
var
  list: tListaDoble;
  valor_obtenido: integer;
  exito: boolean;
  resultado: string;
  esperado_valor: integer;
  esperado_exito: boolean;
begin
  WriteLn('Test get_at: Posicion media');
  crear_lista_con_elementos(list);
  valor_obtenido := get_at(list, 2); 
  resultado := IntToStr(valor_obtenido);
  esperado_valor := 2;
  esperado_exito := True;
  WriteLn(' Lista: ', to_string(list));
  WriteLn('  Resultado valor = ', resultado, ', Esperado valor = ', IntToStr(esperado_valor), ', Test Valor: ', bool_to_str(valor_obtenido = esperado_valor));
  exito := (valor_obtenido = esperado_valor); 
  WriteLn('  Resultado exito = ', bool_to_str(exito), ', Esperado exito = ', bool_to_str(esperado_exito) , ', Test Exito: ', bool_to_str(exito = esperado_exito));
end;

procedure test_get_at_posicion_final();
var
  list: tListaDoble;
  valor_obtenido: integer;
  exito: boolean;
  resultado: string;
  esperado_valor: integer;
  esperado_exito: boolean;
begin
  WriteLn('Test get_at: Posicion final');
  crear_lista_con_elementos(list);
  valor_obtenido := get_at(list, 3); 
  resultado := IntToStr(valor_obtenido);
  esperado_valor := 3;
  esperado_exito := True;
  WriteLn(' Lista: ', to_string(list));
  WriteLn('  Resultado valor = ', resultado, ', Esperado valor = ', IntToStr(esperado_valor), ', Test Valor: ', bool_to_str(valor_obtenido = esperado_valor));
  exito := (valor_obtenido = esperado_valor); 
  WriteLn('  Resultado exito = ', bool_to_str(exito), ', Esperado exito = ', bool_to_str(esperado_exito) , ', Test Exito: ', bool_to_str(exito = esperado_exito));
end;

procedure test_get_at_posicion_fuera_rango();
var
  list: tListaDoble;
  valor_obtenido: integer;
  exito: boolean;
  resultado_exito: string;
  esperado_exito: boolean;

begin
  WriteLn('Test 1 get_at: Posicion fuera de rango (mayor)');
  crear_lista_con_elementos(list);
  valor_obtenido := get_at(list, 4); 
  // No deberia devolver nada, pero no se puede verificar
  WriteLn(' Valor obtenido = ', valor_obtenido);

  WriteLn('Test 2 get_at: Posicion fuera de rango (menor)');
  crear_lista_con_elementos(list);
  valor_obtenido := get_at(list, 0);
  // No deberia devolver nada, pero no se puede verificar
  WriteLn(' Valor obtenido = ', valor_obtenido);
end;

begin
  WriteLn('Comprobacion del metodo get_at:');
  WriteLn('');

  test_get_at_lista_vacia();
  test_get_at_posicion_1();
  test_get_at_posicion_media();
  test_get_at_posicion_final();
  test_get_at_posicion_fuera_rango();

  readln;
end.