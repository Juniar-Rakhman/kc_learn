--
-- PostgreSQL database dump
--

\restrict OUNKaDeu2MDu988bNFAhnQksSelFFIk5h2WQMASXajaxeGIarbFNo29cSuSow4g

-- Dumped from database version 13.22 (Debian 13.22-1.pgdg13+1)
-- Dumped by pg_dump version 13.22 (Debian 13.22-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64),
    details_json text
);


ALTER TABLE public.admin_event_entity OWNER TO admin;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO admin;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO admin;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO admin;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO admin;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO admin;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO admin;

--
-- Name: client; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO admin;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO admin;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO admin;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO admin;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO admin;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO admin;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO admin;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO admin;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO admin;

--
-- Name: component; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO admin;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO admin;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO admin;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer,
    version integer DEFAULT 0
);


ALTER TABLE public.credential OWNER TO admin;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO admin;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO admin;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO admin;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO admin;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.fed_user_attribute OWNER TO admin;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO admin;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO admin;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO admin;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO admin;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO admin;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO admin;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO admin;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO admin;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO admin;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO admin;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL,
    organization_id character varying(255),
    hide_on_login boolean DEFAULT false
);


ALTER TABLE public.identity_provider OWNER TO admin;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO admin;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO admin;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO admin;

--
-- Name: jgroups_ping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.jgroups_ping (
    address character varying(200) NOT NULL,
    name character varying(200),
    cluster_name character varying(200) NOT NULL,
    ip character varying(200) NOT NULL,
    coord boolean
);


ALTER TABLE public.jgroups_ping OWNER TO admin;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36),
    type integer DEFAULT 0 NOT NULL,
    description character varying(255)
);


ALTER TABLE public.keycloak_group OWNER TO admin;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO admin;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO admin;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.offline_client_session OWNER TO admin;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL,
    broker_session_id character varying(1024),
    version integer DEFAULT 0
);


ALTER TABLE public.offline_user_session OWNER TO admin;

--
-- Name: org; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    alias character varying(255) NOT NULL,
    redirect_url character varying(2048)
);


ALTER TABLE public.org OWNER TO admin;

--
-- Name: org_domain; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);


ALTER TABLE public.org_domain OWNER TO admin;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO admin;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO admin;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO admin;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO admin;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO admin;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO admin;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO admin;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO admin;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO admin;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO admin;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO admin;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO admin;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO admin;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO admin;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO admin;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO admin;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO admin;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO admin;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO admin;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO admin;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO admin;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO admin;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO admin;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO admin;

--
-- Name: revoked_token; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.revoked_token (
    id character varying(255) NOT NULL,
    expire bigint NOT NULL
);


ALTER TABLE public.revoked_token OWNER TO admin;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO admin;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO admin;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO admin;

--
-- Name: server_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.server_config (
    server_config_key character varying(255) NOT NULL,
    value text NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.server_config OWNER TO admin;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.user_attribute OWNER TO admin;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO admin;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO admin;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO admin;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO admin;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO admin;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO admin;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO admin;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    membership_type character varying(255) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO admin;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO admin;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO admin;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO admin;

--
-- Name: workflow_state; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.workflow_state (
    execution_id character varying(255) NOT NULL,
    resource_id character varying(255) NOT NULL,
    workflow_id character varying(255) NOT NULL,
    workflow_provider_id character varying(255),
    resource_type character varying(255),
    scheduled_step_id character varying(255),
    scheduled_step_timestamp bigint
);


ALTER TABLE public.workflow_state OWNER TO admin;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type, details_json) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
5c4a52e9-b1de-4b73-8ec1-f0f337e9fd92	\N	auth-cookie	3654cfb9-0034-4bee-8aff-6eda67a58466	fac120ed-effd-48ca-8aa3-fab6ebf72bd6	2	10	f	\N	\N
f84a6bfa-8012-4913-997e-c2063f8a57f1	\N	auth-spnego	3654cfb9-0034-4bee-8aff-6eda67a58466	fac120ed-effd-48ca-8aa3-fab6ebf72bd6	3	20	f	\N	\N
377daca1-82b2-4eec-afd0-e17205194911	\N	identity-provider-redirector	3654cfb9-0034-4bee-8aff-6eda67a58466	fac120ed-effd-48ca-8aa3-fab6ebf72bd6	2	25	f	\N	\N
8edde065-a036-429b-8ab3-ae9ee52cf7f1	\N	\N	3654cfb9-0034-4bee-8aff-6eda67a58466	fac120ed-effd-48ca-8aa3-fab6ebf72bd6	2	30	t	5e11d405-0e20-4d56-a341-1674fe61cedc	\N
b7c96a2e-ec5c-491a-b802-5fea408dbcb5	\N	auth-username-password-form	3654cfb9-0034-4bee-8aff-6eda67a58466	5e11d405-0e20-4d56-a341-1674fe61cedc	0	10	f	\N	\N
df511063-9376-47d3-a34a-e019a11eea34	\N	\N	3654cfb9-0034-4bee-8aff-6eda67a58466	5e11d405-0e20-4d56-a341-1674fe61cedc	1	20	t	5ddd2780-ce4b-4494-8909-0a6c451510dd	\N
833e79fb-7a5f-4253-a537-06e68c587ff5	\N	conditional-user-configured	3654cfb9-0034-4bee-8aff-6eda67a58466	5ddd2780-ce4b-4494-8909-0a6c451510dd	0	10	f	\N	\N
5a3dc964-7dc4-4d81-9438-cee714c4d48d	\N	conditional-credential	3654cfb9-0034-4bee-8aff-6eda67a58466	5ddd2780-ce4b-4494-8909-0a6c451510dd	0	20	f	\N	0ac151e7-4332-4893-934d-5dab426462da
e7d79d80-d5f8-4018-9cbc-31b99bd5bb5f	\N	auth-otp-form	3654cfb9-0034-4bee-8aff-6eda67a58466	5ddd2780-ce4b-4494-8909-0a6c451510dd	2	30	f	\N	\N
68d1aa54-510c-4eb9-9794-1fd3d5ffdda1	\N	webauthn-authenticator	3654cfb9-0034-4bee-8aff-6eda67a58466	5ddd2780-ce4b-4494-8909-0a6c451510dd	3	40	f	\N	\N
be824ca0-fd3f-4be1-836d-a15fb5bde54f	\N	auth-recovery-authn-code-form	3654cfb9-0034-4bee-8aff-6eda67a58466	5ddd2780-ce4b-4494-8909-0a6c451510dd	3	50	f	\N	\N
bf665745-ad46-4409-aa5a-b4aec4137903	\N	direct-grant-validate-username	3654cfb9-0034-4bee-8aff-6eda67a58466	503989c6-8582-4316-9787-02a1691c5e45	0	10	f	\N	\N
5db9d4d4-7243-4036-86b7-4eb74258469d	\N	direct-grant-validate-password	3654cfb9-0034-4bee-8aff-6eda67a58466	503989c6-8582-4316-9787-02a1691c5e45	0	20	f	\N	\N
3f44c52b-ccec-4a08-8c92-5598559c36e5	\N	\N	3654cfb9-0034-4bee-8aff-6eda67a58466	503989c6-8582-4316-9787-02a1691c5e45	1	30	t	556f6541-b5e6-49e6-84b5-c6629f3119fe	\N
df590a72-218c-4bf9-8e7b-0860f9e1b681	\N	conditional-user-configured	3654cfb9-0034-4bee-8aff-6eda67a58466	556f6541-b5e6-49e6-84b5-c6629f3119fe	0	10	f	\N	\N
4d1dbb72-cb43-41c9-93ad-33df85176039	\N	direct-grant-validate-otp	3654cfb9-0034-4bee-8aff-6eda67a58466	556f6541-b5e6-49e6-84b5-c6629f3119fe	0	20	f	\N	\N
4fca2510-2f30-4509-a53f-10fc7039110c	\N	registration-page-form	3654cfb9-0034-4bee-8aff-6eda67a58466	867a392f-e28f-457c-a6ee-b6825c096a86	0	10	t	aee65003-f3ea-418c-831c-72189b04ac55	\N
7d2eacfe-d32d-43ab-aba8-1555c35b4fd6	\N	registration-user-creation	3654cfb9-0034-4bee-8aff-6eda67a58466	aee65003-f3ea-418c-831c-72189b04ac55	0	20	f	\N	\N
39100a30-abb5-4c90-b361-593b8f1e58a2	\N	registration-password-action	3654cfb9-0034-4bee-8aff-6eda67a58466	aee65003-f3ea-418c-831c-72189b04ac55	0	50	f	\N	\N
2404d855-8d8a-4171-b2fa-1a9e586fb1fc	\N	registration-recaptcha-action	3654cfb9-0034-4bee-8aff-6eda67a58466	aee65003-f3ea-418c-831c-72189b04ac55	3	60	f	\N	\N
f00749dd-d5e8-4d27-bb32-306aea282fd9	\N	registration-terms-and-conditions	3654cfb9-0034-4bee-8aff-6eda67a58466	aee65003-f3ea-418c-831c-72189b04ac55	3	70	f	\N	\N
7b712998-772d-4b53-96a1-929407333c80	\N	reset-credentials-choose-user	3654cfb9-0034-4bee-8aff-6eda67a58466	488e6dda-0dfa-4dbc-b219-0fb7dca3d923	0	10	f	\N	\N
7eddd491-b3bd-48dc-9b61-b3ab3b1e3aa8	\N	reset-credential-email	3654cfb9-0034-4bee-8aff-6eda67a58466	488e6dda-0dfa-4dbc-b219-0fb7dca3d923	0	20	f	\N	\N
ae97f75f-ed5c-4411-addd-4dcf6f31b10e	\N	reset-password	3654cfb9-0034-4bee-8aff-6eda67a58466	488e6dda-0dfa-4dbc-b219-0fb7dca3d923	0	30	f	\N	\N
af8bea03-6f0a-4688-83ad-105f4a612b4c	\N	\N	3654cfb9-0034-4bee-8aff-6eda67a58466	488e6dda-0dfa-4dbc-b219-0fb7dca3d923	1	40	t	a3ab4d65-ad0e-4e3d-acd4-09416868098c	\N
65ae532c-1f33-457f-b235-e86453adc110	\N	conditional-user-configured	3654cfb9-0034-4bee-8aff-6eda67a58466	a3ab4d65-ad0e-4e3d-acd4-09416868098c	0	10	f	\N	\N
e760895a-f92e-4ab2-bd1d-42432fd2df1c	\N	reset-otp	3654cfb9-0034-4bee-8aff-6eda67a58466	a3ab4d65-ad0e-4e3d-acd4-09416868098c	0	20	f	\N	\N
f9136a87-98c8-4e82-982b-46695d0208a2	\N	client-secret	3654cfb9-0034-4bee-8aff-6eda67a58466	c03f4a5f-5afe-4b70-b653-3ab84adf07cd	2	10	f	\N	\N
20a08ef6-4282-4676-8170-5b27fc0ec9e3	\N	client-jwt	3654cfb9-0034-4bee-8aff-6eda67a58466	c03f4a5f-5afe-4b70-b653-3ab84adf07cd	2	20	f	\N	\N
677e550f-409a-495b-9d33-4248b02bd560	\N	client-secret-jwt	3654cfb9-0034-4bee-8aff-6eda67a58466	c03f4a5f-5afe-4b70-b653-3ab84adf07cd	2	30	f	\N	\N
1bbda206-63eb-4143-beb6-eef5436151a3	\N	client-x509	3654cfb9-0034-4bee-8aff-6eda67a58466	c03f4a5f-5afe-4b70-b653-3ab84adf07cd	2	40	f	\N	\N
6ae2ac32-c12b-455f-bfb4-14fa83ca633b	\N	idp-review-profile	3654cfb9-0034-4bee-8aff-6eda67a58466	4bd45628-286c-4b2f-816d-aad506664a59	0	10	f	\N	ab0137f8-0c66-4462-8394-b2fbc799a662
fce05348-bfba-44c5-8f34-93fd93bcef06	\N	\N	3654cfb9-0034-4bee-8aff-6eda67a58466	4bd45628-286c-4b2f-816d-aad506664a59	0	20	t	5d826d77-999c-4d3b-9e12-4a69f91f1b53	\N
c593c393-dc74-4ddb-8f65-75e85cb4772d	\N	idp-create-user-if-unique	3654cfb9-0034-4bee-8aff-6eda67a58466	5d826d77-999c-4d3b-9e12-4a69f91f1b53	2	10	f	\N	89cbd213-a34e-4e9a-bc22-8b35d969e998
072a0758-0892-477d-b0dd-b681ee656cab	\N	\N	3654cfb9-0034-4bee-8aff-6eda67a58466	5d826d77-999c-4d3b-9e12-4a69f91f1b53	2	20	t	0c550f44-2d38-4e82-a454-2f2f6619cd16	\N
1f8e9940-0509-42be-8509-1b484b6ddd28	\N	idp-confirm-link	3654cfb9-0034-4bee-8aff-6eda67a58466	0c550f44-2d38-4e82-a454-2f2f6619cd16	0	10	f	\N	\N
712b94be-6bc6-41c0-a04a-0b6a8c2b3b7f	\N	\N	3654cfb9-0034-4bee-8aff-6eda67a58466	0c550f44-2d38-4e82-a454-2f2f6619cd16	0	20	t	755ef277-cf45-49cf-b4cc-d441b7157725	\N
c787a868-ed74-4670-b4b5-eca390bc86f0	\N	idp-email-verification	3654cfb9-0034-4bee-8aff-6eda67a58466	755ef277-cf45-49cf-b4cc-d441b7157725	2	10	f	\N	\N
da7e105e-3a78-403c-ac51-662ad0c2545f	\N	\N	3654cfb9-0034-4bee-8aff-6eda67a58466	755ef277-cf45-49cf-b4cc-d441b7157725	2	20	t	9b002919-280c-4290-934a-5d85a88d9c24	\N
7b397673-4dde-4162-880a-a7693ed118b2	\N	idp-username-password-form	3654cfb9-0034-4bee-8aff-6eda67a58466	9b002919-280c-4290-934a-5d85a88d9c24	0	10	f	\N	\N
175253fa-ba89-46fc-a95a-964f13e499aa	\N	\N	3654cfb9-0034-4bee-8aff-6eda67a58466	9b002919-280c-4290-934a-5d85a88d9c24	1	20	t	ff61f5b3-7321-44a1-8862-bdad9423f4c3	\N
b6eac0dc-b397-43b2-b3c0-04c3d564be13	\N	conditional-user-configured	3654cfb9-0034-4bee-8aff-6eda67a58466	ff61f5b3-7321-44a1-8862-bdad9423f4c3	0	10	f	\N	\N
3c1e5f18-ce8a-4e85-8904-3f072ed871f5	\N	conditional-credential	3654cfb9-0034-4bee-8aff-6eda67a58466	ff61f5b3-7321-44a1-8862-bdad9423f4c3	0	20	f	\N	83314dc1-c615-4cee-b3fb-890cd617213b
4cde8042-0d61-4f76-8fc7-fbbfab40a987	\N	auth-otp-form	3654cfb9-0034-4bee-8aff-6eda67a58466	ff61f5b3-7321-44a1-8862-bdad9423f4c3	2	30	f	\N	\N
28eb5115-5022-48b5-999e-c51b3182c39c	\N	webauthn-authenticator	3654cfb9-0034-4bee-8aff-6eda67a58466	ff61f5b3-7321-44a1-8862-bdad9423f4c3	3	40	f	\N	\N
fbc2295b-4508-4efc-81d5-a55a75cc82fa	\N	auth-recovery-authn-code-form	3654cfb9-0034-4bee-8aff-6eda67a58466	ff61f5b3-7321-44a1-8862-bdad9423f4c3	3	50	f	\N	\N
8e4e3cd7-4c76-40bd-ad64-b8d207ddea65	\N	http-basic-authenticator	3654cfb9-0034-4bee-8aff-6eda67a58466	894c1d3d-70ff-4f15-ba11-3974d3cc7f66	0	10	f	\N	\N
4dcee1a9-5669-4d9f-aab6-8f807713924c	\N	docker-http-basic-authenticator	3654cfb9-0034-4bee-8aff-6eda67a58466	a4398383-518e-47d6-a1ef-33ad59136ba7	0	10	f	\N	\N
62d264f5-e3b6-41d8-ba6a-4226a46376e7	\N	auth-cookie	17787da5-ff56-48dc-a36a-2700dec08b2e	1900b0da-a398-4a61-bfb9-45cc48c776ce	2	10	f	\N	\N
a0e10f4a-b74d-4a97-b985-fbaeca20030f	\N	auth-spnego	17787da5-ff56-48dc-a36a-2700dec08b2e	1900b0da-a398-4a61-bfb9-45cc48c776ce	3	20	f	\N	\N
b27a3519-ddde-42f9-a6ac-fe312a35e3b3	\N	identity-provider-redirector	17787da5-ff56-48dc-a36a-2700dec08b2e	1900b0da-a398-4a61-bfb9-45cc48c776ce	2	25	f	\N	\N
efe93de3-94ce-401d-b74f-99b1578fb79a	\N	\N	17787da5-ff56-48dc-a36a-2700dec08b2e	1900b0da-a398-4a61-bfb9-45cc48c776ce	2	30	t	9942ddf8-3e54-4347-8d62-9a7b1b1ee0b8	\N
49484001-4fe3-4b37-8de4-35ee1c519d7d	\N	auth-username-password-form	17787da5-ff56-48dc-a36a-2700dec08b2e	9942ddf8-3e54-4347-8d62-9a7b1b1ee0b8	0	10	f	\N	\N
365d080b-7ddd-4ddf-8681-5313a8ac29d6	\N	\N	17787da5-ff56-48dc-a36a-2700dec08b2e	9942ddf8-3e54-4347-8d62-9a7b1b1ee0b8	1	20	t	ba604fdc-f963-4b14-b8e1-6e5d3c9085e4	\N
6a61efc9-34b2-4dc2-8d3a-e45fbfef49ee	\N	conditional-user-configured	17787da5-ff56-48dc-a36a-2700dec08b2e	ba604fdc-f963-4b14-b8e1-6e5d3c9085e4	0	10	f	\N	\N
c035900b-09d4-4cc6-b3f4-fa7834c37606	\N	conditional-credential	17787da5-ff56-48dc-a36a-2700dec08b2e	ba604fdc-f963-4b14-b8e1-6e5d3c9085e4	0	20	f	\N	d3ab9d3e-bcee-40d8-80ba-5f85f1d21d60
01d8ae81-13e7-42c3-b017-488b841adbc1	\N	auth-otp-form	17787da5-ff56-48dc-a36a-2700dec08b2e	ba604fdc-f963-4b14-b8e1-6e5d3c9085e4	2	30	f	\N	\N
f4a3e62b-5723-4911-81bd-f9002f0d252a	\N	webauthn-authenticator	17787da5-ff56-48dc-a36a-2700dec08b2e	ba604fdc-f963-4b14-b8e1-6e5d3c9085e4	3	40	f	\N	\N
bc7e0eff-facb-41f2-ada3-aabf648c7698	\N	auth-recovery-authn-code-form	17787da5-ff56-48dc-a36a-2700dec08b2e	ba604fdc-f963-4b14-b8e1-6e5d3c9085e4	3	50	f	\N	\N
adf5db25-82fd-4510-9c57-e497066c39e9	\N	\N	17787da5-ff56-48dc-a36a-2700dec08b2e	1900b0da-a398-4a61-bfb9-45cc48c776ce	2	26	t	2d00c7fb-4ee7-4d5d-8db1-83c5fa635fc9	\N
4583bff2-ce6e-4548-a9f9-09a79f99532a	\N	\N	17787da5-ff56-48dc-a36a-2700dec08b2e	2d00c7fb-4ee7-4d5d-8db1-83c5fa635fc9	1	10	t	58131ede-9a89-48ec-af1e-71ea9bc07c78	\N
febffa2d-f5a3-4a6b-bbc4-552eb9ee51c3	\N	conditional-user-configured	17787da5-ff56-48dc-a36a-2700dec08b2e	58131ede-9a89-48ec-af1e-71ea9bc07c78	0	10	f	\N	\N
8ebf314e-9972-4bcc-82e3-31182825d581	\N	organization	17787da5-ff56-48dc-a36a-2700dec08b2e	58131ede-9a89-48ec-af1e-71ea9bc07c78	2	20	f	\N	\N
6d3b01c0-ecc4-4069-ae15-14f711bfc2fb	\N	direct-grant-validate-username	17787da5-ff56-48dc-a36a-2700dec08b2e	2a4be5b0-a648-411a-b38b-2b878e4df0cc	0	10	f	\N	\N
3df9e2ab-5569-4d16-b67b-ad724399b152	\N	direct-grant-validate-password	17787da5-ff56-48dc-a36a-2700dec08b2e	2a4be5b0-a648-411a-b38b-2b878e4df0cc	0	20	f	\N	\N
9e340952-83d7-4acf-b395-82664f9f7156	\N	\N	17787da5-ff56-48dc-a36a-2700dec08b2e	2a4be5b0-a648-411a-b38b-2b878e4df0cc	1	30	t	2014b75c-acfb-47a2-9e26-7326445d508a	\N
d23bdc7f-fd7f-4fed-94f7-fde8740724bf	\N	conditional-user-configured	17787da5-ff56-48dc-a36a-2700dec08b2e	2014b75c-acfb-47a2-9e26-7326445d508a	0	10	f	\N	\N
a3ef663a-b7c0-4b67-af4f-6212a13089eb	\N	direct-grant-validate-otp	17787da5-ff56-48dc-a36a-2700dec08b2e	2014b75c-acfb-47a2-9e26-7326445d508a	0	20	f	\N	\N
95fba0a4-d880-492c-9b15-a9b8879c64b6	\N	registration-page-form	17787da5-ff56-48dc-a36a-2700dec08b2e	f524e55b-c5e4-4eb6-8d5b-4c0f3f87ceb3	0	10	t	1cb1be6d-1426-457a-b16d-9ed952ef2ecf	\N
e87b24b3-a5c3-4e86-b32a-21d65f829a1a	\N	registration-user-creation	17787da5-ff56-48dc-a36a-2700dec08b2e	1cb1be6d-1426-457a-b16d-9ed952ef2ecf	0	20	f	\N	\N
62fc45d7-ad8b-479b-b505-0d16377ce4da	\N	registration-password-action	17787da5-ff56-48dc-a36a-2700dec08b2e	1cb1be6d-1426-457a-b16d-9ed952ef2ecf	0	50	f	\N	\N
e83ad34d-9f59-4af7-8b4b-a382d1407306	\N	registration-recaptcha-action	17787da5-ff56-48dc-a36a-2700dec08b2e	1cb1be6d-1426-457a-b16d-9ed952ef2ecf	3	60	f	\N	\N
0938b640-9a5b-4392-9858-606272b9465d	\N	registration-terms-and-conditions	17787da5-ff56-48dc-a36a-2700dec08b2e	1cb1be6d-1426-457a-b16d-9ed952ef2ecf	3	70	f	\N	\N
1958fa44-1af7-447f-bc2f-0c87d3f315f8	\N	reset-credentials-choose-user	17787da5-ff56-48dc-a36a-2700dec08b2e	1e485d74-7930-4f78-8915-39ca175f063a	0	10	f	\N	\N
63a5db3a-5e5a-482c-94bd-130fef5240ab	\N	reset-credential-email	17787da5-ff56-48dc-a36a-2700dec08b2e	1e485d74-7930-4f78-8915-39ca175f063a	0	20	f	\N	\N
cfc7550c-2def-41bf-b585-138afae2deb9	\N	reset-password	17787da5-ff56-48dc-a36a-2700dec08b2e	1e485d74-7930-4f78-8915-39ca175f063a	0	30	f	\N	\N
a45f1ada-c300-4355-94d4-5774db22a201	\N	\N	17787da5-ff56-48dc-a36a-2700dec08b2e	1e485d74-7930-4f78-8915-39ca175f063a	1	40	t	8333a386-5f4c-4b3a-a3a0-ee23441cab75	\N
f13e8abc-83ee-42e7-8f34-ad9ba5432832	\N	conditional-user-configured	17787da5-ff56-48dc-a36a-2700dec08b2e	8333a386-5f4c-4b3a-a3a0-ee23441cab75	0	10	f	\N	\N
5d6bb32f-6c6a-407c-a423-90ba2884b4f2	\N	reset-otp	17787da5-ff56-48dc-a36a-2700dec08b2e	8333a386-5f4c-4b3a-a3a0-ee23441cab75	0	20	f	\N	\N
005d8d3b-dd2a-474e-85dc-e724691c8d52	\N	client-secret	17787da5-ff56-48dc-a36a-2700dec08b2e	98817f68-43b9-4218-b04a-402cd385bd20	2	10	f	\N	\N
ce92e65a-ec80-493a-98dc-2091d6b83348	\N	client-jwt	17787da5-ff56-48dc-a36a-2700dec08b2e	98817f68-43b9-4218-b04a-402cd385bd20	2	20	f	\N	\N
08a752c3-89e3-4518-be82-7ff3cd01783a	\N	client-secret-jwt	17787da5-ff56-48dc-a36a-2700dec08b2e	98817f68-43b9-4218-b04a-402cd385bd20	2	30	f	\N	\N
a4debc56-c0d3-40bc-a3ee-a25278a0b932	\N	client-x509	17787da5-ff56-48dc-a36a-2700dec08b2e	98817f68-43b9-4218-b04a-402cd385bd20	2	40	f	\N	\N
af98e5d9-3e49-4fb1-8788-b6ebf86c4b41	\N	idp-review-profile	17787da5-ff56-48dc-a36a-2700dec08b2e	301bbbc2-022a-4003-a7c9-4354e3ceb45b	0	10	f	\N	ac021ed4-cb17-4918-afda-a63665d6b044
c426bb3f-a10d-4e1a-9ba0-d99de77711d6	\N	\N	17787da5-ff56-48dc-a36a-2700dec08b2e	301bbbc2-022a-4003-a7c9-4354e3ceb45b	0	20	t	8bb55318-17d6-47bd-8c43-9cb3b884f21c	\N
24abe15e-6edf-46e4-a3c0-48435e13e106	\N	idp-create-user-if-unique	17787da5-ff56-48dc-a36a-2700dec08b2e	8bb55318-17d6-47bd-8c43-9cb3b884f21c	2	10	f	\N	0db35734-837c-4a5b-b157-ae24c833d496
58b64a76-8a2a-4dd1-8593-7b8c016f3435	\N	\N	17787da5-ff56-48dc-a36a-2700dec08b2e	8bb55318-17d6-47bd-8c43-9cb3b884f21c	2	20	t	c52ee89c-0503-4b1b-90ae-7d1a73843e65	\N
20a488fe-ccd3-4a89-b0ad-5ff26cfb2094	\N	idp-confirm-link	17787da5-ff56-48dc-a36a-2700dec08b2e	c52ee89c-0503-4b1b-90ae-7d1a73843e65	0	10	f	\N	\N
d6b3a68f-85d8-4909-a621-997b705a8bfe	\N	\N	17787da5-ff56-48dc-a36a-2700dec08b2e	c52ee89c-0503-4b1b-90ae-7d1a73843e65	0	20	t	f87f39cb-a827-4233-bbc2-d810dc61e056	\N
7713894d-05a5-4835-aef9-ec35eecd2717	\N	idp-email-verification	17787da5-ff56-48dc-a36a-2700dec08b2e	f87f39cb-a827-4233-bbc2-d810dc61e056	2	10	f	\N	\N
6cc4f3b3-169e-4b3b-bbd2-92989a4d94ea	\N	\N	17787da5-ff56-48dc-a36a-2700dec08b2e	f87f39cb-a827-4233-bbc2-d810dc61e056	2	20	t	b22cf8aa-6e6f-4177-a2c8-eb5d306ad567	\N
766f25b1-891a-4568-9ab3-6d870d8e67c9	\N	idp-username-password-form	17787da5-ff56-48dc-a36a-2700dec08b2e	b22cf8aa-6e6f-4177-a2c8-eb5d306ad567	0	10	f	\N	\N
237a1b23-5855-4ff3-ac68-b1fdea9c0011	\N	\N	17787da5-ff56-48dc-a36a-2700dec08b2e	b22cf8aa-6e6f-4177-a2c8-eb5d306ad567	1	20	t	8e24e0c0-4c1d-4701-8e4d-8300f8cbffb1	\N
1f057f4e-090d-4adc-a3be-de3e31491470	\N	conditional-user-configured	17787da5-ff56-48dc-a36a-2700dec08b2e	8e24e0c0-4c1d-4701-8e4d-8300f8cbffb1	0	10	f	\N	\N
f470132b-10a5-463f-b0a3-0ab4bea534a6	\N	conditional-credential	17787da5-ff56-48dc-a36a-2700dec08b2e	8e24e0c0-4c1d-4701-8e4d-8300f8cbffb1	0	20	f	\N	0ed7c308-d8aa-4baf-8a36-ab9be2ed45aa
a59e9ae0-c994-402a-8f59-74442fc461c9	\N	auth-otp-form	17787da5-ff56-48dc-a36a-2700dec08b2e	8e24e0c0-4c1d-4701-8e4d-8300f8cbffb1	2	30	f	\N	\N
06f2cdb3-fc1a-4c51-beb2-3a900c1e3d54	\N	webauthn-authenticator	17787da5-ff56-48dc-a36a-2700dec08b2e	8e24e0c0-4c1d-4701-8e4d-8300f8cbffb1	3	40	f	\N	\N
fbe240b9-cad3-4361-9273-83078e375ab0	\N	auth-recovery-authn-code-form	17787da5-ff56-48dc-a36a-2700dec08b2e	8e24e0c0-4c1d-4701-8e4d-8300f8cbffb1	3	50	f	\N	\N
51021444-bad6-4810-83bb-1e6151fac038	\N	\N	17787da5-ff56-48dc-a36a-2700dec08b2e	301bbbc2-022a-4003-a7c9-4354e3ceb45b	1	60	t	1cff7b0b-6903-46d3-b351-1563f62af096	\N
97395067-22d7-4dd0-b516-97d8517cb04e	\N	conditional-user-configured	17787da5-ff56-48dc-a36a-2700dec08b2e	1cff7b0b-6903-46d3-b351-1563f62af096	0	10	f	\N	\N
4e45da18-6f00-4f7d-9925-86f742777747	\N	idp-add-organization-member	17787da5-ff56-48dc-a36a-2700dec08b2e	1cff7b0b-6903-46d3-b351-1563f62af096	0	20	f	\N	\N
49f3801b-ada7-4f54-b835-12b30cb1d3b9	\N	http-basic-authenticator	17787da5-ff56-48dc-a36a-2700dec08b2e	7fb3318d-25ab-4ceb-a19f-f35daaf1768d	0	10	f	\N	\N
85d198bc-5fe7-475a-9b64-dea2baa1cbc1	\N	docker-http-basic-authenticator	17787da5-ff56-48dc-a36a-2700dec08b2e	5b4f1efb-4b14-471d-95b7-f53ecc75574f	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
fac120ed-effd-48ca-8aa3-fab6ebf72bd6	browser	Browser based authentication	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	t	t
5e11d405-0e20-4d56-a341-1674fe61cedc	forms	Username, password, otp and other auth forms.	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	f	t
5ddd2780-ce4b-4494-8909-0a6c451510dd	Browser - Conditional 2FA	Flow to determine if any 2FA is required for the authentication	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	f	t
503989c6-8582-4316-9787-02a1691c5e45	direct grant	OpenID Connect Resource Owner Grant	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	t	t
556f6541-b5e6-49e6-84b5-c6629f3119fe	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	f	t
867a392f-e28f-457c-a6ee-b6825c096a86	registration	Registration flow	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	t	t
aee65003-f3ea-418c-831c-72189b04ac55	registration form	Registration form	3654cfb9-0034-4bee-8aff-6eda67a58466	form-flow	f	t
488e6dda-0dfa-4dbc-b219-0fb7dca3d923	reset credentials	Reset credentials for a user if they forgot their password or something	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	t	t
a3ab4d65-ad0e-4e3d-acd4-09416868098c	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	f	t
c03f4a5f-5afe-4b70-b653-3ab84adf07cd	clients	Base authentication for clients	3654cfb9-0034-4bee-8aff-6eda67a58466	client-flow	t	t
4bd45628-286c-4b2f-816d-aad506664a59	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	t	t
5d826d77-999c-4d3b-9e12-4a69f91f1b53	User creation or linking	Flow for the existing/non-existing user alternatives	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	f	t
0c550f44-2d38-4e82-a454-2f2f6619cd16	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	f	t
755ef277-cf45-49cf-b4cc-d441b7157725	Account verification options	Method with which to verity the existing account	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	f	t
9b002919-280c-4290-934a-5d85a88d9c24	Verify Existing Account by Re-authentication	Reauthentication of existing account	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	f	t
ff61f5b3-7321-44a1-8862-bdad9423f4c3	First broker login - Conditional 2FA	Flow to determine if any 2FA is required for the authentication	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	f	t
894c1d3d-70ff-4f15-ba11-3974d3cc7f66	saml ecp	SAML ECP Profile Authentication Flow	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	t	t
a4398383-518e-47d6-a1ef-33ad59136ba7	docker auth	Used by Docker clients to authenticate against the IDP	3654cfb9-0034-4bee-8aff-6eda67a58466	basic-flow	t	t
1900b0da-a398-4a61-bfb9-45cc48c776ce	browser	Browser based authentication	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	t	t
9942ddf8-3e54-4347-8d62-9a7b1b1ee0b8	forms	Username, password, otp and other auth forms.	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	f	t
ba604fdc-f963-4b14-b8e1-6e5d3c9085e4	Browser - Conditional 2FA	Flow to determine if any 2FA is required for the authentication	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	f	t
2d00c7fb-4ee7-4d5d-8db1-83c5fa635fc9	Organization	\N	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	f	t
58131ede-9a89-48ec-af1e-71ea9bc07c78	Browser - Conditional Organization	Flow to determine if the organization identity-first login is to be used	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	f	t
2a4be5b0-a648-411a-b38b-2b878e4df0cc	direct grant	OpenID Connect Resource Owner Grant	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	t	t
2014b75c-acfb-47a2-9e26-7326445d508a	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	f	t
f524e55b-c5e4-4eb6-8d5b-4c0f3f87ceb3	registration	Registration flow	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	t	t
1cb1be6d-1426-457a-b16d-9ed952ef2ecf	registration form	Registration form	17787da5-ff56-48dc-a36a-2700dec08b2e	form-flow	f	t
1e485d74-7930-4f78-8915-39ca175f063a	reset credentials	Reset credentials for a user if they forgot their password or something	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	t	t
8333a386-5f4c-4b3a-a3a0-ee23441cab75	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	f	t
98817f68-43b9-4218-b04a-402cd385bd20	clients	Base authentication for clients	17787da5-ff56-48dc-a36a-2700dec08b2e	client-flow	t	t
301bbbc2-022a-4003-a7c9-4354e3ceb45b	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	t	t
8bb55318-17d6-47bd-8c43-9cb3b884f21c	User creation or linking	Flow for the existing/non-existing user alternatives	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	f	t
c52ee89c-0503-4b1b-90ae-7d1a73843e65	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	f	t
f87f39cb-a827-4233-bbc2-d810dc61e056	Account verification options	Method with which to verity the existing account	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	f	t
b22cf8aa-6e6f-4177-a2c8-eb5d306ad567	Verify Existing Account by Re-authentication	Reauthentication of existing account	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	f	t
8e24e0c0-4c1d-4701-8e4d-8300f8cbffb1	First broker login - Conditional 2FA	Flow to determine if any 2FA is required for the authentication	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	f	t
1cff7b0b-6903-46d3-b351-1563f62af096	First Broker Login - Conditional Organization	Flow to determine if the authenticator that adds organization members is to be used	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	f	t
7fb3318d-25ab-4ceb-a19f-f35daaf1768d	saml ecp	SAML ECP Profile Authentication Flow	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	t	t
5b4f1efb-4b14-471d-95b7-f53ecc75574f	docker auth	Used by Docker clients to authenticate against the IDP	17787da5-ff56-48dc-a36a-2700dec08b2e	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
0ac151e7-4332-4893-934d-5dab426462da	browser-conditional-credential	3654cfb9-0034-4bee-8aff-6eda67a58466
ab0137f8-0c66-4462-8394-b2fbc799a662	review profile config	3654cfb9-0034-4bee-8aff-6eda67a58466
89cbd213-a34e-4e9a-bc22-8b35d969e998	create unique user config	3654cfb9-0034-4bee-8aff-6eda67a58466
83314dc1-c615-4cee-b3fb-890cd617213b	first-broker-login-conditional-credential	3654cfb9-0034-4bee-8aff-6eda67a58466
d3ab9d3e-bcee-40d8-80ba-5f85f1d21d60	browser-conditional-credential	17787da5-ff56-48dc-a36a-2700dec08b2e
ac021ed4-cb17-4918-afda-a63665d6b044	review profile config	17787da5-ff56-48dc-a36a-2700dec08b2e
0db35734-837c-4a5b-b157-ae24c833d496	create unique user config	17787da5-ff56-48dc-a36a-2700dec08b2e
0ed7c308-d8aa-4baf-8a36-ab9be2ed45aa	first-broker-login-conditional-credential	17787da5-ff56-48dc-a36a-2700dec08b2e
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
0ac151e7-4332-4893-934d-5dab426462da	webauthn-passwordless	credentials
83314dc1-c615-4cee-b3fb-890cd617213b	webauthn-passwordless	credentials
89cbd213-a34e-4e9a-bc22-8b35d969e998	false	require.password.update.after.registration
ab0137f8-0c66-4462-8394-b2fbc799a662	missing	update.profile.on.first.login
0db35734-837c-4a5b-b157-ae24c833d496	false	require.password.update.after.registration
0ed7c308-d8aa-4baf-8a36-ab9be2ed45aa	webauthn-passwordless	credentials
ac021ed4-cb17-4918-afda-a63665d6b044	missing	update.profile.on.first.login
d3ab9d3e-bcee-40d8-80ba-5f85f1d21d60	webauthn-passwordless	credentials
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
2ff86fec-3d01-4f46-ae60-06b6ae320749	t	f	master-realm	0	f	\N	\N	t	\N	f	3654cfb9-0034-4bee-8aff-6eda67a58466	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
2f78cfee-7416-429f-8463-7b84b102a6ff	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	3654cfb9-0034-4bee-8aff-6eda67a58466	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	3654cfb9-0034-4bee-8aff-6eda67a58466	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
5be60e83-8e73-4288-884a-94e97783d931	t	f	broker	0	f	\N	\N	t	\N	f	3654cfb9-0034-4bee-8aff-6eda67a58466	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
8b0f1494-a2c8-4184-a246-1791bd30192e	t	t	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	3654cfb9-0034-4bee-8aff-6eda67a58466	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
68f95d65-e0c9-48be-969b-5e447f3ab6fc	t	t	admin-cli	0	t	\N	\N	f	\N	f	3654cfb9-0034-4bee-8aff-6eda67a58466	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	f	cybertron-realm	0	f	\N	\N	t	\N	f	3654cfb9-0034-4bee-8aff-6eda67a58466	\N	0	f	f	cybertron Realm	f	client-secret	\N	\N	\N	t	f	f	f
6becd912-7640-41a5-a651-31867bef9c44	t	f	realm-management	0	f	\N	\N	t	\N	f	17787da5-ff56-48dc-a36a-2700dec08b2e	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	t	f	account	0	t	\N	/realms/cybertron/account/	f	\N	f	17787da5-ff56-48dc-a36a-2700dec08b2e	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
f3de95ba-eae6-4b4f-9667-2638e741fcc9	t	f	account-console	0	t	\N	/realms/cybertron/account/	f	\N	f	17787da5-ff56-48dc-a36a-2700dec08b2e	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
318063f8-35b7-481e-87c0-b23d5337e35f	t	f	broker	0	f	\N	\N	t	\N	f	17787da5-ff56-48dc-a36a-2700dec08b2e	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
89af5f6b-be83-458b-8250-4aefba4ffec1	t	t	security-admin-console	0	t	\N	/admin/cybertron/console/	f	\N	f	17787da5-ff56-48dc-a36a-2700dec08b2e	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
2fea712f-525b-4b9a-ba54-d5be043ed8a7	t	t	admin-cli	0	t	\N	\N	f	\N	f	17787da5-ff56-48dc-a36a-2700dec08b2e	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
12b20603-24ee-4e3c-8fa9-124de5bde364	t	t	myclient	0	t	\N		f		f	17787da5-ff56-48dc-a36a-2700dec08b2e	openid-connect	-1	t	f	myclient	f	client-secret		myclient desc	\N	t	f	f	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
2f78cfee-7416-429f-8463-7b84b102a6ff	post.logout.redirect.uris	+
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	post.logout.redirect.uris	+
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	pkce.code.challenge.method	S256
8b0f1494-a2c8-4184-a246-1791bd30192e	post.logout.redirect.uris	+
8b0f1494-a2c8-4184-a246-1791bd30192e	pkce.code.challenge.method	S256
8b0f1494-a2c8-4184-a246-1791bd30192e	client.use.lightweight.access.token.enabled	true
68f95d65-e0c9-48be-969b-5e447f3ab6fc	client.use.lightweight.access.token.enabled	true
1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	post.logout.redirect.uris	+
f3de95ba-eae6-4b4f-9667-2638e741fcc9	post.logout.redirect.uris	+
f3de95ba-eae6-4b4f-9667-2638e741fcc9	pkce.code.challenge.method	S256
89af5f6b-be83-458b-8250-4aefba4ffec1	post.logout.redirect.uris	+
89af5f6b-be83-458b-8250-4aefba4ffec1	pkce.code.challenge.method	S256
89af5f6b-be83-458b-8250-4aefba4ffec1	client.use.lightweight.access.token.enabled	true
2fea712f-525b-4b9a-ba54-d5be043ed8a7	client.use.lightweight.access.token.enabled	true
12b20603-24ee-4e3c-8fa9-124de5bde364	client.secret.creation.time	1761270341
12b20603-24ee-4e3c-8fa9-124de5bde364	standard.token.exchange.enabled	false
12b20603-24ee-4e3c-8fa9-124de5bde364	oauth2.device.authorization.grant.enabled	false
12b20603-24ee-4e3c-8fa9-124de5bde364	oidc.ciba.grant.enabled	false
12b20603-24ee-4e3c-8fa9-124de5bde364	pkce.code.challenge.method	S256
12b20603-24ee-4e3c-8fa9-124de5bde364	dpop.bound.access.tokens	false
12b20603-24ee-4e3c-8fa9-124de5bde364	backchannel.logout.session.required	true
12b20603-24ee-4e3c-8fa9-124de5bde364	backchannel.logout.revoke.offline.tokens	false
12b20603-24ee-4e3c-8fa9-124de5bde364	realm_client	false
12b20603-24ee-4e3c-8fa9-124de5bde364	display.on.consent.screen	false
12b20603-24ee-4e3c-8fa9-124de5bde364	frontchannel.logout.session.required	true
12b20603-24ee-4e3c-8fa9-124de5bde364	post.logout.redirect.uris	http://localhost:8000/*
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
3874bf67-328a-4917-9df4-ac164d67b77c	offline_access	3654cfb9-0034-4bee-8aff-6eda67a58466	OpenID Connect built-in scope: offline_access	openid-connect
5c26e757-67c2-4720-a814-4ebabb0a6210	role_list	3654cfb9-0034-4bee-8aff-6eda67a58466	SAML role list	saml
4728e71f-43f1-4c3c-ad5d-c15dbbce2dca	saml_organization	3654cfb9-0034-4bee-8aff-6eda67a58466	Organization Membership	saml
c264dda0-e318-45ee-a306-70be7092dba3	profile	3654cfb9-0034-4bee-8aff-6eda67a58466	OpenID Connect built-in scope: profile	openid-connect
2a3cac96-2576-4c97-8337-ee31009a0345	email	3654cfb9-0034-4bee-8aff-6eda67a58466	OpenID Connect built-in scope: email	openid-connect
9321628e-4b0b-409d-bb14-b8489607bbbf	address	3654cfb9-0034-4bee-8aff-6eda67a58466	OpenID Connect built-in scope: address	openid-connect
1a06a005-a31c-46a8-83ee-c552d1f4b404	phone	3654cfb9-0034-4bee-8aff-6eda67a58466	OpenID Connect built-in scope: phone	openid-connect
55db265b-d032-4e89-9bf4-ca5a6edf3475	roles	3654cfb9-0034-4bee-8aff-6eda67a58466	OpenID Connect scope for add user roles to the access token	openid-connect
da9201a2-3505-4155-b915-8250bf1e165f	web-origins	3654cfb9-0034-4bee-8aff-6eda67a58466	OpenID Connect scope for add allowed web origins to the access token	openid-connect
576e255e-0f89-4ea7-b41a-a3bb8ad8cf74	microprofile-jwt	3654cfb9-0034-4bee-8aff-6eda67a58466	Microprofile - JWT built-in scope	openid-connect
71569b96-9de3-4a9f-a059-5d70ac43fbc7	acr	3654cfb9-0034-4bee-8aff-6eda67a58466	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
dfad6d2d-c551-4718-bc90-0cfa1756886d	basic	3654cfb9-0034-4bee-8aff-6eda67a58466	OpenID Connect scope for add all basic claims to the token	openid-connect
4ce15839-6fe6-48f1-800f-bb8da5f390d5	service_account	3654cfb9-0034-4bee-8aff-6eda67a58466	Specific scope for a client enabled for service accounts	openid-connect
6bee678a-b327-4c07-afbf-893e78617e99	organization	3654cfb9-0034-4bee-8aff-6eda67a58466	Additional claims about the organization a subject belongs to	openid-connect
ab082a91-1118-4ee4-b8a7-f8fff22c90b1	offline_access	17787da5-ff56-48dc-a36a-2700dec08b2e	OpenID Connect built-in scope: offline_access	openid-connect
a08596a3-2f56-48e3-a6c2-3f677abc04fe	role_list	17787da5-ff56-48dc-a36a-2700dec08b2e	SAML role list	saml
e388c5c7-b269-4718-a04a-eaa6fe2b180b	saml_organization	17787da5-ff56-48dc-a36a-2700dec08b2e	Organization Membership	saml
277c44f2-6c48-4b50-b577-64e2af58aa69	profile	17787da5-ff56-48dc-a36a-2700dec08b2e	OpenID Connect built-in scope: profile	openid-connect
7bac0196-400a-44b6-ac9a-f49157068235	email	17787da5-ff56-48dc-a36a-2700dec08b2e	OpenID Connect built-in scope: email	openid-connect
77e3bae2-5cc2-4c58-a3ab-51e86e61b0b5	address	17787da5-ff56-48dc-a36a-2700dec08b2e	OpenID Connect built-in scope: address	openid-connect
bc10061e-fe2b-4d9b-b714-cb9d62a4a688	phone	17787da5-ff56-48dc-a36a-2700dec08b2e	OpenID Connect built-in scope: phone	openid-connect
8fc4d791-7889-4198-8d26-4fddd2a21202	roles	17787da5-ff56-48dc-a36a-2700dec08b2e	OpenID Connect scope for add user roles to the access token	openid-connect
5cc4aa6f-da39-4c9c-98c8-a51c5a23132b	web-origins	17787da5-ff56-48dc-a36a-2700dec08b2e	OpenID Connect scope for add allowed web origins to the access token	openid-connect
e93611eb-33d1-455d-a48b-e70253cce5ff	microprofile-jwt	17787da5-ff56-48dc-a36a-2700dec08b2e	Microprofile - JWT built-in scope	openid-connect
e3a574d9-4a36-40a7-9807-c881b9f17bb2	acr	17787da5-ff56-48dc-a36a-2700dec08b2e	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
d6dab1fe-4572-40c2-8616-9f4bd1656511	basic	17787da5-ff56-48dc-a36a-2700dec08b2e	OpenID Connect scope for add all basic claims to the token	openid-connect
8b737abe-8d83-478a-be8d-fbe3964690b7	service_account	17787da5-ff56-48dc-a36a-2700dec08b2e	Specific scope for a client enabled for service accounts	openid-connect
38a104e9-a8ed-42d5-ad2d-238f6f2719f3	organization	17787da5-ff56-48dc-a36a-2700dec08b2e	Additional claims about the organization a subject belongs to	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
3874bf67-328a-4917-9df4-ac164d67b77c	true	display.on.consent.screen
3874bf67-328a-4917-9df4-ac164d67b77c	${offlineAccessScopeConsentText}	consent.screen.text
5c26e757-67c2-4720-a814-4ebabb0a6210	true	display.on.consent.screen
5c26e757-67c2-4720-a814-4ebabb0a6210	${samlRoleListScopeConsentText}	consent.screen.text
4728e71f-43f1-4c3c-ad5d-c15dbbce2dca	false	display.on.consent.screen
c264dda0-e318-45ee-a306-70be7092dba3	true	display.on.consent.screen
c264dda0-e318-45ee-a306-70be7092dba3	${profileScopeConsentText}	consent.screen.text
c264dda0-e318-45ee-a306-70be7092dba3	true	include.in.token.scope
2a3cac96-2576-4c97-8337-ee31009a0345	true	display.on.consent.screen
2a3cac96-2576-4c97-8337-ee31009a0345	${emailScopeConsentText}	consent.screen.text
2a3cac96-2576-4c97-8337-ee31009a0345	true	include.in.token.scope
9321628e-4b0b-409d-bb14-b8489607bbbf	true	display.on.consent.screen
9321628e-4b0b-409d-bb14-b8489607bbbf	${addressScopeConsentText}	consent.screen.text
9321628e-4b0b-409d-bb14-b8489607bbbf	true	include.in.token.scope
1a06a005-a31c-46a8-83ee-c552d1f4b404	true	display.on.consent.screen
1a06a005-a31c-46a8-83ee-c552d1f4b404	${phoneScopeConsentText}	consent.screen.text
1a06a005-a31c-46a8-83ee-c552d1f4b404	true	include.in.token.scope
55db265b-d032-4e89-9bf4-ca5a6edf3475	true	display.on.consent.screen
55db265b-d032-4e89-9bf4-ca5a6edf3475	${rolesScopeConsentText}	consent.screen.text
55db265b-d032-4e89-9bf4-ca5a6edf3475	false	include.in.token.scope
da9201a2-3505-4155-b915-8250bf1e165f	false	display.on.consent.screen
da9201a2-3505-4155-b915-8250bf1e165f		consent.screen.text
da9201a2-3505-4155-b915-8250bf1e165f	false	include.in.token.scope
576e255e-0f89-4ea7-b41a-a3bb8ad8cf74	false	display.on.consent.screen
576e255e-0f89-4ea7-b41a-a3bb8ad8cf74	true	include.in.token.scope
71569b96-9de3-4a9f-a059-5d70ac43fbc7	false	display.on.consent.screen
71569b96-9de3-4a9f-a059-5d70ac43fbc7	false	include.in.token.scope
dfad6d2d-c551-4718-bc90-0cfa1756886d	false	display.on.consent.screen
dfad6d2d-c551-4718-bc90-0cfa1756886d	false	include.in.token.scope
4ce15839-6fe6-48f1-800f-bb8da5f390d5	false	display.on.consent.screen
4ce15839-6fe6-48f1-800f-bb8da5f390d5	false	include.in.token.scope
6bee678a-b327-4c07-afbf-893e78617e99	true	display.on.consent.screen
6bee678a-b327-4c07-afbf-893e78617e99	${organizationScopeConsentText}	consent.screen.text
6bee678a-b327-4c07-afbf-893e78617e99	true	include.in.token.scope
ab082a91-1118-4ee4-b8a7-f8fff22c90b1	true	display.on.consent.screen
ab082a91-1118-4ee4-b8a7-f8fff22c90b1	${offlineAccessScopeConsentText}	consent.screen.text
a08596a3-2f56-48e3-a6c2-3f677abc04fe	true	display.on.consent.screen
a08596a3-2f56-48e3-a6c2-3f677abc04fe	${samlRoleListScopeConsentText}	consent.screen.text
e388c5c7-b269-4718-a04a-eaa6fe2b180b	false	display.on.consent.screen
277c44f2-6c48-4b50-b577-64e2af58aa69	true	display.on.consent.screen
277c44f2-6c48-4b50-b577-64e2af58aa69	${profileScopeConsentText}	consent.screen.text
277c44f2-6c48-4b50-b577-64e2af58aa69	true	include.in.token.scope
7bac0196-400a-44b6-ac9a-f49157068235	true	display.on.consent.screen
7bac0196-400a-44b6-ac9a-f49157068235	${emailScopeConsentText}	consent.screen.text
7bac0196-400a-44b6-ac9a-f49157068235	true	include.in.token.scope
77e3bae2-5cc2-4c58-a3ab-51e86e61b0b5	true	display.on.consent.screen
77e3bae2-5cc2-4c58-a3ab-51e86e61b0b5	${addressScopeConsentText}	consent.screen.text
77e3bae2-5cc2-4c58-a3ab-51e86e61b0b5	true	include.in.token.scope
bc10061e-fe2b-4d9b-b714-cb9d62a4a688	true	display.on.consent.screen
bc10061e-fe2b-4d9b-b714-cb9d62a4a688	${phoneScopeConsentText}	consent.screen.text
bc10061e-fe2b-4d9b-b714-cb9d62a4a688	true	include.in.token.scope
8fc4d791-7889-4198-8d26-4fddd2a21202	true	display.on.consent.screen
8fc4d791-7889-4198-8d26-4fddd2a21202	${rolesScopeConsentText}	consent.screen.text
8fc4d791-7889-4198-8d26-4fddd2a21202	false	include.in.token.scope
5cc4aa6f-da39-4c9c-98c8-a51c5a23132b	false	display.on.consent.screen
5cc4aa6f-da39-4c9c-98c8-a51c5a23132b		consent.screen.text
5cc4aa6f-da39-4c9c-98c8-a51c5a23132b	false	include.in.token.scope
e93611eb-33d1-455d-a48b-e70253cce5ff	false	display.on.consent.screen
e93611eb-33d1-455d-a48b-e70253cce5ff	true	include.in.token.scope
e3a574d9-4a36-40a7-9807-c881b9f17bb2	false	display.on.consent.screen
e3a574d9-4a36-40a7-9807-c881b9f17bb2	false	include.in.token.scope
d6dab1fe-4572-40c2-8616-9f4bd1656511	false	display.on.consent.screen
d6dab1fe-4572-40c2-8616-9f4bd1656511	false	include.in.token.scope
8b737abe-8d83-478a-be8d-fbe3964690b7	false	display.on.consent.screen
8b737abe-8d83-478a-be8d-fbe3964690b7	false	include.in.token.scope
38a104e9-a8ed-42d5-ad2d-238f6f2719f3	true	display.on.consent.screen
38a104e9-a8ed-42d5-ad2d-238f6f2719f3	${organizationScopeConsentText}	consent.screen.text
38a104e9-a8ed-42d5-ad2d-238f6f2719f3	true	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
2f78cfee-7416-429f-8463-7b84b102a6ff	dfad6d2d-c551-4718-bc90-0cfa1756886d	t
2f78cfee-7416-429f-8463-7b84b102a6ff	71569b96-9de3-4a9f-a059-5d70ac43fbc7	t
2f78cfee-7416-429f-8463-7b84b102a6ff	55db265b-d032-4e89-9bf4-ca5a6edf3475	t
2f78cfee-7416-429f-8463-7b84b102a6ff	c264dda0-e318-45ee-a306-70be7092dba3	t
2f78cfee-7416-429f-8463-7b84b102a6ff	2a3cac96-2576-4c97-8337-ee31009a0345	t
2f78cfee-7416-429f-8463-7b84b102a6ff	da9201a2-3505-4155-b915-8250bf1e165f	t
2f78cfee-7416-429f-8463-7b84b102a6ff	1a06a005-a31c-46a8-83ee-c552d1f4b404	f
2f78cfee-7416-429f-8463-7b84b102a6ff	9321628e-4b0b-409d-bb14-b8489607bbbf	f
2f78cfee-7416-429f-8463-7b84b102a6ff	3874bf67-328a-4917-9df4-ac164d67b77c	f
2f78cfee-7416-429f-8463-7b84b102a6ff	6bee678a-b327-4c07-afbf-893e78617e99	f
2f78cfee-7416-429f-8463-7b84b102a6ff	576e255e-0f89-4ea7-b41a-a3bb8ad8cf74	f
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	dfad6d2d-c551-4718-bc90-0cfa1756886d	t
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	71569b96-9de3-4a9f-a059-5d70ac43fbc7	t
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	55db265b-d032-4e89-9bf4-ca5a6edf3475	t
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	c264dda0-e318-45ee-a306-70be7092dba3	t
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	2a3cac96-2576-4c97-8337-ee31009a0345	t
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	da9201a2-3505-4155-b915-8250bf1e165f	t
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	1a06a005-a31c-46a8-83ee-c552d1f4b404	f
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	9321628e-4b0b-409d-bb14-b8489607bbbf	f
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	3874bf67-328a-4917-9df4-ac164d67b77c	f
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	6bee678a-b327-4c07-afbf-893e78617e99	f
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	576e255e-0f89-4ea7-b41a-a3bb8ad8cf74	f
68f95d65-e0c9-48be-969b-5e447f3ab6fc	dfad6d2d-c551-4718-bc90-0cfa1756886d	t
68f95d65-e0c9-48be-969b-5e447f3ab6fc	71569b96-9de3-4a9f-a059-5d70ac43fbc7	t
68f95d65-e0c9-48be-969b-5e447f3ab6fc	55db265b-d032-4e89-9bf4-ca5a6edf3475	t
68f95d65-e0c9-48be-969b-5e447f3ab6fc	c264dda0-e318-45ee-a306-70be7092dba3	t
68f95d65-e0c9-48be-969b-5e447f3ab6fc	2a3cac96-2576-4c97-8337-ee31009a0345	t
68f95d65-e0c9-48be-969b-5e447f3ab6fc	da9201a2-3505-4155-b915-8250bf1e165f	t
68f95d65-e0c9-48be-969b-5e447f3ab6fc	1a06a005-a31c-46a8-83ee-c552d1f4b404	f
68f95d65-e0c9-48be-969b-5e447f3ab6fc	9321628e-4b0b-409d-bb14-b8489607bbbf	f
68f95d65-e0c9-48be-969b-5e447f3ab6fc	3874bf67-328a-4917-9df4-ac164d67b77c	f
68f95d65-e0c9-48be-969b-5e447f3ab6fc	6bee678a-b327-4c07-afbf-893e78617e99	f
68f95d65-e0c9-48be-969b-5e447f3ab6fc	576e255e-0f89-4ea7-b41a-a3bb8ad8cf74	f
5be60e83-8e73-4288-884a-94e97783d931	dfad6d2d-c551-4718-bc90-0cfa1756886d	t
5be60e83-8e73-4288-884a-94e97783d931	71569b96-9de3-4a9f-a059-5d70ac43fbc7	t
5be60e83-8e73-4288-884a-94e97783d931	55db265b-d032-4e89-9bf4-ca5a6edf3475	t
5be60e83-8e73-4288-884a-94e97783d931	c264dda0-e318-45ee-a306-70be7092dba3	t
5be60e83-8e73-4288-884a-94e97783d931	2a3cac96-2576-4c97-8337-ee31009a0345	t
5be60e83-8e73-4288-884a-94e97783d931	da9201a2-3505-4155-b915-8250bf1e165f	t
5be60e83-8e73-4288-884a-94e97783d931	1a06a005-a31c-46a8-83ee-c552d1f4b404	f
5be60e83-8e73-4288-884a-94e97783d931	9321628e-4b0b-409d-bb14-b8489607bbbf	f
5be60e83-8e73-4288-884a-94e97783d931	3874bf67-328a-4917-9df4-ac164d67b77c	f
5be60e83-8e73-4288-884a-94e97783d931	6bee678a-b327-4c07-afbf-893e78617e99	f
5be60e83-8e73-4288-884a-94e97783d931	576e255e-0f89-4ea7-b41a-a3bb8ad8cf74	f
2ff86fec-3d01-4f46-ae60-06b6ae320749	dfad6d2d-c551-4718-bc90-0cfa1756886d	t
2ff86fec-3d01-4f46-ae60-06b6ae320749	71569b96-9de3-4a9f-a059-5d70ac43fbc7	t
2ff86fec-3d01-4f46-ae60-06b6ae320749	55db265b-d032-4e89-9bf4-ca5a6edf3475	t
2ff86fec-3d01-4f46-ae60-06b6ae320749	c264dda0-e318-45ee-a306-70be7092dba3	t
2ff86fec-3d01-4f46-ae60-06b6ae320749	2a3cac96-2576-4c97-8337-ee31009a0345	t
2ff86fec-3d01-4f46-ae60-06b6ae320749	da9201a2-3505-4155-b915-8250bf1e165f	t
2ff86fec-3d01-4f46-ae60-06b6ae320749	1a06a005-a31c-46a8-83ee-c552d1f4b404	f
2ff86fec-3d01-4f46-ae60-06b6ae320749	9321628e-4b0b-409d-bb14-b8489607bbbf	f
2ff86fec-3d01-4f46-ae60-06b6ae320749	3874bf67-328a-4917-9df4-ac164d67b77c	f
2ff86fec-3d01-4f46-ae60-06b6ae320749	6bee678a-b327-4c07-afbf-893e78617e99	f
2ff86fec-3d01-4f46-ae60-06b6ae320749	576e255e-0f89-4ea7-b41a-a3bb8ad8cf74	f
8b0f1494-a2c8-4184-a246-1791bd30192e	dfad6d2d-c551-4718-bc90-0cfa1756886d	t
8b0f1494-a2c8-4184-a246-1791bd30192e	71569b96-9de3-4a9f-a059-5d70ac43fbc7	t
8b0f1494-a2c8-4184-a246-1791bd30192e	55db265b-d032-4e89-9bf4-ca5a6edf3475	t
8b0f1494-a2c8-4184-a246-1791bd30192e	c264dda0-e318-45ee-a306-70be7092dba3	t
8b0f1494-a2c8-4184-a246-1791bd30192e	2a3cac96-2576-4c97-8337-ee31009a0345	t
8b0f1494-a2c8-4184-a246-1791bd30192e	da9201a2-3505-4155-b915-8250bf1e165f	t
8b0f1494-a2c8-4184-a246-1791bd30192e	1a06a005-a31c-46a8-83ee-c552d1f4b404	f
8b0f1494-a2c8-4184-a246-1791bd30192e	9321628e-4b0b-409d-bb14-b8489607bbbf	f
8b0f1494-a2c8-4184-a246-1791bd30192e	3874bf67-328a-4917-9df4-ac164d67b77c	f
8b0f1494-a2c8-4184-a246-1791bd30192e	6bee678a-b327-4c07-afbf-893e78617e99	f
8b0f1494-a2c8-4184-a246-1791bd30192e	576e255e-0f89-4ea7-b41a-a3bb8ad8cf74	f
1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	5cc4aa6f-da39-4c9c-98c8-a51c5a23132b	t
1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	277c44f2-6c48-4b50-b577-64e2af58aa69	t
1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	7bac0196-400a-44b6-ac9a-f49157068235	t
1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	e3a574d9-4a36-40a7-9807-c881b9f17bb2	t
1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	d6dab1fe-4572-40c2-8616-9f4bd1656511	t
1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	8fc4d791-7889-4198-8d26-4fddd2a21202	t
1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	bc10061e-fe2b-4d9b-b714-cb9d62a4a688	f
1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	e93611eb-33d1-455d-a48b-e70253cce5ff	f
1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	38a104e9-a8ed-42d5-ad2d-238f6f2719f3	f
1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	ab082a91-1118-4ee4-b8a7-f8fff22c90b1	f
1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	77e3bae2-5cc2-4c58-a3ab-51e86e61b0b5	f
f3de95ba-eae6-4b4f-9667-2638e741fcc9	5cc4aa6f-da39-4c9c-98c8-a51c5a23132b	t
f3de95ba-eae6-4b4f-9667-2638e741fcc9	277c44f2-6c48-4b50-b577-64e2af58aa69	t
f3de95ba-eae6-4b4f-9667-2638e741fcc9	7bac0196-400a-44b6-ac9a-f49157068235	t
f3de95ba-eae6-4b4f-9667-2638e741fcc9	e3a574d9-4a36-40a7-9807-c881b9f17bb2	t
f3de95ba-eae6-4b4f-9667-2638e741fcc9	d6dab1fe-4572-40c2-8616-9f4bd1656511	t
f3de95ba-eae6-4b4f-9667-2638e741fcc9	8fc4d791-7889-4198-8d26-4fddd2a21202	t
f3de95ba-eae6-4b4f-9667-2638e741fcc9	bc10061e-fe2b-4d9b-b714-cb9d62a4a688	f
f3de95ba-eae6-4b4f-9667-2638e741fcc9	e93611eb-33d1-455d-a48b-e70253cce5ff	f
f3de95ba-eae6-4b4f-9667-2638e741fcc9	38a104e9-a8ed-42d5-ad2d-238f6f2719f3	f
f3de95ba-eae6-4b4f-9667-2638e741fcc9	ab082a91-1118-4ee4-b8a7-f8fff22c90b1	f
f3de95ba-eae6-4b4f-9667-2638e741fcc9	77e3bae2-5cc2-4c58-a3ab-51e86e61b0b5	f
2fea712f-525b-4b9a-ba54-d5be043ed8a7	5cc4aa6f-da39-4c9c-98c8-a51c5a23132b	t
2fea712f-525b-4b9a-ba54-d5be043ed8a7	277c44f2-6c48-4b50-b577-64e2af58aa69	t
2fea712f-525b-4b9a-ba54-d5be043ed8a7	7bac0196-400a-44b6-ac9a-f49157068235	t
2fea712f-525b-4b9a-ba54-d5be043ed8a7	e3a574d9-4a36-40a7-9807-c881b9f17bb2	t
2fea712f-525b-4b9a-ba54-d5be043ed8a7	d6dab1fe-4572-40c2-8616-9f4bd1656511	t
2fea712f-525b-4b9a-ba54-d5be043ed8a7	8fc4d791-7889-4198-8d26-4fddd2a21202	t
2fea712f-525b-4b9a-ba54-d5be043ed8a7	bc10061e-fe2b-4d9b-b714-cb9d62a4a688	f
2fea712f-525b-4b9a-ba54-d5be043ed8a7	e93611eb-33d1-455d-a48b-e70253cce5ff	f
2fea712f-525b-4b9a-ba54-d5be043ed8a7	38a104e9-a8ed-42d5-ad2d-238f6f2719f3	f
2fea712f-525b-4b9a-ba54-d5be043ed8a7	ab082a91-1118-4ee4-b8a7-f8fff22c90b1	f
2fea712f-525b-4b9a-ba54-d5be043ed8a7	77e3bae2-5cc2-4c58-a3ab-51e86e61b0b5	f
318063f8-35b7-481e-87c0-b23d5337e35f	5cc4aa6f-da39-4c9c-98c8-a51c5a23132b	t
318063f8-35b7-481e-87c0-b23d5337e35f	277c44f2-6c48-4b50-b577-64e2af58aa69	t
318063f8-35b7-481e-87c0-b23d5337e35f	7bac0196-400a-44b6-ac9a-f49157068235	t
318063f8-35b7-481e-87c0-b23d5337e35f	e3a574d9-4a36-40a7-9807-c881b9f17bb2	t
318063f8-35b7-481e-87c0-b23d5337e35f	d6dab1fe-4572-40c2-8616-9f4bd1656511	t
318063f8-35b7-481e-87c0-b23d5337e35f	8fc4d791-7889-4198-8d26-4fddd2a21202	t
318063f8-35b7-481e-87c0-b23d5337e35f	bc10061e-fe2b-4d9b-b714-cb9d62a4a688	f
318063f8-35b7-481e-87c0-b23d5337e35f	e93611eb-33d1-455d-a48b-e70253cce5ff	f
318063f8-35b7-481e-87c0-b23d5337e35f	38a104e9-a8ed-42d5-ad2d-238f6f2719f3	f
318063f8-35b7-481e-87c0-b23d5337e35f	ab082a91-1118-4ee4-b8a7-f8fff22c90b1	f
318063f8-35b7-481e-87c0-b23d5337e35f	77e3bae2-5cc2-4c58-a3ab-51e86e61b0b5	f
6becd912-7640-41a5-a651-31867bef9c44	5cc4aa6f-da39-4c9c-98c8-a51c5a23132b	t
6becd912-7640-41a5-a651-31867bef9c44	277c44f2-6c48-4b50-b577-64e2af58aa69	t
6becd912-7640-41a5-a651-31867bef9c44	7bac0196-400a-44b6-ac9a-f49157068235	t
6becd912-7640-41a5-a651-31867bef9c44	e3a574d9-4a36-40a7-9807-c881b9f17bb2	t
6becd912-7640-41a5-a651-31867bef9c44	d6dab1fe-4572-40c2-8616-9f4bd1656511	t
6becd912-7640-41a5-a651-31867bef9c44	8fc4d791-7889-4198-8d26-4fddd2a21202	t
6becd912-7640-41a5-a651-31867bef9c44	bc10061e-fe2b-4d9b-b714-cb9d62a4a688	f
6becd912-7640-41a5-a651-31867bef9c44	e93611eb-33d1-455d-a48b-e70253cce5ff	f
6becd912-7640-41a5-a651-31867bef9c44	38a104e9-a8ed-42d5-ad2d-238f6f2719f3	f
6becd912-7640-41a5-a651-31867bef9c44	ab082a91-1118-4ee4-b8a7-f8fff22c90b1	f
6becd912-7640-41a5-a651-31867bef9c44	77e3bae2-5cc2-4c58-a3ab-51e86e61b0b5	f
89af5f6b-be83-458b-8250-4aefba4ffec1	5cc4aa6f-da39-4c9c-98c8-a51c5a23132b	t
89af5f6b-be83-458b-8250-4aefba4ffec1	277c44f2-6c48-4b50-b577-64e2af58aa69	t
89af5f6b-be83-458b-8250-4aefba4ffec1	7bac0196-400a-44b6-ac9a-f49157068235	t
89af5f6b-be83-458b-8250-4aefba4ffec1	e3a574d9-4a36-40a7-9807-c881b9f17bb2	t
89af5f6b-be83-458b-8250-4aefba4ffec1	d6dab1fe-4572-40c2-8616-9f4bd1656511	t
89af5f6b-be83-458b-8250-4aefba4ffec1	8fc4d791-7889-4198-8d26-4fddd2a21202	t
89af5f6b-be83-458b-8250-4aefba4ffec1	bc10061e-fe2b-4d9b-b714-cb9d62a4a688	f
89af5f6b-be83-458b-8250-4aefba4ffec1	e93611eb-33d1-455d-a48b-e70253cce5ff	f
89af5f6b-be83-458b-8250-4aefba4ffec1	38a104e9-a8ed-42d5-ad2d-238f6f2719f3	f
89af5f6b-be83-458b-8250-4aefba4ffec1	ab082a91-1118-4ee4-b8a7-f8fff22c90b1	f
89af5f6b-be83-458b-8250-4aefba4ffec1	77e3bae2-5cc2-4c58-a3ab-51e86e61b0b5	f
12b20603-24ee-4e3c-8fa9-124de5bde364	5cc4aa6f-da39-4c9c-98c8-a51c5a23132b	t
12b20603-24ee-4e3c-8fa9-124de5bde364	277c44f2-6c48-4b50-b577-64e2af58aa69	t
12b20603-24ee-4e3c-8fa9-124de5bde364	7bac0196-400a-44b6-ac9a-f49157068235	t
12b20603-24ee-4e3c-8fa9-124de5bde364	e3a574d9-4a36-40a7-9807-c881b9f17bb2	t
12b20603-24ee-4e3c-8fa9-124de5bde364	d6dab1fe-4572-40c2-8616-9f4bd1656511	t
12b20603-24ee-4e3c-8fa9-124de5bde364	8fc4d791-7889-4198-8d26-4fddd2a21202	t
12b20603-24ee-4e3c-8fa9-124de5bde364	bc10061e-fe2b-4d9b-b714-cb9d62a4a688	f
12b20603-24ee-4e3c-8fa9-124de5bde364	e93611eb-33d1-455d-a48b-e70253cce5ff	f
12b20603-24ee-4e3c-8fa9-124de5bde364	38a104e9-a8ed-42d5-ad2d-238f6f2719f3	f
12b20603-24ee-4e3c-8fa9-124de5bde364	ab082a91-1118-4ee4-b8a7-f8fff22c90b1	f
12b20603-24ee-4e3c-8fa9-124de5bde364	77e3bae2-5cc2-4c58-a3ab-51e86e61b0b5	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
3874bf67-328a-4917-9df4-ac164d67b77c	a1a5e1ad-c4c2-47a9-a7ed-eec53f015dbd
ab082a91-1118-4ee4-b8a7-f8fff22c90b1	ea8374df-db95-4a44-ae94-c8b6ee75edf8
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
39bf4db1-d3c7-4a0b-9b2f-e9dce5eba8b2	Trusted Hosts	3654cfb9-0034-4bee-8aff-6eda67a58466	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3654cfb9-0034-4bee-8aff-6eda67a58466	anonymous
f7391c40-2517-4ff4-90b8-6130717b4b27	Consent Required	3654cfb9-0034-4bee-8aff-6eda67a58466	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3654cfb9-0034-4bee-8aff-6eda67a58466	anonymous
7e38b1bb-3fe7-4666-8c76-35ce7fd31c8d	Full Scope Disabled	3654cfb9-0034-4bee-8aff-6eda67a58466	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3654cfb9-0034-4bee-8aff-6eda67a58466	anonymous
197a46a7-798c-4e3f-9d6b-e9d9da4f63de	Max Clients Limit	3654cfb9-0034-4bee-8aff-6eda67a58466	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3654cfb9-0034-4bee-8aff-6eda67a58466	anonymous
84fd467c-a522-406d-82e0-fd2f70986e25	Allowed Protocol Mapper Types	3654cfb9-0034-4bee-8aff-6eda67a58466	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3654cfb9-0034-4bee-8aff-6eda67a58466	anonymous
82ed081b-6702-46de-ab47-1ef495030053	Allowed Client Scopes	3654cfb9-0034-4bee-8aff-6eda67a58466	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3654cfb9-0034-4bee-8aff-6eda67a58466	anonymous
1f134601-0484-4d77-98b6-9d58a0566bec	Allowed Protocol Mapper Types	3654cfb9-0034-4bee-8aff-6eda67a58466	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3654cfb9-0034-4bee-8aff-6eda67a58466	authenticated
ce0104a5-abb5-4ac1-97c4-7c0facd5c1c8	Allowed Client Scopes	3654cfb9-0034-4bee-8aff-6eda67a58466	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3654cfb9-0034-4bee-8aff-6eda67a58466	authenticated
481f60cf-aa32-41b5-a3e6-9a3f3df22d58	rsa-generated	3654cfb9-0034-4bee-8aff-6eda67a58466	rsa-generated	org.keycloak.keys.KeyProvider	3654cfb9-0034-4bee-8aff-6eda67a58466	\N
8fd86856-4571-461d-b491-218552da0ab0	rsa-enc-generated	3654cfb9-0034-4bee-8aff-6eda67a58466	rsa-enc-generated	org.keycloak.keys.KeyProvider	3654cfb9-0034-4bee-8aff-6eda67a58466	\N
d6356420-7615-4de0-a54b-1735f031509a	hmac-generated-hs512	3654cfb9-0034-4bee-8aff-6eda67a58466	hmac-generated	org.keycloak.keys.KeyProvider	3654cfb9-0034-4bee-8aff-6eda67a58466	\N
2ef5d6c2-b80d-418c-970f-a62957b3a050	aes-generated	3654cfb9-0034-4bee-8aff-6eda67a58466	aes-generated	org.keycloak.keys.KeyProvider	3654cfb9-0034-4bee-8aff-6eda67a58466	\N
abbd623d-0b9c-404b-903d-b82dff835c29	\N	3654cfb9-0034-4bee-8aff-6eda67a58466	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	3654cfb9-0034-4bee-8aff-6eda67a58466	\N
8a63870f-acad-4657-afdd-64dae4de9968	rsa-generated	17787da5-ff56-48dc-a36a-2700dec08b2e	rsa-generated	org.keycloak.keys.KeyProvider	17787da5-ff56-48dc-a36a-2700dec08b2e	\N
1a04950e-db1b-4266-bc2f-1ce5f7340dd6	rsa-enc-generated	17787da5-ff56-48dc-a36a-2700dec08b2e	rsa-enc-generated	org.keycloak.keys.KeyProvider	17787da5-ff56-48dc-a36a-2700dec08b2e	\N
23a9275a-a7ed-4869-ba6d-f91fbce8bb7d	hmac-generated-hs512	17787da5-ff56-48dc-a36a-2700dec08b2e	hmac-generated	org.keycloak.keys.KeyProvider	17787da5-ff56-48dc-a36a-2700dec08b2e	\N
5caf26f2-f359-4360-abce-0059bbffe541	aes-generated	17787da5-ff56-48dc-a36a-2700dec08b2e	aes-generated	org.keycloak.keys.KeyProvider	17787da5-ff56-48dc-a36a-2700dec08b2e	\N
65e23f5b-4af2-4977-a8d8-7a664fcb9576	Trusted Hosts	17787da5-ff56-48dc-a36a-2700dec08b2e	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17787da5-ff56-48dc-a36a-2700dec08b2e	anonymous
da3bf1f7-c3a8-470f-9f9e-df18088ce4b0	Consent Required	17787da5-ff56-48dc-a36a-2700dec08b2e	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17787da5-ff56-48dc-a36a-2700dec08b2e	anonymous
f63df4d4-cba1-4a11-960f-f9583e62bcda	Full Scope Disabled	17787da5-ff56-48dc-a36a-2700dec08b2e	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17787da5-ff56-48dc-a36a-2700dec08b2e	anonymous
6bfe111a-005f-4397-a383-86889d2e0e78	Max Clients Limit	17787da5-ff56-48dc-a36a-2700dec08b2e	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17787da5-ff56-48dc-a36a-2700dec08b2e	anonymous
90698849-463c-4eb0-981c-50c73b7563d0	Allowed Protocol Mapper Types	17787da5-ff56-48dc-a36a-2700dec08b2e	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17787da5-ff56-48dc-a36a-2700dec08b2e	anonymous
c6aa068f-bd29-4da0-9fa8-038d123e54a6	Allowed Client Scopes	17787da5-ff56-48dc-a36a-2700dec08b2e	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17787da5-ff56-48dc-a36a-2700dec08b2e	anonymous
1beafc58-23c2-45a6-bb17-6a55c4d3c0dc	Allowed Protocol Mapper Types	17787da5-ff56-48dc-a36a-2700dec08b2e	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17787da5-ff56-48dc-a36a-2700dec08b2e	authenticated
a6c1c9f5-24ec-4663-b123-8424a4396c88	Allowed Client Scopes	17787da5-ff56-48dc-a36a-2700dec08b2e	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	17787da5-ff56-48dc-a36a-2700dec08b2e	authenticated
2c8745b1-4989-4c2c-bdc5-e252c11b9a0a	\N	17787da5-ff56-48dc-a36a-2700dec08b2e	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	17787da5-ff56-48dc-a36a-2700dec08b2e	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
0a8994cf-1dbf-4208-acdb-dc9b5311e0a9	39bf4db1-d3c7-4a0b-9b2f-e9dce5eba8b2	client-uris-must-match	true
61637ce7-e9fa-41dd-9b68-e25dca8586b3	39bf4db1-d3c7-4a0b-9b2f-e9dce5eba8b2	host-sending-registration-request-must-match	true
701df49e-fac3-4b14-ab0c-7e37532540b5	84fd467c-a522-406d-82e0-fd2f70986e25	allowed-protocol-mapper-types	oidc-address-mapper
561614cb-1d59-46ba-88ec-37338e45dde9	84fd467c-a522-406d-82e0-fd2f70986e25	allowed-protocol-mapper-types	saml-role-list-mapper
b167c137-8c3e-44b6-82c0-55ce2e574fce	84fd467c-a522-406d-82e0-fd2f70986e25	allowed-protocol-mapper-types	saml-user-property-mapper
40ee040a-9a74-46ff-944e-3cb54cbb2994	84fd467c-a522-406d-82e0-fd2f70986e25	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
2f709746-0842-4186-bc3f-e90c397dd4da	84fd467c-a522-406d-82e0-fd2f70986e25	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
7c509bdd-717a-4d79-bde6-19a3f9e52c33	84fd467c-a522-406d-82e0-fd2f70986e25	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
5a58d979-1474-4e00-93f4-8a6ef1245098	84fd467c-a522-406d-82e0-fd2f70986e25	allowed-protocol-mapper-types	oidc-full-name-mapper
0a8b23a8-f6e2-4084-88b6-eee4e4e0987b	84fd467c-a522-406d-82e0-fd2f70986e25	allowed-protocol-mapper-types	saml-user-attribute-mapper
b30737e3-f8ce-4737-b6e6-c12e04f19c1c	ce0104a5-abb5-4ac1-97c4-7c0facd5c1c8	allow-default-scopes	true
6e3e3114-7873-4a49-9e39-03ddce30c5f1	82ed081b-6702-46de-ab47-1ef495030053	allow-default-scopes	true
7e8bf308-7e7f-45ca-8c11-4aefdbdc0593	197a46a7-798c-4e3f-9d6b-e9d9da4f63de	max-clients	200
afa6ee55-642a-4845-b2be-e35127622d86	1f134601-0484-4d77-98b6-9d58a0566bec	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
464ae0db-8f57-496d-80f8-06abb4309513	1f134601-0484-4d77-98b6-9d58a0566bec	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
89e152c4-1410-4d91-83ab-c9271c406d73	1f134601-0484-4d77-98b6-9d58a0566bec	allowed-protocol-mapper-types	saml-user-attribute-mapper
0e8ba5c1-9021-4ced-86b8-6edbaf940258	1f134601-0484-4d77-98b6-9d58a0566bec	allowed-protocol-mapper-types	saml-user-property-mapper
135ee1a4-359a-41b6-946c-d2de621a51ce	1f134601-0484-4d77-98b6-9d58a0566bec	allowed-protocol-mapper-types	oidc-full-name-mapper
d52bae7d-a7b3-4618-b4d0-b7170f61296b	1f134601-0484-4d77-98b6-9d58a0566bec	allowed-protocol-mapper-types	saml-role-list-mapper
27063e5d-38a1-45a8-8511-c44ec30686f9	1f134601-0484-4d77-98b6-9d58a0566bec	allowed-protocol-mapper-types	oidc-address-mapper
dd53e8c3-3640-4171-b607-b8e4eff00851	1f134601-0484-4d77-98b6-9d58a0566bec	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
7128562f-dd14-4b2a-892a-0c94cda85c67	481f60cf-aa32-41b5-a3e6-9a3f3df22d58	priority	100
618f803a-c88d-4eaa-b7fd-ccc19b21689d	481f60cf-aa32-41b5-a3e6-9a3f3df22d58	privateKey	MIIEogIBAAKCAQEA15cXG9qsF3v+SDvSHd5c9vvmhk1VJgokRP/nAHoPwEgOEsH9Z2rYYl2nGEk67c0d84wSE2iS2s+OHmRk9xWchJOBpcONmBZhuDXuTdjzR+mXEJkeuCV+28i0QwHcqBd4qQrz1D3zdxHAOHVNKoSUZsxENlm9iKFpzwxp4CFB6ix91WJ15FfT5Exyqthc8JHPZ17FR0Sc+pKPULoJG71YC1EdA44RltP5jloRar5yG0r1DrujnixlZ2sjMZpD/M1YMjHlvM9CFayBvNP5i8qg61MUrrLox6Tjm+nGdkI04SzOUKOFDwX1//Thx1d/LrsLtfq+/pL12JOiAEkqTB8ltwIDAQABAoIBABVkIcrbEPro4VDRfrEFVea7v80mRy3rEQY3o01iJHCeYFHEJcc+dryWhknb75jrd+6pFfIPDOM2d5IpwUrdk2t5fK0HO4689HKOsgJ6EEmGXT2Bs+aZnH4PlV3rWrWNqU88jaJK3f670tLHRiIoiCuwVjmpAIFaDWGZ3bd7aqA4HfUN65JCU4HPcMccG2Ij6ZBSNrK6NNSnvHlwz0mxDRGIbyl3sVZTaiOnj6WSDN7zZycG63qQ7fCSgnk+XLGxSfol/bMBaN7A3JDyOv9SmVH6/rc68vOzK9qzCMC5lqIZWO5BOsS9Ti3WMfNLOWPUjeyMBTs2H1Tvgtej6eoM4gECgYEA7J7xmOh+lRAMgxhIAWyI3LzT5QqOk242jA+spmnrjpm9i6CKX4WazqvaBmd4D1tVemehs8QOzpKBZy2mE8dQa224A+rxa1YdOzIpe8BYZEnBOB+F2gkDSKNnnWePxIPlpO+rwgWuZd1BkrBQgXaeGlVnF3jTcl6NIpmC2CX9m0ECgYEA6T82NLCNzGSJiB3kt8JsHZhIxogobua6Izo6+MYRWaP2HoNyV34qZi8ffI8z0Ay+LOwml/nAcyGIWSGu+yNaWJtS/ffnw71xv+9xsrKApYnU0CLfmXrVe/rPL8korLBsyJm7GBmPFsHJaolpfYUsJhZvXYo8PNxIObn4SKz52vcCgYAG7bSHVK94L+sd35UkLYhoZkMSHtgD6yM/wKm+ibVzDH9nWkETAPeCe7e7nkX+tR7woZ4zhFcmp1WQrt6BD8IEE0djHfsJuJDMjfB3Bi/QZ/R3bzzdIIxvERHUoxarm20bAkWWPdJYez0TTYRd9ho1DTEil9AhNjGNxM73A03EwQKBgCGyXCZoi1PIAoaDqxNRJ0VvRrRH32+GLcYBF5vxIXiN03S9ELvLIlz42deo6JdZ/++Ffl3eWwtHAOe/kgP+K4M5jVfbhMQmjlRoR0jFuQgxTWl0YFFQCZ+LsHr62MF6C30/mGP27VEgVfTqPS9BGgu2mggtfF5ehKCyWUhGlSIpAoGAH/q0rGk/fHmPUuVCPotcmWcxFkJj+rpmPVlFhZjrkR6F2zQ37oU57g2h/OMBz3gQoVePpwZ/3wZCCOR5qKfgGFHZNUpKwnMCRb8Ql6vWhWhph7B9hBn56lMX62Lj4Vc5MFcOz4uu1SV/mex+Sd0Z4UQsrhwWFngZXEPxOqIT4PI=
08c52283-809d-4add-9cc8-0cee62ce6402	481f60cf-aa32-41b5-a3e6-9a3f3df22d58	certificate	MIICmzCCAYMCBgGaEbBZIzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUxMDIzMTUyNzQxWhcNMzUxMDIzMTUyOTIxWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDXlxcb2qwXe/5IO9Id3lz2++aGTVUmCiRE/+cAeg/ASA4Swf1nathiXacYSTrtzR3zjBITaJLaz44eZGT3FZyEk4Glw42YFmG4Ne5N2PNH6ZcQmR64JX7byLRDAdyoF3ipCvPUPfN3EcA4dU0qhJRmzEQ2Wb2IoWnPDGngIUHqLH3VYnXkV9PkTHKq2Fzwkc9nXsVHRJz6ko9QugkbvVgLUR0DjhGW0/mOWhFqvnIbSvUOu6OeLGVnayMxmkP8zVgyMeW8z0IVrIG80/mLyqDrUxSusujHpOOb6cZ2QjThLM5Qo4UPBfX/9OHHV38uuwu1+r7+kvXYk6IASSpMHyW3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAI827rvn2nNtWQSmFuo/XII85NZ1Z1W19x/7CI9ndW88e+L7vVZV61q+OZtQeDsbyElY7FIRKq865M/E/QlJMput6qhWNuy4uWiAXXL/L4k9KuQZdwDcR1lk6/wRK8JIY9oHh1IbZLoQHiGqTF1HGU8Xdi4nKM3aH+2j5syOvzdjIn/6SMFqDq14HJrnB8+PPc7mStg26de5tB8LTfjHSiUu9qLrZ7UptMAPWMyIl8gqGnj1Jk4qlBzYMAblaja3vbZoL6MiKRCDp2K26fRXRsLxcoRYU16F/cUkVU29n3RadZpZgvZE7V72+1XTOY3yAq+SEBixmBDzZY1TZxJtxdk=
7272187d-e131-4794-92c5-cd2a8f56fa15	481f60cf-aa32-41b5-a3e6-9a3f3df22d58	keyUse	SIG
bddf0359-0d19-4056-a11e-1beaf52456e4	8fd86856-4571-461d-b491-218552da0ab0	algorithm	RSA-OAEP
dea2c1d8-3d89-490f-aecc-12cb4a92c140	8fd86856-4571-461d-b491-218552da0ab0	privateKey	MIIEogIBAAKCAQEAouNwGHQjUoGvzP/AGk3ClAj6UV2ixT3tNMYEOCKMg9BZz+ucjl2/ZJOuwH959uBKvehiJzCzNCfnM4ruMKsWkHJrxwdRtK8b0CQC4h7bsmJrLexSzV4z+fDxjwMwrT4CWH7SoqihkGEHSFIrDh2cTMXBfmUv5PFOjdTNN88qv02fn3ErKv9QL8SHpkmAv4lu7EP6g1dlZ+4+S1lD+Gmx8GagmQuq4AQGqyvnAaPkeRWAGmcttdHMT9FLXS06FM4VCfwkvWaqMB7ASrTBrIb8j8dJgWyu3EsDPOhP7+DOUQhZ+zpANd+n/y3NuXQcvpDOoISm2drGFnSxev3jUyU6mQIDAQABAoIBAAU/6kLHf29EdxDWz0SpwT3PJO4kDpUSdVzQOEjs3XV5bLjq7DKZv+Ddx5yJnznUfw7WzfmwXp4tiQyGtj2C+L5dXwQyRAZcPGZoEAsPQ9+1v07iwRpq+6bbBpX9htSWh9x9SIxDKLiEAAhAfwW8m5HNL9AYh8N2VCSgY/V1Vk3bBUIZ3qBQ4ZgLwqRK6WZLltK+BAuzrjfg+LZHH5TwIQegThBcn09cYHJe1BjH13XZJfL6I57tXsGfvgMuL5RfKwXsfwIMuGyGYSsggmKARjQ+feVBkHqEMBwPIkQUW8hX34tt1ZxN60nFyvM9FM8gIpdxY8dSS9uSV/EwxhnsgN8CgYEAz17AORd+yx7/L2CVW0Po6GoSmlYm7avAAHQAMukLvdlVDq2J088bTho9WcMxL0aBWrbXQ6IJ344fJtVGr373RxfmpeRN4hA6NsRJoBmTt/fdzFavUlcDgez3k8GizcjLn0lLAOruptNoR71D9AmKsDzY/24ZQ6qJ6s9WSewMwqcCgYEAyRZGZrYNz/9qipXKuja5ihWTEgj7ohFnRszX7BDLvyd9zREZCiesKcefFlS8kl6Fi6YCyEYfG5okw3opEftWHsv7zw7xk26tkZBlabqLRYANRGTXSl7wXYw6tcV85xh4NoHaHN/lUUhn7ZGwCskRyddR+kcVQkfvmi9gLPFgAL8CgYBbLo2VTQh6piGNIonp/H1gHKwbYwBxB1FAocEooaKBExw8fQAau3mFKTKK0rJA2F6ulbEn0wtGWobGG4eeSVTP1OmdTjsUyQ/f3wWEuVpjzUCgxgkHSq2HJrxiIwXEOKOYYbDyMVtIzbKPwOAtYTizb7326uF/CHDmZ87IaFvgBwKBgBCtGzuLX4vfV7uUfpKA1VRBQ8gcHJotLU5u0H1QS0VYBhPKljQEZD+2wVe9wUG2OwcAxnxLbGsClofrippmKJc3PXPHfntGk3hd7DsfcEtcOj1wy3Xsd6yaY4gNj7Uuj1Gd5TO90auzAINwMJREZohBphfGa1nq01ELGsO/ZMHLAoGADZ8frcgLVeapnOr1rThbEVLxuTKAq4o8GlGcUqQAskFJrnn5J3/B2MQpShJJO2rCP4p8DNAO7A+cRfsaTtq50aOCbNCTyL+79xqRvTFXQaNZMB1MTL2FG8j/1ycC/yzX2bE4YnPwK60sYk7ac0k4aas+pH1PJheKsNQ2HGSFB/4=
7e04d99f-4022-449f-affd-b08984ebc9d7	8fd86856-4571-461d-b491-218552da0ab0	priority	100
a8139d77-1964-4722-8d1b-4fd4171f9bb0	8fd86856-4571-461d-b491-218552da0ab0	keyUse	ENC
7fc37456-34d8-4c87-ae76-f3a380baf608	8fd86856-4571-461d-b491-218552da0ab0	certificate	MIICmzCCAYMCBgGaEbBZsjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUxMDIzMTUyNzQxWhcNMzUxMDIzMTUyOTIxWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCi43AYdCNSga/M/8AaTcKUCPpRXaLFPe00xgQ4IoyD0FnP65yOXb9kk67Af3n24Eq96GInMLM0J+cziu4wqxaQcmvHB1G0rxvQJALiHtuyYmst7FLNXjP58PGPAzCtPgJYftKiqKGQYQdIUisOHZxMxcF+ZS/k8U6N1M03zyq/TZ+fcSsq/1AvxIemSYC/iW7sQ/qDV2Vn7j5LWUP4abHwZqCZC6rgBAarK+cBo+R5FYAaZy210cxP0UtdLToUzhUJ/CS9ZqowHsBKtMGshvyPx0mBbK7cSwM86E/v4M5RCFn7OkA136f/Lc25dBy+kM6ghKbZ2sYWdLF6/eNTJTqZAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHWk9hMwiDqmGsPrHrLUbDj0p+w/rFUlwKiUGujyrH1aBPf21zwAelnkEOW0Mooc/sO0Wy87XvLD7wcQJAps1zQCPvXHO36sMEBM1MV+8xl62874e7rxIPz4lir1Iey+n4Zj4ZHMP64EskhN6YSkn58VY589LAWfrb4Iiy2ZoW+WK6PjL/3QdCJp+ABjnQGPSHii5ezMCyF8P9nlhdPkdNQMKBmUDg9GJQ0r5sFC4GYpPIWpVjmDUSpc42TD+yaiWWMYitupyEoWoIiz+GdNGxSbvKCiKp1rP4T19qT/iAF9YnkhjkZXpf/hOQ8F/xZs3QZIiLa2p1w0MFnTheeOqLM=
0beb3460-fa66-43b6-99dd-2ecc50706cf6	2ef5d6c2-b80d-418c-970f-a62957b3a050	kid	8e40aba4-a17a-42fc-96cc-fd83fee37d42
a1f8aef7-1686-45bf-b02e-df9a09732b95	2ef5d6c2-b80d-418c-970f-a62957b3a050	priority	100
12f7036a-ac65-413c-b035-80ee14d3b825	2ef5d6c2-b80d-418c-970f-a62957b3a050	secret	bNE6St6O1vfdscPi5MIfOg
c4f9dcf7-dd3a-4268-a1a1-2747a769e347	abbd623d-0b9c-404b-903d-b82dff835c29	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
f71f6116-fc20-4cd8-aa1f-1fab87d5615c	d6356420-7615-4de0-a54b-1735f031509a	kid	872cdd56-feab-4e4a-bc1e-15262f7091b7
7647ca9d-604c-4e70-b608-fb87f16f4f51	d6356420-7615-4de0-a54b-1735f031509a	secret	KoMlO5toarIxRkbd3YlY1DpkF3EizxTOHSIqiDMpBJYhirt53PkBFr_TDxg9MOxJYECEne240zJ2RsdqZ3ZEtRWO6yfLZqvmkzGzcbjwK761c3ZwAb1lMYSOUNJ-EaZYFTuDSkRphqR9BJYi7ekV9_Xq2ubc0kozksbVOXlxr4Q
e74288ac-0a98-4568-9634-d8558d1f6b89	d6356420-7615-4de0-a54b-1735f031509a	priority	100
fb874ce7-41a7-4a64-aaf2-4054db6af073	d6356420-7615-4de0-a54b-1735f031509a	algorithm	HS512
31cb0d06-afe7-4d6d-b7d8-48c4fdb4defc	23a9275a-a7ed-4869-ba6d-f91fbce8bb7d	secret	mx0mNy1LYaBHFF2LOFbc8RUrgJHFBElO75EYua64hkwzaKS_KKgvNTUBZnLVsh42e2RZWBhcRHqn0HBRhoV4u9MxhqfG6GvaKIUG7cVjJwj5S7Pu-NIXc0A_A-0JWFScfy1P_R7h5N7YZOofnAZ9DGxBGiAbdK3mHYBqMYv6aXM
222bd28b-f594-46a9-b571-67e32cc723a0	23a9275a-a7ed-4869-ba6d-f91fbce8bb7d	kid	43f9c0af-28b4-4956-b942-cbe77a39a801
9a3198b9-d3d2-4aff-913f-c2f03a554bf3	23a9275a-a7ed-4869-ba6d-f91fbce8bb7d	priority	100
ba077e8a-42ea-4c51-b50b-3028b7572812	23a9275a-a7ed-4869-ba6d-f91fbce8bb7d	algorithm	HS512
df0e7bb0-edd6-4d10-bb95-66cb307397ef	8a63870f-acad-4657-afdd-64dae4de9968	privateKey	MIIEogIBAAKCAQEA94tBef3JCPyGZ7MjVQTo4YYbEHyF88QtSZIGE6NHPD070V594fp9BNPfJ8jS1pZJnIehAgvO/W+cy7JvyIbUrtaXUY8y1khXysIjvbG0HMMCWd57sTDeYiUjguVc2tnjUZmEKDy9PkbWLGtI47deStPSAlhukgUrHODtO2uNmXZCfOXOVdnwldLVzBWNSPOolM5y3ADA+QUu1b6zGz2oSd1UXCcoMMPzg8mVc2H54zA5f2st8PqyNu1nfNT6GQgk/07N8GY+7WvvnK3SKkJp63/bfTt2FYut+j8aH4oiXap8hLrSADC4hM4UO+NT7vUV4STgNqUNLPjpXTO50J72rwIDAQABAoIBACjIrzV3nB8YZ9Z++6O+xtWdQClDstgaKrHz1n92x75Dgm74x/mqyN06QQpvelkzcpZQ/DR3mJdFw8oFsIgTusfBgDXGR4Rpb9luie/vbrLMaD9BOhTT7deysbqXqmg+PMcNaWots6omhpPT6zLlW6otYuzTAAibxGIiJsPC8RXmxJMwz233JcFsviZkWp6cDSa2skEkTljzroW7hg4CPYlUxOW8OPxR6pypv5zbN9i8GHbnDPEIR3bP1QGjGsufAXi1FR1uTiRL3j3bPpKacBNoNPbsLl1PBLnbFXkCiwI3f8ZWsTQZd0I+GQMyJ0hBU8aGgwLRQj9MugH2OQQOv6kCgYEA+86UdR6VLC/u+MxnhIwR5DhjEXXxECT8wvQCSBghtpMzohMRG6r7Cvyy3cEC5uTRRIUhsz20nHOrT1DnbQ5BnGiw8ftclFDilZCpHZaVeceGA2GSnGmA7M3qC54+NJdEsvItWuwqUQoVZsjPpGnZdx6G8zWuicocnNu71+pzeVcCgYEA+6qA2NX/9TapUtGBji+VOkKy1zmwJ6D/h/SbgLqfh3WGx3s9ddBpa9DBqokiHPDVl8/9TiwmXLjg3gmSGCaCFTnplCdQo2C0xjP088oHUzmUhqbshXgWChHvw2FZHFVsUckevgJbjyPRmgldk2o1DCt2x/NJx0Oi2yXKjpEGHmkCgYAsUeThZFufJmSqV9fUhY7Um3Qca6TdUZVHfwkzxUORzgDlgvOc6hA7k9SroUAwgY+vvrr6wF6ctuMtF7FUCZFUxTx3quVVmZL3/jk14v42K/8Tc0YJz6wIggmyt8x9Fy7ZTDTdbvnXv62apLefWZ4UEERyZD1vNSqqFSbPzw06CwKBgFpgNZso5p05vv7Fy9+yyMU+VJkj11Wz5G//cKR+4HE1zGvwnvajHGiidBn42y5HcnztLUsYYcJkhiRWjYdstMRIotAYekXhoamX2Px/bbf+co8UfNXFdSyymkawu96H8rlAH3EeyaCSvV+yw08AEgLHzQUrIjCT4nUOkjo2bFsZAoGAXccL0FT//lrs5dxWNfL6napJU1YE3p9srnVnCoAOezmoVg4XP97xbuzavMK6Ze4EQBV6X3bfLeJFlfrRlBp+ZhCsID+kyrUAUXsiEJK7SLT2VKavglE1F4akEaYDzruLyStHvT/qWaDI+sc8E9Lz246C88dYH/VnjS3E+fvf+Io=
b0b30fd7-5357-41fe-aa68-604b27b419af	8a63870f-acad-4657-afdd-64dae4de9968	keyUse	SIG
d94463e7-84c7-46f5-a4b6-79f2c143ac06	8a63870f-acad-4657-afdd-64dae4de9968	priority	100
8c687290-33e4-4cd5-8fff-7a086c19cc86	8a63870f-acad-4657-afdd-64dae4de9968	certificate	MIICoTCCAYkCBgGaEcRatzANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAljeWJlcnRyb24wHhcNMjUxMDIzMTU0OTMyWhcNMzUxMDIzMTU1MTEyWjAUMRIwEAYDVQQDDAljeWJlcnRyb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQD3i0F5/ckI/IZnsyNVBOjhhhsQfIXzxC1JkgYTo0c8PTvRXn3h+n0E098nyNLWlkmch6ECC879b5zLsm/IhtSu1pdRjzLWSFfKwiO9sbQcwwJZ3nuxMN5iJSOC5Vza2eNRmYQoPL0+RtYsa0jjt15K09ICWG6SBSsc4O07a42ZdkJ85c5V2fCV0tXMFY1I86iUznLcAMD5BS7VvrMbPahJ3VRcJygww/ODyZVzYfnjMDl/ay3w+rI27Wd81PoZCCT/Ts3wZj7ta++crdIqQmnrf9t9O3YVi636PxofiiJdqnyEutIAMLiEzhQ741Pu9RXhJOA2pQ0s+OldM7nQnvavAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFdK98lqR3bjRdLK3diJybt7BOaWkEdpZfRvhlhtB5c5cE/vrk7FKUMLrtrF5kJ8kA/hEHmexn5XLxvLrcDRSq+SzKgHoCNIzj7hU/IGqjoEDZ+d850CMv91B70nAnDmMTJNTaCUDRgryxJmGbFcI46yyEuit0inH5zZTICIxTd7fnptLanHLIJzra0TkFH19RtvTyvWfDTUHyHTAf1pULN8dJ4vlPF1j9Q52PT0OGTMMJnzJ7AQnYJgNVI7pJs0+adhzDENcDlRRSSRUE4tCOJCVr/1kDAvVGCEbrluctD31Ck94FgySQmwGGAI6LavDOZaxsIWkDuZtBJujbSR8kw=
8c6dc94b-8510-4bb0-9e6c-f0eba033bf74	5caf26f2-f359-4360-abce-0059bbffe541	kid	f166a688-849a-413e-ac4d-8144ec4adf9d
da60534a-77cd-4e19-bb7f-b73eff1bec16	5caf26f2-f359-4360-abce-0059bbffe541	priority	100
ea1c29b2-cba9-4bf6-a119-f146d147a2cd	5caf26f2-f359-4360-abce-0059bbffe541	secret	zAoF5ufKc5jM6eunRFZWFA
55434678-bc5b-40fb-b7f0-642b0e1de263	1a04950e-db1b-4266-bc2f-1ce5f7340dd6	keyUse	ENC
e124a237-d01e-4185-8456-b16fe1d92072	1a04950e-db1b-4266-bc2f-1ce5f7340dd6	privateKey	MIIEpAIBAAKCAQEAwOpztpPxsKSDue4rLo88DBNH404HgvYSXnNfqrbd/x2U8fI7ivyj0GQnzpRvI5XyPsh1LnQWtOyUI5F+8J0hzqdJMhvxB5LEosiiJPyyfaf7PsUCOplGClqCZhRnYX9MEtE1EM7o0MdrxWhV2MBDHk0j3bMrXBvFuMxmKAG3T8TSvjaKQq5HevraiEduM/xQO5Y3W9CaufF0SmPc6PBSpsNZWD5xJqiYe/QvsboSujLR+5d3BeLxJMM2dUXiRM2v5EP8NYpk7pJXoJuJ8SiOnIg9ZbjbCadsP6/82X8dn04rULeiXKE4MHCFcJtoDk8jB8QaS+WZENdLMz5DfTA25QIDAQABAoIBAF1uj2lLQMCBBQ09ROuxUm80vVng1jF+tQnKjfhTxbPDo3oEjAL19e69OyxJZoRRIHh4xIwhjEfG1r5dPqIRMCjyizg6ISO+WP7P9fu86UODYmMVrk0sI6hrCoGe+yzUpsbsTOudklNfaho7PGyUPU2FJcw/dM4Q41Nrp0RUBHCcdpP4E1j2p6zMbcuBqYt6QnldwTMovi+0OODJy67Zd+bH4Epards/1q0pfg4wzZHkohl+pe5rs/f5jURfzJfTLFMZWHj8f+7WlNmTXkafEOoqnHpb4kO4FKjeBXCfUA9HULuYS5Jgn8Mo6P5NXUZFqdrH3BwleXG6O1U7skScdIcCgYEA7NaABdAZh5X3ujIO74K7U3efURdOYMoo1y9fhAYP2nwBUzMTyC5HTKiUNzSJ2KzLTfP6z5i4Yl/+4/+j1VvZGuTuepQK5wnhvEK8VIRmnqYtFoIg0E4B4YlsfE8Kp2e+yhZNyY3ll/3i+MBIczfsrhcs/9A+cg2lWs9t5l0ihhcCgYEA0IY3k9LvNL4VbQwh2MkvfF8MWlmC7/P/oZX16Q3fTlNimPtqk6E3NR0OFsLThFEpAkfQiQsiWh7I4pri9xFffu6qXKb+q/jn24FsJhi7w1OVeMDODhE0qdc/7kHmiZPJ+6INvyd1d7wt+zky/Aji+l7LUdwrxF/+hH2+dFvyBGMCgYAyACcPExwQr+yY9rCIiEUcHgkYiZ8WeBefNnUn3k/ChKOS+RmYDY0n9f80mHbxs6lIT9YHtepXeoTJhdME3Fs9fk+KuW6D0GZD5KL2BO3VWKf0NIzQ7WcgQm8Q328UYKa663KItthd+k/MzGt/R7NEHch2SXSlh5P9VAWTuN3tCQKBgQDNNXiWWjwbzICrawgYHo1DuQogE/zehWHps/loG8XJgBgE809D76Cz/V7zGVIs4e4Yl3Hqm/F3fNo23zRC7m7rLJatTY5M0UvjYe97YlXNeIEdb6iYgWgxSGpa37GvbKiWoTkkCAH7Dk617+lzzI8K06UFb0YHIG0KF/EI878tfwKBgQDZ8hT+ScX/qQfYO47XeLjUcW9iGC8hfy8btQkMfGjY+SAnf7E0qqJ5nLnR24rtOPkvmr9e/H2hKRhKna5b9voC3sj+3Omoim4UTmO0asPRmhkoTmjTBkEfq/V5/WUqe52qV/dR3OTsEW3EivwRdqSfKcaeZ6jg1lSkH2P137ZN7A==
caf49ee2-95b5-4a61-b82b-ec771dd2a379	1a04950e-db1b-4266-bc2f-1ce5f7340dd6	algorithm	RSA-OAEP
62748e39-0751-4852-8cc1-02e6058ef854	1a04950e-db1b-4266-bc2f-1ce5f7340dd6	certificate	MIICoTCCAYkCBgGaEcRa5jANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAljeWJlcnRyb24wHhcNMjUxMDIzMTU0OTMyWhcNMzUxMDIzMTU1MTEyWjAUMRIwEAYDVQQDDAljeWJlcnRyb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDA6nO2k/GwpIO57isujzwME0fjTgeC9hJec1+qtt3/HZTx8juK/KPQZCfOlG8jlfI+yHUudBa07JQjkX7wnSHOp0kyG/EHksSiyKIk/LJ9p/s+xQI6mUYKWoJmFGdhf0wS0TUQzujQx2vFaFXYwEMeTSPdsytcG8W4zGYoAbdPxNK+NopCrkd6+tqIR24z/FA7ljdb0Jq58XRKY9zo8FKmw1lYPnEmqJh79C+xuhK6MtH7l3cF4vEkwzZ1ReJEza/kQ/w1imTuklegm4nxKI6ciD1luNsJp2w/r/zZfx2fTitQt6JcoTgwcIVwm2gOTyMHxBpL5ZkQ10szPkN9MDblAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIUJda1V1XtQyHJ1h2OyKkVuL4ZOYuSPe1lV082aeaia+Nhs+gTOh2MSAGnTYNosB4OJnk/3yizpmA0gN+y1PPhjaF0RQEqcusxpcMOzGJX9/S+ywQiegZ6Ia6FC2qj1og2Jg5MsDowXa0tkBm26PKnJUdROjqTBBGYKzp2BE5pqmBQdAIp9eK6DsFYNuwGQxmkRxwNz3/9LvQPMHiJD+QdJp67AJN72xmAXYvD2vwAWx3N5iIyeCuMOwRZvwllxtjceOtj6YQKm3a7VX6sCtB7T3JV+eUHCt+5cg5OBCFGK50TCL7lNneLgaTE9Lw1kMNd9cdCkzzYDOAqed3muAqM=
dbe202c2-d996-4d72-9236-213aba482e73	1a04950e-db1b-4266-bc2f-1ce5f7340dd6	priority	100
588aab96-a879-4fc6-81db-c4db6964d5ef	65e23f5b-4af2-4977-a8d8-7a664fcb9576	client-uris-must-match	true
8b2cbdca-766a-4c03-b288-e88947c4486a	65e23f5b-4af2-4977-a8d8-7a664fcb9576	host-sending-registration-request-must-match	true
9dbd66d8-8939-4e14-becc-d325065ad61f	6bfe111a-005f-4397-a383-86889d2e0e78	max-clients	200
a3c339f0-2d2e-41de-8807-4a56db4bf4cd	90698849-463c-4eb0-981c-50c73b7563d0	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
3a58c9f7-5c38-473b-8f6a-da7a4465a224	90698849-463c-4eb0-981c-50c73b7563d0	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
da0ef137-c883-4006-b7ff-542a4f8059e2	90698849-463c-4eb0-981c-50c73b7563d0	allowed-protocol-mapper-types	oidc-address-mapper
7d471a06-a2f6-4692-8c99-d141e6649b83	90698849-463c-4eb0-981c-50c73b7563d0	allowed-protocol-mapper-types	oidc-full-name-mapper
afaed7d4-338e-4701-b42b-a898af990f18	90698849-463c-4eb0-981c-50c73b7563d0	allowed-protocol-mapper-types	saml-role-list-mapper
e47de607-f7f2-4338-acce-869e82ccbc75	90698849-463c-4eb0-981c-50c73b7563d0	allowed-protocol-mapper-types	saml-user-property-mapper
c9f46c77-c5c0-490f-afdf-95368381de6e	90698849-463c-4eb0-981c-50c73b7563d0	allowed-protocol-mapper-types	saml-user-attribute-mapper
31ced97d-e04f-47c5-9596-b4e80dae38d5	90698849-463c-4eb0-981c-50c73b7563d0	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
29e3cbec-660a-4654-9b40-1ccfbb3a9721	c6aa068f-bd29-4da0-9fa8-038d123e54a6	allow-default-scopes	true
a5d7a787-43bb-48bf-82de-2416da7a9e8f	1beafc58-23c2-45a6-bb17-6a55c4d3c0dc	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
0e29b015-2044-4a05-a8d7-cd73b384e50a	1beafc58-23c2-45a6-bb17-6a55c4d3c0dc	allowed-protocol-mapper-types	saml-user-attribute-mapper
63f942cc-c570-43d8-b41c-df673d017cbd	1beafc58-23c2-45a6-bb17-6a55c4d3c0dc	allowed-protocol-mapper-types	saml-user-property-mapper
9aa115b2-0408-4dd7-88e9-101bdf38c2f4	1beafc58-23c2-45a6-bb17-6a55c4d3c0dc	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
156f174c-5d18-47fb-b1ba-dd4284c32617	1beafc58-23c2-45a6-bb17-6a55c4d3c0dc	allowed-protocol-mapper-types	saml-role-list-mapper
0d73fd9d-1a7a-43ad-b972-ad250aa32923	1beafc58-23c2-45a6-bb17-6a55c4d3c0dc	allowed-protocol-mapper-types	oidc-full-name-mapper
ace287da-141c-4314-8231-e5bcadff6a21	1beafc58-23c2-45a6-bb17-6a55c4d3c0dc	allowed-protocol-mapper-types	oidc-address-mapper
7de4daf9-f5f9-4525-bce5-6eb600178082	1beafc58-23c2-45a6-bb17-6a55c4d3c0dc	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
1f1ba59d-fce3-48e5-af29-8a84fd8bea41	a6c1c9f5-24ec-4663-b123-8424a4396c88	allow-default-scopes	true
1d4ffa2c-a069-4e2d-8647-66b2a47b912d	2c8745b1-4989-4c2c-bdc5-e252c11b9a0a	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"avatar","displayName":"avatar","validations":{},"annotations":{},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"group":"user-metadata","multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.composite_role (composite, child_role) FROM stdin;
50e164e0-fab9-4fc3-b38d-d220765a2e4b	fa7ba715-60a8-4167-b49b-caf41b5b190b
50e164e0-fab9-4fc3-b38d-d220765a2e4b	d3a98624-9bd7-4f94-b6cd-c66180427c91
50e164e0-fab9-4fc3-b38d-d220765a2e4b	9bae282c-cd43-4ef5-bf16-dda13a1fee69
50e164e0-fab9-4fc3-b38d-d220765a2e4b	c3b1c1a4-43b3-4074-8411-18a72d4aa2be
50e164e0-fab9-4fc3-b38d-d220765a2e4b	f6560faf-7d17-43d9-a953-d8a602e4a3de
50e164e0-fab9-4fc3-b38d-d220765a2e4b	ab900dcd-39d5-4f68-b4a8-516c5142215a
50e164e0-fab9-4fc3-b38d-d220765a2e4b	3f81177e-e8a8-431f-8525-8ebbc1b51c48
50e164e0-fab9-4fc3-b38d-d220765a2e4b	a1ff6823-d0e0-4aa7-a35e-45aed95a901d
50e164e0-fab9-4fc3-b38d-d220765a2e4b	d7ff6d9f-70fb-4176-8c3a-ac42a10dd8f9
50e164e0-fab9-4fc3-b38d-d220765a2e4b	90b4e6f1-3c00-4d97-94ac-9a89ccdef8ce
50e164e0-fab9-4fc3-b38d-d220765a2e4b	5dd36f6d-100a-41be-a690-d5fb17287e4d
50e164e0-fab9-4fc3-b38d-d220765a2e4b	edcaddde-8164-4c0b-bbe2-f2bbc5aa4ed7
50e164e0-fab9-4fc3-b38d-d220765a2e4b	a16a309f-2e57-4254-938e-a46361100e8d
50e164e0-fab9-4fc3-b38d-d220765a2e4b	c9394f77-e473-4008-9216-5932b5c00918
50e164e0-fab9-4fc3-b38d-d220765a2e4b	e2a29b1a-e5ee-41c9-87c9-e40a3933949e
50e164e0-fab9-4fc3-b38d-d220765a2e4b	7adcd8a8-c473-41c5-a5dd-3e0dc16a8244
50e164e0-fab9-4fc3-b38d-d220765a2e4b	4193bc7c-93c3-4adb-836c-3f8a564dda0a
50e164e0-fab9-4fc3-b38d-d220765a2e4b	0f14c635-05a0-4f77-b647-c9570a118312
717a8b0b-1783-4a0e-b122-88e60d263943	daf8a238-26e5-4b43-b08f-a7b834e086cc
c3b1c1a4-43b3-4074-8411-18a72d4aa2be	0f14c635-05a0-4f77-b647-c9570a118312
c3b1c1a4-43b3-4074-8411-18a72d4aa2be	e2a29b1a-e5ee-41c9-87c9-e40a3933949e
f6560faf-7d17-43d9-a953-d8a602e4a3de	7adcd8a8-c473-41c5-a5dd-3e0dc16a8244
717a8b0b-1783-4a0e-b122-88e60d263943	55541bd9-62af-44bf-b498-6db6418abb7d
55541bd9-62af-44bf-b498-6db6418abb7d	b335e34d-5c23-4eed-a338-363609167533
da65a7ef-c66f-42eb-b619-79c3a9ac056e	923a92c5-1889-4b92-8be5-a8e9dd492af9
50e164e0-fab9-4fc3-b38d-d220765a2e4b	5f232e5b-3ba2-49ad-a460-12ce1102d81c
717a8b0b-1783-4a0e-b122-88e60d263943	a1a5e1ad-c4c2-47a9-a7ed-eec53f015dbd
717a8b0b-1783-4a0e-b122-88e60d263943	99fe3168-39a0-41e7-9994-99043e7f7813
50e164e0-fab9-4fc3-b38d-d220765a2e4b	8033b10d-b434-4c12-9e8d-7a2a7c06b4de
50e164e0-fab9-4fc3-b38d-d220765a2e4b	a382784b-2a3e-4835-bbd6-b414c1eaa923
50e164e0-fab9-4fc3-b38d-d220765a2e4b	fb06f290-1e5d-4a1e-830f-b88cc19485ab
50e164e0-fab9-4fc3-b38d-d220765a2e4b	187954f6-159c-4322-bb9e-0f0d1918004e
50e164e0-fab9-4fc3-b38d-d220765a2e4b	2d10c28b-304a-42e8-8f50-54e1c2df8997
50e164e0-fab9-4fc3-b38d-d220765a2e4b	fb5fa4a8-e675-47cc-9f26-280844880c40
50e164e0-fab9-4fc3-b38d-d220765a2e4b	e66ab712-6db1-4d77-90a3-4d97b78ff767
50e164e0-fab9-4fc3-b38d-d220765a2e4b	3801a441-c8fa-42c0-af34-4029fe74d44e
50e164e0-fab9-4fc3-b38d-d220765a2e4b	1ca30d5d-8faa-4e8b-ab51-20c3fae0bf96
50e164e0-fab9-4fc3-b38d-d220765a2e4b	8fb013d9-329f-4550-9d93-a8064cd8429e
50e164e0-fab9-4fc3-b38d-d220765a2e4b	d925ab03-1618-493c-bbbb-79d846af1995
50e164e0-fab9-4fc3-b38d-d220765a2e4b	9e70a4ea-db89-44d8-93d8-2b62dfef229d
50e164e0-fab9-4fc3-b38d-d220765a2e4b	321dc231-5a7f-4be8-a0d1-0affd59d7b47
50e164e0-fab9-4fc3-b38d-d220765a2e4b	c6be0844-4885-4124-a461-972ac0cc79ac
50e164e0-fab9-4fc3-b38d-d220765a2e4b	9ff4c8d3-5f3e-4b98-99b9-ed86621f64f1
50e164e0-fab9-4fc3-b38d-d220765a2e4b	7e247f11-7766-42e4-ab47-0a78a83ce04f
50e164e0-fab9-4fc3-b38d-d220765a2e4b	7859cf59-a3ba-4104-973d-3edeed600af3
187954f6-159c-4322-bb9e-0f0d1918004e	9ff4c8d3-5f3e-4b98-99b9-ed86621f64f1
fb06f290-1e5d-4a1e-830f-b88cc19485ab	7859cf59-a3ba-4104-973d-3edeed600af3
fb06f290-1e5d-4a1e-830f-b88cc19485ab	c6be0844-4885-4124-a461-972ac0cc79ac
96f4f151-6e99-4fd1-b5f0-f23b55a73869	57e8560c-c77b-49ce-a78b-f2c162273b1e
96f4f151-6e99-4fd1-b5f0-f23b55a73869	de9abfce-99f9-4f63-8e72-38cb64ff2f67
96f4f151-6e99-4fd1-b5f0-f23b55a73869	28251415-966f-4d72-8c95-05cb62e0709c
96f4f151-6e99-4fd1-b5f0-f23b55a73869	d1c931e3-62a9-4a4a-a5c1-0d33aa89b6cf
96f4f151-6e99-4fd1-b5f0-f23b55a73869	ce08cbd5-4fcb-4f01-b894-bd359fa64919
96f4f151-6e99-4fd1-b5f0-f23b55a73869	57f85b62-6056-4b04-8c68-bdefb69e852e
96f4f151-6e99-4fd1-b5f0-f23b55a73869	c5c6c5be-810d-4dc2-afd5-fe52e593e9cb
96f4f151-6e99-4fd1-b5f0-f23b55a73869	7dc80d22-2934-48a5-8288-91ca55d56ae6
96f4f151-6e99-4fd1-b5f0-f23b55a73869	5bf42d3a-b2a3-4e9f-a4f9-104ffdf8efde
96f4f151-6e99-4fd1-b5f0-f23b55a73869	1e13da91-3d33-4a9d-8d43-55d6aa73a94e
96f4f151-6e99-4fd1-b5f0-f23b55a73869	2c91802a-c964-4e09-b0fb-b2e2d28d6136
96f4f151-6e99-4fd1-b5f0-f23b55a73869	9db464ab-30b6-4ae4-9b76-ff629909d16b
96f4f151-6e99-4fd1-b5f0-f23b55a73869	6faaf758-f2ef-4420-ac9a-e58599d85ce8
96f4f151-6e99-4fd1-b5f0-f23b55a73869	288ae460-80d3-4f47-9353-2ba384a9d1fb
96f4f151-6e99-4fd1-b5f0-f23b55a73869	1e42efd5-7527-4ef3-b03e-d4facbc20035
96f4f151-6e99-4fd1-b5f0-f23b55a73869	89612d0d-5bf2-4b95-a035-2d589d35bdc3
96f4f151-6e99-4fd1-b5f0-f23b55a73869	a35243d0-0443-498a-aca1-74415d1f1e10
28251415-966f-4d72-8c95-05cb62e0709c	288ae460-80d3-4f47-9353-2ba384a9d1fb
28251415-966f-4d72-8c95-05cb62e0709c	a35243d0-0443-498a-aca1-74415d1f1e10
6d57524f-cdca-41c4-aea3-68a171c93aee	64cfb6bf-5573-4d9b-a857-fbffbd95f583
d1c931e3-62a9-4a4a-a5c1-0d33aa89b6cf	1e42efd5-7527-4ef3-b03e-d4facbc20035
6d57524f-cdca-41c4-aea3-68a171c93aee	4453524b-366c-4c30-81fc-46c11154ff72
4453524b-366c-4c30-81fc-46c11154ff72	7119f133-3a1a-4653-9d87-3378707b433d
563a58a7-447b-4370-a0e5-d8c800a0fd79	fb066a22-248e-4a88-84f9-f2cf2eef6b46
50e164e0-fab9-4fc3-b38d-d220765a2e4b	ab95e173-bc1d-4ee7-8c66-1ece0e373bfe
96f4f151-6e99-4fd1-b5f0-f23b55a73869	0e6918ed-c7c6-4f34-a9fa-a896c055b33f
6d57524f-cdca-41c4-aea3-68a171c93aee	ea8374df-db95-4a44-ae94-c8b6ee75edf8
6d57524f-cdca-41c4-aea3-68a171c93aee	4119b8f4-2ac6-4c3f-bff9-448047d58678
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority, version) FROM stdin;
14bdac79-24c4-4417-950a-f330b3f4ac04	\N	password	7894ab68-ae4a-4537-9040-9c172fd219f3	1761233361508	\N	{"value":"n+N9Ad3tsFWaaqHrXwiLjhh5O1jrXkc84RZFXs02htI=","salt":"7DEZpD3zJ5IvFKE5XupmZA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	0
3797a87c-9e03-412b-a039-d5e436e71284	\N	password	3832d768-00a5-44b9-97cd-9cad93a03dbc	1761234735944	My password	{"value":"8r/pW+8uFp3qVCTs5ytseFm1fX55gBuvtYHLNM7A768=","salt":"JfqdZ4ywP1jh94egxyDXkg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	1
5367a9d3-7328-4cfe-90cb-830eeaba7556	\N	password	ff5df9cb-7dde-4fff-aa1c-c0d5b4fada3b	1761234836581	My password	{"value":"HQ8sgTC2+ciVXGWL1BQlfXxbRFhDGLQnxFDl9K/RstU=","salt":"Z9qIn2rA0XkExdfHuGfNnA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	1
bfd80732-bf14-4ccb-afac-fa1312de7e5b	\N	password	596e6997-44b2-4a53-be0b-d5aa2a233015	1761236148902	My password	{"value":"1Dx/TCgSO+8WPT0la/MTA7B0NtcRWZGODM8Fo19G7Rc=","salt":"p9A3Hvn6uUUNaopXvDKpKg==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	1
d139363d-434a-44c0-859d-e51a48fea8dc	\N	password	4ffde88c-782c-4da4-8ef0-90125d748036	1761269593170	My password	{"value":"evc2L4I1iABkaSyfQXKWyEi/35rog1YvJlmNzeDlzos=","salt":"yQ+wSzsBG3lqVNWohgXakw==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10	1
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2025-10-23 15:29:15.368183	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.33.0	\N	\N	1233352422
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2025-10-23 15:29:15.379801	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.33.0	\N	\N	1233352422
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2025-10-23 15:29:15.403287	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.33.0	\N	\N	1233352422
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2025-10-23 15:29:15.405567	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.33.0	\N	\N	1233352422
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2025-10-23 15:29:15.456995	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.33.0	\N	\N	1233352422
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2025-10-23 15:29:15.460926	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.33.0	\N	\N	1233352422
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2025-10-23 15:29:15.505669	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.33.0	\N	\N	1233352422
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2025-10-23 15:29:15.509569	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.33.0	\N	\N	1233352422
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2025-10-23 15:29:15.513074	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.33.0	\N	\N	1233352422
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2025-10-23 15:29:15.598584	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.33.0	\N	\N	1233352422
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2025-10-23 15:29:15.650463	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.33.0	\N	\N	1233352422
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2025-10-23 15:29:15.653905	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.33.0	\N	\N	1233352422
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2025-10-23 15:29:15.670569	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.33.0	\N	\N	1233352422
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-10-23 15:29:15.691089	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.33.0	\N	\N	1233352422
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-10-23 15:29:15.697826	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	1233352422
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-10-23 15:29:15.702549	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.33.0	\N	\N	1233352422
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2025-10-23 15:29:15.705153	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.33.0	\N	\N	1233352422
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2025-10-23 15:29:15.731442	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.33.0	\N	\N	1233352422
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2025-10-23 15:29:15.762698	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.33.0	\N	\N	1233352422
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2025-10-23 15:29:15.765689	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.33.0	\N	\N	1233352422
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-10-23 15:29:17.844401	119	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.33.0	\N	\N	1233352422
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2025-10-23 15:29:15.767947	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.33.0	\N	\N	1233352422
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2025-10-23 15:29:15.77029	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.33.0	\N	\N	1233352422
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2025-10-23 15:29:15.814654	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.33.0	\N	\N	1233352422
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2025-10-23 15:29:15.817801	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.33.0	\N	\N	1233352422
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2025-10-23 15:29:15.819017	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.33.0	\N	\N	1233352422
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2025-10-23 15:29:16.025896	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.33.0	\N	\N	1233352422
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2025-10-23 15:29:16.060623	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.33.0	\N	\N	1233352422
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2025-10-23 15:29:16.062505	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.33.0	\N	\N	1233352422
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2025-10-23 15:29:16.088812	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.33.0	\N	\N	1233352422
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2025-10-23 15:29:16.097635	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.33.0	\N	\N	1233352422
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2025-10-23 15:29:16.108625	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.33.0	\N	\N	1233352422
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2025-10-23 15:29:16.110926	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.33.0	\N	\N	1233352422
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-10-23 15:29:16.113832	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	1233352422
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-10-23 15:29:16.115295	34	MARK_RAN	9:f9753208029f582525ed12011a19d054	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.33.0	\N	\N	1233352422
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-10-23 15:29:16.128721	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.33.0	\N	\N	1233352422
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2025-10-23 15:29:16.131479	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.33.0	\N	\N	1233352422
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2025-10-23 15:29:16.133808	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.33.0	\N	\N	1233352422
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2025-10-23 15:29:16.135606	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.33.0	\N	\N	1233352422
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2025-10-23 15:29:16.137371	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.33.0	\N	\N	1233352422
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-10-23 15:29:16.138018	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.33.0	\N	\N	1233352422
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-10-23 15:29:16.139201	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.33.0	\N	\N	1233352422
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2025-10-23 15:29:16.142146	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.33.0	\N	\N	1233352422
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2025-10-23 15:29:16.931949	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.33.0	\N	\N	1233352422
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2025-10-23 15:29:16.934189	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.33.0	\N	\N	1233352422
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-10-23 15:29:16.936547	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.33.0	\N	\N	1233352422
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-10-23 15:29:16.938743	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.33.0	\N	\N	1233352422
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-10-23 15:29:16.93953	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.33.0	\N	\N	1233352422
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-10-23 15:29:16.993266	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.33.0	\N	\N	1233352422
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2025-10-23 15:29:16.995538	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.33.0	\N	\N	1233352422
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2025-10-23 15:29:17.010534	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.33.0	\N	\N	1233352422
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2025-10-23 15:29:17.172014	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.33.0	\N	\N	1233352422
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2025-10-23 15:29:17.174672	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	1233352422
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2025-10-23 15:29:17.176622	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.33.0	\N	\N	1233352422
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2025-10-23 15:29:17.17813	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.33.0	\N	\N	1233352422
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-10-23 15:29:17.181383	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.33.0	\N	\N	1233352422
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-10-23 15:29:17.183729	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.33.0	\N	\N	1233352422
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-10-23 15:29:17.206373	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.33.0	\N	\N	1233352422
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2025-10-23 15:29:17.38502	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.33.0	\N	\N	1233352422
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2025-10-23 15:29:17.400132	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.33.0	\N	\N	1233352422
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2025-10-23 15:29:17.402839	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.33.0	\N	\N	1233352422
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-10-23 15:29:17.406252	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.33.0	\N	\N	1233352422
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2025-10-23 15:29:17.408655	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.33.0	\N	\N	1233352422
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2025-10-23 15:29:17.409954	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.33.0	\N	\N	1233352422
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2025-10-23 15:29:17.41135	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.33.0	\N	\N	1233352422
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2025-10-23 15:29:17.41257	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.33.0	\N	\N	1233352422
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2025-10-23 15:29:17.433142	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.33.0	\N	\N	1233352422
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2025-10-23 15:29:17.449383	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.33.0	\N	\N	1233352422
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2025-10-23 15:29:17.45149	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.33.0	\N	\N	1233352422
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2025-10-23 15:29:17.468695	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.33.0	\N	\N	1233352422
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2025-10-23 15:29:17.471406	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.33.0	\N	\N	1233352422
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2025-10-23 15:29:17.473142	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.33.0	\N	\N	1233352422
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-10-23 15:29:17.475521	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.33.0	\N	\N	1233352422
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-10-23 15:29:17.478539	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.33.0	\N	\N	1233352422
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-10-23 15:29:17.479828	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.33.0	\N	\N	1233352422
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-10-23 15:29:17.487474	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.33.0	\N	\N	1233352422
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2025-10-23 15:29:17.505644	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.33.0	\N	\N	1233352422
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-10-23 15:29:17.507388	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.33.0	\N	\N	1233352422
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-10-23 15:29:17.507996	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.33.0	\N	\N	1233352422
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-10-23 15:29:17.516046	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.33.0	\N	\N	1233352422
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2025-10-23 15:29:17.516896	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.33.0	\N	\N	1233352422
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-10-23 15:29:17.533185	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.33.0	\N	\N	1233352422
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-10-23 15:29:17.53418	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.33.0	\N	\N	1233352422
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-10-23 15:29:17.536307	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.33.0	\N	\N	1233352422
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-10-23 15:29:17.536904	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.33.0	\N	\N	1233352422
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2025-10-23 15:29:17.553738	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.33.0	\N	\N	1233352422
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2025-10-23 15:29:17.556126	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.33.0	\N	\N	1233352422
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-10-23 15:29:17.559001	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.33.0	\N	\N	1233352422
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2025-10-23 15:29:17.56444	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.33.0	\N	\N	1233352422
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-23 15:29:17.568133	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.33.0	\N	\N	1233352422
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-23 15:29:17.571799	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.33.0	\N	\N	1233352422
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-23 15:29:17.589143	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	1233352422
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-23 15:29:17.59252	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.33.0	\N	\N	1233352422
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-23 15:29:17.593213	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.33.0	\N	\N	1233352422
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-23 15:29:17.596595	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.33.0	\N	\N	1233352422
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-23 15:29:17.597295	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.33.0	\N	\N	1233352422
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2025-10-23 15:29:17.600218	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.33.0	\N	\N	1233352422
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-10-23 15:29:17.648518	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	1233352422
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-10-23 15:29:17.64941	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	1233352422
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-10-23 15:29:17.656378	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	1233352422
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-10-23 15:29:17.679154	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	1233352422
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-10-23 15:29:17.680312	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	1233352422
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-10-23 15:29:17.709436	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.33.0	\N	\N	1233352422
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2025-10-23 15:29:17.712385	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.33.0	\N	\N	1233352422
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2025-10-23 15:29:17.715498	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.33.0	\N	\N	1233352422
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2025-10-23 15:29:17.733498	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.33.0	\N	\N	1233352422
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2025-10-23 15:29:17.752138	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.33.0	\N	\N	1233352422
18.0.15-30992-index-consent	keycloak	META-INF/jpa-changelog-18.0.15.xml	2025-10-23 15:29:17.773875	107	EXECUTED	9:80071ede7a05604b1f4906f3bf3b00f0	createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE		\N	4.33.0	\N	\N	1233352422
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2025-10-23 15:29:17.776388	108	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.33.0	\N	\N	1233352422
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-10-23 15:29:17.79572	109	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.33.0	\N	\N	1233352422
20.0.0-12964-supported-dbs-edb-migration	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-10-23 15:29:17.817979	110	EXECUTED	9:a6b18a8e38062df5793edbe064f4aecd	dropIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE; createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.33.0	\N	\N	1233352422
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-10-23 15:29:17.819139	111	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.33.0	\N	\N	1233352422
client-attributes-string-accomodation-fixed-pre-drop-index	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-10-23 15:29:17.821582	112	EXECUTED	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	1233352422
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-10-23 15:29:17.82448	113	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	1233352422
client-attributes-string-accomodation-fixed-post-create-index	keycloak	META-INF/jpa-changelog-20.0.0.xml	2025-10-23 15:29:17.825381	114	MARK_RAN	9:bd2bd0fc7768cf0845ac96a8786fa735	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	1233352422
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2025-10-23 15:29:17.827475	115	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.33.0	\N	\N	1233352422
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-10-23 15:29:17.839628	116	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.33.0	\N	\N	1233352422
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2025-10-23 15:29:17.841274	117	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.33.0	\N	\N	1233352422
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2025-10-23 15:29:17.843805	118	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.33.0	\N	\N	1233352422
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-10-23 15:29:17.846475	120	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.33.0	\N	\N	1233352422
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2025-10-23 15:29:17.847745	121	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.33.0	\N	\N	1233352422
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-10-23 15:29:17.911461	122	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.33.0	\N	\N	1233352422
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-10-23 15:29:17.91339	123	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.33.0	\N	\N	1233352422
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-10-23 15:29:17.915987	124	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	1233352422
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-10-23 15:29:17.93169	125	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	1233352422
24.0.0-26618-edb-migration	keycloak	META-INF/jpa-changelog-24.0.0.xml	2025-10-23 15:29:17.950749	126	EXECUTED	9:2f684b29d414cd47efe3a3599f390741	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES; createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	1233352422
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-10-23 15:29:17.953186	127	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.33.0	\N	\N	1233352422
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-10-23 15:29:17.95399	128	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	1233352422
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2025-10-23 15:29:17.95486	129	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.33.0	\N	\N	1233352422
25.0.0-28265-tables	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-23 15:29:17.957241	130	EXECUTED	9:deda2df035df23388af95bbd36c17cef	addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION		\N	4.33.0	\N	\N	1233352422
25.0.0-28265-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-23 15:29:17.974086	131	EXECUTED	9:3e96709818458ae49f3c679ae58d263a	createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	1233352422
25.0.0-28265-index-cleanup-uss-createdon	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-23 15:29:17.978347	132	EXECUTED	9:78ab4fc129ed5e8265dbcc3485fba92f	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	1233352422
25.0.0-28265-index-cleanup-uss-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-23 15:29:17.981662	133	EXECUTED	9:de5f7c1f7e10994ed8b62e621d20eaab	dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	1233352422
25.0.0-28265-index-cleanup-uss-by-usersess	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-23 15:29:17.985798	134	EXECUTED	9:6eee220d024e38e89c799417ec33667f	dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	1233352422
25.0.0-28265-index-cleanup-css-preload	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-23 15:29:17.990149	135	EXECUTED	9:5411d2fb2891d3e8d63ddb55dfa3c0c9	dropIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION		\N	4.33.0	\N	\N	1233352422
25.0.0-28265-index-2-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-23 15:29:17.990943	136	MARK_RAN	9:b7ef76036d3126bb83c2423bf4d449d6	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	1233352422
25.0.0-28265-index-2-not-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-23 15:29:18.007599	137	EXECUTED	9:23396cf51ab8bc1ae6f0cac7f9f6fcf7	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.33.0	\N	\N	1233352422
25.0.0-org	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-23 15:29:18.014654	138	EXECUTED	9:5c859965c2c9b9c72136c360649af157	createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN		\N	4.33.0	\N	\N	1233352422
unique-consentuser	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-23 15:29:18.019417	139	EXECUTED	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.33.0	\N	\N	1233352422
unique-consentuser-edb-migration	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-23 15:29:18.0234	140	MARK_RAN	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.33.0	\N	\N	1233352422
unique-consentuser-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-23 15:29:18.02454	141	MARK_RAN	9:b79478aad5adaa1bc428e31563f55e8e	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.33.0	\N	\N	1233352422
25.0.0-28861-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2025-10-23 15:29:18.061114	142	EXECUTED	9:b9acb58ac958d9ada0fe12a5d4794ab1	createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET		\N	4.33.0	\N	\N	1233352422
26.0.0-org-alias	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-23 15:29:18.065397	143	EXECUTED	9:6ef7d63e4412b3c2d66ed179159886a4	addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG		\N	4.33.0	\N	\N	1233352422
26.0.0-org-group	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-23 15:29:18.068652	144	EXECUTED	9:da8e8087d80ef2ace4f89d8c5b9ca223	addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange		\N	4.33.0	\N	\N	1233352422
26.0.0-org-indexes	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-23 15:29:18.085888	145	EXECUTED	9:79b05dcd610a8c7f25ec05135eec0857	createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN		\N	4.33.0	\N	\N	1233352422
26.0.0-org-group-membership	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-23 15:29:18.088529	146	EXECUTED	9:a6ace2ce583a421d89b01ba2a28dc2d4	addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP		\N	4.33.0	\N	\N	1233352422
31296-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-23 15:29:18.091849	147	EXECUTED	9:64ef94489d42a358e8304b0e245f0ed4	createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN		\N	4.33.0	\N	\N	1233352422
31725-index-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-23 15:29:18.109218	148	EXECUTED	9:b994246ec2bf7c94da881e1d28782c7b	createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN		\N	4.33.0	\N	\N	1233352422
26.0.0-idps-for-login	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-23 15:29:18.142738	149	EXECUTED	9:51f5fffadf986983d4bd59582c6c1604	addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange		\N	4.33.0	\N	\N	1233352422
26.0.0-32583-drop-redundant-index-on-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-23 15:29:18.146412	150	EXECUTED	9:24972d83bf27317a055d234187bb4af9	dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION		\N	4.33.0	\N	\N	1233352422
26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-23 15:29:18.15199	151	EXECUTED	9:febdc0f47f2ed241c59e60f58c3ceea5	dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...		\N	4.33.0	\N	\N	1233352422
26.0.0-33201-org-redirect-url	keycloak	META-INF/jpa-changelog-26.0.0.xml	2025-10-23 15:29:18.153456	152	EXECUTED	9:4d0e22b0ac68ebe9794fa9cb752ea660	addColumn tableName=ORG		\N	4.33.0	\N	\N	1233352422
29399-jdbc-ping-default	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-10-23 15:29:18.157331	153	EXECUTED	9:007dbe99d7203fca403b89d4edfdf21e	createTable tableName=JGROUPS_PING; addPrimaryKey constraintName=CONSTRAINT_JGROUPS_PING, tableName=JGROUPS_PING		\N	4.33.0	\N	\N	1233352422
26.1.0-34013	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-10-23 15:29:18.160488	154	EXECUTED	9:e6b686a15759aef99a6d758a5c4c6a26	addColumn tableName=ADMIN_EVENT_ENTITY		\N	4.33.0	\N	\N	1233352422
26.1.0-34380	keycloak	META-INF/jpa-changelog-26.1.0.xml	2025-10-23 15:29:18.162341	155	EXECUTED	9:ac8b9edb7c2b6c17a1c7a11fcf5ccf01	dropTable tableName=USERNAME_LOGIN_FAILURE		\N	4.33.0	\N	\N	1233352422
26.2.0-36750	keycloak	META-INF/jpa-changelog-26.2.0.xml	2025-10-23 15:29:18.168102	156	EXECUTED	9:b49ce951c22f7eb16480ff085640a33a	createTable tableName=SERVER_CONFIG		\N	4.33.0	\N	\N	1233352422
26.2.0-26106	keycloak	META-INF/jpa-changelog-26.2.0.xml	2025-10-23 15:29:18.169753	157	EXECUTED	9:b5877d5dab7d10ff3a9d209d7beb6680	addColumn tableName=CREDENTIAL		\N	4.33.0	\N	\N	1233352422
26.2.6-39866-duplicate	keycloak	META-INF/jpa-changelog-26.2.6.xml	2025-10-23 15:29:18.171623	158	EXECUTED	9:1dc67ccee24f30331db2cba4f372e40e	customChange		\N	4.33.0	\N	\N	1233352422
26.2.6-39866-uk	keycloak	META-INF/jpa-changelog-26.2.6.xml	2025-10-23 15:29:18.174929	159	EXECUTED	9:b70b76f47210cf0a5f4ef0e219eac7cd	addUniqueConstraint constraintName=UK_MIGRATION_VERSION, tableName=MIGRATION_MODEL		\N	4.33.0	\N	\N	1233352422
26.2.6-40088-duplicate	keycloak	META-INF/jpa-changelog-26.2.6.xml	2025-10-23 15:29:18.177253	160	EXECUTED	9:cc7e02ed69ab31979afb1982f9670e8f	customChange		\N	4.33.0	\N	\N	1233352422
26.2.6-40088-uk	keycloak	META-INF/jpa-changelog-26.2.6.xml	2025-10-23 15:29:18.179411	161	EXECUTED	9:5bb848128da7bc4595cc507383325241	addUniqueConstraint constraintName=UK_MIGRATION_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.33.0	\N	\N	1233352422
26.3.0-groups-description	keycloak	META-INF/jpa-changelog-26.3.0.xml	2025-10-23 15:29:18.181743	162	EXECUTED	9:e1a3c05574326fb5b246b73b9a4c4d49	addColumn tableName=KEYCLOAK_GROUP		\N	4.33.0	\N	\N	1233352422
26.4.0-40933-saml-encryption-attributes	keycloak	META-INF/jpa-changelog-26.4.0.xml	2025-10-23 15:29:18.183512	163	EXECUTED	9:7e9eaba362ca105efdda202303a4fe49	customChange		\N	4.33.0	\N	\N	1233352422
26.4.0-51321	keycloak	META-INF/jpa-changelog-26.4.0.xml	2025-10-23 15:29:18.199203	164	EXECUTED	9:34bab2bc56f75ffd7e347c580874e306	createIndex indexName=IDX_EVENT_ENTITY_USER_ID_TYPE, tableName=EVENT_ENTITY		\N	4.33.0	\N	\N	1233352422
40343-workflow-state-table	keycloak	META-INF/jpa-changelog-26.4.0.xml	2025-10-23 15:29:18.230311	165	EXECUTED	9:ed3ab4723ceed210e5b5e60ac4562106	createTable tableName=WORKFLOW_STATE; addPrimaryKey constraintName=PK_WORKFLOW_STATE, tableName=WORKFLOW_STATE; addUniqueConstraint constraintName=UQ_WORKFLOW_RESOURCE, tableName=WORKFLOW_STATE; createIndex indexName=IDX_WORKFLOW_STATE_STEP, table...		\N	4.33.0	\N	\N	1233352422
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
3654cfb9-0034-4bee-8aff-6eda67a58466	3874bf67-328a-4917-9df4-ac164d67b77c	f
3654cfb9-0034-4bee-8aff-6eda67a58466	5c26e757-67c2-4720-a814-4ebabb0a6210	t
3654cfb9-0034-4bee-8aff-6eda67a58466	4728e71f-43f1-4c3c-ad5d-c15dbbce2dca	t
3654cfb9-0034-4bee-8aff-6eda67a58466	c264dda0-e318-45ee-a306-70be7092dba3	t
3654cfb9-0034-4bee-8aff-6eda67a58466	2a3cac96-2576-4c97-8337-ee31009a0345	t
3654cfb9-0034-4bee-8aff-6eda67a58466	9321628e-4b0b-409d-bb14-b8489607bbbf	f
3654cfb9-0034-4bee-8aff-6eda67a58466	1a06a005-a31c-46a8-83ee-c552d1f4b404	f
3654cfb9-0034-4bee-8aff-6eda67a58466	55db265b-d032-4e89-9bf4-ca5a6edf3475	t
3654cfb9-0034-4bee-8aff-6eda67a58466	da9201a2-3505-4155-b915-8250bf1e165f	t
3654cfb9-0034-4bee-8aff-6eda67a58466	576e255e-0f89-4ea7-b41a-a3bb8ad8cf74	f
3654cfb9-0034-4bee-8aff-6eda67a58466	71569b96-9de3-4a9f-a059-5d70ac43fbc7	t
3654cfb9-0034-4bee-8aff-6eda67a58466	dfad6d2d-c551-4718-bc90-0cfa1756886d	t
3654cfb9-0034-4bee-8aff-6eda67a58466	6bee678a-b327-4c07-afbf-893e78617e99	f
17787da5-ff56-48dc-a36a-2700dec08b2e	ab082a91-1118-4ee4-b8a7-f8fff22c90b1	f
17787da5-ff56-48dc-a36a-2700dec08b2e	a08596a3-2f56-48e3-a6c2-3f677abc04fe	t
17787da5-ff56-48dc-a36a-2700dec08b2e	e388c5c7-b269-4718-a04a-eaa6fe2b180b	t
17787da5-ff56-48dc-a36a-2700dec08b2e	277c44f2-6c48-4b50-b577-64e2af58aa69	t
17787da5-ff56-48dc-a36a-2700dec08b2e	7bac0196-400a-44b6-ac9a-f49157068235	t
17787da5-ff56-48dc-a36a-2700dec08b2e	77e3bae2-5cc2-4c58-a3ab-51e86e61b0b5	f
17787da5-ff56-48dc-a36a-2700dec08b2e	bc10061e-fe2b-4d9b-b714-cb9d62a4a688	f
17787da5-ff56-48dc-a36a-2700dec08b2e	8fc4d791-7889-4198-8d26-4fddd2a21202	t
17787da5-ff56-48dc-a36a-2700dec08b2e	5cc4aa6f-da39-4c9c-98c8-a51c5a23132b	t
17787da5-ff56-48dc-a36a-2700dec08b2e	e93611eb-33d1-455d-a48b-e70253cce5ff	f
17787da5-ff56-48dc-a36a-2700dec08b2e	e3a574d9-4a36-40a7-9807-c881b9f17bb2	t
17787da5-ff56-48dc-a36a-2700dec08b2e	d6dab1fe-4572-40c2-8616-9f4bd1656511	t
17787da5-ff56-48dc-a36a-2700dec08b2e	38a104e9-a8ed-42d5-ad2d-238f6f2719f3	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only, organization_id, hide_on_login) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: jgroups_ping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.jgroups_ping (address, name, cluster_name, ip, coord) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.keycloak_group (id, name, parent_group, realm_id, type, description) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
717a8b0b-1783-4a0e-b122-88e60d263943	3654cfb9-0034-4bee-8aff-6eda67a58466	f	${role_default-roles}	default-roles-master	3654cfb9-0034-4bee-8aff-6eda67a58466	\N	\N
50e164e0-fab9-4fc3-b38d-d220765a2e4b	3654cfb9-0034-4bee-8aff-6eda67a58466	f	${role_admin}	admin	3654cfb9-0034-4bee-8aff-6eda67a58466	\N	\N
fa7ba715-60a8-4167-b49b-caf41b5b190b	3654cfb9-0034-4bee-8aff-6eda67a58466	f	${role_create-realm}	create-realm	3654cfb9-0034-4bee-8aff-6eda67a58466	\N	\N
d3a98624-9bd7-4f94-b6cd-c66180427c91	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_create-client}	create-client	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
9bae282c-cd43-4ef5-bf16-dda13a1fee69	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_view-realm}	view-realm	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
c3b1c1a4-43b3-4074-8411-18a72d4aa2be	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_view-users}	view-users	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
f6560faf-7d17-43d9-a953-d8a602e4a3de	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_view-clients}	view-clients	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
ab900dcd-39d5-4f68-b4a8-516c5142215a	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_view-events}	view-events	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
3f81177e-e8a8-431f-8525-8ebbc1b51c48	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_view-identity-providers}	view-identity-providers	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
a1ff6823-d0e0-4aa7-a35e-45aed95a901d	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_view-authorization}	view-authorization	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
d7ff6d9f-70fb-4176-8c3a-ac42a10dd8f9	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_manage-realm}	manage-realm	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
90b4e6f1-3c00-4d97-94ac-9a89ccdef8ce	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_manage-users}	manage-users	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
5dd36f6d-100a-41be-a690-d5fb17287e4d	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_manage-clients}	manage-clients	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
edcaddde-8164-4c0b-bbe2-f2bbc5aa4ed7	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_manage-events}	manage-events	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
a16a309f-2e57-4254-938e-a46361100e8d	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_manage-identity-providers}	manage-identity-providers	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
c9394f77-e473-4008-9216-5932b5c00918	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_manage-authorization}	manage-authorization	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
e2a29b1a-e5ee-41c9-87c9-e40a3933949e	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_query-users}	query-users	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
7adcd8a8-c473-41c5-a5dd-3e0dc16a8244	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_query-clients}	query-clients	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
4193bc7c-93c3-4adb-836c-3f8a564dda0a	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_query-realms}	query-realms	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
0f14c635-05a0-4f77-b647-c9570a118312	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_query-groups}	query-groups	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
daf8a238-26e5-4b43-b08f-a7b834e086cc	2f78cfee-7416-429f-8463-7b84b102a6ff	t	${role_view-profile}	view-profile	3654cfb9-0034-4bee-8aff-6eda67a58466	2f78cfee-7416-429f-8463-7b84b102a6ff	\N
55541bd9-62af-44bf-b498-6db6418abb7d	2f78cfee-7416-429f-8463-7b84b102a6ff	t	${role_manage-account}	manage-account	3654cfb9-0034-4bee-8aff-6eda67a58466	2f78cfee-7416-429f-8463-7b84b102a6ff	\N
b335e34d-5c23-4eed-a338-363609167533	2f78cfee-7416-429f-8463-7b84b102a6ff	t	${role_manage-account-links}	manage-account-links	3654cfb9-0034-4bee-8aff-6eda67a58466	2f78cfee-7416-429f-8463-7b84b102a6ff	\N
a1f541f9-7fdd-4a78-bfde-c14d50ef9443	2f78cfee-7416-429f-8463-7b84b102a6ff	t	${role_view-applications}	view-applications	3654cfb9-0034-4bee-8aff-6eda67a58466	2f78cfee-7416-429f-8463-7b84b102a6ff	\N
923a92c5-1889-4b92-8be5-a8e9dd492af9	2f78cfee-7416-429f-8463-7b84b102a6ff	t	${role_view-consent}	view-consent	3654cfb9-0034-4bee-8aff-6eda67a58466	2f78cfee-7416-429f-8463-7b84b102a6ff	\N
da65a7ef-c66f-42eb-b619-79c3a9ac056e	2f78cfee-7416-429f-8463-7b84b102a6ff	t	${role_manage-consent}	manage-consent	3654cfb9-0034-4bee-8aff-6eda67a58466	2f78cfee-7416-429f-8463-7b84b102a6ff	\N
b7b9ef10-cda6-471a-bbd8-53562d9bf9a2	2f78cfee-7416-429f-8463-7b84b102a6ff	t	${role_view-groups}	view-groups	3654cfb9-0034-4bee-8aff-6eda67a58466	2f78cfee-7416-429f-8463-7b84b102a6ff	\N
961cb80e-9178-45ee-b004-450ff59fb6b8	2f78cfee-7416-429f-8463-7b84b102a6ff	t	${role_delete-account}	delete-account	3654cfb9-0034-4bee-8aff-6eda67a58466	2f78cfee-7416-429f-8463-7b84b102a6ff	\N
846e7410-7de8-4e95-9a6b-e416c3cc8558	5be60e83-8e73-4288-884a-94e97783d931	t	${role_read-token}	read-token	3654cfb9-0034-4bee-8aff-6eda67a58466	5be60e83-8e73-4288-884a-94e97783d931	\N
5f232e5b-3ba2-49ad-a460-12ce1102d81c	2ff86fec-3d01-4f46-ae60-06b6ae320749	t	${role_impersonation}	impersonation	3654cfb9-0034-4bee-8aff-6eda67a58466	2ff86fec-3d01-4f46-ae60-06b6ae320749	\N
a1a5e1ad-c4c2-47a9-a7ed-eec53f015dbd	3654cfb9-0034-4bee-8aff-6eda67a58466	f	${role_offline-access}	offline_access	3654cfb9-0034-4bee-8aff-6eda67a58466	\N	\N
99fe3168-39a0-41e7-9994-99043e7f7813	3654cfb9-0034-4bee-8aff-6eda67a58466	f	${role_uma_authorization}	uma_authorization	3654cfb9-0034-4bee-8aff-6eda67a58466	\N	\N
6d57524f-cdca-41c4-aea3-68a171c93aee	17787da5-ff56-48dc-a36a-2700dec08b2e	f	${role_default-roles}	default-roles-cybertron	17787da5-ff56-48dc-a36a-2700dec08b2e	\N	\N
8033b10d-b434-4c12-9e8d-7a2a7c06b4de	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_create-client}	create-client	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
a382784b-2a3e-4835-bbd6-b414c1eaa923	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_view-realm}	view-realm	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
fb06f290-1e5d-4a1e-830f-b88cc19485ab	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_view-users}	view-users	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
187954f6-159c-4322-bb9e-0f0d1918004e	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_view-clients}	view-clients	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
2d10c28b-304a-42e8-8f50-54e1c2df8997	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_view-events}	view-events	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
fb5fa4a8-e675-47cc-9f26-280844880c40	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_view-identity-providers}	view-identity-providers	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
e66ab712-6db1-4d77-90a3-4d97b78ff767	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_view-authorization}	view-authorization	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
3801a441-c8fa-42c0-af34-4029fe74d44e	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_manage-realm}	manage-realm	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
1ca30d5d-8faa-4e8b-ab51-20c3fae0bf96	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_manage-users}	manage-users	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
8fb013d9-329f-4550-9d93-a8064cd8429e	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_manage-clients}	manage-clients	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
d925ab03-1618-493c-bbbb-79d846af1995	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_manage-events}	manage-events	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
9e70a4ea-db89-44d8-93d8-2b62dfef229d	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_manage-identity-providers}	manage-identity-providers	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
321dc231-5a7f-4be8-a0d1-0affd59d7b47	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_manage-authorization}	manage-authorization	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
c6be0844-4885-4124-a461-972ac0cc79ac	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_query-users}	query-users	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
9ff4c8d3-5f3e-4b98-99b9-ed86621f64f1	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_query-clients}	query-clients	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
7e247f11-7766-42e4-ab47-0a78a83ce04f	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_query-realms}	query-realms	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
7859cf59-a3ba-4104-973d-3edeed600af3	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_query-groups}	query-groups	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
96f4f151-6e99-4fd1-b5f0-f23b55a73869	6becd912-7640-41a5-a651-31867bef9c44	t	${role_realm-admin}	realm-admin	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
57e8560c-c77b-49ce-a78b-f2c162273b1e	6becd912-7640-41a5-a651-31867bef9c44	t	${role_create-client}	create-client	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
de9abfce-99f9-4f63-8e72-38cb64ff2f67	6becd912-7640-41a5-a651-31867bef9c44	t	${role_view-realm}	view-realm	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
28251415-966f-4d72-8c95-05cb62e0709c	6becd912-7640-41a5-a651-31867bef9c44	t	${role_view-users}	view-users	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
d1c931e3-62a9-4a4a-a5c1-0d33aa89b6cf	6becd912-7640-41a5-a651-31867bef9c44	t	${role_view-clients}	view-clients	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
ce08cbd5-4fcb-4f01-b894-bd359fa64919	6becd912-7640-41a5-a651-31867bef9c44	t	${role_view-events}	view-events	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
57f85b62-6056-4b04-8c68-bdefb69e852e	6becd912-7640-41a5-a651-31867bef9c44	t	${role_view-identity-providers}	view-identity-providers	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
c5c6c5be-810d-4dc2-afd5-fe52e593e9cb	6becd912-7640-41a5-a651-31867bef9c44	t	${role_view-authorization}	view-authorization	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
7dc80d22-2934-48a5-8288-91ca55d56ae6	6becd912-7640-41a5-a651-31867bef9c44	t	${role_manage-realm}	manage-realm	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
5bf42d3a-b2a3-4e9f-a4f9-104ffdf8efde	6becd912-7640-41a5-a651-31867bef9c44	t	${role_manage-users}	manage-users	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
1e13da91-3d33-4a9d-8d43-55d6aa73a94e	6becd912-7640-41a5-a651-31867bef9c44	t	${role_manage-clients}	manage-clients	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
2c91802a-c964-4e09-b0fb-b2e2d28d6136	6becd912-7640-41a5-a651-31867bef9c44	t	${role_manage-events}	manage-events	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
9db464ab-30b6-4ae4-9b76-ff629909d16b	6becd912-7640-41a5-a651-31867bef9c44	t	${role_manage-identity-providers}	manage-identity-providers	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
6faaf758-f2ef-4420-ac9a-e58599d85ce8	6becd912-7640-41a5-a651-31867bef9c44	t	${role_manage-authorization}	manage-authorization	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
288ae460-80d3-4f47-9353-2ba384a9d1fb	6becd912-7640-41a5-a651-31867bef9c44	t	${role_query-users}	query-users	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
1e42efd5-7527-4ef3-b03e-d4facbc20035	6becd912-7640-41a5-a651-31867bef9c44	t	${role_query-clients}	query-clients	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
89612d0d-5bf2-4b95-a035-2d589d35bdc3	6becd912-7640-41a5-a651-31867bef9c44	t	${role_query-realms}	query-realms	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
a35243d0-0443-498a-aca1-74415d1f1e10	6becd912-7640-41a5-a651-31867bef9c44	t	${role_query-groups}	query-groups	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
64cfb6bf-5573-4d9b-a857-fbffbd95f583	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	t	${role_view-profile}	view-profile	17787da5-ff56-48dc-a36a-2700dec08b2e	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	\N
4453524b-366c-4c30-81fc-46c11154ff72	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	t	${role_manage-account}	manage-account	17787da5-ff56-48dc-a36a-2700dec08b2e	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	\N
7119f133-3a1a-4653-9d87-3378707b433d	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	t	${role_manage-account-links}	manage-account-links	17787da5-ff56-48dc-a36a-2700dec08b2e	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	\N
06d04b4f-e04b-4e1f-86cc-9e9cc2d08da8	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	t	${role_view-applications}	view-applications	17787da5-ff56-48dc-a36a-2700dec08b2e	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	\N
fb066a22-248e-4a88-84f9-f2cf2eef6b46	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	t	${role_view-consent}	view-consent	17787da5-ff56-48dc-a36a-2700dec08b2e	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	\N
563a58a7-447b-4370-a0e5-d8c800a0fd79	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	t	${role_manage-consent}	manage-consent	17787da5-ff56-48dc-a36a-2700dec08b2e	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	\N
6d39b0c5-737e-4681-b099-3a877bc5ffd6	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	t	${role_view-groups}	view-groups	17787da5-ff56-48dc-a36a-2700dec08b2e	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	\N
5c596431-4536-4767-afa4-192a1513a362	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	t	${role_delete-account}	delete-account	17787da5-ff56-48dc-a36a-2700dec08b2e	1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	\N
ab95e173-bc1d-4ee7-8c66-1ece0e373bfe	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	t	${role_impersonation}	impersonation	3654cfb9-0034-4bee-8aff-6eda67a58466	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	\N
0e6918ed-c7c6-4f34-a9fa-a896c055b33f	6becd912-7640-41a5-a651-31867bef9c44	t	${role_impersonation}	impersonation	17787da5-ff56-48dc-a36a-2700dec08b2e	6becd912-7640-41a5-a651-31867bef9c44	\N
2660f000-ab00-4f6e-afbf-205b003ddf2f	318063f8-35b7-481e-87c0-b23d5337e35f	t	${role_read-token}	read-token	17787da5-ff56-48dc-a36a-2700dec08b2e	318063f8-35b7-481e-87c0-b23d5337e35f	\N
ea8374df-db95-4a44-ae94-c8b6ee75edf8	17787da5-ff56-48dc-a36a-2700dec08b2e	f	${role_offline-access}	offline_access	17787da5-ff56-48dc-a36a-2700dec08b2e	\N	\N
4119b8f4-2ac6-4c3f-bff9-448047d58678	17787da5-ff56-48dc-a36a-2700dec08b2e	f	${role_uma_authorization}	uma_authorization	17787da5-ff56-48dc-a36a-2700dec08b2e	\N	\N
a3d6d9b6-6026-4f83-91d3-84e73adc72d2	17787da5-ff56-48dc-a36a-2700dec08b2e	f	my custom role	myrole	17787da5-ff56-48dc-a36a-2700dec08b2e	\N	\N
a8f0983c-e97e-494d-8cb8-22fbe54499eb	12b20603-24ee-4e3c-8fa9-124de5bde364	t	\N	uma_protection	17787da5-ff56-48dc-a36a-2700dec08b2e	12b20603-24ee-4e3c-8fa9-124de5bde364	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.migration_model (id, version, update_time) FROM stdin;
e4lsx	26.4.2	1761233360
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
\.


--
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.org (id, enabled, realm_id, group_id, name, description, alias, redirect_url) FROM stdin;
\.


--
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.org_domain (id, name, verified, org_id) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
222cd178-1594-4cfe-81e1-53cb5e4ffc22	audience resolve	openid-connect	oidc-audience-resolve-mapper	50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	\N
24504a3e-8582-4c22-aea1-31709cae36b5	locale	openid-connect	oidc-usermodel-attribute-mapper	8b0f1494-a2c8-4184-a246-1791bd30192e	\N
974ed3d7-84f3-4878-bedc-b7551a7fc770	role list	saml	saml-role-list-mapper	\N	5c26e757-67c2-4720-a814-4ebabb0a6210
3bc6b74c-67d0-4002-b860-375c24105515	organization	saml	saml-organization-membership-mapper	\N	4728e71f-43f1-4c3c-ad5d-c15dbbce2dca
0f60d2f5-2fbe-40f4-ad23-9901bd23fcf3	full name	openid-connect	oidc-full-name-mapper	\N	c264dda0-e318-45ee-a306-70be7092dba3
075741ba-31ea-4d49-ba92-d42e88772e06	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	c264dda0-e318-45ee-a306-70be7092dba3
0c3ec022-0436-4f96-8703-b8e910b1d88e	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	c264dda0-e318-45ee-a306-70be7092dba3
ad74e48d-f3b4-4a6b-93f8-2e17099c44cf	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	c264dda0-e318-45ee-a306-70be7092dba3
e6db79b2-4302-40d5-bbdb-b468409fd19f	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	c264dda0-e318-45ee-a306-70be7092dba3
a3000770-3041-4ebd-9fb2-6eb87ef4f96e	username	openid-connect	oidc-usermodel-attribute-mapper	\N	c264dda0-e318-45ee-a306-70be7092dba3
9dcff00f-3aee-4224-94a7-410bb1df630a	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	c264dda0-e318-45ee-a306-70be7092dba3
def98e82-a8ce-417d-9411-2ac602bd21fd	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	c264dda0-e318-45ee-a306-70be7092dba3
f420af7d-b99d-4611-a9a4-60152179235e	website	openid-connect	oidc-usermodel-attribute-mapper	\N	c264dda0-e318-45ee-a306-70be7092dba3
a09f17e5-6b25-41f9-9dbf-a8e28c2abc5f	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	c264dda0-e318-45ee-a306-70be7092dba3
7ce75bed-76fd-4f4e-ab9a-e0942fa116fa	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	c264dda0-e318-45ee-a306-70be7092dba3
19e926fd-74de-4739-b7ff-1f318f8109d5	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	c264dda0-e318-45ee-a306-70be7092dba3
54142519-bb72-46ba-815a-05e956477893	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	c264dda0-e318-45ee-a306-70be7092dba3
458d2365-2262-4214-ba3c-4029f9dfb260	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	c264dda0-e318-45ee-a306-70be7092dba3
0d813204-e611-4a80-9564-03bf13c0af9f	email	openid-connect	oidc-usermodel-attribute-mapper	\N	2a3cac96-2576-4c97-8337-ee31009a0345
af194a49-50e0-491b-ac2b-6fd5de896391	email verified	openid-connect	oidc-usermodel-property-mapper	\N	2a3cac96-2576-4c97-8337-ee31009a0345
76d9251d-a757-4d82-875a-b51bbd6da46f	address	openid-connect	oidc-address-mapper	\N	9321628e-4b0b-409d-bb14-b8489607bbbf
492c03e9-4555-434b-a75f-d4c4bcbed139	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	1a06a005-a31c-46a8-83ee-c552d1f4b404
082084e3-cd38-43ac-9334-733aaaa4b8f0	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	1a06a005-a31c-46a8-83ee-c552d1f4b404
d74e0563-e082-4122-b467-16c7243ffbf3	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	55db265b-d032-4e89-9bf4-ca5a6edf3475
c24d5b38-14b4-4606-a21b-4eb04721bac3	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	55db265b-d032-4e89-9bf4-ca5a6edf3475
2ea58450-7fab-4964-af49-7bf659c63092	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	55db265b-d032-4e89-9bf4-ca5a6edf3475
3fcd9241-32ea-4d08-b4e4-c23fa1521c2f	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	da9201a2-3505-4155-b915-8250bf1e165f
78a81380-dd69-4226-800d-fd8cb19b712e	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	576e255e-0f89-4ea7-b41a-a3bb8ad8cf74
71fff236-ef77-46e3-ae9d-fca9cd5dd9cd	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	576e255e-0f89-4ea7-b41a-a3bb8ad8cf74
be3e4e9d-74a4-4b92-939a-f8563e457fa8	acr loa level	openid-connect	oidc-acr-mapper	\N	71569b96-9de3-4a9f-a059-5d70ac43fbc7
29af1a2c-a229-4ec7-ad6e-c0faa17cbe06	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	dfad6d2d-c551-4718-bc90-0cfa1756886d
3062f246-37bf-4929-85f5-f77e7f0eb8b7	sub	openid-connect	oidc-sub-mapper	\N	dfad6d2d-c551-4718-bc90-0cfa1756886d
39307faa-8b70-468d-8c24-f9e302f541db	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	4ce15839-6fe6-48f1-800f-bb8da5f390d5
705686d5-d117-4e87-9b0e-b95602a35801	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	4ce15839-6fe6-48f1-800f-bb8da5f390d5
4532f554-2cae-4157-ba11-2462928e4210	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	4ce15839-6fe6-48f1-800f-bb8da5f390d5
9071964c-9444-403b-aa27-7694d47794cc	organization	openid-connect	oidc-organization-membership-mapper	\N	6bee678a-b327-4c07-afbf-893e78617e99
67286ee6-06fb-4eb9-b2b2-61f1c56e419e	audience resolve	openid-connect	oidc-audience-resolve-mapper	f3de95ba-eae6-4b4f-9667-2638e741fcc9	\N
12f374fc-2e1c-461a-b65e-1217ef9e169a	role list	saml	saml-role-list-mapper	\N	a08596a3-2f56-48e3-a6c2-3f677abc04fe
f9e6eefd-b941-4177-b2ce-3edfd1f48589	organization	saml	saml-organization-membership-mapper	\N	e388c5c7-b269-4718-a04a-eaa6fe2b180b
67d3bca5-5782-44ef-b2a5-4d5a1f5e6da5	full name	openid-connect	oidc-full-name-mapper	\N	277c44f2-6c48-4b50-b577-64e2af58aa69
8c52041c-baed-4067-9fcd-a75e3f6002ca	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	277c44f2-6c48-4b50-b577-64e2af58aa69
b7aa0633-e379-4e66-88b8-5d8eee3fac78	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	277c44f2-6c48-4b50-b577-64e2af58aa69
49906cf2-2772-448f-bcbc-63e8329f0706	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	277c44f2-6c48-4b50-b577-64e2af58aa69
ddea30f4-2a0c-4815-b3f0-0ce8e7daa5ea	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	277c44f2-6c48-4b50-b577-64e2af58aa69
c3601d01-95e9-47fc-9027-76346702f2cf	username	openid-connect	oidc-usermodel-attribute-mapper	\N	277c44f2-6c48-4b50-b577-64e2af58aa69
b2c6f96b-3e56-4dd6-a2e4-766ee05d7c57	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	277c44f2-6c48-4b50-b577-64e2af58aa69
0b17b97d-f05b-4dfb-8e60-28cfa455d60b	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	277c44f2-6c48-4b50-b577-64e2af58aa69
c01a5db7-a113-4737-854d-fb6bb9c71c7b	website	openid-connect	oidc-usermodel-attribute-mapper	\N	277c44f2-6c48-4b50-b577-64e2af58aa69
02b27de6-5ec6-43ab-8cf8-f51ec7146c81	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	277c44f2-6c48-4b50-b577-64e2af58aa69
b217d600-46c0-4b7f-a0e1-6c42e36f7819	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	277c44f2-6c48-4b50-b577-64e2af58aa69
6684f5f4-cc5b-4972-8e16-68a1ae33ccf4	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	277c44f2-6c48-4b50-b577-64e2af58aa69
b57004a9-6aed-4a56-850e-315f800fc7bf	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	277c44f2-6c48-4b50-b577-64e2af58aa69
76231b1f-ecfb-4af1-8716-9cd92baacae9	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	277c44f2-6c48-4b50-b577-64e2af58aa69
39322e1b-af1f-4ce2-af20-0674d13a0ee1	email	openid-connect	oidc-usermodel-attribute-mapper	\N	7bac0196-400a-44b6-ac9a-f49157068235
243820a9-730b-465e-805d-45603e758fc6	email verified	openid-connect	oidc-usermodel-property-mapper	\N	7bac0196-400a-44b6-ac9a-f49157068235
872d43f5-b805-4cd2-8710-fb5866b86e13	address	openid-connect	oidc-address-mapper	\N	77e3bae2-5cc2-4c58-a3ab-51e86e61b0b5
17b686a2-7327-4b99-9c5a-0870deba19b7	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	bc10061e-fe2b-4d9b-b714-cb9d62a4a688
0a2f1bb8-74aa-4754-b680-47a6e3a3c1db	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	bc10061e-fe2b-4d9b-b714-cb9d62a4a688
119d8f80-2732-4020-af6c-90b59706fa17	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	8fc4d791-7889-4198-8d26-4fddd2a21202
e5e31620-e6b2-4558-a844-f25f8f48fcdb	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	8fc4d791-7889-4198-8d26-4fddd2a21202
28152d2a-20d7-4364-8261-1088505c918a	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	8fc4d791-7889-4198-8d26-4fddd2a21202
b4974580-b021-4a1f-a97a-6e67edacd14c	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	5cc4aa6f-da39-4c9c-98c8-a51c5a23132b
e18058f7-244f-4855-aa46-715e2d30c713	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	e93611eb-33d1-455d-a48b-e70253cce5ff
e8af0752-b9dc-4e31-89f2-07bc03d896ae	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	e93611eb-33d1-455d-a48b-e70253cce5ff
e301e07d-9d77-46e8-bf88-b4de4dbfcb81	acr loa level	openid-connect	oidc-acr-mapper	\N	e3a574d9-4a36-40a7-9807-c881b9f17bb2
fbe5463d-e607-4641-b36f-fd16ded6391f	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	d6dab1fe-4572-40c2-8616-9f4bd1656511
613469d4-ff0e-42be-b67f-0c928f5a89a8	sub	openid-connect	oidc-sub-mapper	\N	d6dab1fe-4572-40c2-8616-9f4bd1656511
d5d41710-313b-4ef0-9860-faf77d18231d	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	\N	8b737abe-8d83-478a-be8d-fbe3964690b7
c4937128-a9b9-4027-b703-bbe6b7b1b7d2	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	\N	8b737abe-8d83-478a-be8d-fbe3964690b7
d68142c8-f4de-4e42-a5b2-404fd2b7415a	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	\N	8b737abe-8d83-478a-be8d-fbe3964690b7
8247ba72-be9e-43c5-9b79-603dc26f1927	organization	openid-connect	oidc-organization-membership-mapper	\N	38a104e9-a8ed-42d5-ad2d-238f6f2719f3
ae695996-e375-482c-997f-1efc170c666b	locale	openid-connect	oidc-usermodel-attribute-mapper	89af5f6b-be83-458b-8250-4aefba4ffec1	\N
dd1ab794-97b9-46be-879e-ad7b53585f62	avatar mapper	openid-connect	oidc-usermodel-attribute-mapper	12b20603-24ee-4e3c-8fa9-124de5bde364	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
24504a3e-8582-4c22-aea1-31709cae36b5	true	introspection.token.claim
24504a3e-8582-4c22-aea1-31709cae36b5	true	userinfo.token.claim
24504a3e-8582-4c22-aea1-31709cae36b5	locale	user.attribute
24504a3e-8582-4c22-aea1-31709cae36b5	true	id.token.claim
24504a3e-8582-4c22-aea1-31709cae36b5	true	access.token.claim
24504a3e-8582-4c22-aea1-31709cae36b5	locale	claim.name
24504a3e-8582-4c22-aea1-31709cae36b5	String	jsonType.label
974ed3d7-84f3-4878-bedc-b7551a7fc770	false	single
974ed3d7-84f3-4878-bedc-b7551a7fc770	Basic	attribute.nameformat
974ed3d7-84f3-4878-bedc-b7551a7fc770	Role	attribute.name
075741ba-31ea-4d49-ba92-d42e88772e06	true	introspection.token.claim
075741ba-31ea-4d49-ba92-d42e88772e06	true	userinfo.token.claim
075741ba-31ea-4d49-ba92-d42e88772e06	lastName	user.attribute
075741ba-31ea-4d49-ba92-d42e88772e06	true	id.token.claim
075741ba-31ea-4d49-ba92-d42e88772e06	true	access.token.claim
075741ba-31ea-4d49-ba92-d42e88772e06	family_name	claim.name
075741ba-31ea-4d49-ba92-d42e88772e06	String	jsonType.label
0c3ec022-0436-4f96-8703-b8e910b1d88e	true	introspection.token.claim
0c3ec022-0436-4f96-8703-b8e910b1d88e	true	userinfo.token.claim
0c3ec022-0436-4f96-8703-b8e910b1d88e	firstName	user.attribute
0c3ec022-0436-4f96-8703-b8e910b1d88e	true	id.token.claim
0c3ec022-0436-4f96-8703-b8e910b1d88e	true	access.token.claim
0c3ec022-0436-4f96-8703-b8e910b1d88e	given_name	claim.name
0c3ec022-0436-4f96-8703-b8e910b1d88e	String	jsonType.label
0f60d2f5-2fbe-40f4-ad23-9901bd23fcf3	true	introspection.token.claim
0f60d2f5-2fbe-40f4-ad23-9901bd23fcf3	true	userinfo.token.claim
0f60d2f5-2fbe-40f4-ad23-9901bd23fcf3	true	id.token.claim
0f60d2f5-2fbe-40f4-ad23-9901bd23fcf3	true	access.token.claim
19e926fd-74de-4739-b7ff-1f318f8109d5	true	introspection.token.claim
19e926fd-74de-4739-b7ff-1f318f8109d5	true	userinfo.token.claim
19e926fd-74de-4739-b7ff-1f318f8109d5	zoneinfo	user.attribute
19e926fd-74de-4739-b7ff-1f318f8109d5	true	id.token.claim
19e926fd-74de-4739-b7ff-1f318f8109d5	true	access.token.claim
19e926fd-74de-4739-b7ff-1f318f8109d5	zoneinfo	claim.name
19e926fd-74de-4739-b7ff-1f318f8109d5	String	jsonType.label
458d2365-2262-4214-ba3c-4029f9dfb260	true	introspection.token.claim
458d2365-2262-4214-ba3c-4029f9dfb260	true	userinfo.token.claim
458d2365-2262-4214-ba3c-4029f9dfb260	updatedAt	user.attribute
458d2365-2262-4214-ba3c-4029f9dfb260	true	id.token.claim
458d2365-2262-4214-ba3c-4029f9dfb260	true	access.token.claim
458d2365-2262-4214-ba3c-4029f9dfb260	updated_at	claim.name
458d2365-2262-4214-ba3c-4029f9dfb260	long	jsonType.label
54142519-bb72-46ba-815a-05e956477893	true	introspection.token.claim
54142519-bb72-46ba-815a-05e956477893	true	userinfo.token.claim
54142519-bb72-46ba-815a-05e956477893	locale	user.attribute
54142519-bb72-46ba-815a-05e956477893	true	id.token.claim
54142519-bb72-46ba-815a-05e956477893	true	access.token.claim
54142519-bb72-46ba-815a-05e956477893	locale	claim.name
54142519-bb72-46ba-815a-05e956477893	String	jsonType.label
7ce75bed-76fd-4f4e-ab9a-e0942fa116fa	true	introspection.token.claim
7ce75bed-76fd-4f4e-ab9a-e0942fa116fa	true	userinfo.token.claim
7ce75bed-76fd-4f4e-ab9a-e0942fa116fa	birthdate	user.attribute
7ce75bed-76fd-4f4e-ab9a-e0942fa116fa	true	id.token.claim
7ce75bed-76fd-4f4e-ab9a-e0942fa116fa	true	access.token.claim
7ce75bed-76fd-4f4e-ab9a-e0942fa116fa	birthdate	claim.name
7ce75bed-76fd-4f4e-ab9a-e0942fa116fa	String	jsonType.label
9dcff00f-3aee-4224-94a7-410bb1df630a	true	introspection.token.claim
9dcff00f-3aee-4224-94a7-410bb1df630a	true	userinfo.token.claim
9dcff00f-3aee-4224-94a7-410bb1df630a	profile	user.attribute
9dcff00f-3aee-4224-94a7-410bb1df630a	true	id.token.claim
9dcff00f-3aee-4224-94a7-410bb1df630a	true	access.token.claim
9dcff00f-3aee-4224-94a7-410bb1df630a	profile	claim.name
9dcff00f-3aee-4224-94a7-410bb1df630a	String	jsonType.label
a09f17e5-6b25-41f9-9dbf-a8e28c2abc5f	true	introspection.token.claim
a09f17e5-6b25-41f9-9dbf-a8e28c2abc5f	true	userinfo.token.claim
a09f17e5-6b25-41f9-9dbf-a8e28c2abc5f	gender	user.attribute
a09f17e5-6b25-41f9-9dbf-a8e28c2abc5f	true	id.token.claim
a09f17e5-6b25-41f9-9dbf-a8e28c2abc5f	true	access.token.claim
a09f17e5-6b25-41f9-9dbf-a8e28c2abc5f	gender	claim.name
a09f17e5-6b25-41f9-9dbf-a8e28c2abc5f	String	jsonType.label
a3000770-3041-4ebd-9fb2-6eb87ef4f96e	true	introspection.token.claim
a3000770-3041-4ebd-9fb2-6eb87ef4f96e	true	userinfo.token.claim
a3000770-3041-4ebd-9fb2-6eb87ef4f96e	username	user.attribute
a3000770-3041-4ebd-9fb2-6eb87ef4f96e	true	id.token.claim
a3000770-3041-4ebd-9fb2-6eb87ef4f96e	true	access.token.claim
a3000770-3041-4ebd-9fb2-6eb87ef4f96e	preferred_username	claim.name
a3000770-3041-4ebd-9fb2-6eb87ef4f96e	String	jsonType.label
ad74e48d-f3b4-4a6b-93f8-2e17099c44cf	true	introspection.token.claim
ad74e48d-f3b4-4a6b-93f8-2e17099c44cf	true	userinfo.token.claim
ad74e48d-f3b4-4a6b-93f8-2e17099c44cf	middleName	user.attribute
ad74e48d-f3b4-4a6b-93f8-2e17099c44cf	true	id.token.claim
ad74e48d-f3b4-4a6b-93f8-2e17099c44cf	true	access.token.claim
ad74e48d-f3b4-4a6b-93f8-2e17099c44cf	middle_name	claim.name
ad74e48d-f3b4-4a6b-93f8-2e17099c44cf	String	jsonType.label
def98e82-a8ce-417d-9411-2ac602bd21fd	true	introspection.token.claim
def98e82-a8ce-417d-9411-2ac602bd21fd	true	userinfo.token.claim
def98e82-a8ce-417d-9411-2ac602bd21fd	picture	user.attribute
def98e82-a8ce-417d-9411-2ac602bd21fd	true	id.token.claim
def98e82-a8ce-417d-9411-2ac602bd21fd	true	access.token.claim
def98e82-a8ce-417d-9411-2ac602bd21fd	picture	claim.name
def98e82-a8ce-417d-9411-2ac602bd21fd	String	jsonType.label
e6db79b2-4302-40d5-bbdb-b468409fd19f	true	introspection.token.claim
e6db79b2-4302-40d5-bbdb-b468409fd19f	true	userinfo.token.claim
e6db79b2-4302-40d5-bbdb-b468409fd19f	nickname	user.attribute
e6db79b2-4302-40d5-bbdb-b468409fd19f	true	id.token.claim
e6db79b2-4302-40d5-bbdb-b468409fd19f	true	access.token.claim
e6db79b2-4302-40d5-bbdb-b468409fd19f	nickname	claim.name
e6db79b2-4302-40d5-bbdb-b468409fd19f	String	jsonType.label
f420af7d-b99d-4611-a9a4-60152179235e	true	introspection.token.claim
f420af7d-b99d-4611-a9a4-60152179235e	true	userinfo.token.claim
f420af7d-b99d-4611-a9a4-60152179235e	website	user.attribute
f420af7d-b99d-4611-a9a4-60152179235e	true	id.token.claim
f420af7d-b99d-4611-a9a4-60152179235e	true	access.token.claim
f420af7d-b99d-4611-a9a4-60152179235e	website	claim.name
f420af7d-b99d-4611-a9a4-60152179235e	String	jsonType.label
0d813204-e611-4a80-9564-03bf13c0af9f	true	introspection.token.claim
0d813204-e611-4a80-9564-03bf13c0af9f	true	userinfo.token.claim
0d813204-e611-4a80-9564-03bf13c0af9f	email	user.attribute
0d813204-e611-4a80-9564-03bf13c0af9f	true	id.token.claim
0d813204-e611-4a80-9564-03bf13c0af9f	true	access.token.claim
0d813204-e611-4a80-9564-03bf13c0af9f	email	claim.name
0d813204-e611-4a80-9564-03bf13c0af9f	String	jsonType.label
af194a49-50e0-491b-ac2b-6fd5de896391	true	introspection.token.claim
af194a49-50e0-491b-ac2b-6fd5de896391	true	userinfo.token.claim
af194a49-50e0-491b-ac2b-6fd5de896391	emailVerified	user.attribute
af194a49-50e0-491b-ac2b-6fd5de896391	true	id.token.claim
af194a49-50e0-491b-ac2b-6fd5de896391	true	access.token.claim
af194a49-50e0-491b-ac2b-6fd5de896391	email_verified	claim.name
af194a49-50e0-491b-ac2b-6fd5de896391	boolean	jsonType.label
76d9251d-a757-4d82-875a-b51bbd6da46f	formatted	user.attribute.formatted
76d9251d-a757-4d82-875a-b51bbd6da46f	country	user.attribute.country
76d9251d-a757-4d82-875a-b51bbd6da46f	true	introspection.token.claim
76d9251d-a757-4d82-875a-b51bbd6da46f	postal_code	user.attribute.postal_code
76d9251d-a757-4d82-875a-b51bbd6da46f	true	userinfo.token.claim
76d9251d-a757-4d82-875a-b51bbd6da46f	street	user.attribute.street
76d9251d-a757-4d82-875a-b51bbd6da46f	true	id.token.claim
76d9251d-a757-4d82-875a-b51bbd6da46f	region	user.attribute.region
76d9251d-a757-4d82-875a-b51bbd6da46f	true	access.token.claim
76d9251d-a757-4d82-875a-b51bbd6da46f	locality	user.attribute.locality
082084e3-cd38-43ac-9334-733aaaa4b8f0	true	introspection.token.claim
082084e3-cd38-43ac-9334-733aaaa4b8f0	true	userinfo.token.claim
082084e3-cd38-43ac-9334-733aaaa4b8f0	phoneNumberVerified	user.attribute
082084e3-cd38-43ac-9334-733aaaa4b8f0	true	id.token.claim
082084e3-cd38-43ac-9334-733aaaa4b8f0	true	access.token.claim
082084e3-cd38-43ac-9334-733aaaa4b8f0	phone_number_verified	claim.name
082084e3-cd38-43ac-9334-733aaaa4b8f0	boolean	jsonType.label
492c03e9-4555-434b-a75f-d4c4bcbed139	true	introspection.token.claim
492c03e9-4555-434b-a75f-d4c4bcbed139	true	userinfo.token.claim
492c03e9-4555-434b-a75f-d4c4bcbed139	phoneNumber	user.attribute
492c03e9-4555-434b-a75f-d4c4bcbed139	true	id.token.claim
492c03e9-4555-434b-a75f-d4c4bcbed139	true	access.token.claim
492c03e9-4555-434b-a75f-d4c4bcbed139	phone_number	claim.name
492c03e9-4555-434b-a75f-d4c4bcbed139	String	jsonType.label
2ea58450-7fab-4964-af49-7bf659c63092	true	introspection.token.claim
2ea58450-7fab-4964-af49-7bf659c63092	true	access.token.claim
c24d5b38-14b4-4606-a21b-4eb04721bac3	true	introspection.token.claim
c24d5b38-14b4-4606-a21b-4eb04721bac3	true	multivalued
c24d5b38-14b4-4606-a21b-4eb04721bac3	foo	user.attribute
c24d5b38-14b4-4606-a21b-4eb04721bac3	true	access.token.claim
c24d5b38-14b4-4606-a21b-4eb04721bac3	resource_access.${client_id}.roles	claim.name
c24d5b38-14b4-4606-a21b-4eb04721bac3	String	jsonType.label
d74e0563-e082-4122-b467-16c7243ffbf3	true	introspection.token.claim
d74e0563-e082-4122-b467-16c7243ffbf3	true	multivalued
d74e0563-e082-4122-b467-16c7243ffbf3	foo	user.attribute
d74e0563-e082-4122-b467-16c7243ffbf3	true	access.token.claim
d74e0563-e082-4122-b467-16c7243ffbf3	realm_access.roles	claim.name
d74e0563-e082-4122-b467-16c7243ffbf3	String	jsonType.label
3fcd9241-32ea-4d08-b4e4-c23fa1521c2f	true	introspection.token.claim
3fcd9241-32ea-4d08-b4e4-c23fa1521c2f	true	access.token.claim
71fff236-ef77-46e3-ae9d-fca9cd5dd9cd	true	introspection.token.claim
71fff236-ef77-46e3-ae9d-fca9cd5dd9cd	true	multivalued
71fff236-ef77-46e3-ae9d-fca9cd5dd9cd	foo	user.attribute
71fff236-ef77-46e3-ae9d-fca9cd5dd9cd	true	id.token.claim
71fff236-ef77-46e3-ae9d-fca9cd5dd9cd	true	access.token.claim
71fff236-ef77-46e3-ae9d-fca9cd5dd9cd	groups	claim.name
71fff236-ef77-46e3-ae9d-fca9cd5dd9cd	String	jsonType.label
78a81380-dd69-4226-800d-fd8cb19b712e	true	introspection.token.claim
78a81380-dd69-4226-800d-fd8cb19b712e	true	userinfo.token.claim
78a81380-dd69-4226-800d-fd8cb19b712e	username	user.attribute
78a81380-dd69-4226-800d-fd8cb19b712e	true	id.token.claim
78a81380-dd69-4226-800d-fd8cb19b712e	true	access.token.claim
78a81380-dd69-4226-800d-fd8cb19b712e	upn	claim.name
78a81380-dd69-4226-800d-fd8cb19b712e	String	jsonType.label
be3e4e9d-74a4-4b92-939a-f8563e457fa8	true	introspection.token.claim
be3e4e9d-74a4-4b92-939a-f8563e457fa8	true	id.token.claim
be3e4e9d-74a4-4b92-939a-f8563e457fa8	true	access.token.claim
29af1a2c-a229-4ec7-ad6e-c0faa17cbe06	AUTH_TIME	user.session.note
29af1a2c-a229-4ec7-ad6e-c0faa17cbe06	true	introspection.token.claim
29af1a2c-a229-4ec7-ad6e-c0faa17cbe06	true	id.token.claim
29af1a2c-a229-4ec7-ad6e-c0faa17cbe06	true	access.token.claim
29af1a2c-a229-4ec7-ad6e-c0faa17cbe06	auth_time	claim.name
29af1a2c-a229-4ec7-ad6e-c0faa17cbe06	long	jsonType.label
3062f246-37bf-4929-85f5-f77e7f0eb8b7	true	introspection.token.claim
3062f246-37bf-4929-85f5-f77e7f0eb8b7	true	access.token.claim
39307faa-8b70-468d-8c24-f9e302f541db	client_id	user.session.note
39307faa-8b70-468d-8c24-f9e302f541db	true	introspection.token.claim
39307faa-8b70-468d-8c24-f9e302f541db	true	id.token.claim
39307faa-8b70-468d-8c24-f9e302f541db	true	access.token.claim
39307faa-8b70-468d-8c24-f9e302f541db	client_id	claim.name
39307faa-8b70-468d-8c24-f9e302f541db	String	jsonType.label
4532f554-2cae-4157-ba11-2462928e4210	clientAddress	user.session.note
4532f554-2cae-4157-ba11-2462928e4210	true	introspection.token.claim
4532f554-2cae-4157-ba11-2462928e4210	true	id.token.claim
4532f554-2cae-4157-ba11-2462928e4210	true	access.token.claim
4532f554-2cae-4157-ba11-2462928e4210	clientAddress	claim.name
4532f554-2cae-4157-ba11-2462928e4210	String	jsonType.label
705686d5-d117-4e87-9b0e-b95602a35801	clientHost	user.session.note
705686d5-d117-4e87-9b0e-b95602a35801	true	introspection.token.claim
705686d5-d117-4e87-9b0e-b95602a35801	true	id.token.claim
705686d5-d117-4e87-9b0e-b95602a35801	true	access.token.claim
705686d5-d117-4e87-9b0e-b95602a35801	clientHost	claim.name
705686d5-d117-4e87-9b0e-b95602a35801	String	jsonType.label
9071964c-9444-403b-aa27-7694d47794cc	true	introspection.token.claim
9071964c-9444-403b-aa27-7694d47794cc	true	multivalued
9071964c-9444-403b-aa27-7694d47794cc	true	id.token.claim
9071964c-9444-403b-aa27-7694d47794cc	true	access.token.claim
9071964c-9444-403b-aa27-7694d47794cc	organization	claim.name
9071964c-9444-403b-aa27-7694d47794cc	String	jsonType.label
12f374fc-2e1c-461a-b65e-1217ef9e169a	false	single
12f374fc-2e1c-461a-b65e-1217ef9e169a	Basic	attribute.nameformat
12f374fc-2e1c-461a-b65e-1217ef9e169a	Role	attribute.name
02b27de6-5ec6-43ab-8cf8-f51ec7146c81	true	introspection.token.claim
02b27de6-5ec6-43ab-8cf8-f51ec7146c81	true	userinfo.token.claim
02b27de6-5ec6-43ab-8cf8-f51ec7146c81	gender	user.attribute
02b27de6-5ec6-43ab-8cf8-f51ec7146c81	true	id.token.claim
02b27de6-5ec6-43ab-8cf8-f51ec7146c81	true	access.token.claim
02b27de6-5ec6-43ab-8cf8-f51ec7146c81	gender	claim.name
02b27de6-5ec6-43ab-8cf8-f51ec7146c81	String	jsonType.label
0b17b97d-f05b-4dfb-8e60-28cfa455d60b	true	introspection.token.claim
0b17b97d-f05b-4dfb-8e60-28cfa455d60b	true	userinfo.token.claim
0b17b97d-f05b-4dfb-8e60-28cfa455d60b	picture	user.attribute
0b17b97d-f05b-4dfb-8e60-28cfa455d60b	true	id.token.claim
0b17b97d-f05b-4dfb-8e60-28cfa455d60b	true	access.token.claim
0b17b97d-f05b-4dfb-8e60-28cfa455d60b	picture	claim.name
0b17b97d-f05b-4dfb-8e60-28cfa455d60b	String	jsonType.label
49906cf2-2772-448f-bcbc-63e8329f0706	true	introspection.token.claim
49906cf2-2772-448f-bcbc-63e8329f0706	true	userinfo.token.claim
49906cf2-2772-448f-bcbc-63e8329f0706	middleName	user.attribute
49906cf2-2772-448f-bcbc-63e8329f0706	true	id.token.claim
49906cf2-2772-448f-bcbc-63e8329f0706	true	access.token.claim
49906cf2-2772-448f-bcbc-63e8329f0706	middle_name	claim.name
49906cf2-2772-448f-bcbc-63e8329f0706	String	jsonType.label
6684f5f4-cc5b-4972-8e16-68a1ae33ccf4	true	introspection.token.claim
6684f5f4-cc5b-4972-8e16-68a1ae33ccf4	true	userinfo.token.claim
6684f5f4-cc5b-4972-8e16-68a1ae33ccf4	zoneinfo	user.attribute
6684f5f4-cc5b-4972-8e16-68a1ae33ccf4	true	id.token.claim
6684f5f4-cc5b-4972-8e16-68a1ae33ccf4	true	access.token.claim
6684f5f4-cc5b-4972-8e16-68a1ae33ccf4	zoneinfo	claim.name
6684f5f4-cc5b-4972-8e16-68a1ae33ccf4	String	jsonType.label
67d3bca5-5782-44ef-b2a5-4d5a1f5e6da5	true	introspection.token.claim
67d3bca5-5782-44ef-b2a5-4d5a1f5e6da5	true	userinfo.token.claim
67d3bca5-5782-44ef-b2a5-4d5a1f5e6da5	true	id.token.claim
67d3bca5-5782-44ef-b2a5-4d5a1f5e6da5	true	access.token.claim
76231b1f-ecfb-4af1-8716-9cd92baacae9	true	introspection.token.claim
76231b1f-ecfb-4af1-8716-9cd92baacae9	true	userinfo.token.claim
76231b1f-ecfb-4af1-8716-9cd92baacae9	updatedAt	user.attribute
76231b1f-ecfb-4af1-8716-9cd92baacae9	true	id.token.claim
76231b1f-ecfb-4af1-8716-9cd92baacae9	true	access.token.claim
76231b1f-ecfb-4af1-8716-9cd92baacae9	updated_at	claim.name
76231b1f-ecfb-4af1-8716-9cd92baacae9	long	jsonType.label
8c52041c-baed-4067-9fcd-a75e3f6002ca	true	introspection.token.claim
8c52041c-baed-4067-9fcd-a75e3f6002ca	true	userinfo.token.claim
8c52041c-baed-4067-9fcd-a75e3f6002ca	lastName	user.attribute
8c52041c-baed-4067-9fcd-a75e3f6002ca	true	id.token.claim
8c52041c-baed-4067-9fcd-a75e3f6002ca	true	access.token.claim
8c52041c-baed-4067-9fcd-a75e3f6002ca	family_name	claim.name
8c52041c-baed-4067-9fcd-a75e3f6002ca	String	jsonType.label
b217d600-46c0-4b7f-a0e1-6c42e36f7819	true	introspection.token.claim
b217d600-46c0-4b7f-a0e1-6c42e36f7819	true	userinfo.token.claim
b217d600-46c0-4b7f-a0e1-6c42e36f7819	birthdate	user.attribute
b217d600-46c0-4b7f-a0e1-6c42e36f7819	true	id.token.claim
b217d600-46c0-4b7f-a0e1-6c42e36f7819	true	access.token.claim
b217d600-46c0-4b7f-a0e1-6c42e36f7819	birthdate	claim.name
b217d600-46c0-4b7f-a0e1-6c42e36f7819	String	jsonType.label
b2c6f96b-3e56-4dd6-a2e4-766ee05d7c57	true	introspection.token.claim
b2c6f96b-3e56-4dd6-a2e4-766ee05d7c57	true	userinfo.token.claim
b2c6f96b-3e56-4dd6-a2e4-766ee05d7c57	profile	user.attribute
b2c6f96b-3e56-4dd6-a2e4-766ee05d7c57	true	id.token.claim
b2c6f96b-3e56-4dd6-a2e4-766ee05d7c57	true	access.token.claim
b2c6f96b-3e56-4dd6-a2e4-766ee05d7c57	profile	claim.name
b2c6f96b-3e56-4dd6-a2e4-766ee05d7c57	String	jsonType.label
b57004a9-6aed-4a56-850e-315f800fc7bf	true	introspection.token.claim
b57004a9-6aed-4a56-850e-315f800fc7bf	true	userinfo.token.claim
b57004a9-6aed-4a56-850e-315f800fc7bf	locale	user.attribute
b57004a9-6aed-4a56-850e-315f800fc7bf	true	id.token.claim
b57004a9-6aed-4a56-850e-315f800fc7bf	true	access.token.claim
b57004a9-6aed-4a56-850e-315f800fc7bf	locale	claim.name
b57004a9-6aed-4a56-850e-315f800fc7bf	String	jsonType.label
b7aa0633-e379-4e66-88b8-5d8eee3fac78	true	introspection.token.claim
b7aa0633-e379-4e66-88b8-5d8eee3fac78	true	userinfo.token.claim
b7aa0633-e379-4e66-88b8-5d8eee3fac78	firstName	user.attribute
b7aa0633-e379-4e66-88b8-5d8eee3fac78	true	id.token.claim
b7aa0633-e379-4e66-88b8-5d8eee3fac78	true	access.token.claim
b7aa0633-e379-4e66-88b8-5d8eee3fac78	given_name	claim.name
b7aa0633-e379-4e66-88b8-5d8eee3fac78	String	jsonType.label
c01a5db7-a113-4737-854d-fb6bb9c71c7b	true	introspection.token.claim
c01a5db7-a113-4737-854d-fb6bb9c71c7b	true	userinfo.token.claim
c01a5db7-a113-4737-854d-fb6bb9c71c7b	website	user.attribute
c01a5db7-a113-4737-854d-fb6bb9c71c7b	true	id.token.claim
c01a5db7-a113-4737-854d-fb6bb9c71c7b	true	access.token.claim
c01a5db7-a113-4737-854d-fb6bb9c71c7b	website	claim.name
c01a5db7-a113-4737-854d-fb6bb9c71c7b	String	jsonType.label
c3601d01-95e9-47fc-9027-76346702f2cf	true	introspection.token.claim
c3601d01-95e9-47fc-9027-76346702f2cf	true	userinfo.token.claim
c3601d01-95e9-47fc-9027-76346702f2cf	username	user.attribute
c3601d01-95e9-47fc-9027-76346702f2cf	true	id.token.claim
c3601d01-95e9-47fc-9027-76346702f2cf	true	access.token.claim
c3601d01-95e9-47fc-9027-76346702f2cf	preferred_username	claim.name
c3601d01-95e9-47fc-9027-76346702f2cf	String	jsonType.label
ddea30f4-2a0c-4815-b3f0-0ce8e7daa5ea	true	introspection.token.claim
ddea30f4-2a0c-4815-b3f0-0ce8e7daa5ea	true	userinfo.token.claim
ddea30f4-2a0c-4815-b3f0-0ce8e7daa5ea	nickname	user.attribute
ddea30f4-2a0c-4815-b3f0-0ce8e7daa5ea	true	id.token.claim
ddea30f4-2a0c-4815-b3f0-0ce8e7daa5ea	true	access.token.claim
ddea30f4-2a0c-4815-b3f0-0ce8e7daa5ea	nickname	claim.name
ddea30f4-2a0c-4815-b3f0-0ce8e7daa5ea	String	jsonType.label
243820a9-730b-465e-805d-45603e758fc6	true	introspection.token.claim
243820a9-730b-465e-805d-45603e758fc6	true	userinfo.token.claim
243820a9-730b-465e-805d-45603e758fc6	emailVerified	user.attribute
243820a9-730b-465e-805d-45603e758fc6	true	id.token.claim
243820a9-730b-465e-805d-45603e758fc6	true	access.token.claim
243820a9-730b-465e-805d-45603e758fc6	email_verified	claim.name
243820a9-730b-465e-805d-45603e758fc6	boolean	jsonType.label
39322e1b-af1f-4ce2-af20-0674d13a0ee1	true	introspection.token.claim
39322e1b-af1f-4ce2-af20-0674d13a0ee1	true	userinfo.token.claim
39322e1b-af1f-4ce2-af20-0674d13a0ee1	email	user.attribute
39322e1b-af1f-4ce2-af20-0674d13a0ee1	true	id.token.claim
39322e1b-af1f-4ce2-af20-0674d13a0ee1	true	access.token.claim
39322e1b-af1f-4ce2-af20-0674d13a0ee1	email	claim.name
39322e1b-af1f-4ce2-af20-0674d13a0ee1	String	jsonType.label
872d43f5-b805-4cd2-8710-fb5866b86e13	formatted	user.attribute.formatted
872d43f5-b805-4cd2-8710-fb5866b86e13	country	user.attribute.country
872d43f5-b805-4cd2-8710-fb5866b86e13	true	introspection.token.claim
872d43f5-b805-4cd2-8710-fb5866b86e13	postal_code	user.attribute.postal_code
872d43f5-b805-4cd2-8710-fb5866b86e13	true	userinfo.token.claim
872d43f5-b805-4cd2-8710-fb5866b86e13	street	user.attribute.street
872d43f5-b805-4cd2-8710-fb5866b86e13	true	id.token.claim
872d43f5-b805-4cd2-8710-fb5866b86e13	region	user.attribute.region
872d43f5-b805-4cd2-8710-fb5866b86e13	true	access.token.claim
872d43f5-b805-4cd2-8710-fb5866b86e13	locality	user.attribute.locality
0a2f1bb8-74aa-4754-b680-47a6e3a3c1db	true	introspection.token.claim
0a2f1bb8-74aa-4754-b680-47a6e3a3c1db	true	userinfo.token.claim
0a2f1bb8-74aa-4754-b680-47a6e3a3c1db	phoneNumberVerified	user.attribute
0a2f1bb8-74aa-4754-b680-47a6e3a3c1db	true	id.token.claim
0a2f1bb8-74aa-4754-b680-47a6e3a3c1db	true	access.token.claim
0a2f1bb8-74aa-4754-b680-47a6e3a3c1db	phone_number_verified	claim.name
0a2f1bb8-74aa-4754-b680-47a6e3a3c1db	boolean	jsonType.label
17b686a2-7327-4b99-9c5a-0870deba19b7	true	introspection.token.claim
17b686a2-7327-4b99-9c5a-0870deba19b7	true	userinfo.token.claim
17b686a2-7327-4b99-9c5a-0870deba19b7	phoneNumber	user.attribute
17b686a2-7327-4b99-9c5a-0870deba19b7	true	id.token.claim
17b686a2-7327-4b99-9c5a-0870deba19b7	true	access.token.claim
17b686a2-7327-4b99-9c5a-0870deba19b7	phone_number	claim.name
17b686a2-7327-4b99-9c5a-0870deba19b7	String	jsonType.label
119d8f80-2732-4020-af6c-90b59706fa17	true	introspection.token.claim
119d8f80-2732-4020-af6c-90b59706fa17	true	multivalued
119d8f80-2732-4020-af6c-90b59706fa17	foo	user.attribute
119d8f80-2732-4020-af6c-90b59706fa17	true	access.token.claim
119d8f80-2732-4020-af6c-90b59706fa17	realm_access.roles	claim.name
119d8f80-2732-4020-af6c-90b59706fa17	String	jsonType.label
28152d2a-20d7-4364-8261-1088505c918a	true	introspection.token.claim
28152d2a-20d7-4364-8261-1088505c918a	true	access.token.claim
e5e31620-e6b2-4558-a844-f25f8f48fcdb	true	introspection.token.claim
e5e31620-e6b2-4558-a844-f25f8f48fcdb	true	multivalued
e5e31620-e6b2-4558-a844-f25f8f48fcdb	foo	user.attribute
e5e31620-e6b2-4558-a844-f25f8f48fcdb	true	access.token.claim
e5e31620-e6b2-4558-a844-f25f8f48fcdb	resource_access.${client_id}.roles	claim.name
e5e31620-e6b2-4558-a844-f25f8f48fcdb	String	jsonType.label
b4974580-b021-4a1f-a97a-6e67edacd14c	true	introspection.token.claim
b4974580-b021-4a1f-a97a-6e67edacd14c	true	access.token.claim
e18058f7-244f-4855-aa46-715e2d30c713	true	introspection.token.claim
e18058f7-244f-4855-aa46-715e2d30c713	true	userinfo.token.claim
e18058f7-244f-4855-aa46-715e2d30c713	username	user.attribute
e18058f7-244f-4855-aa46-715e2d30c713	true	id.token.claim
e18058f7-244f-4855-aa46-715e2d30c713	true	access.token.claim
e18058f7-244f-4855-aa46-715e2d30c713	upn	claim.name
e18058f7-244f-4855-aa46-715e2d30c713	String	jsonType.label
e8af0752-b9dc-4e31-89f2-07bc03d896ae	true	introspection.token.claim
e8af0752-b9dc-4e31-89f2-07bc03d896ae	true	multivalued
e8af0752-b9dc-4e31-89f2-07bc03d896ae	foo	user.attribute
e8af0752-b9dc-4e31-89f2-07bc03d896ae	true	id.token.claim
e8af0752-b9dc-4e31-89f2-07bc03d896ae	true	access.token.claim
e8af0752-b9dc-4e31-89f2-07bc03d896ae	groups	claim.name
e8af0752-b9dc-4e31-89f2-07bc03d896ae	String	jsonType.label
e301e07d-9d77-46e8-bf88-b4de4dbfcb81	true	introspection.token.claim
e301e07d-9d77-46e8-bf88-b4de4dbfcb81	true	id.token.claim
e301e07d-9d77-46e8-bf88-b4de4dbfcb81	true	access.token.claim
613469d4-ff0e-42be-b67f-0c928f5a89a8	true	introspection.token.claim
613469d4-ff0e-42be-b67f-0c928f5a89a8	true	access.token.claim
fbe5463d-e607-4641-b36f-fd16ded6391f	AUTH_TIME	user.session.note
fbe5463d-e607-4641-b36f-fd16ded6391f	true	introspection.token.claim
fbe5463d-e607-4641-b36f-fd16ded6391f	true	id.token.claim
fbe5463d-e607-4641-b36f-fd16ded6391f	true	access.token.claim
fbe5463d-e607-4641-b36f-fd16ded6391f	auth_time	claim.name
fbe5463d-e607-4641-b36f-fd16ded6391f	long	jsonType.label
c4937128-a9b9-4027-b703-bbe6b7b1b7d2	clientHost	user.session.note
c4937128-a9b9-4027-b703-bbe6b7b1b7d2	true	introspection.token.claim
c4937128-a9b9-4027-b703-bbe6b7b1b7d2	true	id.token.claim
c4937128-a9b9-4027-b703-bbe6b7b1b7d2	true	access.token.claim
c4937128-a9b9-4027-b703-bbe6b7b1b7d2	clientHost	claim.name
c4937128-a9b9-4027-b703-bbe6b7b1b7d2	String	jsonType.label
d5d41710-313b-4ef0-9860-faf77d18231d	client_id	user.session.note
d5d41710-313b-4ef0-9860-faf77d18231d	true	introspection.token.claim
d5d41710-313b-4ef0-9860-faf77d18231d	true	id.token.claim
d5d41710-313b-4ef0-9860-faf77d18231d	true	access.token.claim
d5d41710-313b-4ef0-9860-faf77d18231d	client_id	claim.name
d5d41710-313b-4ef0-9860-faf77d18231d	String	jsonType.label
d68142c8-f4de-4e42-a5b2-404fd2b7415a	clientAddress	user.session.note
d68142c8-f4de-4e42-a5b2-404fd2b7415a	true	introspection.token.claim
d68142c8-f4de-4e42-a5b2-404fd2b7415a	true	id.token.claim
d68142c8-f4de-4e42-a5b2-404fd2b7415a	true	access.token.claim
d68142c8-f4de-4e42-a5b2-404fd2b7415a	clientAddress	claim.name
d68142c8-f4de-4e42-a5b2-404fd2b7415a	String	jsonType.label
8247ba72-be9e-43c5-9b79-603dc26f1927	true	introspection.token.claim
8247ba72-be9e-43c5-9b79-603dc26f1927	true	multivalued
8247ba72-be9e-43c5-9b79-603dc26f1927	true	id.token.claim
8247ba72-be9e-43c5-9b79-603dc26f1927	true	access.token.claim
8247ba72-be9e-43c5-9b79-603dc26f1927	organization	claim.name
8247ba72-be9e-43c5-9b79-603dc26f1927	String	jsonType.label
ae695996-e375-482c-997f-1efc170c666b	true	introspection.token.claim
ae695996-e375-482c-997f-1efc170c666b	true	userinfo.token.claim
ae695996-e375-482c-997f-1efc170c666b	locale	user.attribute
ae695996-e375-482c-997f-1efc170c666b	true	id.token.claim
ae695996-e375-482c-997f-1efc170c666b	true	access.token.claim
ae695996-e375-482c-997f-1efc170c666b	locale	claim.name
ae695996-e375-482c-997f-1efc170c666b	String	jsonType.label
dd1ab794-97b9-46be-879e-ad7b53585f62	true	introspection.token.claim
dd1ab794-97b9-46be-879e-ad7b53585f62	true	userinfo.token.claim
dd1ab794-97b9-46be-879e-ad7b53585f62	avatar	user.attribute
dd1ab794-97b9-46be-879e-ad7b53585f62	true	id.token.claim
dd1ab794-97b9-46be-879e-ad7b53585f62	false	lightweight.claim
dd1ab794-97b9-46be-879e-ad7b53585f62	false	access.token.claim
dd1ab794-97b9-46be-879e-ad7b53585f62	picture	claim.name
dd1ab794-97b9-46be-879e-ad7b53585f62	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
3654cfb9-0034-4bee-8aff-6eda67a58466	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	2ff86fec-3d01-4f46-ae60-06b6ae320749	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	fac120ed-effd-48ca-8aa3-fab6ebf72bd6	867a392f-e28f-457c-a6ee-b6825c096a86	503989c6-8582-4316-9787-02a1691c5e45	488e6dda-0dfa-4dbc-b219-0fb7dca3d923	c03f4a5f-5afe-4b70-b653-3ab84adf07cd	2592000	f	900	t	f	a4398383-518e-47d6-a1ef-33ad59136ba7	0	f	0	0	717a8b0b-1783-4a0e-b122-88e60d263943
17787da5-ff56-48dc-a36a-2700dec08b2e	60	300	300	keycloak.v3	keycloak.v2	keycloak	t	f	0	keycloak.v2	cybertron	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	2f088ce4-d4b6-4c8f-8305-5fbd340a265d	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	1900b0da-a398-4a61-bfb9-45cc48c776ce	f524e55b-c5e4-4eb6-8d5b-4c0f3f87ceb3	2a4be5b0-a648-411a-b38b-2b878e4df0cc	1e485d74-7930-4f78-8915-39ca175f063a	98817f68-43b9-4218-b04a-402cd385bd20	2592000	f	900	t	f	5b4f1efb-4b14-471d-95b7-f53ecc75574f	0	f	0	0	6d57524f-cdca-41c4-aea3-68a171c93aee
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	3654cfb9-0034-4bee-8aff-6eda67a58466	
_browser_header.xContentTypeOptions	3654cfb9-0034-4bee-8aff-6eda67a58466	nosniff
_browser_header.referrerPolicy	3654cfb9-0034-4bee-8aff-6eda67a58466	no-referrer
_browser_header.xRobotsTag	3654cfb9-0034-4bee-8aff-6eda67a58466	none
_browser_header.xFrameOptions	3654cfb9-0034-4bee-8aff-6eda67a58466	SAMEORIGIN
_browser_header.contentSecurityPolicy	3654cfb9-0034-4bee-8aff-6eda67a58466	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.strictTransportSecurity	3654cfb9-0034-4bee-8aff-6eda67a58466	max-age=31536000; includeSubDomains
bruteForceProtected	3654cfb9-0034-4bee-8aff-6eda67a58466	false
permanentLockout	3654cfb9-0034-4bee-8aff-6eda67a58466	false
maxTemporaryLockouts	3654cfb9-0034-4bee-8aff-6eda67a58466	0
bruteForceStrategy	3654cfb9-0034-4bee-8aff-6eda67a58466	MULTIPLE
maxFailureWaitSeconds	3654cfb9-0034-4bee-8aff-6eda67a58466	900
minimumQuickLoginWaitSeconds	3654cfb9-0034-4bee-8aff-6eda67a58466	60
waitIncrementSeconds	3654cfb9-0034-4bee-8aff-6eda67a58466	60
quickLoginCheckMilliSeconds	3654cfb9-0034-4bee-8aff-6eda67a58466	1000
maxDeltaTimeSeconds	3654cfb9-0034-4bee-8aff-6eda67a58466	43200
failureFactor	3654cfb9-0034-4bee-8aff-6eda67a58466	30
realmReusableOtpCode	3654cfb9-0034-4bee-8aff-6eda67a58466	false
firstBrokerLoginFlowId	3654cfb9-0034-4bee-8aff-6eda67a58466	4bd45628-286c-4b2f-816d-aad506664a59
displayName	3654cfb9-0034-4bee-8aff-6eda67a58466	Keycloak
displayNameHtml	3654cfb9-0034-4bee-8aff-6eda67a58466	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	3654cfb9-0034-4bee-8aff-6eda67a58466	RS256
offlineSessionMaxLifespanEnabled	3654cfb9-0034-4bee-8aff-6eda67a58466	false
offlineSessionMaxLifespan	3654cfb9-0034-4bee-8aff-6eda67a58466	5184000
_browser_header.contentSecurityPolicyReportOnly	17787da5-ff56-48dc-a36a-2700dec08b2e	
_browser_header.xContentTypeOptions	17787da5-ff56-48dc-a36a-2700dec08b2e	nosniff
_browser_header.referrerPolicy	17787da5-ff56-48dc-a36a-2700dec08b2e	no-referrer
_browser_header.xRobotsTag	17787da5-ff56-48dc-a36a-2700dec08b2e	none
_browser_header.xFrameOptions	17787da5-ff56-48dc-a36a-2700dec08b2e	SAMEORIGIN
_browser_header.contentSecurityPolicy	17787da5-ff56-48dc-a36a-2700dec08b2e	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.strictTransportSecurity	17787da5-ff56-48dc-a36a-2700dec08b2e	max-age=31536000; includeSubDomains
bruteForceProtected	17787da5-ff56-48dc-a36a-2700dec08b2e	false
permanentLockout	17787da5-ff56-48dc-a36a-2700dec08b2e	false
maxTemporaryLockouts	17787da5-ff56-48dc-a36a-2700dec08b2e	0
bruteForceStrategy	17787da5-ff56-48dc-a36a-2700dec08b2e	MULTIPLE
maxFailureWaitSeconds	17787da5-ff56-48dc-a36a-2700dec08b2e	900
minimumQuickLoginWaitSeconds	17787da5-ff56-48dc-a36a-2700dec08b2e	60
waitIncrementSeconds	17787da5-ff56-48dc-a36a-2700dec08b2e	60
quickLoginCheckMilliSeconds	17787da5-ff56-48dc-a36a-2700dec08b2e	1000
maxDeltaTimeSeconds	17787da5-ff56-48dc-a36a-2700dec08b2e	43200
failureFactor	17787da5-ff56-48dc-a36a-2700dec08b2e	30
realmReusableOtpCode	17787da5-ff56-48dc-a36a-2700dec08b2e	false
defaultSignatureAlgorithm	17787da5-ff56-48dc-a36a-2700dec08b2e	RS256
offlineSessionMaxLifespanEnabled	17787da5-ff56-48dc-a36a-2700dec08b2e	false
offlineSessionMaxLifespan	17787da5-ff56-48dc-a36a-2700dec08b2e	5184000
actionTokenGeneratedByAdminLifespan	17787da5-ff56-48dc-a36a-2700dec08b2e	43200
actionTokenGeneratedByUserLifespan	17787da5-ff56-48dc-a36a-2700dec08b2e	300
oauth2DeviceCodeLifespan	17787da5-ff56-48dc-a36a-2700dec08b2e	600
oauth2DevicePollingInterval	17787da5-ff56-48dc-a36a-2700dec08b2e	5
webAuthnPolicyRpEntityName	17787da5-ff56-48dc-a36a-2700dec08b2e	keycloak
webAuthnPolicySignatureAlgorithms	17787da5-ff56-48dc-a36a-2700dec08b2e	ES256,RS256
webAuthnPolicyRpId	17787da5-ff56-48dc-a36a-2700dec08b2e	
webAuthnPolicyAttestationConveyancePreference	17787da5-ff56-48dc-a36a-2700dec08b2e	not specified
webAuthnPolicyAuthenticatorAttachment	17787da5-ff56-48dc-a36a-2700dec08b2e	not specified
webAuthnPolicyRequireResidentKey	17787da5-ff56-48dc-a36a-2700dec08b2e	not specified
webAuthnPolicyUserVerificationRequirement	17787da5-ff56-48dc-a36a-2700dec08b2e	not specified
webAuthnPolicyCreateTimeout	17787da5-ff56-48dc-a36a-2700dec08b2e	0
webAuthnPolicyAvoidSameAuthenticatorRegister	17787da5-ff56-48dc-a36a-2700dec08b2e	false
webAuthnPolicyRpEntityNamePasswordless	17787da5-ff56-48dc-a36a-2700dec08b2e	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	17787da5-ff56-48dc-a36a-2700dec08b2e	ES256,RS256
webAuthnPolicyRpIdPasswordless	17787da5-ff56-48dc-a36a-2700dec08b2e	
webAuthnPolicyAttestationConveyancePreferencePasswordless	17787da5-ff56-48dc-a36a-2700dec08b2e	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	17787da5-ff56-48dc-a36a-2700dec08b2e	not specified
webAuthnPolicyRequireResidentKeyPasswordless	17787da5-ff56-48dc-a36a-2700dec08b2e	Yes
webAuthnPolicyUserVerificationRequirementPasswordless	17787da5-ff56-48dc-a36a-2700dec08b2e	required
webAuthnPolicyCreateTimeoutPasswordless	17787da5-ff56-48dc-a36a-2700dec08b2e	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	17787da5-ff56-48dc-a36a-2700dec08b2e	false
cibaBackchannelTokenDeliveryMode	17787da5-ff56-48dc-a36a-2700dec08b2e	poll
cibaExpiresIn	17787da5-ff56-48dc-a36a-2700dec08b2e	120
cibaInterval	17787da5-ff56-48dc-a36a-2700dec08b2e	5
cibaAuthRequestedUserHint	17787da5-ff56-48dc-a36a-2700dec08b2e	login_hint
parRequestUriLifespan	17787da5-ff56-48dc-a36a-2700dec08b2e	60
firstBrokerLoginFlowId	17787da5-ff56-48dc-a36a-2700dec08b2e	301bbbc2-022a-4003-a7c9-4354e3ceb45b
darkMode	17787da5-ff56-48dc-a36a-2700dec08b2e	true
organizationsEnabled	17787da5-ff56-48dc-a36a-2700dec08b2e	false
adminPermissionsEnabled	17787da5-ff56-48dc-a36a-2700dec08b2e	false
verifiableCredentialsEnabled	17787da5-ff56-48dc-a36a-2700dec08b2e	false
clientSessionIdleTimeout	17787da5-ff56-48dc-a36a-2700dec08b2e	0
clientSessionMaxLifespan	17787da5-ff56-48dc-a36a-2700dec08b2e	0
clientOfflineSessionIdleTimeout	17787da5-ff56-48dc-a36a-2700dec08b2e	0
clientOfflineSessionMaxLifespan	17787da5-ff56-48dc-a36a-2700dec08b2e	0
client-policies.profiles	17787da5-ff56-48dc-a36a-2700dec08b2e	{"profiles":[]}
client-policies.policies	17787da5-ff56-48dc-a36a-2700dec08b2e	{"policies":[]}
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
3654cfb9-0034-4bee-8aff-6eda67a58466	jboss-logging
17787da5-ff56-48dc-a36a-2700dec08b2e	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	3654cfb9-0034-4bee-8aff-6eda67a58466
password	password	t	t	17787da5-ff56-48dc-a36a-2700dec08b2e
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.redirect_uris (client_id, value) FROM stdin;
2f78cfee-7416-429f-8463-7b84b102a6ff	/realms/master/account/*
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	/realms/master/account/*
8b0f1494-a2c8-4184-a246-1791bd30192e	/admin/master/console/*
1e4596fc-4e54-4a9c-af86-bc80f8fe1d08	/realms/cybertron/account/*
f3de95ba-eae6-4b4f-9667-2638e741fcc9	/realms/cybertron/account/*
89af5f6b-be83-458b-8250-4aefba4ffec1	/admin/cybertron/console/*
12b20603-24ee-4e3c-8fa9-124de5bde364	http://localhost:8000/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
b3e0e4bd-4fd1-4277-bac8-4f7f81087042	VERIFY_EMAIL	Verify Email	3654cfb9-0034-4bee-8aff-6eda67a58466	t	f	VERIFY_EMAIL	50
00d8bc6a-eff2-48fb-92ef-d33ed941505c	UPDATE_PROFILE	Update Profile	3654cfb9-0034-4bee-8aff-6eda67a58466	t	f	UPDATE_PROFILE	40
d2d19507-4804-416f-bcde-4380f0fdd5e0	CONFIGURE_TOTP	Configure OTP	3654cfb9-0034-4bee-8aff-6eda67a58466	t	f	CONFIGURE_TOTP	10
bf02fec4-fe5c-456d-8f27-0cc6d991cc91	UPDATE_PASSWORD	Update Password	3654cfb9-0034-4bee-8aff-6eda67a58466	t	f	UPDATE_PASSWORD	30
4bc1e076-8d1b-4c6f-9cdf-e34d6d22a1d7	TERMS_AND_CONDITIONS	Terms and Conditions	3654cfb9-0034-4bee-8aff-6eda67a58466	f	f	TERMS_AND_CONDITIONS	20
e4ae098c-74ee-4583-b80c-43e1f2402bd1	delete_account	Delete Account	3654cfb9-0034-4bee-8aff-6eda67a58466	f	f	delete_account	60
58b70823-261a-4b6d-9355-fb3f7c7301a0	delete_credential	Delete Credential	3654cfb9-0034-4bee-8aff-6eda67a58466	t	f	delete_credential	110
4a35b3de-ae0e-4cea-8b7a-f5dcd06b272a	update_user_locale	Update User Locale	3654cfb9-0034-4bee-8aff-6eda67a58466	t	f	update_user_locale	1000
4768e0f1-003f-4f78-8fb3-d7b06e09a7af	UPDATE_EMAIL	Update Email	3654cfb9-0034-4bee-8aff-6eda67a58466	f	f	UPDATE_EMAIL	70
b949f4eb-c4e8-439e-b5de-c201270dd533	CONFIGURE_RECOVERY_AUTHN_CODES	Recovery Authentication Codes	3654cfb9-0034-4bee-8aff-6eda67a58466	t	f	CONFIGURE_RECOVERY_AUTHN_CODES	130
3d5ded8f-6a5d-4990-bbe0-1edb86f2a6f2	webauthn-register	Webauthn Register	3654cfb9-0034-4bee-8aff-6eda67a58466	t	f	webauthn-register	80
9dfa2af7-9a96-4713-82ee-2d3849e4bb3e	webauthn-register-passwordless	Webauthn Register Passwordless	3654cfb9-0034-4bee-8aff-6eda67a58466	t	f	webauthn-register-passwordless	90
fccfd99a-7947-44c1-b1b1-2e91bc492c07	VERIFY_PROFILE	Verify Profile	3654cfb9-0034-4bee-8aff-6eda67a58466	t	f	VERIFY_PROFILE	100
69d62a6a-1155-4f89-8f63-408e7249885e	idp_link	Linking Identity Provider	3654cfb9-0034-4bee-8aff-6eda67a58466	t	f	idp_link	120
3a682b19-3e84-4fe2-83d1-f6fe157b6999	VERIFY_EMAIL	Verify Email	17787da5-ff56-48dc-a36a-2700dec08b2e	t	f	VERIFY_EMAIL	50
c8cf8d65-3498-48be-ba67-1fa08c899d4b	UPDATE_PROFILE	Update Profile	17787da5-ff56-48dc-a36a-2700dec08b2e	t	f	UPDATE_PROFILE	40
b0e550ee-a917-4654-a757-28e9468cdfd7	CONFIGURE_TOTP	Configure OTP	17787da5-ff56-48dc-a36a-2700dec08b2e	t	f	CONFIGURE_TOTP	10
24505b77-2f48-4074-a5dd-1a8d2f7251c1	UPDATE_PASSWORD	Update Password	17787da5-ff56-48dc-a36a-2700dec08b2e	t	f	UPDATE_PASSWORD	30
e7adf48b-3c74-4935-9da0-27fbd7e143de	TERMS_AND_CONDITIONS	Terms and Conditions	17787da5-ff56-48dc-a36a-2700dec08b2e	f	f	TERMS_AND_CONDITIONS	20
2f52240b-1c8f-4ba5-8ac4-479ba0f31a18	delete_account	Delete Account	17787da5-ff56-48dc-a36a-2700dec08b2e	f	f	delete_account	60
7d0b253f-fabf-4a99-aafd-0f84961437b0	delete_credential	Delete Credential	17787da5-ff56-48dc-a36a-2700dec08b2e	t	f	delete_credential	110
37b049bb-e576-4c43-a547-6ac90b7d1532	update_user_locale	Update User Locale	17787da5-ff56-48dc-a36a-2700dec08b2e	t	f	update_user_locale	1000
a7e9ca5d-4098-4039-80e1-bf41e4588371	UPDATE_EMAIL	Update Email	17787da5-ff56-48dc-a36a-2700dec08b2e	f	f	UPDATE_EMAIL	70
d911fc00-ef82-4e16-bde1-62af1f787dfd	CONFIGURE_RECOVERY_AUTHN_CODES	Recovery Authentication Codes	17787da5-ff56-48dc-a36a-2700dec08b2e	t	f	CONFIGURE_RECOVERY_AUTHN_CODES	130
0d3575df-15b9-4c74-b847-d4ddd6c9644a	webauthn-register	Webauthn Register	17787da5-ff56-48dc-a36a-2700dec08b2e	t	f	webauthn-register	80
c47ab5b5-e32b-4e52-b65b-2a684f2f4356	webauthn-register-passwordless	Webauthn Register Passwordless	17787da5-ff56-48dc-a36a-2700dec08b2e	t	f	webauthn-register-passwordless	90
63e690d2-af60-4596-9052-741b4f9dd4fb	VERIFY_PROFILE	Verify Profile	17787da5-ff56-48dc-a36a-2700dec08b2e	t	f	VERIFY_PROFILE	100
0ef4ec22-d50a-46cd-b0d6-b15d59f99cea	idp_link	Linking Identity Provider	17787da5-ff56-48dc-a36a-2700dec08b2e	t	f	idp_link	120
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: revoked_token; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.revoked_token (id, expire) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	55541bd9-62af-44bf-b498-6db6418abb7d
50f8c25f-4590-4ac7-a1cc-3cdce833e1ea	b7b9ef10-cda6-471a-bbd8-53562d9bf9a2
f3de95ba-eae6-4b4f-9667-2638e741fcc9	6d39b0c5-737e-4681-b099-3a877bc5ffd6
f3de95ba-eae6-4b4f-9667-2638e741fcc9	4453524b-366c-4c30-81fc-46c11154ff72
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: server_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.server_config (server_config_key, value, version) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
is_temporary_admin	true	7894ab68-ae4a-4537-9040-9c172fd219f3	fa5f08ae-5220-4131-b80e-67518bba917c	\N	\N	\N
avatar	https://www.tfw2005.com/boards/attachments/33354524_415635055577580_6803363947895324672_n-jpg.28002119/	596e6997-44b2-4a53-be0b-d5aa2a233015	83de3990-b02a-48c2-a480-86de4f0456b9	\N	\N	\N
avatar	https://i.pinimg.com/474x/2d/31/6e/2d316efaef588c75e5c4d8e98d0d0e26.jpg	3832d768-00a5-44b9-97cd-9cad93a03dbc	120af4cd-4f91-41a0-9392-75b939d55223	\N	\N	\N
avatar	https://icons.iconseeker.com/png/fullsize/transformers-x-vol-1/megatron-1.png	ff5df9cb-7dde-4fff-aa1c-c0d5b4fada3b	8c96ea2d-c2d8-4f34-8266-7b2d374ca5f8	\N	\N	\N
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
7894ab68-ae4a-4537-9040-9c172fd219f3	\N	ebf763fb-79f8-44c1-822f-44fea587896a	f	t	\N	\N	\N	3654cfb9-0034-4bee-8aff-6eda67a58466	admin	1761233361399	\N	0
4ffde88c-782c-4da4-8ef0-90125d748036	optimus@master.realm	optimus@master.realm	t	t	\N	optimus	prime	3654cfb9-0034-4bee-8aff-6eda67a58466	optimus	1761233426965	\N	0
3832d768-00a5-44b9-97cd-9cad93a03dbc	optimus@cybertron.com	optimus@cybertron.com	t	t	\N	optimus	prime	17787da5-ff56-48dc-a36a-2700dec08b2e	optimus	1761234713152	\N	0
ff5df9cb-7dde-4fff-aa1c-c0d5b4fada3b	megatron@cybertron.com	megatron@cybertron.com	t	t	\N	mega	tron	17787da5-ff56-48dc-a36a-2700dec08b2e	megatron	1761234822052	\N	0
596e6997-44b2-4a53-be0b-d5aa2a233015	bumblebee@cybertron.com	bumblebee@cybertron.com	t	t	\N	bumble	bee	17787da5-ff56-48dc-a36a-2700dec08b2e	bumblebee	1761236131934	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_group_membership (group_id, user_id, membership_type) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
717a8b0b-1783-4a0e-b122-88e60d263943	7894ab68-ae4a-4537-9040-9c172fd219f3
50e164e0-fab9-4fc3-b38d-d220765a2e4b	7894ab68-ae4a-4537-9040-9c172fd219f3
717a8b0b-1783-4a0e-b122-88e60d263943	4ffde88c-782c-4da4-8ef0-90125d748036
50e164e0-fab9-4fc3-b38d-d220765a2e4b	4ffde88c-782c-4da4-8ef0-90125d748036
6d57524f-cdca-41c4-aea3-68a171c93aee	3832d768-00a5-44b9-97cd-9cad93a03dbc
ea8374df-db95-4a44-ae94-c8b6ee75edf8	3832d768-00a5-44b9-97cd-9cad93a03dbc
4119b8f4-2ac6-4c3f-bff9-448047d58678	3832d768-00a5-44b9-97cd-9cad93a03dbc
6d57524f-cdca-41c4-aea3-68a171c93aee	ff5df9cb-7dde-4fff-aa1c-c0d5b4fada3b
6d57524f-cdca-41c4-aea3-68a171c93aee	596e6997-44b2-4a53-be0b-d5aa2a233015
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.web_origins (client_id, value) FROM stdin;
8b0f1494-a2c8-4184-a246-1791bd30192e	+
89af5f6b-be83-458b-8250-4aefba4ffec1	+
12b20603-24ee-4e3c-8fa9-124de5bde364	http://localhost:8000
\.


--
-- Data for Name: workflow_state; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.workflow_state (execution_id, resource_id, workflow_id, workflow_provider_id, resource_type, scheduled_step_id, scheduled_step_timestamp) FROM stdin;
\.


--
-- Name: org_domain ORG_DOMAIN_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);


--
-- Name: org ORG_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);


--
-- Name: server_config SERVER_CONFIG_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.server_config
    ADD CONSTRAINT "SERVER_CONFIG_pkey" PRIMARY KEY (server_config_key);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: jgroups_ping constraint_jgroups_ping; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.jgroups_ping
    ADD CONSTRAINT constraint_jgroups_ping PRIMARY KEY (address);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: revoked_token constraint_rt; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.revoked_token
    ADD CONSTRAINT constraint_rt PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: workflow_state pk_workflow_state; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.workflow_state
    ADD CONSTRAINT pk_workflow_state PRIMARY KEY (execution_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: user_consent uk_external_consent; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_local_consent; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);


--
-- Name: migration_model uk_migration_update_time; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT uk_migration_update_time UNIQUE (update_time);


--
-- Name: migration_model uk_migration_version; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT uk_migration_version UNIQUE (version);


--
-- Name: org uk_org_alias; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_alias UNIQUE (realm_id, alias);


--
-- Name: org uk_org_group; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);


--
-- Name: org uk_org_name; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: workflow_state uq_workflow_resource; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.workflow_state
    ADD CONSTRAINT uq_workflow_resource UNIQUE (workflow_id, resource_id);


--
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_entity_user_id_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_event_entity_user_id_type ON public.event_entity USING btree (user_id, type, event_time);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_idp_for_login; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_idp_for_login ON public.identity_provider USING btree (realm_id, enabled, link_only, hide_on_login, organization_id);


--
-- Name: idx_idp_realm_org; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_idp_realm_org ON public.identity_provider USING btree (realm_id, organization_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_by_broker_session_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);


--
-- Name: idx_offline_uss_by_last_session_refresh; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_org_domain_org_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_org_domain_org_id ON public.org_domain USING btree (org_id);


--
-- Name: idx_perm_ticket_owner; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);


--
-- Name: idx_perm_ticket_requester; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_rev_token_on_expire; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_rev_token_on_expire ON public.revoked_token USING btree (expire);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_usconsent_scope_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: idx_workflow_state_provider; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_workflow_state_provider ON public.workflow_state USING btree (resource_id, workflow_provider_id);


--
-- Name: idx_workflow_state_step; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_workflow_state_step ON public.workflow_state USING btree (workflow_id, scheduled_step_id);


--
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

\unrestrict OUNKaDeu2MDu988bNFAhnQksSelFFIk5h2WQMASXajaxeGIarbFNo29cSuSow4g

