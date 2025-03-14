unit uListadeListas;

interface

uses
    SysUtils, 
    uListaEnlazadaDoble;

type

    nodo = record
        persona: string; // Información almacenada en el nodo
        lista: tListaDoble; // Información almacenada en el nodo
        sig: ^nodo; // Puntero al siguiente nodo
        ant: ^nodo; // Puntero al nodo anterior
    end;

    tListaDeListas = record
        first, last: ^nodo; // Punteros al primer y último nodo de la lista
    end;

    procedure inicializar(var list: tListaDeListas);
    function hay_facturas(list: tListaDeListas): boolean;
    function hay_facturas_de_persona(list: tListaDeListas; persona: string): boolean;
    procedure obtener_facturas_de_persona(list: tListaDeListas; persona: string; var lista: tListaDoble);
    function obtener_factura_de_persona(list: tListaDeListas; persona: string): integer;
    procedure pagar_facturas_de_persona(var list: tListaDeListas; persona: string);
    procedure pagar_factura_de_persona(var list: tListaDeListas; persona: string);
    procedure agregar_factura_a_persona(var list: tListaDeListas; persona: string; factura: integer);
    function imprimir_facturas(list: tListaDeListas): string;

implementation

    procedure inicializar(var list: tListaDeListas);
    begin
        list.first := nil; // Inicializa la lista vacía
        list.last := nil; // Inicializa la lista vacía
    end;

    function hay_facturas(list: tListaDeListas): boolean;
    begin
        hay_facturas := list.first <> nil; // Verifica si la lista está vacía
    end;

    function hay_facturas_de_persona(list: tListaDeListas; persona: string): boolean;
    var
        aux: ^nodo;
    begin
        aux := list.first;
        while (aux <> nil) and (aux^.persona <> persona) do
            aux := aux^.sig;
        hay_facturas_de_persona := aux <> nil;
    end;

    procedure obtener_facturas_de_persona(list: tListaDeListas; persona: string; var lista: tListaDoble);
    var
        aux: ^nodo;
    begin
        aux := list.first;
        while (aux <> nil) and (aux^.persona <> persona) do
            aux := aux^.sig;
        if aux <> nil then
            copy(aux^.lista, lista)
        else
            initialize(lista);
    end;

    function obtener_factura_de_persona(list: tListaDeListas; persona: string): integer;
    var
        aux: ^nodo;
    begin
        aux := list.first;
        while (aux <> nil) and (aux^.persona <> persona) do
            aux := aux^.sig;
        if aux <> nil then
            obtener_factura_de_persona := first(aux^.lista)
        else
            obtener_factura_de_persona := 0;
    end;

    procedure pagar_facturas_de_persona(var list: tListaDeListas; persona: string);
    var
        aux, temp: ^nodo;
    begin
        aux := list.first;
        while (aux <> nil) and (aux^.persona <> persona) do
            aux := aux^.sig;
        if aux <> nil then
            begin
                clear(aux^.lista);
                // Elimina la persona de la lista
                if aux = list.first then
                    list.first := aux^.sig
                else
                    aux^.ant^.sig := aux^.sig;
                if aux = list.last then
                    list.last := aux^.ant
                else
                    aux^.sig^.ant := aux^.ant;
                temp := aux;
                aux := aux^.sig;
                dispose(temp);
            end;
    end;

    procedure pagar_factura_de_persona(var list: tListaDeListas; persona: string);
    var
        aux, temp: ^nodo;
    begin
        aux := list.first;
        while (aux <> nil) and (aux^.persona <> persona) do
            aux := aux^.sig;
        if aux <> nil then
        begin
            delete_at_begin(aux^.lista);
            // Si la lista queda vacía, se elimina la persona
            if is_empty(aux^.lista) then
            begin
                if aux = list.first then
                    list.first := aux^.sig
                else
                    aux^.ant^.sig := aux^.sig;
                if aux = list.last then
                    list.last := aux^.ant
                else
                    aux^.sig^.ant := aux^.ant;
                temp := aux;
                aux := aux^.sig;
                dispose(temp);
            end;
        end;
    end;

    procedure agregar_factura_a_persona(var list: tListaDeListas; persona: string; factura: integer);
    var
        aux: ^nodo;
    begin
        if not hay_facturas_de_persona(list, persona) then
        begin
            new(aux);
            aux^.persona := persona;
            initialize(aux^.lista);
            aux^.sig := nil;
            aux^.ant := list.last;
            if hay_facturas(list) then
                list.last^.sig := aux
            else
                list.first := aux;
            list.last := aux;
        end;
        aux := list.first;
        while (aux <> nil) and (aux^.persona <> persona) do
            aux := aux^.sig;
        if aux <> nil then
            insert_at_end(aux^.lista, factura);
    end;

    function imprimir_facturas(list: tListaDeListas): string;
    var
        aux: ^nodo;
        s: string;
    begin
        aux := list.first;
        s := '';
        while aux <> nil do
        begin
            s := s + aux^.persona + ': ' + to_string(aux^.lista) + sLineBreak;
            aux := aux^.sig;
        end;
        imprimir_facturas := s;
    end;

end.
