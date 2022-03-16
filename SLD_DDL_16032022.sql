
create schema if not exists nexus_sld;

drop owned by nexus_sld_user;
drop user if exists nexus_sld_user;

create user nexus_sld_user with password 'nexusdevsld';
grant connect on database postgres to nexus_sld_user;
grant usage on schema nexus_sld to nexus_sld_user;
grant all on schema nexus_sld to nexus_sld_user;



drop table if exists nexus_sld."nexus_services";
drop table if exists nexus_sld."nexus_ups_countries";
drop table if exists nexus_sld."nexus_ups_psps";
drop table if exists nexus_sld."nexus_psp";
drop table if exists nexus_sld."nexus_ups";
drop table if exists nexus_sld."nexus_country";



CREATE TABLE IF NOT EXISTS nexus_sld.nexus_country
(
    id uuid NOT NULL,
    country_code varchar(2) NOT NULL,
    country varchar(35) NOT NULL,
    gw_onboarded boolean NOT NULL,
    created_by varchar(35) NOT NULL,
    created_dttm timestamp NOT NULL,
    CONSTRAINT nexus_country_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS nexus_sld.nexus_psp
(
    id uuid NOT NULL,
    bic varchar(35),
    lei varchar(35),
    local_id varchar(35),
    xml text NOT NULL,
    created_by varchar(35) NOT NULL,
    created_dttm timestamp NOT NULL,
    CONSTRAINT nexus_psp_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS nexus_sld.nexus_services
(
    id uuid NOT NULL,
    country_code varchar(2) NOT NULL,
    service_type varchar(35) NOT NULL,
    xml text NOT NULL,
    effective_dttm timestamp NOT NULL,
    created_by varchar(35) NOT NULL,
    created_dttm timestamp NOT NULL,
    CONSTRAINT nexus_services_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS nexus_sld.nexus_ups
(
    id uuid NOT NULL,
    ups_id varchar(35) NOT NULL,
    xml text NOT NULL,
    effective_dttm timestamp NOT NULL,
    created_by varchar(35) NOT NULL,
    created_dttm timestamp NOT NULL,
    CONSTRAINT nexus_ups_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS nexus_sld.nexus_ups_countries
(
    id uuid NOT NULL,
    ups_fk uuid NOT NULL,
    country_code_fk uuid NOT NULL,
    ups_id varchar(35) NOT NULL,
    country_code varchar(2) NOT NULL,
    currency_code varchar(3) NOT NULL,
    effective_dttm timestamp NOT NULL,
    created_by varchar(35) NOT NULL,
    created_dttm timestamp NOT NULL,
    CONSTRAINT nexus_ups_countries_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS nexus_sld.nexus_ups_psps
(
    id uuid NOT NULL,
    ups_fk uuid NOT NULL,
    psp_fk uuid NOT NULL,
    ups_id varchar(35) NOT NULL,
    psp_id uuid NOT NULL,
    created_by varchar(35) NOT NULL,
    created_dttm timestamp NOT NULL,
    CONSTRAINT nexus_ups_psps_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS nexus_sld.nexus_ups_countries
    ADD CONSTRAINT nexus_country_code_fkey FOREIGN KEY (country_code_fk)
    REFERENCES nexus_sld.nexus_country (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS nexus_sld.nexus_ups_countries
    ADD CONSTRAINT nexus_ups_id_fkey FOREIGN KEY (ups_fk)
    REFERENCES nexus_sld.nexus_ups (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS nexus_sld.nexus_ups_psps
    ADD CONSTRAINT nexus_psp_fkey FOREIGN KEY (psp_fk)
    REFERENCES nexus_sld.nexus_psp (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS nexus_sld.nexus_ups_psps
    ADD CONSTRAINT nexus_psp_usp_fkey FOREIGN KEY (ups_fk)
    REFERENCES nexus_sld.nexus_ups (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

