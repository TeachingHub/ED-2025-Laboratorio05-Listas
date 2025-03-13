program listas_ej13;

uses
  uListaEnlazadaDobleOrdenada, SysUtils;

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

procedure crear_lista_con_un_elemento(var list: tListaDoble);
begin
  initialize(list);
  insert_at_end(list, 10);
end;

procedure crear_lista_con_elementos(var list: tListaDoble);
begin
  initialize(list);
  insert_at_end(list, 10);
  insert_at_end(list, 20);
  insert_at_end(list, 30);
end;

procedure crear_lista_con_elementos_correcta_medio(var list: tListaDoble);
begin
  initialize(list);
  insert_at_end(list, 10);
  insert_at_end(list, 20);
  insert_at_end(list, 25);
  insert_at_end(list, 30);
end;


procedure crear_lista_con_elementos_correcta_final(var list: tListaDoble);
begin
  initialize(list);
  insert_at_end(list, 10);
  insert_at_end(list, 20);
  insert_at_end(list, 30);
  insert_at_end(list, 40);
end;


procedure crear_lista_con_elementos_correcta_principio(var list: tListaDoble);
begin
  initialize(list);
    insert_at_end(list, 0);
    insert_at_end(list, 10);
    insert_at_end(list, 20);
    insert_at_end(list, 30);
end;



procedure crear_lista_con_elementos_correcta_principio_repetido(var list: tListaDoble);
begin
  initialize(list);
    insert_at_end(list, 10);
    insert_at_end(list, 10);
    insert_at_end(list, 20);
    insert_at_end(list, 30);
end;

procedure crear_lista_con_elementos_correcta_final_repetido(var list: tListaDoble);
begin
  initialize(list);
    insert_at_end(list, 10);
    insert_at_end(list, 20);
    insert_at_end(list, 30);
    insert_at_end(list, 30);
end;

procedure crear_lista_con_elementos_correcta_medio_repetido(var list: tListaDoble);
begin
  initialize(list);
    insert_at_end(list, 10);
    insert_at_end(list, 20);
    insert_at_end(list, 20);
    insert_at_end(list, 30);
end;

procedure test_insertar_lista_vacia();
var
  lista, lista_esperada: tListaDoble;
  lista_str, lista_esperada_str, lista_inicial_str: string;
begin
    WriteLn('Test insertar en lista vacia');
    crear_lista_vacia(lista);
    crear_lista_con_un_elemento(lista_esperada);
    lista_inicial_str := to_string(lista);
    insert(lista, 10);
    lista_str := to_string(lista);
    lista_esperada_str := to_string(lista_esperada);
    WriteLn('    Lista: ', lista_inicial_str);
    WriteLn('    Valor a insertar: 10');
    WriteLn('    Esperado: ', lista_esperada_str);
    WriteLn('    Resultado: ',  lista_str);
    WriteLn('    Test: ', bool_to_str(lista_str = lista_esperada_str));
end;

procedure test_insertar_lista_correcta_final();
var
  lista, lista_esperada: tListaDoble;
  lista_str, lista_esperada_str, lista_inicial_str: string;
begin
    WriteLn('Test insertar en lista correcta final');
    crear_lista_con_elementos(lista);
    crear_lista_con_elementos_correcta_final(lista_esperada);
    lista_inicial_str := to_string(lista);
    insert(lista, 40);
    lista_str := to_string(lista);
    lista_esperada_str := to_string(lista_esperada);
    WriteLn('    Lista: ', lista_inicial_str);
    WriteLn('    Valor a insertar: 40');
    WriteLn('    Esperado: ', lista_esperada_str);
    WriteLn('    Resultado: ',  lista_str);
    WriteLn('    Test: ', bool_to_str(lista_str = lista_esperada_str));
end;

procedure test_insertar_lista_correcta_principio();
var
  lista, lista_esperada: tListaDoble;
  lista_str, lista_esperada_str, lista_inicial_str: string;
begin
    WriteLn('Test insertar en lista correcta principio');
    crear_lista_con_elementos(lista);
    crear_lista_con_elementos_correcta_principio(lista_esperada);
    lista_inicial_str := to_string(lista);
    insert(lista, 0);
    lista_str := to_string(lista);
    lista_esperada_str := to_string(lista_esperada);
    WriteLn('    Lista: ', lista_inicial_str);
    WriteLn('    Valor a insertar: 0');
    WriteLn('    Esperado: ', lista_esperada_str);
    WriteLn('    Resultado: ',  lista_str);
    WriteLn('    Test: ', bool_to_str(lista_str = lista_esperada_str));
end;

procedure test_insertar_lista_correcta_medio();
var
  lista, lista_esperada: tListaDoble;
  lista_str, lista_esperada_str, lista_inicial_str: string;
begin
    WriteLn('Test insertar en lista correcta medio');
    crear_lista_con_elementos(lista);
    crear_lista_con_elementos_correcta_medio(lista_esperada);
    lista_inicial_str := to_string(lista);
    insert(lista, 25);
    lista_str := to_string(lista);
    lista_esperada_str := to_string(lista_esperada);
    WriteLn('    Lista: ', lista_inicial_str);
    WriteLn('    Valor a insertar: 25');
    WriteLn('    Esperado: ', lista_esperada_str);
    WriteLn('    Resultado: ',  lista_str);
    WriteLn('    Test: ', bool_to_str(lista_str = lista_esperada_str));
end;

procedure test_insertar_lista_correcta_principio_repetido();
var
  lista, lista_esperada: tListaDoble;
  lista_str, lista_esperada_str, lista_inicial_str: string;
begin
    WriteLn('Test insertar en lista correcta principio repetido');
    crear_lista_con_elementos(lista);
    crear_lista_con_elementos_correcta_principio_repetido(lista_esperada);
    lista_inicial_str := to_string(lista);
    insert(lista, 10);
    lista_str := to_string(lista);
    lista_esperada_str := to_string(lista_esperada);
    WriteLn('    Lista: ', lista_inicial_str);
    WriteLn('    Valor a insertar: 0');
    WriteLn('    Esperado: ', lista_esperada_str);
    WriteLn('    Resultado: ',  lista_str);
    WriteLn('    Test: ', bool_to_str(lista_str = lista_esperada_str));
end;

procedure test_insertar_lista_correcta_final_repetido();
var
  lista, lista_esperada: tListaDoble;
  lista_str, lista_esperada_str, lista_inicial_str: string;
begin
    WriteLn('Test insertar en lista correcta final repetido');
    crear_lista_con_elementos(lista);
    crear_lista_con_elementos_correcta_final_repetido(lista_esperada);
    lista_inicial_str := to_string(lista);
    insert(lista, 30);
    lista_str := to_string(lista);
    lista_esperada_str := to_string(lista_esperada);
    WriteLn('    Lista: ', lista_inicial_str);
    WriteLn('    Valor a insertar: 30');
    WriteLn('    Esperado: ', lista_esperada_str);
    WriteLn('    Resultado: ',  lista_str);
    WriteLn('    Test: ', bool_to_str(lista_str = lista_esperada_str));
end;

procedure test_insertar_lista_correcta_medio_repetido();
var
  lista, lista_esperada: tListaDoble;
  lista_str, lista_esperada_str, lista_inicial_str: string;
begin
    WriteLn('Test insertar en lista correcta medio repetido');
    crear_lista_con_elementos(lista);
    crear_lista_con_elementos_correcta_medio_repetido(lista_esperada);
    lista_inicial_str := to_string(lista);
    insert(lista, 20);
    lista_str := to_string(lista);
    lista_esperada_str := to_string(lista_esperada);
    WriteLn('    Lista: ', lista_inicial_str);
    WriteLn('    Valor a insertar: 20');
    WriteLn('    Esperado: ', lista_esperada_str);
    WriteLn('    Resultado: ',  lista_str);
    WriteLn('    Test: ', bool_to_str(lista_str = lista_esperada_str));
end;


begin
  test_insertar_lista_vacia();
  test_insertar_lista_correcta_final();
  test_insertar_lista_correcta_principio();
  test_insertar_lista_correcta_medio();
  test_insertar_lista_correcta_principio_repetido();
  test_insertar_lista_correcta_final_repetido();
  test_insertar_lista_correcta_medio_repetido();

  readln;
end.

