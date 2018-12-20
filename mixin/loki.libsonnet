{
  _config+:: {
    auth_enabled: false,
    server: {
      http_listen_port: 3100,
    },
    ingester: {
      lifecycler: {
        address: '127.0.0.1',
        ring: {
          store: 'inmemory',
          replication_factor: 1,
        },
      },
    },
    schema_config: {
      configs: [
        {
          from: 0,
          store: 'boltdb',
          object_store: 'filesystem',
          schema: 'v9',
          index: {
            prefix: 'index_',
            period: '168h',
          },
        },
      ],
    },
    storage_config: {
      boltdb: {
        directory: '/tmp/loki/index',
      },
      filesystem: {
        directory: '/tmp/loki/chunks/',
      },
    },
  },
}
