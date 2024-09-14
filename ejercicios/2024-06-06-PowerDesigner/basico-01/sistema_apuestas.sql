/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     13/09/2024 5:07:06 p. m.                     */
/*==============================================================*/


drop table APUESTA;

drop table APUESTA_LOTERIA;

drop table LOTERIA;

drop table NUMERO_APUESTA;

drop table USUARIO;

/*==============================================================*/
/* Table: APUESTA                                               */
/*==============================================================*/
create table APUESTA (
   ID_APUESTA           INT2                 not null,
   FECHA_APUESTA        DATE                 null,
   MONTO                DECIMAL(10, 2)       null,
   ESTADO               VARCHAR(20)          null,
   ID_USUARIO           INT2                 not null,
   ID_NUMERO_APUESTA    INT2                 null,
   constraint PK_APUESTA primary key (ID_APUESTA, ID_USUARIO)
);

/*==============================================================*/
/* Table: APUESTA_LOTERIA                                       */
/*==============================================================*/
create table APUESTA_LOTERIA (
   ID_APUESTA_LOTERIA   INT2                 not null,
   ID_APUESTA           INT2                 null,
   ID_USUARIO           INT2                 null,
   ID_LOTERIA           INT2                 null,
   constraint PK_APUESTA_LOTERIA primary key (ID_APUESTA_LOTERIA)
);

/*==============================================================*/
/* Table: LOTERIA                                               */
/*==============================================================*/
create table LOTERIA (
   ID_LOTERIA           INT2                 not null,
   NOMBRE_LOTERIA       VARCHAR(50)          null,
   HORARIO              TIME                 null,
   constraint PK_LOTERIA primary key (ID_LOTERIA)
);

/*==============================================================*/
/* Table: NUMERO_APUESTA                                        */
/*==============================================================*/
create table NUMERO_APUESTA (
   ID_NUMERO_APUESTA    INT2                 not null,
   NUMERO               INT2                 null,
   ID_APUESTA           INT2                 not null,
   ID_USUARIO           INT2                 null,
   constraint PK_NUMERO_APUESTA primary key (ID_NUMERO_APUESTA)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           INT2                 not null,
   ID_NUMERO_APUESTA    INT2                 null,
   ID_APUESTA_LOTERIA   INT2                 null,
   ID_APUESTA           INT2                 null,
   NOMBRE               VARCHAR(50)          null,
   EMAIL                VARCHAR(100)         null,
   SALDO                DECIMAL(10, 2)       null,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

alter table APUESTA
   add constraint FK_APUESTA_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table APUESTA
   add constraint FK_APUESTA_REFERENCE_NUMERO_A foreign key (ID_NUMERO_APUESTA)
      references NUMERO_APUESTA (ID_NUMERO_APUESTA)
      on delete restrict on update restrict;

alter table APUESTA_LOTERIA
   add constraint FK_APUESTA__REFERENCE_APUESTA foreign key (ID_APUESTA, ID_USUARIO)
      references APUESTA (ID_APUESTA, ID_USUARIO)
      on delete restrict on update restrict;

alter table APUESTA_LOTERIA
   add constraint FK_APUESTA__REFERENCE_LOTERIA foreign key (ID_LOTERIA)
      references LOTERIA (ID_LOTERIA)
      on delete restrict on update restrict;

alter table NUMERO_APUESTA
   add constraint FK_NUMERO_A_REFERENCE_APUESTA foreign key (ID_APUESTA, ID_USUARIO)
      references APUESTA (ID_APUESTA, ID_USUARIO)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_NUMERO_A foreign key (ID_NUMERO_APUESTA)
      references NUMERO_APUESTA (ID_NUMERO_APUESTA)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_APUESTA_ foreign key (ID_APUESTA_LOTERIA)
      references APUESTA_LOTERIA (ID_APUESTA_LOTERIA)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_APUESTA foreign key (ID_APUESTA, ID_USUARIO)
      references APUESTA (ID_APUESTA, ID_USUARIO)
      on delete restrict on update restrict;

