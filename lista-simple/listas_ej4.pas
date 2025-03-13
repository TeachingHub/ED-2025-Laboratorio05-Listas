program listas_ej4;

uses uListaEnlazadaSimple;

function bool_to_str(b: boolean): string;
begin
    if b then
        bool_to_str := 'bien.'
    else
        bool_to_str := 'mal.';
end;



{ 
    Implementar un subprograma que reciba una lista de enteros y devuelva dos listas, una con los números pares y otra con los impares.
    La lista original no debe ser modificada.
}
procedure dividir_lista_en_pares_e_impares(var list: tListaSimple; var pares, impares: tListaSimple);
var
    aux: tListaSimple;
begin
    initialize(pares);
    initialize(impares);
    initialize(aux);

    while not is_empty(list) do
    begin
        if first(list) mod 2 = 0 then
            insert_at_end(pares, first(list))
        else
            insert_at_end(impares, first(list));
        insert_at_end(aux, first(list));
        delete_at_begin(list);
    end;
    list := aux;
end;


procedure crear_lista_1(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 1);
    insert_at_end(l, 2);
    insert_at_end(l, 3);
    insert_at_end(l, 4);
    insert_at_end(l, 5);
    insert_at_end(l, 6);
end;

procedure crear_lista_2(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 2);
    insert_at_end(l, 4);
    insert_at_end(l, 6);
end;

procedure crear_lista_3(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 1);
    insert_at_end(l, 3);
    insert_at_end(l, 5);
end;

procedure test_dividir_lista();
var
    lista_original, lista_pares, lista_impares, lista_pares_correcta, lista_impares_correcta: tListaSimple;
    resultado_pares, resultado_impares, original_str: string;
begin
    WriteLn('Ejercicio: Dividir lista en pares e impares');

    // Test 1
    crear_lista_1(lista_original); // lista_original = [1, 2, 3, 4, 5, 6]
    original_str := to_string(lista_original);
    crear_lista_2(lista_pares_correcta); // lista_pares_correcta = [2, 4, 6]
    crear_lista_3(lista_impares_correcta); // lista_impares_correcta = [1, 3, 5]

    WriteLn('  Lista original: ', original_str);
    dividir_lista_en_pares_e_impares(lista_original, lista_pares, lista_impares);
    resultado_pares := to_string(lista_pares);
    resultado_impares := to_string(lista_impares);

    WriteLn('  Test 1: Lista pares = ', resultado_pares, ', Correcta = ', to_string(lista_pares_correcta) , ' El ejercicio funciona en pares ', bool_to_str(resultado_pares = to_string(lista_pares_correcta)));
    WriteLn('  Test 1: Lista impares = ', resultado_impares, ', Correcta = ', to_string(lista_impares_correcta) , ' El ejercicio funciona en impares ', bool_to_str(resultado_impares = to_string(lista_impares_correcta)));
    WriteLn('  Estado lista inicial sin modificar: ', to_string(lista_original), ' = ', original_str, ' ', bool_to_str(original_str = to_string(lista_original))); // La lista original no debe ser modificada


    // Test 2 - Lista vacía
    initialize(lista_original); // lista_original = []
    original_str := to_string(lista_original);
    initialize(lista_pares_correcta); // lista_pares_correcta = []
    initialize(lista_impares_correcta); // lista_impares_correcta = []

    WriteLn('  Lista original: ', original_str);
    dividir_lista_en_pares_e_impares(lista_original, lista_pares, lista_impares);
    resultado_pares := to_string(lista_pares);
    resultado_impares := to_string(lista_impares);

    WriteLn('  Test 2 (Lista vacía): Lista pares = ', resultado_pares, ', Correcta = ', to_string(lista_pares_correcta) , ' El ejercicio funciona en pares ', bool_to_str(resultado_pares = to_string(lista_pares_correcta)));
    WriteLn('  Test 2 (Lista vacía): Lista impares = ', resultado_impares, ', Correcta = ', to_string(lista_impares_correcta) , ' El ejercicio funciona en impares ', bool_to_str(resultado_impares = to_string(lista_impares_correcta)));
    WriteLn('  Estado lista inicial sin modificar: ', to_string(lista_original), ' = ', original_str, ' ', bool_to_str(original_str = to_string(lista_original))); // La lista original no debe ser modificada

    // Test 3 - Solo pares
    crear_lista_2(lista_original); // lista_original = [2, 4, 6]
    original_str := to_string(lista_original);
    crear_lista_2(lista_pares_correcta); // lista_pares_correcta = [2, 4, 6]
    initialize(lista_impares_correcta); // lista_impares_correcta = []

    WriteLn('  Lista original: ', original_str);
    dividir_lista_en_pares_e_impares(lista_original, lista_pares, lista_impares);
    resultado_pares := to_string(lista_pares);
    resultado_impares := to_string(lista_impares);

    WriteLn('  Test 3 (Solo pares): Lista pares = ', resultado_pares, ', Correcta = ', to_string(lista_pares_correcta) , ' El ejercicio funciona en pares ', bool_to_str(resultado_pares = to_string(lista_pares_correcta)));
    WriteLn('  Test 3 (Solo pares): Lista impares = ', resultado_impares, ', Correcta = ', to_string(lista_impares_correcta) , ' El ejercicio funciona en impares ', bool_to_str(resultado_impares = to_string(lista_impares_correcta)));
    WriteLn('  Estado lista inicial sin modificar: ', to_string(lista_original), ' = ', original_str, ' ', bool_to_str(original_str = to_string(lista_original))); // La lista original no debe ser modificada

    // Test 4 - Solo impares
    crear_lista_3(lista_original); // lista_original = [1, 3, 5]
    original_str := to_string(lista_original);
    initialize(lista_pares_correcta); // lista_pares_correcta = []
    crear_lista_3(lista_impares_correcta); // lista_impares_correcta = [1, 3, 5]

    WriteLn('  Lista original: ', original_str);
    dividir_lista_en_pares_e_impares(lista_original, lista_pares, lista_impares);
    resultado_pares := to_string(lista_pares);
    resultado_impares := to_string(lista_impares);

    WriteLn('  Test 4 (Solo impares): Lista pares = ', resultado_pares, ', Correcta = ', to_string(lista_pares_correcta) , ' El ejercicio funciona en pares ', bool_to_str(resultado_pares = to_string(lista_pares_correcta)));
    WriteLn('  Test 4 (Solo impares): Lista impares = ', resultado_impares, ', Correcta = ', to_string(lista_impares_correcta) , ' El ejercicio funciona en impares ', bool_to_str(resultado_impares = to_string(lista_impares_correcta)));
    WriteLn('  Estado lista inicial sin modificar: ', to_string(lista_original), ' = ', original_str, ' ', bool_to_str(original_str = to_string(lista_original))); // La lista original no debe ser modificada


end;


begin
    test_dividir_lista();
    readln;
end.