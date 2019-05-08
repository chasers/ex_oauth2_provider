# Changelog

## v0.5.0 (TBA)

This is a full rewrite of the library, and areseveral breaking changes. You're encouraged to test your app well if you upgrade from 0.4.

### Upgrading from 0.4

#### 1. Schema modules

Schema modules are now generated when installing ExOauth2Provider. To upgrade please run `mix ex_oauth2_provider.install --no-config --no-migrations` to generate the schema files.

#### 2. Configuration

Config now has the form `config :my_app, ExOauth2Provider`. You can still use the previous `config :ex_oauth2_provider` configuration, but are encouraged to switch over to the app specific configuration.

#### 3. Resource owner UUID configuration

If your configuration has `:resource_owner` setting with a UUID, you should remove it and only use the module name for your user schema. UUID is now handled in the schema modules directly.