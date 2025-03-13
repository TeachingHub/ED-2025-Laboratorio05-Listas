program listas_ej9;

uses uListaEnlazadaCircular;

function bool_to_str(b: boolean): string;
begin
    if b then
        bool_to_str := 'bien.'
    else
        bool_to_str := 'mal.';
end;

procedure eliminar_duplicados(var list: tListaCircular);
var
    first_element, current_element: integer;
    num_elements_original, i: integer;
    processed_count: integer;
begin
    first_element := first(list);
    if not is_empty(list) then
    repeat

        current_element := first(list);
        delete(list, current_element);

        while in_list(list, current_element) do
        begin
            delete(list, current_element);
        end;

        insert_at_end(list, current_element);

    until first(list) = first_element;

end;


procedure crear_lista_circular_1(var l: tListaCircular);
begin
    initialize(l);
    insert_at_end(l, 2);
    insert_at_end(l, 4);
    insert_at_end(l, 1);
    insert_at_end(l, 2);
    insert_at_end(l, 3);
    insert_at_end(l, 4);
    insert_at_end(l, 4);
    insert_at_end(l, 5);
end;

procedure crear_lista_circular_2(var l: tListaCircular);
begin
    initialize(l);
    insert_at_end(l, 1);
    insert_at_end(l, 2);
    insert_at_end(l, 3);
    insert_at_end(l, 4);
    insert_at_end(l, 5);
end;

procedure crear_lista_circular_3(var l: tListaCircular);
begin
    initialize(l);
    insert_at_end(l, 2);
    insert_at_end(l, 2);
    insert_at_end(l, 2);
end;

procedure crear_lista_circular_4(var l: tListaCircular);
begin
    initialize(l);
    insert_at_end(l, 7);
end;

procedure crear_lista_circular_vacia(var l: tListaCircular);
begin
    initialize(l);
end;

procedure crear_lista_circular_5(var l: tListaCircular);
begin
    initialize(l);
    insert_at_end(l, 1);
    insert_at_end(l, 1);
    insert_at_end(l, 1);
    insert_at_end(l, 1);
    insert_at_end(l, 1);
end;


procedure crear_lista_circular_resultado_test1(var l: tListaCircular);
begin
    initialize(l);
    insert_at_end(l, 2);
    insert_at_end(l, 4);
    insert_at_end(l, 1);
    insert_at_end(l, 3);
    insert_at_end(l, 5);
end;

procedure crear_lista_circular_resultado_test2(var l: tListaCircular);
begin
    initialize(l);
    insert_at_end(l, 1);
    insert_at_end(l, 2);
    insert_at_end(l, 3);
    insert_at_end(l, 4);
    insert_at_end(l, 5);
end;

procedure crear_lista_circular_resultado_test3(var l: tListaCircular);
begin
    initialize(l);
    insert_at_end(l, 2);
end;

procedure crear_lista_circular_resultado_test4(var l: tListaCircular);
begin
    initialize(l);
    insert_at_end(l, 7);
end;

procedure crear_lista_circular_resultado_test_vacia(var l: tListaCircular);
begin
    initialize(l);
end;

procedure crear_lista_circular_resultado_test5(var l: tListaCircular);
begin
    initialize(l);
    insert_at_end(l, 1);
end;


procedure test_eliminar_duplicados();
var
    lista_original, lista_resultante, lista_correcta: tListaCircular;
    resultado_str, correcta_str, original_str: string;
    test_result : boolean;
begin
    WriteLn('Ejercicio: Eliminar Duplicados de Lista Circular');

    // Test 1: Lista con duplicados múltiples
    crear_lista_circular_1(lista_original); // lista_original = [2, 4, 1, 2, 3, 4, 4, 5]
    original_str := to_string(lista_original);
    crear_lista_circular_resultado_test1(lista_correcta); // lista_correcta = [1, 2, 3, 4, 5]
    copy(lista_original, lista_resultante);
    eliminar_duplicados(lista_resultante);
    resultado_str := to_string(lista_resultante);
    writeln('Resultado Test 1: ', resultado_str);
    correcta_str := to_string(lista_correcta);
    test_result := resultado_str = correcta_str;
    WriteLn('  Test 1: Lista original: ', original_str, ', Resultado esperado: ', correcta_str, ' -> ', bool_to_str(test_result));

    // Test 2: Lista sin duplicados
    crear_lista_circular_2(lista_original); // lista_original = [1, 2, 3, 4, 5]
    original_str := to_string(lista_original);
    crear_lista_circular_resultado_test2(lista_correcta); // lista_correcta = [1, 2, 3, 4, 5]
    copy(lista_original, lista_resultante);
    eliminar_duplicados(lista_resultante);
    resultado_str := to_string(lista_resultante);
    writeln('Resultado Test 2: ', resultado_str);
    correcta_str := to_string(lista_correcta);
    test_result := resultado_str = correcta_str;
    WriteLn('  Test 2: Lista original: ', original_str, ', Resultado esperado: ', correcta_str, ' -> ', bool_to_str(test_result));

    // Test 3: Lista con todos los elementos duplicados
    crear_lista_circular_3(lista_original); // lista_original = [2, 2, 2]
    original_str := to_string(lista_original);
    crear_lista_circular_resultado_test3(lista_correcta); // lista_correcta = [2]
    copy(lista_original, lista_resultante);
    eliminar_duplicados(lista_resultante);
    resultado_str := to_string(lista_resultante);
    writeln('Resultado Test 3: ', resultado_str);
    correcta_str := to_string(lista_correcta);
    test_result := resultado_str = correcta_str;
    WriteLn('  Test 3: Lista original: ', original_str, ', Resultado esperado: ', correcta_str, ' -> ', bool_to_str(test_result));

    // Test 4: Lista con un solo elemento (sin duplicados)
    crear_lista_circular_4(lista_original); // lista_original = [7]
    original_str := to_string(lista_original);
    crear_lista_circular_resultado_test4(lista_correcta); // lista_correcta = [7]
    copy(lista_original, lista_resultante);
    eliminar_duplicados(lista_resultante);
    resultado_str := to_string(lista_resultante);
    writeln('Resultado Test 4: ', resultado_str);
    correcta_str := to_string(lista_correcta);
    test_result := resultado_str = correcta_str;
    WriteLn('  Test 4: Lista original: ', original_str, ', Resultado esperado: ', correcta_str, ' -> ', bool_to_str(test_result));

    // Test 5: Lista vacía
    crear_lista_circular_vacia(lista_original); // lista_original = []
    original_str := to_string(lista_original);
    crear_lista_circular_resultado_test_vacia(lista_correcta); // lista_correcta = []
    copy(lista_original, lista_resultante);
    eliminar_duplicados(lista_resultante);
    resultado_str := to_string(lista_resultante);
    writeln('Resultado Test 5: ', resultado_str);
    correcta_str := to_string(lista_correcta);
    test_result := resultado_str = correcta_str;
    WriteLn('  Test 5: Lista original: ', original_str, ', Resultado esperado: ', correcta_str, ' -> ', bool_to_str(test_result));

    // Test 6: Lista con todos los elementos repetidos multiple times
    crear_lista_circular_5(lista_original); // lista_original = [1, 1, 1, 1, 1]
    original_str := to_string(lista_original);
    crear_lista_circular_resultado_test5(lista_correcta); // lista_correcta = [1]
    copy(lista_original, lista_resultante);
    eliminar_duplicados(lista_resultante);
    resultado_str := to_string(lista_resultante);
    writeln('Resultado Test 6: ', resultado_str);
    correcta_str := to_string(lista_correcta);
    test_result := resultado_str = correcta_str;
    WriteLn('  Test 6: Lista original: ', original_str, ', Resultado esperado: ', correcta_str, ' -> ', bool_to_str(test_result));

    WriteLn('');
end;


begin
    test_eliminar_duplicados();
    readln;
end.