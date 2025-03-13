program listas_ej12;
uses
  SysUtils,
  uListaEnlazadaDoble;

procedure eliminarElementoMedio(var list: tListaDoble);
var
    size, i, num : integer;
begin
    WriteLn('No implementado');
end;




function bool_to_str(b: boolean): string;
begin
  if b then
    bool_to_str := 'bien.'
  else
    bool_to_str := 'mal.';
end;

procedure lista_vacia (var list: tListaDoble);
begin
    initialize(list);
end;

procedure lista_con_elementos_pares(var list: tListaDoble);
begin
    initialize(list);
    insert_at_end(list, 1);
    insert_at_end(list, 2);
    insert_at_end(list, 3);
    insert_at_end(list, 4);
end;

procedure lista_con_elementos_impares(var list: tListaDoble);
begin
    initialize(list);
    insert_at_end(list, 1);
    insert_at_end(list, 2);
    insert_at_end(list, 3);
    insert_at_end(list, 4);
    insert_at_end(list, 5);
end;

procedure lista_con_elementos_impares_resultado(var list: tListaDoble);
begin
    initialize(list);
    insert_at_end(list, 1);
    insert_at_end(list, 2);
    insert_at_end(list, 4);
    insert_at_end(list, 5);
end;

procedure lista_con_un_elemento(var list: tListaDoble);
begin
    initialize(list);
    insert_at_end(list, 1);
end;

procedure test_lista_vacia();
var
    list, lista_esperada: tListaDoble;
    resultado, resultado_esperado: string;
begin
    WriteLn('Test lista vacia');
    lista_vacia(list);
    lista_vacia(lista_esperada);
    WriteLn(' Lista: ', to_string(list));
    eliminarElementoMedio(list);
    resultado := to_string(list);
    resultado_esperado := to_string(lista_esperada);
    WriteLn(' Resultado = ', resultado, ', Esperado = ', resultado_esperado, ', Test: ', bool_to_str(resultado = resultado_esperado));
end;

procedure test_lista_con_elementos_pares();
var
    list, lista_esperada: tListaDoble;
    resultado, resultado_esperado: string;
begin
    WriteLn('Test lista con elementos pares');
    lista_con_elementos_pares(list);
    lista_con_elementos_pares(lista_esperada);
    WriteLn(' Lista: ', to_string(list));
    eliminarElementoMedio(list);
    resultado := to_string(list);
    resultado_esperado := to_string(lista_esperada);
    WriteLn(' Resultado = ', resultado, ', Esperado = ', resultado_esperado, ', Test: ', bool_to_str(resultado = resultado_esperado));
end;

procedure test_lista_con_elementos_impares();
var
    list, lista_esperada: tListaDoble;
    resultado, resultado_esperado: string;
begin
    WriteLn('Test lista con elementos impares');
    lista_con_elementos_impares(list);
    lista_con_elementos_impares_resultado(lista_esperada);
    WriteLn(' Lista: ', to_string(list));
    eliminarElementoMedio(list);
    resultado := to_string(list);
    resultado_esperado := to_string(lista_esperada);
    WriteLn(' Resultado = ', resultado, ', Esperado = ', resultado_esperado, ', Test: ', bool_to_str(resultado = resultado_esperado));
end;



procedure test_lista_con_un_elemento();
var
    list, lista_esperada: tListaDoble;
    resultado, resultado_esperado: string;
begin
    WriteLn('Test lista con un solo elemento');
    lista_con_un_elemento(list);
    WriteLn(' Lista: ', to_string(list));
    eliminarElementoMedio(list);
    lista_vacia(lista_esperada);
    resultado := to_string(list);
    resultado_esperado := to_string(lista_esperada);
    WriteLn(' Resultado = ', resultado, ', Esperado = ', resultado_esperado, ', Test: ', bool_to_str(resultado = resultado_esperado));
end;

begin
    test_lista_vacia();
    test_lista_con_elementos_pares();
    test_lista_con_elementos_impares();
    test_lista_con_un_elemento();

    readln;
end.

