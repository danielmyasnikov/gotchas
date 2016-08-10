`require 'locomotive/wagon/liquid'`
`require 'locomotive/mounter/reader/file_system/base'`
`require 'locomotive/mounter/reader/file_system/content_entries_reader'`

proxy:
`c = Locomotive::Wagon::Liquid::Drops::ProxyCollection.new(:articles)`

content type:
`t = Locomotive::Wagon::Liquid::Drops::ProxyCollection.new(:articles)`

context with mounting point:
```
_self = Locomotive::Wagon::Server::Renderer

mp = Locomotive::Mounter::MountingPoint.new
mp.path = '/Users/danielmyasnikov/src/12wbt_public'

runner = Locomotive::Mounter::Reader::FileSystem::Runner.new(:file_system)
runner.path = '/Users/danielmyasnikov/src/12wbt_public'

<!-- ctp = Locomotive::Mounter::Reader::FileSystem::ContentTypesReader -->
ctr = Locomotive::Mounter::Reader::FileSystem::ContentTypesReader.new(runner)
ctr.read
ctr.items['crews']
cer = Locomotive::Mounter::Reader::FileSystem::ContentEntriesReader.new(runner)
cer.read
```


```
ce = Locomotive::Wagon::Liquid::Drops::ContentEntry
```


to get content entries for a content type:

1. type = get `mounting_point` with `content_types`, get only `:crews`
1.1 mounting point is a `@context.registers[:mounting_point]`
1.1.1 Assumption, we can avoid context, by reading directly from file_system
1.1.2 Assumption is correct, however requires further investigation and why `Locomotive::Mounter::Models::ContentType` does not have entries
1.2 a context is `Liquid::Context.new`
2. crews = ProxyCollection.new(type)
