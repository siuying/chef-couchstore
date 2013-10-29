name 'couchstore'
maintainer 'Francis Chong'
maintainer_email 'francis@ignition.hk'
license 'MIT'
description 'Installs couchstore'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.1.1'

recipe "couchstore::default", "Installs couchstore."

supports 'debian'
supports 'ubuntu'

depends 'git'