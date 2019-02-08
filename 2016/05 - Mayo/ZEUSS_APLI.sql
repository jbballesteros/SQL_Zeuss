  
     
  
  
  
  
alter Procedure add_documentos_lin  
  
 (  
  @sw   tinyint,  
  @tipo   varchar(4),  
  @numero  int,  
  @codigo  varchar(20),  
  @seq  int,  
  @fec  datetime,  
  @nit  Tipo_NIT,  
  @cantidad real,  
  @porcentaje_iva real,  
  @valor_unitario money,  
  @porcentaje_descuento real,  
  @costo_unitario Tipo_COSTO, 
  @costo_unitario_niif Tipo_COSTO=NULL, --Nuevo Campo NIIF 
  @adicional varchar(80),  
  @vendedor Tipo_NIT,  
  @bodega  smallint,  
  @und  varchar(4),  
  @cantidad_und real,  
  @cantidad_pedida real=0,  
  @maneja_inventario varchar(1)='S',  
  @costo_unitario_sin Tipo_COSTO,  
  @pedido  int=null,  
  @lote   varchar(10)=null,  
  @cantidad_otra_und real=null,  
  @telefono  int=null,  
  @tipo_op   varchar(4)=NULL,  
  @numero_op  int=null,  
  @lote_vcmto  smalldatetime=null,  
  @tipo_link   varchar(4)=null,  
  @numero_link  int=null,  
  @seq_link  int=null,  
  @cantidad_dos  int=null,  
  @porc_dcto_2  real=null,  
  @porc_dcto_3  real=null  
 )  
  
As  
 /* set nocount on */  
 INSERT INTO documentos_lin  
 (  
  sw,  
  tipo,  
  numero,  
  codigo,  
  seq,  
  fec,  
  nit,  
  cantidad,  
  porcentaje_iva,  
  valor_unitario,  
  porcentaje_descuento,  
  costo_unitario,  
  costo_unitario_niif,  --Nuevo Campo NIIF
  adicional,  
  vendedor,  
  bodega,  
  und,  
  cantidad_und,  
  cantidad_pedida,  
  maneja_inventario,  
  costo_unitario_sin,  
  pedido,  
  lote,  
  cantidad_otra_und,  
  telefono,  
  tipo_op,  
  numero_op,  
  lote_vcmto,  
  tipo_link,  
  numero_link,  
  seq_link,  
  cantidad_dos,  
  porc_dcto_2,  
  porc_dcto_3  
 )  
 VALUES  
 (  
  @sw,  
  @tipo,  
  @numero,  
  @codigo,  
  @seq,  
  @fec,  
  @nit,  
  @cantidad,  
  @porcentaje_iva,  
  @valor_unitario,  
  @porcentaje_descuento,  
  @costo_unitario,
  		@costo_unitario_niif,  --Nuevo Campo NIIF  
  @adicional,  
  @vendedor,  
  @bodega,  
  @und,  
  @cantidad_und,  
  @cantidad_pedida,  
  @maneja_inventario,  
  @costo_unitario_sin,  
  @pedido,  
  @lote,  
  @cantidad_otra_und,  
  @telefono,  
  @tipo_op,  
  @numero_op,  
  @lote_vcmto,  
  @tipo_link,  
  @numero_link,  
  @seq_link,  
  @cantidad_dos,  
  @porc_dcto_2,  
  @porc_dcto_3  
 )  
  
 return