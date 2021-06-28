CREATE TABLE @cdm_schema.person
(
  person_id						BIGINT	  	NOT NULL ,
  gender_concept_id				INTEGER	  	NOT NULL ,
  year_of_birth					INTEGER	  	NOT NULL ,
  month_of_birth				INTEGER	  	NULL,
  day_of_birth					INTEGER	  	NULL,
  birth_datetime				TIMESTAMP	NULL,
  death_datetime				TIMESTAMP	NULL,
  race_concept_id				INTEGER		NOT NULL,
  ethnicity_concept_id			INTEGER	  	NOT NULL,
  location_id					BIGINT		NULL,
  provider_id					BIGINT		NULL,
  care_site_id					BIGINT		NULL,
  person_source_value			VARCHAR(50)	NULL,
  gender_source_value			VARCHAR(50) NULL,
  gender_source_concept_id	  	INTEGER		NOT NULL,
  race_source_value				VARCHAR(50) NULL,
  race_source_concept_id		INTEGER		NOT NULL,
  ethnicity_source_value		VARCHAR(50) NULL,
  ethnicity_source_concept_id	INTEGER		NOT NULL
)
;
CREATE TABLE omop.observation_period
(
  observation_period_id				BIGINT		NOT NULL ,
  person_id							BIGINT		NOT NULL ,
  observation_period_start_date		DATE		NOT NULL ,
  observation_period_end_date		DATE		NOT NULL ,
  period_type_concept_id			INTEGER		NOT NULL
)
;

CREATE TABLE omop.visit_occurrence
(
  visit_occurrence_id			BIGINT			NOT NULL ,
  person_id						BIGINT			NOT NULL ,
  visit_concept_id				INTEGER			NOT NULL ,
  visit_start_date				DATE			NULL ,
  visit_start_datetime			TIMESTAMP		NOT NULL ,
  visit_end_date				DATE			NULL ,
  visit_end_datetime			TIMESTAMP		NOT NULL ,
  visit_type_concept_id			INTEGER			NOT NULL ,
  provider_id					BIGINT			NULL,
  care_site_id					BIGINT			NULL,
  visit_source_value			VARCHAR(50)		NULL,
  visit_source_concept_id		INTEGER			NOT NULL ,
  admitted_from_concept_id      INTEGER     	NOT NULL ,
  admitted_from_source_value    VARCHAR(50) 	NULL ,
  discharge_to_source_value		VARCHAR(50)		NULL ,
  discharge_to_concept_id		INTEGER   		NOT NULL ,
  preceding_visit_occurrence_id	BIGINT 			NULL
)
;

CREATE TABLE omop.procedure_occurrence
(
  procedure_occurrence_id		BIGINT			NOT NULL ,
  person_id						BIGINT			NOT NULL ,
  procedure_concept_id			INTEGER			NOT NULL ,
  procedure_date				DATE			NULL ,
  procedure_datetime			TIMESTAMP		NOT NULL ,
  procedure_type_concept_id		INTEGER			NOT NULL ,
  modifier_concept_id			INTEGER			NOT NULL ,
  quantity						INTEGER			NULL ,
  provider_id					BIGINT			NULL ,
  visit_occurrence_id			BIGINT			NULL ,
  visit_detail_id             	BIGINT      	NULL ,
  procedure_source_value		VARCHAR(50)		NULL ,
  procedure_source_concept_id	INTEGER			NOT NULL ,
  modifier_source_value		    VARCHAR(50)		NULL
)
;
