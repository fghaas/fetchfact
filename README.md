fetchfact
=========

This module fetches a JSON, YAML or text file from a defined URL,
and stores it in `/etc/facter/facts.d`. From there, its contents
can be picked up by `facter-dot-d` and thus be available
as custom facts to Facter.

Warning
-------

*Do not retrieve facts from untrusted sources.* `fetchfact` does not
do any sanitization or filtering on the retrieved facts. If your
source provides you with facts that override other custom facts,
this module does not protect you against that. If in doubt, retrieve
facts only from sources that you yourself control and/or trust.

Example
-------

To fetch a dynamically generated JSON document from
`http://service.example.com/something?foo=bar` and store it in
`/etc/facter/facts.d/something.json`, put the following
in your manifest:

    include fetchfact
    
    $url = http://service.example.com/something?foo=bar
    $factfile = something.json
    
    fetchfact::fetch { '$filename':
      url => $url,
      factfile => $filename
    }

Note that `fetchfact` will ensure that the required JSON
Ruby module is installed if your `filename` ends in `.json`.

Normally, the lookup will occur only once for every node.
In order to purge and refresh the downloaded facts, delete
the fact file and wait for the next agent run.

License
-------

ASL 2.0.

Contact
-------

Contact `puppetforge@hastexo.com` for any comments and questions about
this module.


Support
-------

Please report issues on [GitHub](https://github.com/fghaas/fetchfact/issues).
