unit uListadeListas;

interface

uses
    SysUtils, 
    uListaEnlazadaDoble;

type

    nodo = record
        persona: string; // Información almacenada en el nodo: nombre de la persona
        lista: tListaDoble; // Información almacenada en el nodo: lista de facturas
        sig: ^nodo; // Puntero al siguiente nodo
        ant: ^nodo; // Puntero al nodo anterior
    end;

    tListaDeListas = record
        first, last: ^nodo;
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

// Implementar las operaciones aquí

end.
